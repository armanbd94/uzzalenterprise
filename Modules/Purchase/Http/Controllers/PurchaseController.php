<?php

namespace Modules\Purchase\Http\Controllers;

use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\App;
use Modules\Product\Entities\Product;
use Modules\Purchase\Entities\Purchase;
use Modules\Setting\Entities\Warehouse;
use Modules\Supplier\Entities\Supplier;
use App\Http\Controllers\BaseController;
use Modules\Account\Entities\Transaction;
use Modules\Product\Entities\WarehouseProduct;
use Modules\Purchase\Http\Requests\PurchaseFormRequest;

class PurchaseController extends BaseController
{

    public function __construct(Purchase $model)
    {
        $this->model = $model;
    }

    public function index()
    {
        if(permission('purchase-access')){
            $setTitle = __('file.Purchase Manage');
            $this->setPageData($setTitle,$setTitle,'fas fa-shopping-cart',[['name' => $setTitle]]);
            $suppliers  = Supplier::allSuppliers();
            $warehouses = Warehouse::activeWarehouses();
            return view('purchase::index',compact('suppliers','warehouses'));
        }else{
            return $this->access_blocked();
        }
    }

    public function get_datatable_data(Request $request)
    {
        if($request->ajax()){
            if(permission('purchase-access')){

                if (!empty($request->memo_no)) {
                    $this->model->setMemoNo($request->memo_no);
                }
                if (!empty($request->from_date)) {
                    $this->model->setFromDate($request->from_date);
                }
                if (!empty($request->to_date)) {
                    $this->model->setToDate($request->to_date);
                }
                if (!empty($request->warehouse_id)) {
                    $this->model->setWarehouseID($request->warehouse_id);
                }
                if (!empty($request->supplier_id)) {
                    $this->model->setSupplierID($request->supplier_id);
                }
                if (!empty($request->payment_status)) {
                    $this->model->setPaymentStatus($request->payment_status);
                }


                $this->set_datatable_default_properties($request);//set datatable default properties
                $list = $this->model->getDatatableList();//get table data
                $data = [];
                $no = $request->input('start');
                foreach ($list as $value) {
                    $no++;
                    $action = '';
                    if(permission('purchase-edit')){
                        $action .= ' <a class="dropdown-item" href="'.route("purchase.edit",$value->id).'">'.$this->actionButton('Edit').'</a>';
                    }
                    if(permission('purchase-view')){
                        $action .= ' <a class="dropdown-item view_data" href="'.route("purchase.view",$value->id).'">'.$this->actionButton('View').'</a>';
                    }
                    if(permission('purchase-delete')){
                        $action .= ' <a class="dropdown-item delete_data"  data-id="' . $value->id . '" data-name="' . $value->memo_no . '">'.$this->actionButton('Delete').'</a>';
                    }

                    $row = [];
                    if(permission('purchase-bulk-delete')){
                        $row[] = row_checkbox($value->id);//custom helper function to show the table each row checkbox
                    }
                    $row[] = translate($no,App::getLocale());
                    $row[] = translate(date('d-m-Y',strtotime($value->purchase_date)),App::getLocale());
                    $row[] = translate($value->memo_no,App::getLocale());
                    $row[] = $value->warehouse_name;
                    $row[] = $value->supplier_name;
                    $row[] = translate($value->item,App::getLocale()).' ('.translate($value->total_qty,App::getLocale()).')';
                    $row[] = translate(number_format($value->total_cost,2),App::getLocale());
                    $row[] = translate(($value->shipping_cost ? number_format($value->shipping_cost,2) : 0),App::getLocale());
                    $row[] = translate(number_format($value->grand_total,2),App::getLocale());
                    $row[] = translate(number_format($value->paid_amount,2),App::getLocale());
                    $row[] = translate(number_format($value->due_amount,2),App::getLocale());
                    $row[] = PAYMENT_STATUS_LABEL[$value->payment_status];
                    $row[] = $value->account_name;
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
        if(permission('purchase-add')){
            $setTitle = __('file.Add Purchase');
            $this->setPageData($setTitle,$setTitle,'fas fa-shopping-cart',[['name' => $setTitle]]);
            $data = [
                'warehouses' => Warehouse::activeWarehouses(),
                'products'      => Product::where('status',1)->get(),
                'memo_no' => date('ymd').'-'.date('His')
            ];
            return view('purchase::create',$data);
        }else{
            return $this->access_blocked();
        }

    }

    public function store(PurchaseFormRequest $request)
    {
        if($request->ajax()){
            if(permission('purchase-add')){
                // dd($request->all());
                DB::beginTransaction();
                try {
                    $purchase = $this->model->create($this->model->purchase_data($request->all())); //store purchase data

                    //purchase products
                    $products = [];
                    if($request->has('products'))
                    {
                        foreach ($request->products as $key => $value) {
                            $products[$value['id']] = $this->model->purchase_products_data($request->warehouse_id,$value);
                        }
                    }
                    if(count($products) > 0){
                        $purchase->purchase_products()->sync($products);
                    }

                    $supplier = Supplier::with('coa')->find($request->supplier_id);
                    $transaction = $this->model->purchase_balance_add($supplier->coa->id,$request);//store purchse transaction data
                    if($transaction == false)
                    {
                        DB::rollback();
                    }
                    $output  = $this->store_message($purchase, $request->purchase_id);
                    DB::commit();
                } catch (Exception $e) {
                    DB::rollback();
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


    public function show(int $id)
    {
        if(permission('purchase-view')){
            $setTitle = __('file.Purchase');
            $setSubTitle = __('file.Purchase Details');
            $this->setPageData($setSubTitle,$setSubTitle,'fas fa-file',[['name'=>$setTitle,'link' => route('purchase')],['name' => $setSubTitle]]);
            $purchase = $this->model->with('hasManyProducts','supplier','warehouse','creator')->find($id);
            return view('purchase::details',compact('purchase'));
        }else{
            return $this->access_blocked();
        }
    }
    public function edit(int $id)
    {

        if(permission('purchase-edit')){
            $setTitle = __('file.Purchase');
            $setSubTitle = __('file.Edit Purchase');
            $this->setPageData($setSubTitle,$setSubTitle,'fas fa-edit',[['name'=>$setTitle,'link' => route('purchase')],['name' => $setSubTitle]]);
            $data = [
                'purchase'   => $this->model->with('hasManyProducts')->find($id),
                'warehouses' => Warehouse::activeWarehouses(),
                'products'      => Product::where('status',1)->get(),
            ];
            return view('purchase::edit',$data);
        }else{
            return $this->access_blocked();
        }
    }

    public function update(PurchaseFormRequest $request)
    {
        if($request->ajax()){
            if(permission('purchase-edit')){
                // dd($request->all());
                DB::beginTransaction();
                try {
                    $purchaseData = $this->model->with('purchase_products','supplier')->find($request->purchase_id);
                    if(!$purchaseData->purchase_products->isEmpty())
                    {
                        foreach ($purchaseData->purchase_products as  $product) {
                            $received_qty = $product->pivot->qty;
                            $product_data = Product::find($product->id);
                            if($product_data)
                            {
                                $product_data->qty     -= $received_qty;
                                $product_data->cost     = $product->pivot->current_unit_cost;
                                $product_data->old_cost = $product->pivot->old_unit_cost;
                                $product_data->update();
                            }
                            $warehouse_product = WarehouseProduct::where([
                                'warehouse_id' => $purchaseData->warehouse_id,
                                'product_id'   => $product->id])->first();
                            if($warehouse_product)
                            {
                                $warehouse_product->qty -= $received_qty;
                                $warehouse_product->update();
                            }
                        }
                    }
                    //purchase products
                    $products = [];
                    if($request->has('products'))
                    {
                        foreach ($request->products as $key => $value) {
                            $products[$value['id']] = $this->model->purchase_products_data($request->warehouse_id,$value);
                        }
                    }
                     if(count($products) > 0){
                        $purchaseData->purchase_products()->sync($products);
                     }
                    Transaction::where(['voucher_no'=>$purchaseData->memo_no,'voucher_type'=>'Purchase'])->delete();
                    $supplier    = Supplier::with('coa')->find($request->supplier_id);
                    $transaction = $this->model->purchase_balance_add($supplier->coa->id,$request);
                    if($transaction == false)
                    {
                        DB::rollback();
                    }
                    $purchase = $purchaseData->update($this->model->purchase_data($request->all()));
                    $output  = $this->store_message($purchase, $request->purchase_id);
                    DB::commit();
                } catch (Exception $e) {
                    DB::rollback();
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

    public function delete(Request $request)
    {
        if($request->ajax()){
            if(permission('purchase-delete')){
                DB::beginTransaction();
                try {
                    $purchaseData = Purchase::with('purchase_products')->find($request->id);
                    if(!$purchaseData->purchase_products->isEmpty())
                    {
                        $remove_products = $this->model->purchase_products_remove($purchaseData);
                        if($remove_products == false)
                        {
                            DB::rollBack();
                        }
                    }
                    Transaction::where('voucher_no', $purchaseData->memo_no)->where('voucher_type',"Purchase")->delete();
                    $result = $purchaseData->delete();
                    $output = $result ? ['status' => 'success','message' => __('file.Data has been deleted successfully')] : ['status' => 'error','message' => __('file.Failed to delete data')];
                    DB::commit();
                } catch (Exception $e) {
                    DB::rollBack();
                    $output = ['status'=>'error','message'=>$e->getMessage()];
                }
                return response()->json($output);
            }else{
                $output = $this->access_blocked();
            }
            return response()->json($output);
        }else{
            return response()->json($this->access_blocked());
        }
    }

    public function bulk_delete(Request $request)
    {
        if($request->ajax()){
            if(permission('purchase-bulk-delete')){
                    DB::beginTransaction();
                    try {
                        foreach ($request->ids as $id) {
                            $purchaseData = Purchase::with('purchase_products')->find($id);
                            if(!$purchaseData->purchase_products->isEmpty())
                            {
                                $remove_products = $this->model->purchase_products_remove($purchaseData);
                                if($remove_products == false)
                                {
                                    DB::rollBack();
                                }
                            }
                            Transaction::where('voucher_no', $purchaseData->memo_no)->where('voucher_type',"Purchase")->delete();
                        }
                        $result = $this->model->destroy($request->ids);
                        $output = $result ? ['status' => 'success','message' => __('file.Data has been deleted successfully')] : ['status' => 'error','message' => __('file.Failed to delete data')];
                        DB::commit();
                    } catch (Exception $e) {
                        DB::rollBack();
                        $output = ['status'=>'error','message'=>$e->getMessage()];
                    }
                    return response()->json($output);
                
            }else{
                $output = $this->access_blocked();
            }
            return response()->json($output);
        }else{
            return response()->json($this->access_blocked());
        }
    }

}
