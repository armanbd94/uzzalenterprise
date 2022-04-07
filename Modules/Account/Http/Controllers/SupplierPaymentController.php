<?php

namespace Modules\Account\Http\Controllers;

use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Modules\Setting\Entities\Warehouse;
use Modules\Supplier\Entities\Supplier;
use App\Http\Controllers\BaseController;
use Modules\Account\Entities\Transaction;
use Modules\Account\Entities\ChartOfAccount;
use Modules\Account\Entities\SupplierPayment;
use Modules\Account\Http\Requests\SupplierPaymentFormRequest;

class SupplierPaymentController extends BaseController
{
    public function __construct(SupplierPayment $model)
    {
        $this->model = $model;
    }

    public function index()
    {
        if(permission('supplier-payment-access')){
            $setTitle = __('file.Accounts');
            $setSubTitle = __('file.Supplier Payment List');
            $this->setPageData($setSubTitle,$setSubTitle,'far fa-money-bill-alt',[['name'=>$setTitle ],['name'=>$setSubTitle]]);
            $suppliers = Supplier::with('coa')->get();
            return view('account::supplier-payment.index',compact('suppliers'));
        }else{
            return $this->access_blocked();
        }
    }

    public function get_datatable_data(Request $request)
    {
        if($request->ajax()){
            if(permission('supplier-payment-access')){

                if (!empty($request->start_date)) {
                    $this->model->setStartDate($request->start_date);
                }
                if (!empty($request->end_date)) {
                    $this->model->setEndDate($request->end_date);
                }
                if (!empty($request->supplier_coa_id)) {
                    $this->model->setSupplierCOAID($request->supplier_coa_id);
                }


                $this->set_datatable_default_properties($request);//set datatable default properties
                $list = $this->model->getDatatableList();//get table data
                $data = [];
                $no = $request->input('start');
                foreach ($list as $value) {
                    $no++;
                    $action = '';
                    if(permission('supplier-payment-edit')){
                        $action .= ' <a class="dropdown-item" href="'.url("supplier-payment/edit",$value->voucher_no).'">'.self::ACTION_BUTTON['Edit'].'</a>';
                    }

                    if(permission('supplier-payment-delete')){
                        $action .= ' <a class="dropdown-item delete_data"  data-id="' . $value->voucher_no . '" data-name="' . $value->voucher_no . '">'.self::ACTION_BUTTON['Delete'].'</a>';
                    }
                    $account_head = Transaction::with('coa')->where('voucher_no',$value->voucher_no)->orderBy('id','desc')->first();
                    $row = [];
                    $row[] = $no;
                    $row[] = date('d-M-Y',strtotime($value->voucher_date));
                    $row[] = $value->voucher_no;
                    $row[] = $value->supplier_name;
                    $row[] = $account_head ? $account_head->coa->name : '';
                    $row[] = $value->description;
                    $row[] = number_format($value->debit,2);
                    $row[] = $value->created_by;
                    $row[] = action_button($action);//custom helper function for action button
                    $data[] = $row;
                }
                return $this->datatable_draw($request->input('draw'),$this->model->count_all(),
                $this->model->count_filtered(), $data);
            }
        }else{
            return response()->json($this->unauthorized());
        }
    }

    public function create()
    {
        if(permission('supplier-payment-add')){
            $setTitle = __('file.Accounts');
            $setSubTitle = __('file.Supplier Payment Form');
            $this->setPageData($setSubTitle,$setSubTitle,'far fa-money-bill-alt',[['name'=>$setTitle],['name'=>$setSubTitle]]);
            $voucher_no = 'PM-'.date('Ymd').rand(1,999);
            $suppliers = Supplier::where('status',1)->get();
            return view('account::supplier-payment.create',compact('voucher_no','suppliers'));
        }else{
            return $this->access_blocked();
        }
    }

    public function store(SupplierPaymentFormRequest $request)
    {
        if($request->ajax()){
            if(permission('supplier-payment-add')){
                DB::beginTransaction();
                try {
                    $supplier = Supplier::with('coa')->find($request->supplier_id);
                    $transaction = SupplierPayment::supplier_payment([
                        'supplier_coa_id'    => $supplier->coa->id,
                        'payment_account_id' => $request->account_id,
                        'voucher_no'         => $request->voucher_no,
                        'voucher_date'       => $request->voucher_date,
                        'description'        => $request->remarks,
                        'amount'             => $request->amount,
                        'payment_type'       => $request->payment_type
                    ]);

                    $supplier_transaction  = $this->model->create($transaction->supplier_transaction);
                    $payment_transaction = $this->model->create($transaction->payment_account_transaction);
                    if($supplier_transaction && $payment_transaction){
                        $output = ['status'=>'success','message' => 'Payment Data Saved Successfully'];
                        $output['supplier_transaction'] = $supplier_transaction->id;
                        DB::commit();
                    }else{
                        $output = ['status'=>'error','message' => 'Failed To Save Payment Data'];
                        DB::rollBack();
                    }
                   
                } catch (Exception $e) {
                    DB::rollBack();
                    $output = ['status' => 'error','message' => $e->getMessage()];
                }
            }else{
                $output = $this->unauthorized();
            }
            return response()->json($output);
        }else{
            return response()->json($this->unauthorized());
        }
    }

    

