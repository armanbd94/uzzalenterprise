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
                    $row[] = $this->table_image(PRODUCT_IMAGE_PATH,$value->image,$value->name);
                    $row[] = $value->name;
                    $row[] = $value->code;
                    $row[] = $value->category->name;
                    $row[] = $value->unit->unit_name;
                    $row[] = $value->sale_unit->unit_name;
                    $row[] = number_format($value->cost,2);
                    $row[] = number_format($value->price,2);
                    $row[] = $value->qty;
                    $row[] = $value->opening_stock_qty;
                    $row[] = optional($value->tax)->name;
                    $row[] = TAX_METHOD[$value->tax_method];
                    $row[] = $value->alert_quantity;
                    $row[] = permission('product-edit') ? change_status($value->id,$value->status, $value->name) : STATUS_LABEL[$value->status];
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
        if(permission('product-add')){
            $setTitle = __('file.Product');
            $setSubTitle = __('file.Add Finished Goods');
            $this->setPageData($setSubTitle,$setSubTitle,'fab fa-product-hunt',[['name'=>$setTitle,'link'=> route('product')],['name' => $setSubTitle]]);
            $data = [
                'categories' => Category::allProductCategories(),
                'units'      => Unit::all(),
                'taxes'      => Tax::activeTaxes(),
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
                    $collection        = collect($request->validated())->except('alert_quantity','tax_id');
                    $alert_quantity    = $request->alert_quantity ? $request->alert_quantity : 0;
                    $tax_id            = ($request->tax_id != 0) ? $request->tax_id : null;
                    $has_opening_stock = $request->has_opening_stock;
                    $image = !empty($request->old_image) ? $request->old_image : null;
                    if($request->hasFile('image')){
                        $image      = $this->upload_file($request->file('image'),PRODUCT_IMAGE_PATH);
                    }
                    $collection        = $collection->merge(compact('has_opening_stock','alert_quantity','tax_id','image'));
                    if(empty($request->update_id))
                    {
                        $collection        = $collection->merge(['cost'=>0]);
                    }
                    $collection        = $this->track_data($collection,$request->update_id);

                    if($request->update_id)
                    {
                        $product_old_data = $this->model->find($request->update_id);
                        if($has_opening_stock == 1)
                        {
                            if(!empty($product_old_data->opening_stock_qty))
                            {
                                $old_warehouse_product = WarehouseProduct::where([
                                    ['warehouse_id',$product_old_data->opening_warehouse_id],
                                    ['product_id',$product_old_data->id],
                                    ['qty','<>',0]
                                    ])->first();
                                if($old_warehouse_product){
                                    $old_warehouse_product->qty -= $product_old_data->opening_stock_qty;
                                    $old_warehouse_product->update();
                                }

                                $product_old_data->qty -= $product_old_data->opening_stock_qty;
                                $product_old_data->update();

                                $product_new_data = $this->model->find($request->update_id);
                                $product_new_data->qty += $request->opening_stock_qty;
                                $product_new_data->update();

                                $new_warehouse_product = WarehouseProduct::where(['warehouse_id' =>$request->opening_warehouse_id,'product_id' => $request->update_id])->first();
                                if($new_warehouse_product)
                                {
                                    $new_warehouse_product->qty += $request->opening_stock_qty;
                                    $new_warehouse_product->update();
                                }else{
                                    WarehouseProduct::create([
                                        'warehouse_id' => $request->opening_warehouse_id,
                                        'product_id' => $request->update_id,
                                        'qty' => $request->opening_stock_qty,
                                    ]);
                                }
                            }else{
                                $product_old_data->qty += $request->opening_stock_qty;
                                $product_old_data->update();

                                $new_warehouse_product = WarehouseProduct::where(['warehouse_id' =>$request->opening_warehouse_id,'product_id' => $request->update_id])->first();
                                if($new_warehouse_product)
                                {
                                    $new_warehouse_product->qty += $request->opening_stock_qty;
                                    $new_warehouse_product->update();
                                }else{
                                    WarehouseProduct::create([
                                        'warehouse_id' => $request->opening_warehouse_id,
                                        'product_id' => $request->update_id,
                                        'qty' => $request->opening_stock_qty,
                                    ]);
                                }
                            }
                        }else{
                            if(!empty($product_old_data->opening_stock_qty))
                            {
                                $old_warehouse_product = WarehouseProduct::where(['warehouse_id' => $product_old_data->opening_warehouse_id,'product_id' => $product_old_data->id])->first();

                                if($old_warehouse_product){
                                    $old_warehouse_product->qty -= $product_old_data->opening_stock_qty;
                                    $old_warehouse_product->update();
                                }
                                $product_old_data->qty -= $product_old_data->opening_stock_qty;
                                $product_old_data->update();
                            }
                        }
                        $result     = $this->model->updateOrCreate(['id'=>$request->update_id],$collection->all());
                    }else{
                        $result = $this->model->updateOrCreate(['id'=>$request->update_id],$collection->all());
                        if($has_opening_stock == 1)
                        {
                            $product      = $this->model->find($result->id);
                            $product->qty = $request->opening_stock_qty;
                            $product->update();
                            WarehouseProduct::create([
                                'warehouse_id' => $request->opening_warehouse_id,
                                'product_id'   => $result->id,
                                'qty'          => $request->opening_stock_qty,
                            ]);
                        }
                    }
                    if($result)
                    {
                        if($request->hasFile('image')){
                            if(!empty($request->old_image)){
                                $this->delete_file($request->old_image, PRODUCT_IMAGE_PATH);
                            }
                        }
                    }else{
                        if($request->hasFile('image')){
                            if(!empty($image)){
                                $this->delete_file($image, PRODUCT_IMAGE_PATH);
                            }
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
            $setSubTitle = __('file.Edit Finished Goods');
            $this->setPageData($setSubTitle,$setSubTitle,'fab fa-pencil',[['name'=>$setTitle,'link'=> route('product')],['name' => $setSubTitle]]);
            $data = [
                'product'    => $this->model->findOrFail($id),
                'categories' => Category::allProductCategories(),
                'units'      => Unit::all(),
                'taxes'      => Tax::activeTaxes(),
                'warehouses' => Warehouse::activeWarehouses(),
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
            $product = $this->model->with('category','tax','unit','sale_unit','opening_warehouse')->findOrFail($id);
            return view('product::details',compact('product'));
        }else{
            return $this->access_blocked();
        }
    }
    public function delete(Request $request)
    {
        if($request->ajax()){
            if(permission('product-delete')){
                $product  = $this->model->find($request->id);
                $old_image = $product ? $product->image : '';
                $result    = $product->delete();
                if($result && $old_image != ''){
                    $this->delete_file($old_image, PRODUCT_IMAGE_PATH);
                }
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
            if(permission('product-bulk-delete')){
                // $result   = $this->model->destroy($request->ids);
                // $output   = $this->bulk_delete_message($result);
                $products = $this->model->toBase()->select('image')->whereIn('id',$request->ids)->get();
                $result = $this->model->destroy($request->ids);
                if($result){
                    if(!empty($products)){
                        foreach ($products as $product) {
                            if($product->image != null)
                            {
                                $this->delete_file($product->image,PRODUCT_IMAGE_PATH);
                            }
                        }
                    }
                }
                $output   = $this->bulk_delete_message($result);
            }else{
                $output   = $this->unauthorized();
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
