<?php

namespace Modules\Product\Http\Controllers;

use Keygen\Keygen;
use App\Models\Tax;
use App\Models\Unit;
use App\Models\Category;
use App\Traits\UploadAble;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Modules\Product\Entities\Product;
use Modules\Setting\Entities\Warehouse;
use App\Http\Controllers\BaseController;
use Modules\Product\Entities\WarehouseProduct;
use Modules\Product\Http\Requests\ProductFormRequest;

class ProductController extends BaseController
{
    use UploadAble;
    public function __construct(Product $model)
    {
        $this->model = $model;
    }

    public function index()
    {
        if(permission('product-access')){
            $setTitle = __('file.Product Manage');
            $this->setPageData($setTitle,$setTitle,'fab fa-product-hunt',[['name' => $setTitle]]);
            $data = [
                'categories' => Category::allProductCategories(),
            ];
            return view('product::index',$data);
        }else{
            return $this->access_blocked();
        }
    }

    public function get_datatable_data(Request $request)
    {
        if($request->ajax()){
            if(permission('product-access')){

                if (!empty($request->name)) {
                    $this->model->setName($request->name);
                }
                if (!empty($request->category_id)) {
                    $this->model->setCategoryID($request->category_id);
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
                    if(permission('product-edit')){
                        $action .= ' <a class="dropdown-item" href="'.route("product.edit",$value->id).'">'.$this->actionButton('Edit').'</a>';
                    }
                    if(permission('product-view')){
                        $action .= ' <a class="dropdown-item" href="'.url("product/view/".$value->id).'">'.$this->actionButton('View').'</a>';
                    }
                    if(permission('product-delete')){
                        $action .= ' <a class="dropdown-item delete_data"  data-id="' . $value->id . '" data-name="' . $value->name . '">'.$this->actionButton('Delete').'</a>';
                    }

                    $row = [];
                    if(permission('product-bulk-delete')){
                        $row[] = row_checkbox($value->id);//custom helper function to show the table each row checkbox
                    }
                    $row[] = $no;
                    $row[] = $value->name.'<br><b>Code: </b>'.$value->code.'<br><b>Category: </b>'.$value->category->name;
                    $row[] = $value->unit->unit_name;
                    $row[] = number_format($value->cost,2);
                    $row[] = number_format($value->price,2);
                    $row[] = $value->qty;
                    $row[] = $value->alert_qty;
                    $row[] = permission('product-edit') ? change_status($value->id,$value->status, $value->name) : STATUS_LABEL[$value->status];
                    $row[] = action_button($action);
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
        if(permission('product-add')){
            $setTitle = __('file.Product');
            $setSubTitle = __('file.Add Product');
            $this->setPageData($setSubTitle,$setSubTitle,'fab fa-product-hunt',[['name'=>$setTitle,'link'=> route('product')],['name' => $setSubTitle]]);
            $data = [
                'categories' => Category::allProductCategories(),
                'units'      => Unit::all(),
                'warehouses' => Warehouse::activeWarehouses(),
            ];
            return view('product::create',$data);
        }else{
            return $this->access_blocked();
        }
    }

    public function store_or_update_data(ProductFormRequest $request)
    {
        if($request->ajax()){
            if(permission('product-add')){
                DB::beginTransaction();
                try {
                    // dd($request->all());
                    $collection        = collect($request->validated())->except('has_opening_stock');
                    $collection        = $this->track_data($collection,$request->update_id);
                    if($request->update_id)
                    {
                        $result     = $this->model->find($request->update_id)->update($collection->all());
                    }else{
                        $has_opening_stock = $request->has_opening_stock ? $request->has_opening_stock : 2;
                        $collection        = $collection->merge(compact('has_opening_stock'));
                        if($has_opening_stock == 1)
                        {
                            $cost       = $request->opening_cost;
                            $qty        = $request->opening_stock_qty;
                            $collection = $collection->merge(compact('cost','qty'));
                        }
                        $result = $this->model->create($collection->all());
                        if($has_opening_stock == 1)
                        {
                            WarehouseProduct::create([
                                'warehouse_id' => $request->opening_warehouse_id,
                                'product_id'   => $result->id,
                                'qty'          => $request->opening_stock_qty,
                            ]);
                        }
                    }
                    $output     = $this->store_message($result, $request->update_id);
                    DB::commit();
                }catch (\Throwable $th) {
                   DB::rollback();
                   $output = ['status' => 'error','message' => $th->getMessage()];
                }
            }else{
                $output     = $this->unauthorized();
            }
            return response()->json($output);
        }else{
            return response()->json($this->unauthorized());
        }
    }

    public function edit(int $id)
    {
        if(permission('product-edit')){
            $setTitle = __('file.Product');
            $setSubTitle = __('file.Edit Product');
            $this->setPageData($setSubTitle,$setSubTitle,'fab fa-pencil',[['name'=>$setTitle,'link'=> route('product')],['name' => $setSubTitle]]);
            $data = [
                'product'    => $this->model->findOrFail($id),
                'categories' => Category::allProductCategories(),
                'units'      => Unit::all(),
            ];
            return view('product::edit',$data);
        }else{
            return $this->access_blocked();
        }
    }
    public function show(int $id)
    {
        if(permission('product-view')){
            $setTitle = __('file.Product');
            $setSubTitle = __('file.Product Details');
            $this->setPageData($setSubTitle,$setSubTitle,'fas fa-paste',[['name'=>$setTitle,'link'=> route('product')],['name' => $setSubTitle]]);
            $product = $this->model->with('category','unit')->findOrFail($id);
            return view('product::details',compact('product'));
        }else{
            return $this->access_blocked();
        }
    }
    public function delete(Request $request)
    {
        if($request->ajax()){
            if(permission('product-delete')){
                DB::beginTransaction();
                try {
                    $product  = $this->model->find($request->id);
                    if($product->has_opening_stock == 1)
                    {
                        WarehouseProduct::where(['warehouse_id' => $product->opening_warehouse_id,'product_id'=>$product->id])->delete();
                    }
                    $result    = $product->delete();
                    $output   = $this->delete_message($result);
                    DB::commit();
                }catch (\Throwable $th) {
                   DB::rollback();
                   $output = ['status' => 'error','message' => $th->getMessage()];
                }
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
            if(permission('product-bulk-delete')){
                DB::beginTransaction();
                try {
                    $products = $this->model->toBase()->whereIn('id',$request->ids)->get();
                    foreach ($products as $product) {
                        if($product->has_opening_stock == 1)
                        {
                            WarehouseProduct::where(['warehouse_id' => $product->opening_warehouse_id,'product_id'=>$product->id])->delete();
                        }
                    }
                    $result = $this->model->destroy($request->ids);
                    $output   = $this->bulk_delete_message($result);
                    DB::commit();
                }catch (\Throwable $th) {
                   DB::rollback();
                   $output = ['status' => 'error','message' => $th->getMessage()];
                }
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
            if(permission('product-edit')){
                $result   = $this->model->find($request->id)->update(['status' => $request->status]);
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

    //Generate Material Code
    public function generateProductCode()
    {
        $code = Keygen::numeric(8)->generate();
        //Check Material Code ALready Exist or Not
        if(DB::table('products')->where('code',$code)->exists())
        {
            $this->generateProductCode();
        }else{
            return response()->json($code);
        }
    }
}