    public function edit($voucher_no)
    {
        if(permission('supplier-payment-edit')){
            $voucher_data = $this->model->where('voucher_no',$voucher_no)->get();
            if($voucher_data)
            {
                $setTitle = __('file.Accounts');
                $setSubTitle = __('file.Edit Supplier Payment');
                $this->setPageData($setSubTitle,$setSubTitle,'far fa-edit',[['name'=>$setTitle ],['name'=>$setSubTitle]]);
                $suppliers = Supplier::with('coa')->get();
                $showrooms = Warehouse::get();
                $due_amount = Supplier::supplier_balance($voucher_data[0]->coa->supplier_id);
                if($due_amount < 0)
                {
                    $due_amount = explode('-',$due_amount)[1];
                }
                $due_amount = $due_amount + $voucher_data[0]->debit;

                if($voucher_data[1]->coa->parent_name == 'Cash & Cash Equivalent'){
                    $payment_method = 1;
                    $accounts = ChartOfAccount::where(['parent_name' =>  'Cash & Cash Equivalent','status'=>1])->get();
                }elseif ($voucher_data[1]->coa->parent_name == 'Cash At Bank') {
                    $payment_method = 2;
                    $accounts = ChartOfAccount::where('code', 'like', $this->coa_head_code('cash_at_bank').'%')->where('status',1)->get();
                }elseif ($voucher_data[1]->coa->parent_name == 'Cash At Mobile Bank') {
                    $payment_method = 3;
                    $accounts = ChartOfAccount::where('code', 'like', $this->coa_head_code('cash_at_mobile_bank').'%')->where('status',1)->get();
                }
                $account_list = '';
                if ($accounts) {
                    foreach ($accounts as $account) {
                        if($account->code != 1020102 && $account->code != 1020103){
                            $balance = DB::table('transactions')
                            ->select(DB::raw("SUM(debit) - SUM(credit) as balance"))
                            ->where([['chart_of_account_id',$account->id],['approve',1]])
                            ->first();
                            $selected = $voucher_data[1]->chart_of_account_id == $account->id ? 'selected' : '';
                            $account_list .= "<option value='$account->id' ".$selected." data-balance='$balance->balance'>".$account->name." </option>";
                        }
                    }
                }
                return view('account::supplier-payment.edit',compact('voucher_data','suppliers','due_amount','payment_method','account_list','showrooms'));
            }else{
                return redirect()->back();
            }
        }else{
            return $this->access_blocked();
        }
    }

    public function update(SupplierPaymentFormRequest $request)
    {
        if($request->ajax()){
            if(permission('supplier-payment-edit')){
                DB::beginTransaction();
                try {
                    $this->model->where('voucher_no',$request->update_voucher_no)->delete();
                    $supplier = Supplier::with('coa')->find($request->supplier_id);
                    $transaction = SupplierPayment::supplier_payment([
                        'supplier_coa_id'    => $supplier->coa->id,
                        'warehouse_id'       => $request->warehouse_id,
                        'payment_account_id' => $request->account_id,
                        'voucher_no'         => $request->voucher_no,
                        'voucher_date'       => $request->voucher_date,
                        'description'        => $request->remarks,
                        'amount'             => $request->amount,
                        'payment_type'       => $request->payment_type
                    ]);
                    
                    $supplier_transaction  = $this->model->create($transaction->supplier_transaction);
                    $payment_transaction = $this->model->create($transaction->payment_account_transaction);
                    if($supplier_transaction && $payment_transaction){
                        $output = ['status'=>'success','message' => 'Payment Data Updated Successfully'];
                    }else{
                        $output = ['status'=>'error','message' => 'Failed To Update Payment Data'];
                    }
                    DB::commit();
                } catch (Exception $e) {
                    DB::rollBack();
                    $output = ['status' => 'error','message' => $e->getMessage()];
                }
            }else{
                $output = $this->unauthorized();
            }
            return response()->json($output);
        }else{
            return response()->json($this->unauthorized());
        }
    }

    public function show(int $id,int $payment_type)
    {
        if(permission('supplier-payment-view')){
            $setTitle = __('file.Supplier Payment Voucher Print');
            $this->setPageData($setTitle,$setTitle,'far fa-money-bill-alt',[['name'=>$setTitle]]);
            $data = $this->model->with('coa')->find($id);
            return view('account::supplier-payment.print',compact('data','payment_type'));
        }else{
            return $this->access_blocked();
        }
    }

    public function delete(Request $request)
    {
        if($request->ajax()){
            if(permission('supplier-payment-delete')){
                try {
                    $result  = $this->model->where('voucher_no',$request->id)->delete();
                    $output   = $this->delete_message($result);
                } catch (\Throwable $th) {
                    $output = ['status' => 'error','message' => $th->getMessage()];
                }
                return response()->json($output);
            }else{
                return response()->json($this->unauthorized());
            }
        }else{
            return response()->json($this->unauthorized());
        }
    }
}
