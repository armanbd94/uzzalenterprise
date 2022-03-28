<?php

namespace Modules\Vehicle\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\App;
use Modules\Vehicle\Entities\Vehicle;
use App\Http\Controllers\BaseController;
use Modules\Vehicle\Http\Requests\VehicleFormRequest;

class VehicleController extends BaseController
{
    public function __construct(Vehicle $model)
    {
        $this->model = $model;
    }
    public function index()
    {
        if(permission('vehicle-access')){
            $setTitle = __('file.Vehicle');
            $this->setPageData($setTitle,$setTitle,'fas fa-truck-moving',[['name' => $setTitle]]);
            return view('vehicle::index');
        }else{
            return $this->access_blocked();
        }
    }
    public function get_datatable_data(Request $request)
    {
        if($request->ajax()){
            if(permission('vehicle-access')){
                if (!empty($request->name)) {
                    $this->model->setName($request->name);
                }
                $this->set_datatable_default_properties($request);//set datatable default properties
                $list = $this->model->getDatatableList();//get table data
                $data = [];
                $no = $request->input('start');
                foreach ($list as $value) {
                    $no++;
                    $action = '';
                    if(permission('vehicle-edit')){
                        $action .= ' <a class="dropdown-item edit_data" data-id="' . $value->id . '">'.$this->actionButton('Edit').'</a>';
                    }
                    if(permission('vehicle-delete')){
                        $action .= ' <a class="dropdown-item delete_data"  data-id="' . $value->id . '" data-name="' . $value->name . '">'.$this->actionButton('Delete').'</a>';
                        
                    }
                    $row    = [];
                    if(permission('vehicle-bulk-delete')){
                        $row[]  = row_checkbox($value->id);//custom helper function to show the table each row checkbox
                    }
                    $row[]  = translate($no,App::getLocale());
                    $row[]  = $value->name;
                    $row[]  =$value->qty;
                    $row[]  = permission('vehicle-edit') ? change_status($value->id,$value->status, $value->name) : STATUS_LABEL[$value->status];
                    $row[] =  $value->creator->name;
                    $row[] =  translate(date('d-m-Y',strtotime($value->created_at)),App::getLocale());
                    $row[]  = action_button($action);//custom helper function for action button
                    $data[] = $row;
                }
                return $this->datatable_draw($request->input('draw'),$this->model->count_all(),
                $this->model->count_filtered(), $data);
            }
        }else{
            return response()->json($this->unauthorized());
        }
    }
    public function store_or_update_data(VehicleFormRequest $request)
    {
        if($request->ajax()){
            if(permission('vehicle-add')){
                $collection   = collect($request->validated())->merge($request->update_id ?  ['modifier_id' => auth()->user()->id] : ['creator_id' => auth()->user()->id]);
                $result       = $this->model->updateOrCreate(['id'=>$request->update_id],$collection->all());
                $output       = $this->store_message($result, $request->update_id);
            }else{
                $output       = $this->unauthorized();
            }
            return response()->json($output);
        }else{
            return response()->json($this->unauthorized());
        }
    }
    public function edit(Request $request)
    {
        if($request->ajax()){
            if(permission('vehicle-edit')){
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
            if(permission('vehicle-delete')){
                $result   = $this->model->find($request->id)->delete();
                $output   = $this->delete_message($result);
            }else{
                $output   = $this->unauthorized();
            }
            return response()->json($output);
        }else{
            return response()->json($this->unauthorized());
        }
    }
    public function bulk_delete(Request $request)
    {
        if($request->ajax()){
            if(permission('vehicle-bulk-delete')){
                $result   = $this->model->destroy($request->ids);
                $output   = $this->bulk_delete_message($result);
            }else{
                $output   = $this->unauthorized();
            }
            return response()->json($output);
        }else{
            return response()->json($this->unauthorized());
        }
    }
    public function change_status(Request $request)
    {
        if($request->ajax()){
            if(permission('vehicle-edit')){
                $result   = $this->model->find($request->id)->update(['status' => $request->status]);
                $output   = $result ? ['status' => 'success','message' => $this->responseMessage('Status Changed')] : ['status' => 'error','message' => $this->responseMessage('Status Changed Failed')];
            }else{
                $output   = $this->unauthorized();
            }
            return response()->json($output);
        }else{
            return response()->json($this->unauthorized());
        }
    }
}
