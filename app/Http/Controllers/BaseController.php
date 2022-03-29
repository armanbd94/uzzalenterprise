<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Database\Eloquent\Model;

class BaseController extends Controller
{
    protected $model;
    protected const DELETABLE = ['1'=>'No','2'=>'Yes'];
    protected const ACTION_BUTTON = [
           'Edit'                           => '<i class="fas fa-edit text-primary mr-2"></i> Edit',
           'View'                           => '<i class="fas fa-eye text-warning mr-2"></i> View',
           'Delete'                         => '<i class="fas fa-trash text-danger mr-2"></i> Delete'
    ];
    public function actionButton($key){
        $button = [
            'Edit'                          => '<i class="fas fa-edit text-primary mr-2"></i>'.__('file.Edit'),
            'View'                          => '<i class="fas fa-eye text-warning mr-2"></i>'.__('file.View'),
            'Details'                       => '<i class="fas fa-newspaper text-primary mr-2"></i>'.__('file.Details'),
            'Delete'                        => '<i class="fas fa-trash text-danger mr-2"></i>'.__('file.Delete'),
            'Change Status'                 => '<i class="fas fa-check-circle text-success mr-2"></i>'.__('file.Change Status'),
            'Add Payment'                   => '<i class="fas fa-plus-square text-info mr-2"></i>'.__('file.Add Payment'),
            'Payment List'                  => '<i class="fas fa-file-invoice-dollar text-dark mr-2"></i>'.__('file.Payment List'),
            'Finish Good'                   => '<i class="fas fa-boxes text-info mr-2"></i>'.__('file.Finish Good'),
            'Production Product'            => '<i class="fas fa-boxes text-info mr-2"></i>'.__('file.Production Product'),
            'Update Delivery'               => '<i class="fas fa-truck text-info mr-2"></i>'.__('file.Update Delivery'),
            'Add Delivery'                  => '<i class="fas fa-truck text-info mr-2"></i>'.__('file.Add Delivery'),
            'Save'                          => __('file.Save'),
            'Generate Slip'                 => '<i class="fas fa-file-invoice-dollar text-dark mr-2"></i>'.__('file.Generate Slip'),
            'Builder'                       => '<i class="fas fa-th-list text-success mr-2"></i>'.__('file.Menu Builder'),
        ];
        return $button[$key];
    }
    public function responseMessage($response){
        $message = [
            'Data Saved'                    => __('file.Data Has Been Saved Successfully'),
            'Data Update'                   => __('file.Data Has Been Updated Successfully'),
            'Failed Save'                   => __('file.Failed To Save Data'),
            'Failed Update'                 => __('file.Failed To Update Data'),
            'Data Delete'                   => __('file.Data Has Been Delete Successfully'),
            'Data Delete Failed'            => __('file.Failed To Delete Data'),
            'Select Data Delete'            => __('file.Selected Data Has Been Delete Successfully'),
            'Select Data Delete Failed'     => __('file.Failed To Delete Selected Data'),
            'Unauthorized Blocked'          => __('file.Unauthorized Access Blocked!'),
            'No Data'                       => __('file.No data found'),
            'Status Changed'                => __('file.Status Has Been Changed Successfully'),
            'Status Changed Failed'         => __('file.Failed To Change Status'),
            'Hold'                          => __('file.Data Hold Successfully'),
            'Hold Failed'                   => __('file.Failed to Hold Purchase Data'),
            'Select Status'                 => __('file.Please select status'),
            'Approval Status'               => __('file.Approval Status Changed Successfully'),
            'Approval Status Failed'        => __('file.Failed To Change Approval Status'),
            'Unauthorized'                  => __('file.Unauthorized Access Blocked!'),
            'Related Data'                  => __('file.This data cannot delete because it is related with others data.'),
            'Associated Data'               => __('file.can\'t delete because they are associated with others data.'),
            'Expected Menu'                 => __('file.Except these menus'),
            'Associated Other Data'         => __('file.because they are associated with others data.'),
            'Customer'                      => __('file.These customers'),
            'Payment Data'                  => __('file.Payment Data Saved Successfully'),
            'Payment Data Delete'           => __('file.Failed to Save Payment Data'),
            'Account Deleted Transaction'   => __('file.This account cannot delete because it is related with many transactions.'),
            'Selected Data Delete'          => __('file.Selected Data Has Been Deleted Successfully.'),
            'Expected Role'                 => __('file.Except these roles'),
            'Roles'                         => __('file.These roles'),
            'Except'                        => __('file.Except these'),
            'Current Password'              => __('file.Current password does not match!'),
            'Changed Password'              => __('file.Password changed successfully'),
            'Failed Password'               => __('file.Failed to change password. Try Again!'),
            'Warehouse Choose'              => __('file.Please Choose An Warehouse')
        ];
        return $message[$response];
    }
    protected function setPageData(string $page_title, string $sub_title=null, string $page_icon=null, $breadcrumb=null)
    {
        view()->share(['page_title' => $page_title, 'sub_title' => $sub_title ?? $page_title, 'page_icon' => $page_icon, 'breadcrumb' => $breadcrumb]);
    }
    protected function table_image($path,$image,$alt_text,$gender=null)
    {
        if(!empty($path) && !empty($image) && !empty($alt_text))
        {
            return "<img src='".asset("storage/".$path.$image)."' alt='".$alt_text."' style='width:50px;'/>";
        }else{
            if($gender){
                    return "<img src='".asset("images/".($gender == 1 ? 'male' : 'female').".svg")."' alt='Default Image' style='width:50px;'/>";
            }else{
                return "<img src='".asset("images/default.svg")."' alt='Default Image' style='width:50px;'/>";
            }

        }
    }
    protected function set_datatable_default_properties(Request $request)
    {
        $this->model->setOrderValue($request->input('order.0.column'));
        $this->model->setDirValue($request->input('order.0.dir'));
        $this->model->setLengthValue($request->input('length'));
        $this->model->setStartValue($request->input('start'));
    }
    /**
     * @param int $errorCode
     * @param null $message
     * @return \Illuminate\Http\Response
     */
    protected function showErrorPage($errorCode = 404, $message = null)
    {
        $data['message'] = $message;
        return response()->view('errors.'.$errorCode, $data, $errorCode);
    }
    protected function response_json($status='success',$message=null,$data=null,$response_code=200)
    {
        return response()->json([
            'status'        => $status,
            'message'       => $message,
            'data'          => $data,
            'response_code' => $response_code,
        ]);
    }
    protected function datatable_draw($draw, $recordsTotal, $recordsFiltered, $data)
    {
        return array(
            "draw" => $draw,
            "recordsTotal" => $recordsTotal,
            "recordsFiltered" => $recordsFiltered,
            "data" => $data,
        );
    }
    protected function store_message($result, $update_id = null)
    {
        return $result ? ['status' => 'success','message' => !empty($update_id) ? $this->responseMessage('Data Update') : $this->responseMessage('Data Saved')]
        : ['status' => 'error','message' => !empty($update_id) ? $this->responseMessage('Failed Update') : $this->responseMessage('Failed Save')];
    }
    protected function delete_message($result)
    {
        return $result ? ['status' => 'success','message' => $this->responseMessage('Data Delete')]
        : ['status' => 'error','message' => $this->responseMessage('Data Delete Failed')];
    }
    protected function bulk_delete_message($result)
    {
        return $result ? ['status' => 'success','message' => $this->responseMessage('Select Data Delete')]
        : ['status' => 'error','message' => $this->responseMessage('Select Data Delete Failed')];
    }
    protected function unauthorized()
    {
        return ['status'=>'error','message' => $this->responseMessage('Unauthorized Blocked')];
    }
    protected function data_message($data)
    {
        return $data ? $data : ['status' => 'error','message' => $this->responseMessage('No Data')];
    }
    protected function access_blocked()
    {
        return redirect('unauthorized')->with(['status'=>'error','message' => $this->responseMessage('Unauthorized Blocked')]);
    }
    protected function track_data($collection, $update_id=null)
    {
        $created_by   = $modified_by = auth()->user()->name;
        $created_at   = $updated_at  = Carbon::now();
        return $update_id ? $collection->merge(compact('modified_by','updated_at')) : $collection->merge(compact('created_by','created_at'));
    }
    protected function coa_head_code(string $head_name)
    {
        switch (strtolower(str_replace('-','_',$head_name))) {
            case 'assets':
                return 1;
                break;
            case 'non_current_asset':
                return 101;
                break;
            case 'inventory':
                return 10101;
                break;
            case 'current_asset':
                return 102;
                break;
            case 'cash_&_cash_equivalent':
                return 10201;
                break;
            case 'cash_in_hand':
                return 1020101;
                break;
            case 'cash_at_bank':
                return 1020102;
                break;
            case 'cash_at_mobile_bank':
                return 1020103;
                break;
            case 'account_receivable':
                return 10202;
                break;
            case 'customer_receivable':
                return 10202010001;
                break;
            case '1_walking_customer':
                return 10202010001;
                break;
            case 'loan_receivable':
                return 1020202;
                break;
            case 'equity':
                return 2;
                break;
            case 'income':
                return 3;
                break;
            case 'product_sale':
                return 301;
                break;
            case 'service_income':
                return 302;
                break;
            case 'expense':
                return 4;
                break;
            case 'default_expense':
                return 401;
                break;
            case 'material_purchase':
                return 402;
                break;
            case 'employee_salary':
                return 403;
                break;
            case 'machine_purchase':
                return 404;
                break;
            case 'maintenance_service':
                return 405;
                break;
            case 'liabilities':
                return 5;
                break;
            case 'non_current_liabilities':
                return 501;
                break;
            case 'current_liabilities':
                return 502;
                break;
            case 'account_payable':
                return 50201;
                break;
            case 'default_supplier':
                return 502010001;
                break;
            case 'employee_ledger':
                return 50202;
                break;
            case 'tax':
                return 50203;
                break;
        }
    }
}
