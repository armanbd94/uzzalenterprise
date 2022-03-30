<?php

namespace Modules\Sale\Http\Controllers;

use Exception;
use Illuminate\Http\Request;
use Modules\Sale\Entities\Sale;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\App;
use Modules\Product\Entities\Product;
use Modules\Customer\Entities\Customer;
use Modules\Setting\Entities\Warehouse;
use App\Http\Controllers\BaseController;
use Modules\Account\Entities\Transaction;
use Modules\Setting\Entities\CustomerGroup;
use Modules\Product\Entities\WarehouseProduct;
use Modules\Sale\Http\Requests\SaleFormRequest;


class SaleController extends BaseController
{
    public function __construct(Sale $model)
    {
        $this->model = $model;
    }

    public function index()
    {
        if(permission('sale-access')){
            $setTitle = __('file.Sale Manage');
            $this->setPageData($setTitle,$setTitle,'fab fa-opencart',[['name' => $setTitle]]);
            $customers  = Customer::activeCustomers();
            $warehouses = Warehouse::activeWarehouses();
            return view('sale::index',compact('customers','warehouses'));
        }else{
            return $this->access_blocked();
        }
    }

    public function get_datatable_data(Request $request)
    {
        if($request->ajax()){
            if(permission('sale-access')){

                if (!empty($request->invoice_no)) {
                    $this->model->setInvoiceNo($request->invoice_no);
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
                if (!empty($request->customer_id)) {
                    $this->model->setCustomerID($request->customer_id);
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
                    if(permission('sale-edit')){
                        $action .= ' <a class="dropdown-item" href="'.route("sale.edit",$value->id).'">'.$this->actionButton('Edit').'</a>';
                    }
                    if(permission('sale-view')){
                        $action .= ' <a class="dropdown-item view_data" href="'.route("sale.view",$value->id).'">'.$this->actionButton('View').'</a>';
                    }
                    if(permission('sale-delete')){
                        $action .= ' <a class="dropdown-item delete_data"  data-id="' . $value->id . '" data-name="' . $value->invoice_no . '">'.$this->actionButton('Delete').'</a>';
                    }

                    $row = [];
                    if(permission('sale-bulk-delete')){
                        $row[] = row_checkbox($value->id);//custom helper function to show the table each row checkbox
                    }
                    $row[] = translate($no,App::getLocale());
                    $row[] = translate(date('d-m-Y',strtotime($value->sale_date)),App::getLocale());
                    $row[] = translate($value->invoice_no,App::getLocale());
                    $row[] = $value->warehouse_name;
                    $row[] = $value->customer_name;
                    $row[] = translate($value->item,App::getLocale()).' ('.translate($value->total_qty,App::getLocale()).')';
                    $row[] = translate(number_format($value->total_price,2),App::getLocale());
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
        if(permission('sale-add')){
            $setTitle = __('file.Add Purchase');
            $this->setPageData($setTitle,$setTitle,'fas fa-shopping-cart',[['name' => $setTitle]]);
            $data = [
                'warehouses' => Warehouse::activeWarehouses(),
                'products'      => Product::where('status',1)->get(),
                'invoice_no' => date('ymd').'-'.date('His'),
                'customer_groups' => CustomerGroup::where('status',1)->get(),
            ];
            return view('sale::create',$data);
        }else{
            return $this->access_blocked();
        }

    }

    public function store(SaleFormRequest $request)
    {
        if($request->ajax()){
            if(permission('sale-add')){
                // dd($request->all());
                DB::beginTransaction();
                try {
                    $sale = $this->model->create($this->model->sale_data($request->all())); //store sale data
                    //sale products
                    $products = [];
                    if($request->has('products'))
                    {
                        foreach ($request->products as $key => $value) {
                            $products[$value['id']] = $this->model->sale_products_data($request->warehouse_id,$value);
                        }
                    }
                    if(count($products) > 0){
                        $sale->sale_products()->sync($products);
                    }
                    $customer = Customer::with('coa')->find($request->customer_id);
                    $transaction = $this->model->sale_balance_add($customer->coa->id,$request);//store sale transaction data
                    if($transaction == false)
                    {
                        DB::rollback();
                    }
                    $output  = $this->store_message($sale, $request->purchase_id);
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
        if(permission('sale-view')){
            $setTitle = __('file.Sale');
            $setSubTitle = __('file.Sale Details');
            $this->setPageData($setSubTitle,$setSubTitle,'fas fa-file',[['name'=>$setTitle,'link' => route('sale')],['name' => $setSubTitle]]);
            $sale = $this->model->with('hasManyProducts','customer','warehouse','creator')->find($id);
            return view('sale::details',compact('sale'));
        }else{
            return $this->access_blocked();
        }
    }
    public function edit(int $id)
    {

        if(permission('sale-edit')){
            $setTitle = __('file.Sale');
            $setSubTitle = __('file.Edit Sale');
            $this->setPageData($setSubTitle,$setSubTitle,'fas fa-edit',[['name'=>$setTitle,'link' => route('sale')],['name' => $setSubTitle]]);
            $data = [
                'sale'   => $this->model->with('hasManyProducts')->find($id),
                'warehouses' => Warehouse::activeWarehouses(),
                'products'      => Product::where('status',1)->get(),
                'customer_groups' => CustomerGroup::where('status',1)->get(),
            ];
            return view('sale::edit',$data);
        }else{
            return $this->access_blocked();
        }
    }

    public function update(SaleFormRequest $request)
    {
        if($request->ajax()){
            if(permission('sale-edit')){
                // dd($request->all());
                DB::beginTransaction();
                try {
                    $saleData = $this->model->with('sale_products','customer')->find($request->sale_id);
                    if(!$saleData->sale_products->isEmpty())
                    {
                        foreach ($saleData->sale_products as  $product) {
                            $sold_qty = $product->pivot->qty;
                            $product_data = Product::find($product->id);
                            if($product_data)
                            {
                                $product_data->qty     += $sold_qty;
                                $product_data->update();
                            }
                            $warehouse_product = WarehouseProduct::where([
                                'warehouse_id' => $saleData->warehouse_id,
                                'product_id'   => $product->id])->first();
                            if($warehouse_product)
                            {
                                $warehouse_product->qty += $sold_qty;
                                $warehouse_product->update();
                            }
                        }
                    }
                    //sale products
                    $products = [];
                    if($request->has('products'))
                    {
                        foreach ($request->products as $key => $value) {
                            $products[$value['id']] = $this->model->sale_products_data($request->warehouse_id,$value);
                        }
                    }
                     if(count($products) > 0){
                        $saleData->sale_products()->sync($products);
                     }
                    Transaction::where(['voucher_no'=>$saleData->invoice_no,'voucher_type'=>'Invoice'])->delete();
                    $customer    = Customer::with('coa')->find($request->customer_id);
                    $transaction = $this->model->sale_balance_add($customer->coa->id,$request);
                    if($transaction == false)
                    {
                        DB::rollback();
                    }
                    $sale = $saleData->update($this->model->sale_data($request->all()));
                    $output  = $this->store_message($sale, $request->sale_id);
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
            if(permission('sale-delete')){
                DB::beginTransaction();
                try {
                    $saleData = $this->model->with('sale_products')->find($request->id);
                    if(!$saleData->sale_products->isEmpty())
                    {
                        $remove_products = $this->model->sale_products_remove($saleData);
                        if($remove_products == false)
                        {
                            DB::rollBack();
                        }
                    }
                    Transaction::where('voucher_no', $saleData->invoice_no)->where('voucher_type',"Invoice")->delete();
                    $result = $saleData->delete();
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
            if(permission('sale-bulk-delete')){
                    DB::beginTransaction();
                    try {
                        foreach ($request->ids as $id) {
                            $saleData = $this->model->with('sale_products')->find($id);
                            if(!$saleData->sale_products->isEmpty())
                            {
                                $remove_products = $this->model->sale_products_remove($saleData);
                                if($remove_products == false)
                                {
                                    DB::rollBack();
                                }
                            }
                            Transaction::where('voucher_no', $saleData->memo_no)->where('voucher_type',"Invoice")->delete();
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
