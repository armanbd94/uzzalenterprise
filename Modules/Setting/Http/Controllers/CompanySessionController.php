<?php

namespace Modules\Setting\Http\Controllers;

use App\Models\Setting;
use Illuminate\Http\Request;
use App\Http\Controllers\BaseController;
use Modules\Setting\Entities\CompanySession;
use Modules\Setting\Http\Requests\CompanySessionRequest;
use Illuminate\Support\Facades\App;

class CompanySessionController extends BaseController
{
    public function __construct(CompanySession $model)
    {
        $this->model = $model;
    }
    public function index()
    {
        if(permission('session-access')){
            $setTitle = __('file.Session List');
            $this->setPageData($setTitle,$setTitle,'fas fa-life-ring',[['name' => $setTitle]]);
            return view('setting::session.index');
        }else{
            return $this->access_blocked();
        }
    }
    public function get_datatable_data(Request $request)
    {
        if($request->ajax()){
            if(permission('session-access')){

 
                $this->set_datatable_default_properties($request);//set datatable default properties
                $list = $this->model->getDatatableList();//get table data
                $data = [];
                $no = $request->input('start');
                foreach ($list as $value) {
                    $no++;
                    $action = '';
                    if(permission('session-edit')){
                        $action .= ' <a class="dropdown-item edit_data" data-id="' . $value->id . '">'.$this->actionButton('Edit').'</a>';
                    }
                    if(permission('session-delete')){
                        $action .= ' <a class="dropdown-item delete_data"  data-id="' . $value->id . '" data-name="' . $value->session_name . '">'.$this->actionButton('Delete').'</a>';
                    }
                    $row = [];
                    if(permission('session-bulk-delete')){
                        $row[] = row_checkbox($value->id);
                    }
                    $row[] = translate($no,App::getLocale());
                    $row[] = translate($value->session_name,App::getLocale());
                    $row[] = translate(date('d-m-Y',strtotime($value->session_start)),App::getLocale());
                    $row[] = translate(date('d-m-Y',strtotime($value->session_end)),App::getLocale());
                    $row[] = $value->creator->name;
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
    public function store_or_update_data(CompanySessionRequest $request)
    {
        if($request->ajax()){
            if(permission('unit-add')){
                $collection      = collect($request->validated())->merge($request->update_id ?  ['modifier_id' => auth()->user()->id] : ['creator_id' => auth()->user()->id]);
                $result          = $this->model->updateOrCreate(['id'=>$request->update_id],$collection->all());
                $output          = $this->store_message($result, $request->update_id);
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
            if(permission('unit-edit')){
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
            if(permission('unit-delete')){
                $session   = $this->model->find($request->id);
                $active_session_id = Setting::get('active_session_id');
                if($active_session_id == $request->id)
                {
                    $output = ['status' => 'error','message' => __('file.This session cannot delete because it is default session')];
                }else{
                    $result =  $session->delete();
                    $output = $this->delete_message($result);
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
            if(permission('unit-bulk-delete')){
                $delete = [];
                $not_delete = [];
                foreach ($request->ids as $id) {
                    $session   = $this->model->find($request->id);
                    $active_session_id = Setting::get('active_session_id');
                    if($active_session_id == $request->id)
                    {
                        $output = ['status' => 'error','message' => __('file.This session cannot delete because it is default session')];
                    }else{
                        $result =  $session->delete();
                        $output = $this->delete_message($result);
                    }
                }
                
            }else{
                $output       = $this->unauthorized();
            }
            return response()->json($output);
        }else{
            return response()->json($this->unauthorized());
        }
    }

    public function sessionSwitch($id)
    {
        $session = CompanySession::find($id);
        Setting::set('active_session_id',$id);
        Setting::set('session_start',$session->session_start);
        Setting::set('session_end',$session->session_end);
        return redirect()->back()->with('success', 'Session updated successfully');
    }
}
