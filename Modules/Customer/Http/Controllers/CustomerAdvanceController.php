<?php

namespace Modules\Customer\Http\Controllers;

use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Modules\Customer\Entities\Customer;
use App\Http\Controllers\BaseController;
use Modules\Customer\Entities\CustomerAdvance;
use Modules\Customer\Http\Requests\CustomerAdvanceFormRequest;
use Illuminate\Support\Facades\App;

class CustomerAdvanceController extends BaseController
{
    public function __construct(CustomerAdvance $model)
    {
        $this->model = $model;
    }

    public function index()
    {
        $setTitle = __('file.Customer');
        $setSubTitle = __('file.Customer Advance');
        $this->setPageData($setSubTitle,$setSubTitle,'fas fa-hand-holding-usd',[['name'=>$setTitle,'link'=>route('customer')],['name'=>$setSubTitle]]);
        $customers  = Customer::with('coa')->where(['status'=>1])->orderBy('name','asc')->get();
        return view('customer::advance.index',compact('customers'));
    }

    public function get_datatable_data(Request $request)
    {
        if($request->ajax()){

            if (!empty($request->customer_id)) {
                $this->model->setCustomerID($request->customer_id);
            }
            if (!empty($request->type)) {
                $this->model->setType($request->type);
            }
            if (!empty($request->start_date)) {
                $this->model->setStartDate($request->start_date);
            }
            if (!empty($request->end_date)) {
                $this->model->setEndDate($request->end_date);
            }

            $this->set_datatable_default_properties($request);//set datatable default properties
            $list = $this->model->getDatatableList();//get table data
            $data = [];
            $no = $request->input('start');
            foreach ($list as $value) {
                $no++;
                $action = '';
                $action .= ' <a class="dropdown-item edit_data" data-id="' . $value->id . '">'.$this->actionButton('Edit').'</a>';
                $action .= ' <a class="dropdown-item delete_data"  data-id="' . $value->voucher_no . '" data-name="' . $value->name . ' advance ">'.$this->actionButton('Delete').'</a>';
                if(permission('customer-advance-approve')){
                    if($value->approve != 1){
                        $action .= ' <a class="dropdown-item change_status"  data-id="' . $value->voucher_no . '" data-name="' . $value->voucher_no . '" data-status="'.$value->approve.'">'.$this->actionButton('Change Status').'</a>';
                    }
                }
                $account = $this->account_data($value->voucher_no);

                if($account->coa->parent_name == 'Cash & Cash Equivalent'){
                    $payment_method = 'Cash';
                }elseif ($account->coa->parent_name == 'Cash At Bank') {
                    $payment_method = 'Cheque';
                }elseif ($account->coa->parent_name == 'Cash At Mobile Bank') {
                    $payment_method = 'Mobile Bank';
                }
                $row = [];
                $row[] = row_checkbox($value->voucher_no);
                $row[] = translate($no,App::getLocale());
                $row[] = $value->customer_name.'<br><b>Mobile No. </b>'.translate($value->mobile,App::getLocale());
                $row[] = $value->address;
                $row[] = $value->city;
                $row[] = ($value->debit != 0) ? 'Receive' : 'Payment' ;
                $row[] = ($value->debit != 0) ? translate(number_format($value->debit,2,'.',','),App::getLocale()) : translate(number_format($value->credit,2,'.',','),App::getLocale());
                $row[] = APPROVE_STATUS_LABEL[$value->approve];
                $row[] = translate(date('d-m-Y',strtotime($value->created_at)),App::getLocale());
                $row[] = $payment_method;
                $row[] = $account->coa->name;
                $row[] = action_button($action);//custom helper function for action button
                $data[] = $row;
            }
            return $this->datatable_draw($request->input('draw'),$this->model->count_all(),
            $this->model->count_filtered(), $data);

        }else{
            return response()->json($this->unauthorized());
        }
    }

    private function account_data(string $voucher_no) : object
    {
        return $this->model->with('coa')->where('voucher_no',$voucher_no)->orderBy('id','desc')->first();

    }

    public function store_or_update_data(CustomerAdvanceFormRequest $request)
    {
        if($request->ajax()){
            DB::beginTransaction();
            try {
                if(empty($request->id)){
                    $result = $this->advance_add($request->type,$request->amount,$request->customer_coaid,$request->customer_name,$request->payment_method,$request->account_id,$request->reference_no);
                    $output = $this->store_message($result, $request->id);
                }else{
                    $result = $this->advance_update($request->id,$request->type,$request->amount,$request->customer_coaid,$request->customer_name,$request->payment_method,$request->account_id,$request->reference_no);
                    $output = $this->store_message($result, $request->id);
                }
                DB::commit();
            } catch (Exception $e) {
                DB::rollBack();
                $output = ['status' => 'error','message' => $e->getMessage()];
            }
            return response()->json($output);
        }else{
            return response()->json($this->unauthorized());
        }
    }

