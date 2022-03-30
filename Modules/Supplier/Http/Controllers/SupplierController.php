<?php

namespace Modules\Supplier\Http\Controllers;

use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Modules\Supplier\Entities\Supplier;
use App\Http\Controllers\BaseController;
use Modules\Account\Entities\Transaction;
use Modules\Account\Entities\ChartOfAccount;
use Modules\Supplier\Http\Requests\SupplierFormRequest;
use Illuminate\Support\Facades\App;

class SupplierController extends BaseController
{
    public function __construct(Supplier $model)
    {
        $this->model = $model;
    }


    public function index()
    {
        if(permission('supplier-access')){
            $setTitle = __('file.Supplier');
            $this->setPageData($setTitle,$setTitle,'fas fa-th-list',[['name'=>$setTitle]]);
            return view('supplier::index');
        }else{
            return $this->access_blocked();
        }
    }

    public function get_datatable_data(Request $request)
    {
        if($request->ajax()){
            if(permission('supplier-access')){

                if (!empty($request->name)) {
                    $this->model->setName($request->name);
                }
                if (!empty($request->mobile)) {
                    $this->model->setMobile($request->mobile);
                }
                if (!empty($request->email)) {
                    $this->model->setEmail($request->email);
                }

                if (!empty($request->status)) {
                    $this->model->setStatus($request->status);
                }

                $this->set_datatable_default_properties($request);//set datatable default properties
                $list              = $this->model->getDatatableList();              //get table data
                $data              = [];
                $no                = $request->input('start');
                $currency_symbol   = config('settings.currency_symbol');
                $currency_position = config('settings.currency_position');
                foreach ($list as $value) {
                    $no++;
                    $action = '';
                    if(permission('supplier-edit')){
                        $action .= ' <a class="dropdown-item edit_data" data-id="' . $value->id . '">'.$this->actionButton('Edit').'</a>';
                    }
                    if(permission('supplier-delete')){
                        $action .= ' <a class="dropdown-item delete_data"  data-id="' . $value->id . '" data-name="' . $value->name . '">'.$this->actionButton('Delete').'</a>';
                    }
                    $row = [];
                    if(permission('supplier-bulk-delete')){
                        $row[] = row_checkbox($value->id);
                    }
                    $balance = $this->model->supplier_balance($value->id);
                    $row[] = translate($no,App::getLocale());
                    $row[] = $value->name.'<br><b>Mobile No.: </b>'.$value->mobile.($value->email ? '<br><b>Email: </b>'.$value->email.')' : '').($value->company_name ? '<br><b>Company Name: </b>'.$value->company_name : '');
                    $row[] = $value->address;
                    $row[] = $value->city;
                    $row[] = $value->zipcode;
                    $row[] = permission('supplier-edit') ? change_status($value->id,$value->status, $value->name) : STATUS_LABEL[$value->status];
                    $row[] = translate(number_format($balance,2,'.',','),App::getLocale());
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



    public function store_or_update_data(SupplierFormRequest $request)
    {
        if($request->ajax()){
            if(permission('supplier-add')){
                DB::beginTransaction();
                try {
                    $collection = collect($request->validated())->except('previous_balance');
                    $collection = $this->track_data($collection,$request->update_id);
                    $supplier   = $this->model->updateOrCreate(['id'=>$request->update_id],$collection->all());
                    $output     = $this->store_message($supplier, $request->update_id);
                    $output['id']  = $supplier->id;
                    if($request->update_id)
                    {
                        $supplier_coa = ChartOfAccount::where(['supplier_id'=>$request->update_id])->first();
                        if($supplier_coa)
                        {
                            $supplier_coa->update(['name'=>$request->name]);
                        }else{
                            $coa_max_code      = ChartOfAccount::where('level',3)->where('code','like','50201%')->max('code');
                            $code              = $coa_max_code ? ($coa_max_code + 1) : '502010001';
                            ChartOfAccount::create($this->coa_data($code,$request->name,$request->update_id));
                        }
                    }else{
                        $coa_max_code      = ChartOfAccount::where('level',3)->where('code','like','50201%')->max('code');
                        $code              = $coa_max_code ? ($coa_max_code + 1) : '50201000001';
                        $supplier_coa      = ChartOfAccount::create($this->coa_data($code,$supplier->name,$supplier->id));
                        if(!empty($request->previous_balance))
                        {
                            if($supplier_coa){
                                Transaction::insert($this->previous_balance_data($request->previous_balance,$supplier_coa->id,$supplier->name));
                            }
                        }
                    }
                    $this->model->flushCache();
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


    private function coa_data(string $code,string $head_name,int $supplier_id)
    {
        return [
            'code'              => $code,
            'name'              => $head_name,
            'parent_name'       => 'Account Payable',
            'level'             => 3,
            'type'              => 'L',
            'transaction'       => 1,
            'general_ledger'    => 2,
            'supplier_id'       => $supplier_id,
            'budget'            => 2,
            'depreciation'      => 2,
            'depreciation_rate' => '0',
            'status'            => 1,
            'created_by'        => auth()->user()->name
        ];
    }

    private function previous_balance_data($balance, int $supplier_coa_id, string $supplier_name) {
        if(!empty($balance) && !empty($supplier_coa_id) && !empty($supplier_name)){
            $transaction_id = date('ymdHi').rand(1,99);
            // supplier debit for previous balance
            $cosdr = array(
                'chart_of_account_id' => $supplier_coa_id,
                'voucher_no'          => $transaction_id,
                'voucher_type'        => 'PR Balance',
                'voucher_date'        => date("Y-m-d"),
                'description'         => 'Credit '.$balance.' for old purchase from supplier '.$supplier_name,
                'debit'               => 0,
                'credit'              => $balance,
                'posted'              => 1,
                'approve'             => 1,
                'created_by'          => auth()->user()->name,
                'created_at'          => date('Y-m-d H:i:s')
            );
            $inventory = array(
                'chart_of_account_id' => DB::table('chart_of_accounts')->where('code', $this->coa_head_code('inventory'))->value('id'),
                'voucher_no'          => $transaction_id,
                'voucher_type'        => 'PR Balance',
                'voucher_date'        => date("Y-m-d"),
                'description'         => 'Inventory dredit '.$balance.' for old purchase from supplier '.$supplier_name,
                'debit'               => $balance,
                'credit'              => 0,
                'posted'              => 1,
                'approve'             => 1,
                'created_by'          => auth()->user()->name,
                'created_at'          => date('Y-m-d H:i:s')
            );

            return [
                $cosdr,$inventory
            ];
        }
    }

    public function edit(Request $request)
    {
        if($request->ajax()){
            if(permission('supplier-edit')){
                $data   = $this->model->findOrFail($request->id);
                $output = $this->data_message($data); //if data found then it will return data otherwise return error message
            }else{
                $output       = $this->unauthorized();
            }
            return response()->json($output);
        }else{
            return response()->json($this->unauthorized());
        }
    }

    public function delete(Request $request)
    {
        if($request->ajax()){
            if(permission('supplier-delete')){
                DB::beginTransaction();
                try {
                    $total_purchase_data = DB::table('purchase_orders')->where('supplier_id',$request->id)->get()->count();
                    if ($total_purchase_data > 0) {
                        $output = ['status'=>'error','message'=> __('file.This data cannot delete because it is related with others data.')];
                    } else {
                        $supplier_coa_id = ChartOfAccount::where('supplier_id',$request->id)->first();
                        if($supplier_coa_id){
                            Transaction::where('chart_of_account_id',$supplier_coa_id->id)->delete();
                            $supplier_coa_id->delete();
                        }
                        $result   = $this->model->find($request->id)->delete();
                        $output   = $this->delete_message($result);
                    }
                    DB::commit();
                    $this->model->flushCache();
                } catch (Exception $e) {
                   DB::rollBack();
                   $output = ['status' => 'error','message' => $e->getMessage()];
                }
            }else{
                $output       = $this->unauthorized();
            }
            return response()->json($output);
        }else{
            return response()->json($this->unauthorized());
        }
    }

    public function bulk_delete(Request $request)
    {
        if($request->ajax()){
            if(permission('supplier-bulk-delete')){
                DB::beginTransaction();
                try {
                    foreach ($request->ids as $id) {
                        $total_purchase_data = DB::table('purchase_orders')->where('supplier_id',$id)->get()->count();
                        if ($total_purchase_data > 0) {
                            $output = ['status'=>'error','message'=> __('file.This data cannot delete because it is related with others data.')];
                        } else {
                            $supplier_coa_id = ChartOfAccount::where('supplier_id',$id)->first();
                            if($supplier_coa_id){
                                Transaction::where('chart_of_account_id',$supplier_coa_id->id)->delete();
                                $supplier_coa_id->delete();
                            }
                        }
                    }
                    $result   = $this->model->destroy($request->ids);
                    $output   = $this->delete_message($result);
                    DB::commit();
                    $this->model->flushCache();
                } catch (Exception $e) {
                   DB::rollBack();
                   $output = ['status' => 'error','message' => $e->getMessage()];
                } 
            }else{
                $output       = $this->unauthorized();
            }
            return response()->json($output);
        }else{
            return response()->json($this->unauthorized());
        }
    }

    public function change_status(Request $request)
    {
        if($request->ajax()){
            if(permission('supplier-edit')){
                $result   = $this->model->find($request->id)->update(['status' => $request->status]);
                $output   = $result ? ['status' => 'success','message' => $this->responseMessage('Approval Status')]
                : ['status' => 'error','message' => $this->responseMessage('Approval Status Failed')];
            }else{
                $output   = $this->unauthorized();
            }
            return response()->json($output);
        }else{
            return response()->json($this->unauthorized());
        }
    }

    public function supplier_list(Request $request)
    {
        if($request->ajax()){
            $customers = DB::table('suppliers')
                    ->select('id','name','mobile')
                    ->get();
            $output = '<option value="">Select Please</option>';
            if(!$customers->isEmpty())
            {
                foreach ($customers as $key => $value) {
                    $output .= '<option value="'.$value->id.'">'.$value->name.' - '.translate($value->mobile,App::getLocale()).'</option>';
                }
            }
            return $output;
        }
    }

}
