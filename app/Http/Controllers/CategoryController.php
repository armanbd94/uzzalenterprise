<?php

namespace App\Http\Controllers;

use App\Models\Category;
use Illuminate\Http\Request;
use App\Http\Controllers\BaseController;
use App\Http\Requests\CategoryFormRequest;

class CategoryController extends BaseController
{
    public function __construct(Category $model)
    {
        $this->model = $model;
    }

    public function index()
    {
        if(permission('category-access')){
            $setTitle = __('file.Category');
            $this->setPageData($setTitle,$setTitle,'fas fa-th-list',[['name' => $setTitle]]);
            return view('category.index');
        }else{
            return $this->access_blocked();
        }
    }

    public function get_datatable_data(Request $request)
    {
        if($request->ajax()){
            if(permission('category-access')){
                if (!empty($request->name)) {
                    $this->model->setName($request->name);
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
                    if(permission('category-edit')){
                        $action .= ' <a class="dropdown-item edit_data" data-id="' . $value->id . '">'.$this->actionButton('Edit').'</a>';
                    }
//                    if(permission('category-delete')){
//                        $action .= ' <a class="dropdown-item delete_data"  data-id="' . $value->id . '" data-name="' . $value->name . '">'.$this->actionButton('Delete').'</a>';
//                    }
                    $row = [];
                    if(permission('category-bulk-delete')){
                        $row[] = row_checkbox($value->id);//custom helper function to show the table each row checkbox
                    }
                    $row[] = $no;
                    $row[] = $value->name;
                    $row[] = (permission('category-edit')) ? change_status($value->id,$value->status, $value->name) : STATUS_LABEL[$value->status];
                    $row[] = $value->created_by;
                    $row[] = $value->modified_by ?? '<span class="label label-danger label-pill label-inline" style="min-width:70px !important;">Not Modified Yet</span>';
                    $row[] = $value->created_at ? date(config('settings.date_format'),strtotime($value->created_at)) : '';
                    $row[] = $value->modified_by ? date(config('settings.date_format'),strtotime($value->updated_at)) : '<span class="label label-danger label-pill label-inline" style="min-width:70px !important;">No Update Date</span>';
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

    public function store_or_update_data(CategoryFormRequest $request)
    {
        if($request->ajax()){
            if(permission('category-add')){
                $collection   = collect($request->validated());
                $collection   = $this->track_data($collection,$request->update_id);
                $result       = $this->model->updateOrCreate(['id'=>$request->update_id],$collection->all());
                $output       = $this->store_message($result, $request->update_id);
                $this->model->flushCategoryCache();
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
            if(permission('category-edit')){
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
            if(permission('category-delete')){
                $result   = $this->model->find($request->id)->delete();
                $output   = $this->delete_message($result);
                $this->model->flushCategoryCache();
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
            if(permission('category-bulk-delete') ){
                $result   = $this->model->destroy($request->ids);
                $output   = $this->bulk_delete_message($result);
                $this->model->flushCategoryCache();
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
            if(permission('category-edit') ){
                $result   = $this->model->find($request->id)->update(['status' => $request->status]);
                $this->model->flushCategoryCache();
                $output   = $result ? ['status' => 'success','message' => $this->responseMessage('Status Changed')]
                : ['status' => 'error','message' => $this->responseMessage('Status Changed Failed')];
            }else{
                $output       = $this->unauthorized();
            }
            return response()->json($output);
        }else{
            return response()->json($this->unauthorized());
        }
    }
}