    private function advance_add(string $type, $amount, int $customer_coa_id, string $customer_name, int $payment_method, int $account_id, string $reference_no = null) {
        if(!empty($type) && !empty($amount) && !empty($customer_coa_id) && !empty($customer_name)){
            $transaction_id = generator(10);

            $customer_accledger = array(
                'chart_of_account_id' => $customer_coa_id,
                'voucher_no'          => $transaction_id,
                'voucher_type'        => 'Advance',
                'voucher_date'        => date("Y-m-d"),
                'description'         => 'Customer Advance from '.$customer_name,
                'debit'               => ($type == 'debit') ? $amount : 0,
                'credit'              => ($type == 'credit') ? $amount : 0,
                'posted'              => 1,
                'approve'             => 3,
                'created_by'          => auth()->user()->name,
                'created_at'          => date('Y-m-d H:i:s')
            );
            if($payment_method == 1){
                $note = 'Cash in Hand For '.$customer_name;
            }elseif ($payment_method == 2) {
                $note = $reference_no;
            }else{
                $note = 'Cash at Mobile Bank For '.$customer_name;
            }
            $cc = array(
                'chart_of_account_id' => $account_id,
                'voucher_no'          => $transaction_id,
                'voucher_type'        => 'Advance',
                'voucher_date'        => date("Y-m-d"),
                'description'         => $note,
                'debit'               => ($type == 'credit') ? $amount : 0,
                'credit'              => ($type == 'debit') ? $amount : 0,
                'posted'              => 1,
                'approve'             => 3,
                'created_by'          => auth()->user()->name,
                'created_at'          => date('Y-m-d H:i:s')
            );

            return $this->model->insert([
                $customer_accledger,$cc
            ]);
        }
    }

    private function advance_update(int $transaction_id, string $type, $amount, int $customer_coa_id, string $customer_name, int $payment_method, int $account_id, string $reference_no = null) {
        if(!empty($type) && !empty($amount) && !empty($customer_coa_id) && !empty($customer_name)){

            $customer_advance_data = $this->model->find($transaction_id);

            $voucher_no = $customer_advance_data->voucher_no;

            $updated = $customer_advance_data->update([
                'description'         => 'Customer Advance from '.$customer_name,
                'debit'               => ($type == 'debit') ? $amount : 0,
                'credit'              => ($type == 'credit') ? $amount : 0,
                'modified_by'         => auth()->user()->name,
                'updated_at'          => date('Y-m-d H:i:s')
            ]);
            if($updated)
            {
                if($payment_method == 1){
                    $note = 'Cash in Hand For '.$customer_name;
                }elseif ($payment_method == 2) {
                    $note = $reference_no;
                }else{
                    $note = 'Cash at Mobile Bank For '.$customer_name;
                }
                $account = $this->model->where('voucher_no', $voucher_no)->orderBy('id','desc')->first();
                if($account){
                    $account->update([
                        'chart_of_account_id' => $account_id,
                        'description'         => $note,
                        'debit'               => ($type == 'credit') ? $amount : 0,
                        'credit'              => ($type == 'debit') ? $amount : 0,
                        'modified_by'         => auth()->user()->name,
                        'updated_at'          => date('Y-m-d H:i:s')
                    ]);
                   
                }

                return true;
            }else{
                return false;
            }

        }
    }

    public function edit(Request $request)
    {
        if($request->ajax()){
            $data   = $this->model->select('transactions.*','coa.id as coa_id','coa.code','c.id as customer_id')
            ->join('chart_of_accounts as coa','transactions.chart_of_account_id','=','coa.id')
            ->join('customers as c','coa.customer_id','c.id')
            ->where('transactions.id',$request->id)->first();
            $account = $this->account_data($data->voucher_no);
            if($account->coa->parent_name == 'Cash & Cash Equivalent'){
                $payment_method = 1;
            }elseif ($account->coa->parent_name == 'Cash At Bank') {
                $payment_method = 2;
            }elseif ($account->coa->parent_name == 'Cash At Mobile Bank') {
                $payment_method = 3;
            }
            $output = []; //if data found then it will return data otherwise return error message
            if($data){
                $output = [
                    'id'          => $data->id,
                    'customer_id' => $data->customer_id,
                    'type'        => ($data->debit != 0) ? 'debit' : 'credit',
                    'amount'      => ($data->debit != 0) ? $data->debit : $data->credit,
                    'payment_method' => $payment_method,
                    'account_id'     => $account->chart_of_account_id,
                    'reference_no'      => ($payment_method != 1) ? $account->description : ''
                ];
            }
            return response()->json($output);
        }else{
            return response()->json($this->unauthorized());
        }
    }
    public function delete(Request $request)
    {
        if($request->ajax()){
            $result   = $this->model->where('voucher_no',$request->id)->delete();
            $output   = $this->delete_message($result);
            return response()->json($output);
        }else{
            return response()->json($this->unauthorized());
        }
    }
    public function bulk_delete(Request $request)
    {
        if($request->ajax()){
            $result   = $this->model->whereIn('voucher_no',$request->ids)->delete();
            $output   = $this->bulk_delete_message($result);
            return response()->json($output);
        }else{
            return response()->json($this->unauthorized());
        }
    }
    public function change_approval_status(Request $request)
    {
        if($request->ajax())
        {
            if(permission('customer-advance-approve'))
            {
                DB::beginTransaction();
                    try {
                        $result = $this->model->where('voucher_no',$request->approve_id)->update([
                            'approve'     => $request->approval_status,
                            'modified_by' => auth()->user()->name,
                            'updated_at'  => date('Y-m-d H:i:s')
                            ]);
                        if($result)
                        {
                            $output = ['status'=>'success','message'=>$this->responseMessage('Approval Status')];
                        }else{
                            $output = ['status'=>'error','message'=>$this->responseMessage('Approval Status Failed')];
                        }
                        DB::commit();
                    } catch (\Throwable $th) {
                        DB::rollback();
                        $output = ['status'=>'error','message'=>$th->getMessage()];
                    }
                    return response()->json($output);
            }else{
                return response()->json($this->unauthorized());
            }
        }
    }
}
