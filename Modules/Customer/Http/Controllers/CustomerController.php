<?php

namespace Modules\Customer\Http\Controllers;

use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Modules\Customer\Entities\Customer;
use App\Http\Controllers\BaseController;
use Modules\Account\Entities\Transaction;
use Modules\Setting\Entities\CustomerGroup;
use Modules\Account\Entities\ChartOfAccount;
use Modules\Customer\Http\Requests\CustomerFormRequest;
use Illuminate\Support\Facades\App;

class CustomerController extends BaseController
{
    public function __construct(Customer $model)
    {
        $this->model = $model;
    }


    public function index()
    {
        if(permission('customer-access')){
            $setTitle = __('file.Customer');
            $this->setPageData($setTitle,$setTitle,'far fa-handshake',[['name'=> $setTitle]]);
            $data = [
                'customer_groups' => CustomerGroup::where('status',1)->get(),
            ];
            return view('customer::index',$data);
        }else{
            return $this->access_blocked();
        }
    }

    public function get_datatable_data(Request $request)
    {
        if($request->ajax()){
            if(permission('customer-access')){

                if (!empty($request->name)) {
                    $this->model->setName($request->name);
                }
                if (!empty($request->company_name)) {
                    $this->model->setCompanyName($request->company_name);
                }
                if (!empty($request->mobile)) {
                    $this->model->setMobile($request->mobile);
                }
                if (!empty($request->email)) {
                    $this->model->setEmail($request->email);
                }
                if (!empty($request->customer_group_id)) {
                    $this->model->setCustomerGroupID($request->customer_group_id);
                }
                if (!empty($request->status)) {
                    $this->model->setStatus($request->status);
                }

                $this->set_datatable_default_properties($request);//set datatable default properties
                $list = $this->model->getDatatableList();//get table data
                $data = [];
                $no = $request->input('start');
                foreach ($list as $value) {
                    $no++;
                    $action = '';
                    if(permission('customer-edit')){
                    $action .= ' <a class="dropdown-item edit_data" data-id="' . $value->id . '">'.$this->actionButton('Edit').'</a>';
                    }
                    // if(permission('customer-view')){
                    // $action .= ' <a class="dropdown-item view_data" data-id="' . $value->id . '">'.self::ACTION_BUTTON['View'].'</a>';
                    // }
                    if(permission('customer-delete')){
                        $action .= ' <a class="dropdown-item delete_data"  data-id="' . $value->id . '" data-name="' . $value->name . '">'.$this->actionButton('Delete').'</a>';
                    }

                    $row = [];
                    if(permission('customer-bulk-delete')){
                        $row[] = row_checkbox($value->id);//custom helper function to show the table each row checkbox
                    }
                    $row[] = translate($no,App::getLocale());
                    $row[] = $value->name;
                    $row[] = $value->company_name;
                    $row[] = translate($value->mobile,App::getLocale());
                    $row[] = $value->customer_group->group_name;
                    $row[] = $value->email;
                    $row[] = $value->city;
                    $row[] = $value->zipcode;
                    $row[] = $value->address;
                    $row[] = permission('customer-edit') ? change_status($value->id,$value->status, $value->name) : STATUS_LABEL[$value->status];
                    $row[] = translate(number_format($this->model->customer_balance($value->id),2,'.',','),App::getLocale());
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

    public function store_or_update_data(CustomerFormRequest $request)
    {
        if($request->ajax()){
            if(permission('customer-add')){
                DB::beginTransaction();
                try {
                    $collection   = collect($request->validated());
                    $collection   = $this->track_data($collection,$request->update_id);
                    $customer     = $this->model->updateOrCreate(['id'=>$request->update_id],$collection->all());
                    $output       = $this->store_message($customer, $request->update_id);
                    if($request->update_id)
                    {
                        $new_head_name = $request->name;
                        $customer_coa  = ChartOfAccount::where(['customer_id'=>$request->update_id])->first();
                        if($customer_coa)
                        {
                            $customer_coa->update(['name'=>$new_head_name]);
                        }else{
                            $coa_max_code      = ChartOfAccount::where('level',4)->where('code','like','1020201%')->max('code');
                            $code              = $coa_max_code ? ($coa_max_code + 1) : '102020100001';
                            $customer_coa      = ChartOfAccount::create($this->coa_data($code,$new_head_name,$request->update_id));
                        }
                    }else{

                        $coa_max_code      = ChartOfAccount::where('level',4)->where('code','like','1020201%')->max('code');
                        $code              = $coa_max_code ? ($coa_max_code + 1) : '1020201000001';
                        $head_name         = $customer->name;
                        $customer_coa      = ChartOfAccount::create($this->coa_data($code,$head_name,$customer->id));
                        if(!empty($request->previous_balance))
                        {
                            if($customer_coa){
                                Transaction::insert($this->previous_balance_data($request->previous_balance,$customer_coa->id,$customer->name));
                            }
                        }
                    }
                    DB::commit();
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

    private function coa_data(string $code,string $head_name,int $customer_id)
    {
        return [
            'code'              => $code,
            'name'              => $head_name,
            'parent_name'       => 'Customer Receivable',
            'level'             => 4,
            'type'              => 'A',
            'transaction'       => 1,
            'general_ledger'    => 2,
            'customer_id'       => $customer_id,
            'budget'            => 2,
            'depreciation'      => 2,
            'depreciation_rate' => '0',
            'status'            => 1,
            'created_by'        => auth()->user()->name
        ];
    }

    private function previous_balance_data($balance, int $customer_coa_id, string $customer_name) {
        if(!empty($balance) && !empty($customer_coa_id) && !empty($customer_name)){
            $transaction_id = date('ymdHi').rand(1,99);
            // customer debit for previous balance
            $cosdr = array(
                'chart_of_account_id' => $customer_coa_id,
                'voucher_no'          => $transaction_id,
                'voucher_type'        => 'PR Balance',
                'voucher_date'        => date("Y-m-d"),
                'description'         => 'Debit '.$balance.' for old sale from '.$customer_name,
                'debit'               => $balance,
                'credit'              => 0,
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
                'description'         => 'Inventory credit '.$balance.' for Old sale from '.$customer_name,
                'debit'               => 0,
                'credit'              => $balance,
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

    private function previous_balance_update($balance, int $customer_coa_id, string $customer_name) {
        if(!empty($balance) && !empty($customer_coa_id) && !empty($customer_name)){

            $customer_pr_balance_data = Transaction::where(['chart_of_account_id' => $customer_coa_id, 'voucher_type'=> 'PR Balance',])->first();

            $voucher_no = $customer_pr_balance_data->voucher_no;

            $updated = $customer_pr_balance_data->update([
                'description'         => 'Customer debit For '.$customer_name,
                'debit'               => $balance,
                'modified_by'         => auth()->user()->name,
                'updated_at'          => date('Y-m-d H:i:s')
            ]);
            if($updated)
            {
                Transaction::where([
                    'chart_of_account_id' => DB::table('chart_of_accounts')->where('code', $this->coa_head_code('inventory'))->value('id'),
                    'voucher_no'=> $voucher_no])
                    ->update([
                        'description'         => 'Inventory credit For Old sale For '.$customer_name,
                        'credit'              => $balance,
                        'modified_by'         => auth()->user()->name,
                        'updated_at'          => date('Y-m-d H:i:s')
                    ]);
                return true;
            }else{
                return false;
            }
        }
    }

    public function edit(Request $request)
    {
        if($request->ajax()){
            if(permission('customer-edit')){
                $data   = $this->model->with('previous_balance')->findOrFail($request->id);
                $output = $this->data_message($data); //if data found then it will return data otherwise return error message
                return response()->json($output);
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
            if(permission('customer-delete')){
                DB::beginTransaction();
                try {
                    $total_sale_data = Sale::where('customer_id',$request->id)->get()->count();
                    if ($total_sale_data > 0) {
                        $output = ['status'=>'error','message' => $this->responseMessage('Related Data')];
                    } else {
                        $customer_coa_id = ChartOfAccount::where('customer_id',$request->id)->first();
                        Transaction::where('chart_of_account_id',$customer_coa_id->id)->delete();
                        $customer_coa_id->delete();
                        $result   = $this->model->find($request->id)->delete();
                        $output   = $this->delete_message($result);
                    }
                    DB::commit();
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
            if(permission('customer-bulk-delete')){
                DB::beginTransaction();
                try {
                    $delete_list = [];
                    $undelete_list = [];
                    foreach ($request->ids as $id) {
                        $total_sale_data = Sale::where('customer_id',$id)->get()->count();
                        if ($total_sale_data > 0) {
                            $name = DB::table('customers')->where('id',$id)->value('name');
                            array_push($undelete_list,$name);
                        }else{
                            $customer_coa_id = ChartOfAccount::where('customer_id',$id)->first();
                            Transaction::where('chart_of_account_id',$customer_coa_id->id)->delete();
                            $customer_coa_id->delete();
                            array_push($delete_list,$id);
                        }
                    }
                    if(!empty($delete_list)){
                            $result = $this->model->destroy($delete_list);
                            $output = $result ?  ['status'=>'success','message'=> $this->responseMessage('Select Data Delete') . (!empty($undelete_list) ? $this->responseMessage('Expected Menu').'('.implode(',',$undelete_list).')'.$this->responseMessage('Associated Other Data'): '')]
                            : ['status'=>'error','message'=>$this->responseMessage('Data Delete Failed')];
                    }else{
                        $output = ['status'=>'error','message'=> !empty($undelete_list) ? $this->responseMessage('Customer').'('.implode(',',$undelete_list).')' . $this->responseMessage('Associated Data') : ''];
                    }

                    DB::commit();
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
            if(permission('customer-edit')){
                $result   = $this->model->find($request->id)->update(['status' => $request->status]);
                $output   = $result ? ['status' => 'success','message' => $this->responseMessage('Status Changed')]
                : ['status' => 'error','message' => $this->responseMessage('Status Changed Failed')];
            }else{
                $output   = $this->unauthorized();
            }
            return response()->json($output);
        }else{
            return response()->json($this->unauthorized());
        }
    }
    public function groupData(int $id)
    {
        $data = $this->model->with('customer_group')->find($id);
        return $data ? $data->customer_group->percentage : 0;
    }
    public function previous_balance(int $id)
    {
        $data = DB::table('transactions as t')
                ->leftjoin('chart_of_accounts as coa','t.chart_of_account_id','=','coa.id')
                ->select(DB::raw("SUM(t.debit) - SUM(t.credit) as balance"),'coa.id','coa.code')
                ->groupBy('t.chart_of_account_id')
                ->where('coa.customer_id',$id)
                ->where('t.approve',1)
                ->first();
        $balance = $data ? $data->balance : 0;
        return  response()->json($balance);
    }
}
