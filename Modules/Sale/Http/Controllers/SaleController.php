<?php

namespace Modules\Sale\Http\Controllers;

use Exception;
use App\Models\Tax;
use App\Models\Unit;
use App\Models\User;
use App\Traits\UploadAble;
use Illuminate\Http\Request;
use Modules\Sale\Entities\Sale;
use App\Notifications\ProductSold;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Modules\Product\Entities\Product;
use Modules\Customer\Entities\Customer;
use Modules\Setting\Entities\LaborBill;
use Modules\Setting\Entities\Warehouse;
use App\Http\Controllers\BaseController;
use Modules\Account\Entities\Transaction;
use Illuminate\Support\Facades\Notification;
use Modules\Product\Entities\WarehouseProduct;
use Modules\Sale\Http\Requests\SaleFormRequest;
use Modules\Sale\Http\Requests\SaleDeliveryFormRequest;
use Illuminate\Support\Facades\Session;

class SaleController extends BaseController
{
    use UploadAble;
    public function __construct(Sale $model)
    {
        $this->model = $model;
    }

    public function index()
    {
        if(permission('sale-access')){
            $setTitle = __('file.Sale Manage');
            $this->setPageData($setTitle,$setTitle,'fab fa-opencart',[['name' => $setTitle]]);
            $data = [
                'warehouses' => Warehouse::where('status',1)->get(),
                'customers'  => Customer::where('status',1)->get(),
            ];
            return view('sale::index',$data);
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
                if (!empty($request->customer_id)) {
                    $this->model->setCustomerID($request->customer_id);
                }
                if (!empty($request->warehouse_id)) {
                    $this->model->setWarehouseID($request->warehouse_id);
                }
                if (!empty($request->payment_status)) {
                    $this->model->setPaymentStatus($request->payment_status);
                }
                if (!empty($request->status)) {
                    $this->model->setStatus($request->status);
                }
                if (!empty($request->delivery_status)) {
                    $this->model->setDeliveryStatus($request->delivery_status);
                }


                $this->set_datatable_default_properties($request);//set datatable default properties
                $list = $this->model->getDatatableList();//get table data
                $data = [];
                $no = $request->input('start');
                foreach ($list as $value) {
                    $no++;
                    $action = '';
                    if (permission('sale-edit')) {
                        $action .= ' <a class="dropdown-item" href="'.route("sale.edit",$value->id).'">'.$this->actionButton('Edit').'</a>';
                    }
                    if (permission('sale-view')) {
                        $action .= ' <a class="dropdown-item view_data" href="'.route("sale.show",$value->id).'">'.$this->actionButton('View').'</a>';
                    }
                    if(permission('sale-approve')){
                        if($value->status != 1){
                            $action .= ' <a class="dropdown-item change_status"  data-id="' . $value->id . '" data-name="' . $value->invoice_no . '" data-status="'.$value->status.'"><i class="fas fa-check-circle text-success mr-2"></i> Change Status</a>';
                        }
                    }
                    if (permission('sale-delete')) {
                        $action .= ' <a class="dropdown-item delete_data"  data-id="' . $value->id . '" data-name="' . $value->invoice_no . '">'.$this->actionButton('Delete').'</a>';
                    }
                    if (permission('sale-edit')) {
                        $delivery_text = $value->delivery_status ? 'Update Delivery' : 'Add Delivery';
                        $action .= ' <a class="dropdown-item add_delivery" data-id="'.$value->id.'" data-status="'.$value->delivery_status.'" data-date="'.$value->delivery_date.'">'.$this->actionButton($delivery_text).'</a>';
                    }
                    $row = [];
                    if(permission('sale-bulk-delete')){
                        $row[] = row_checkbox($value->id);
                    }
                    $row[] = $no;
                    $row[] = $value->invoice_no;
                    $row[] = $value->warehouse->name;
                    $row[] = $value->customer->company_name.' ( '.$value->customer->name.')';
                    $row[] = $value->item;
                    $row[] = number_format($value->total_price,2);
                    $row[] = $value->order_discount ? number_format($value->order_discount,2) : 0;
                    // $row[] = $value->total_labor_cost ? number_format($value->total_labor_cost,2) : 0;
                    // $row[] = $value->order_tax_rate ? number_format($value->order_tax_rate,2) : 0;
                    // $row[] = $value->order_tax ? number_format($value->order_tax,2) : 0;
                    $row[] = $value->shipping_cost ? number_format($value->shipping_cost,2) : 0;
                    $row[] = number_format($value->grand_total,2);
                    $row[] = number_format($value->previous_due,2);
                    $row[] = number_format(($value->grand_total + $value->previous_due),2);
                    $row[] = number_format($value->paid_amount,2);
                    $row[] = number_format($value->due_amount,2);
                    $row[] = date(config('settings.date_format'),strtotime($value->sale_date));
                    $row[] = PAYMENT_STATUS_LABEL[$value->payment_status];
                    $row[] = APPROVE_STATUS_LABEL[$value->status];
                    $row[] = $value->payment_method ? SALE_PAYMENT_METHOD[$value->payment_method] : '<span class="label label-danger label-pill label-inline" style="min-width:70px !important;">No</span>';
                    $row[] = $value->delivery_status ? DELIVERY_STATUS[$value->delivery_status] : '<span class="label label-danger label-pill label-inline" style="min-width:70px !important;">No</span>';
                    $row[] = $value->delivery_date ? date(config('settings.date_format'),strtotime($value->delivery_date)) : '';
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
            $setTitle = __('file.Add Sale');
            $this->setPageData($setTitle,$setTitle,'fas fa-shopping-cart',[['name' => $setTitle]]);
            $sale = $this->model->select('invoice_no')->orderBy('invoice_no','desc')->first();
            $invoice_prefix = config('settings.invoice_prefix') ? config('settings.invoice_prefix') : 'INV-';
            $default_invoice_no = config('settings.invoice_number') ? config('settings.invoice_number') : 1001;
            $data = [
                'warehouses'  => Warehouse::where('status',1)->get(),
                'customers'   => Customer::activeCustomers(),
                'taxes'       => Tax::activeTaxes(),
                'labor_bills' => LaborBill::select('id','name')->where('status',1)->pluck('name','id'),
                'sale_data'   => Session::get('sale_data')
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
                DB::beginTransaction();
                try {
                    $sale_data = [
                        'invoice_no'       => $request->invoice_no,
                        'warehouse_id'     => $request->warehouse_id,
                        'customer_id'      => $request->customer_id,
                        'item'             => $request->item,
                        'total_qty'        => $request->total_qty,
                        'total_discount'   => $request->total_discount,
                        'total_tax'        => $request->total_tax,
                        'total_price'      => $request->total_price,
                        'order_tax_rate'   => $request->order_tax_rate,
                        'order_tax'        => $request->order_tax,
                        'order_discount'   => $request->order_discount ? $request->order_discount : 0,
                        'shipping_cost'    => $request->shipping_cost ? $request->shipping_cost : 0,
                        'total_labor_cost' =>  0,
                        'grand_total'      => $request->grand_total,
                        'previous_due'     => $request->previous_due ? $request->previous_due : 0,
                        'paid_amount'      => $request->paid_amount ? $request->paid_amount : 0,
                        'due_amount'       => ($request->net_total - ($request->paid_amount ? $request->paid_amount : 0)),
                        'payment_status'   => $request->payment_status,
                        'payment_method'   => $request->payment_method ? $request->payment_method : null,
                        'account_id'       => $request->account_id ? $request->account_id : null,
                        'note'             => $request->note,
                        'sale_date'        => $request->sale_date,
                        'created_by'       => Auth::user()->name
                    ];
                    $payment_data = [
                        'payment_method' => $request->payment_method ? $request->payment_method : null,
                        'account_id'     => $request->account_id ? $request->account_id : null,
                        'paid_amount'    => $request->paid_amount ? $request->paid_amount : 0,
                    ];
                    if($request->hasFile('document')){
                        $sale_data['document'] = $this->upload_file($request->file('document'),SALE_DOCUMENT_PATH);
                    }
                    $products = [];
                    $direct_cost = [];
                    if($request->has('products')) {
                        foreach ($request->products as $key => $value) {
                            $unit = Unit::where('unit_name',$value['unit'])->first();
                            if($unit->operator == '*'){
                                $qty = $value['qty'] * $unit->operation_value;
                            }else{
                                $qty = $value['qty'] / $unit->operation_value;
                            }
                            $products[$value['id']] = [
                                'qty'              => $value['qty'],
                                'sale_unit_id'     => $unit ? $unit->id : null,
                                'net_unit_price'   => $value['net_unit_price'],
                                'discount'         => $value['discount'],
                                'tax_rate'         => $value['tax_rate'],
                                'tax'              => $value['tax'],
                                'total'            => $value['subtotal']
                            ];
                            $product = Product::find($value['id']);
                            $direct_cost[] = $qty * ($product ? $product->cost : 0);
                        }
                    }
                    $sum_direct_cost = array_sum($direct_cost);
                    $total_tax = ($request->total_tax ? $request->total_tax : 0) + ($request->order_tax ? $request->order_tax : 0);
                    $result  = $this->model->create($sale_data);
                    if(empty($result)) {
                        if($request->hasFile('document')){
                            $this->delete_file($sale_data['document'], SALE_DOCUMENT_PATH);
                        }
                    }
                    $sale = $this->model->with('sale_products','labor_bill_rates')->find($result->id);
                    if(count($products) > 0){
                        $sale->sale_products()->sync($products);
                    }
                    $customer = Customer::with('coa')->find($request->customer_id);
                    $data = $this->sale_balance_add($result->id,$request->invoice_no,$request->grand_total,$total_tax,$sum_direct_cost,$customer->coa->id,$customer->name,$request->sale_date,$payment_data,$request->warehouse_id);
                    if($sale) {
                        $users = User::where('role_id',2)->get();
                        Notification::send($users, new ProductSold($sale));
                    }
                    $output  = $this->store_message($result, $request->sale_id);
                    if($result){
                        Session::forget('sale_data');
                    }
                    DB::commit();
                } catch (Exception $e) {
                    DB::rollback();
                    $output = ['status' => 'error','message' => $e->getMessage()];
                }
                return response()->json($output);
            }else{
                return response()->json($this->unauthorized());
            }
        }else{
            return response()->json($this->unauthorized());
        }
    }


    private function sale_balance_add(int $sale_id, $invoice_no, $grand_total, $total_tax,$sum_direct_cost, int $customer_coa_id, string $customer_name, $sale_date, array $payment_data,$warehouse_id) {

        //Inventory Credit
        $coscr = array(
            'chart_of_account_id' => DB::table('chart_of_accounts')->where('code', $this->coa_head_code('inventory'))->value('id'),
            'voucher_no'          => $invoice_no,
            'voucher_type'        => 'INVOICE',
            'voucher_date'        => $sale_date,
            'description'         => 'Inventory Credit For Invoice No '.$invoice_no,
            'debit'               => 0,
            'credit'              => $sum_direct_cost,
            'posted'              => 1,
            'approve'             => 2,
            'created_by'          => auth()->user()->name,
            'created_at'          => date('Y-m-d H:i:s')
        );

            // customer Debit
            $sale_coa_transaction = array(
            'chart_of_account_id' => $customer_coa_id,
            'voucher_no'          => $invoice_no,
            'voucher_type'        => 'INVOICE',
            'voucher_date'        => $sale_date,
            'description'         => 'Customer debit For Invoice No -  ' . $invoice_no . ' Customer ' .$customer_name,
            'debit'               => $grand_total,
            'credit'              => 0,
            'posted'              => 1,
            'approve'             => 2,
            'created_by'          => auth()->user()->name,
            'created_at'          => date('Y-m-d H:i:s')
        );


        $income = $grand_total - $sum_direct_cost - $total_tax;
        $product_sale_income = array(
            'chart_of_account_id' => DB::table('chart_of_accounts')->where('code', $this->coa_head_code('product_sale'))->value('id'),
            'voucher_no'          => $invoice_no,
            'voucher_type'        => 'INVOICE',
            'voucher_date'        => $sale_date,
            'description'         => 'Sale Income For Invoice NO - ' . $invoice_no . ' Customer ' .$customer_name,
            'debit'               => 0,
            'credit'              => $income,
            'posted'              => 1,
            'approve'             => 2,
            'created_by'          => auth()->user()->name,
            'created_at'          => date('Y-m-d H:i:s')
        );

        Transaction::insert([
            $coscr, $sale_coa_transaction, $product_sale_income
        ]);

        if($total_tax){
            $tax_info = array(
                'chart_of_account_id' => DB::table('chart_of_accounts')->where('code', $this->coa_head_code('tax'))->value('id'),
                'voucher_no'          => $invoice_no,
                'voucher_type'        => 'INVOICE',
                'voucher_date'        => $sale_date,
                'description'         => 'Sale Total Tax For Invoice NO - ' . $invoice_no . ' Customer ' .$customer_name,
                'debit'               => 0,
                'credit'              => $total_tax,
                'posted'              => 1,
                'approve'             => 2,
                'created_by'          => auth()->user()->name,
                'created_at'          => date('Y-m-d H:i:s')
            );
            Transaction::create($tax_info);
        }


        if(!empty($payment_data['paid_amount']))
        {

            /****************/
            $customer_credit = array(
                'chart_of_account_id' => $customer_coa_id,
                'voucher_no'          => $invoice_no,
                'voucher_type'        => 'INVOICE',
                'voucher_date'        => $sale_date,
                'description'         => 'Customer credit for Paid Amount For Customer Invoice NO- ' . $invoice_no . ' Customer- ' . $customer_name,
                'debit'               => 0,
                'credit'              => $payment_data['paid_amount'],
                'posted'              => 1,
                'approve'             => 2,
                'created_by'          => auth()->user()->name,
                'created_at'          => date('Y-m-d H:i:s')
            );
            if($payment_data['payment_method'] == 1){
                //Cah In Hand debit
                $payment = array(
                    'chart_of_account_id' => $payment_data['account_id'],
                    'voucher_no'          => $invoice_no,
                    'voucher_type'        => 'INVOICE',
                    'voucher_date'        => $sale_date,
                    'description'         => 'Cash in Hand in Sale for Invoice No - ' . $invoice_no . ' customer- ' .$customer_name,
                    'debit'               => $payment_data['paid_amount'],
                    'credit'              => 0,
                    'posted'              => 1,
                    'approve'             => 2,
                    'created_by'          => auth()->user()->name,
                    'created_at'          => date('Y-m-d H:i:s')

                );
            }else{
                // Bank Ledger
                $payment = array(
                    'chart_of_account_id' => $payment_data['account_id'],
                    'voucher_no'          => $invoice_no,
                    'voucher_type'        => 'INVOICE',
                    'voucher_date'        => $sale_date,
                    'description'         => 'Paid amount for customer  Invoice No - ' . $invoice_no . ' customer -' . $customer_name,
                    'debit'               => $payment_data['paid_amount'],
                    'credit'              => 0,
                    'posted'              => 1,
                    'approve'             => 2,
                    'created_by'          => auth()->user()->name,
                    'created_at'          => date('Y-m-d H:i:s')
                );
            }
            Transaction::insert([$customer_credit,$payment]);

        }
    }


    public function show(int $id)
    {
        if(permission('sale-view')){
            $setTitle = __('file.Sale');
            $setSubTitle = __('file.Sale Details');
            $this->setPageData($setSubTitle,$setSubTitle,'fas fa-file',[['name'=>$setTitle,'link' => route('sale')],['name' => $setSubTitle]]);
            $sale = $this->model->with('sale_products','customer','warehouse')->find($id);
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
            $this->setPageData($setSubTitle,$setSubTitle,'fas fa-edit',[['name'=>$setTitle,'link' => route('purchase')],['name' => $setSubTitle]]);
            $sale_data = $this->model->with('sale_products','customer')->find($id);
            $data = [
                'sale'      => $sale_data,
                'warehouses' => Warehouse::where('status',1)->get(),
                'customers' => Customer::activeCustomers(),
                'taxes'      => Tax::activeTaxes(),
                'labor_bills' => LaborBill::select('id','name')->where('status',1)->pluck('name','id'),
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
                    $sale_data = [
                        'invoice_no'       => $request->invoice_no,
                        'warehouse_id'     => $request->warehouse_id,
                        'customer_id'      => $request->customer_id,
                        'item'             => $request->item,
                        'total_qty'        => $request->total_qty,
                        'total_discount'   => $request->total_discount,
                        'total_tax'        => $request->total_tax,
                        'total_price'      => $request->total_price,
                        'order_tax_rate'   => $request->order_tax_rate,
                        'order_tax'        => $request->order_tax,
                        'order_discount'   => $request->order_discount ? $request->order_discount : 0,
                        'shipping_cost'    => $request->shipping_cost ? $request->shipping_cost : 0,
                        'total_labor_cost' => 0,
                        'grand_total'      => $request->grand_total,
                        'previous_due'     => $request->previous_due ? $request->previous_due : 0,
                        'paid_amount'      => $request->paid_amount ? $request->paid_amount : 0,
                        'due_amount'       => ($request->net_total - ($request->paid_amount ? $request->paid_amount : 0)),
                        'payment_status'   => $request->payment_status,
                        'payment_method'   => $request->payment_method ? $request->payment_method : null,
                        'account_id'       => $request->account_id ? $request->account_id : null,
                        'note'             => $request->note,
                        'sale_date'        => $request->sale_date,
                        'updated_by'       => Auth::user()->name
                    ];

                    $payment_data = [
                        'payment_method' => $request->payment_method,
                        'account_id'     => $request->account_id,
                        'paid_amount'    => $request->paid_amount,
                    ];

                    if($request->hasFile('document')){
                        $sale_data['document'] = $this->upload_file($request->file('document'),SALE_DOCUMENT_PATH);
                    }
                    $saleData = $this->model->with('sale_products')->find($request->sale_id);
                    $old_document = $saleData ? $saleData->document : '';

                    if(!$saleData->sale_products->isEmpty())
                    {
                        foreach ($saleData->sale_products as  $sale_product) {
                            $old_sold_qty = $sale_product->pivot->qty;
                            $sale_unit = Unit::find($sale_product->pivot->sale_unit_id);
                            if($sale_unit->operator == '*'){
                                $old_sold_qty = $old_sold_qty * $sale_unit->operation_value;
                            }else{
                                $old_sold_qty = $old_sold_qty / $sale_unit->operation_value;
                            }
                            if($saleData->status == 1){
                                $warehouse_product = WarehouseProduct::where([
                                    'warehouse_id'=>$saleData->warehouse_id,
                                    'product_id'=>$sale_product->id,
                                    ])->first();
                                $warehouse_product->qty += $old_sold_qty;
                                $warehouse_product->update();

                                $product = Product::find($sale_product->id);
                                $product->qty += $old_sold_qty;
                                $product->update();
                            }

                        }
                    }

                    //purchase finish goods
                    $products = [];
                    $direct_cost  = [];
                    if($request->has('products'))
                    {
                        foreach ($request->products as $key => $value) {
                            $unit = Unit::where('unit_name',$value['unit'])->first();
                            if($unit->operator == '*'){
                                $qty = $value['qty'] * $unit->operation_value;
                            }else{
                                $qty = $value['qty'] / $unit->operation_value;
                            }

                            $products[$value['id']] = [
                                'qty'              => $value['qty'],
                                'sale_unit_id'     => $unit ? $unit->id : null,
                                'net_unit_price'   => $value['net_unit_price'],
                                'discount'         => $value['discount'],
                                'tax_rate'         => $value['tax_rate'],
                                'tax'              => $value['tax'],
                                'total'            => $value['subtotal']
                            ];
                            if($saleData->status == 1){
                                $warehouse_product = WarehouseProduct::where([['warehouse_id',$request->warehouse_id],['product_id',$value['id']],['qty','>',0]])->first();
                                if($warehouse_product){
                                    $warehouse_product->qty -= $qty;
                                    $warehouse_product->save();
                                }

                                $product_data = Product::find($value['id']);
                                $direct_cost[] = $qty * ($product_data ? $product_data->cost : 0);
                                $product_data->qty -= $qty;
                                $product_data->update();

                            }
                        }
                    }
                    $sum_direct_cost = array_sum($direct_cost);
                    $total_tax = ($request->total_tax ? $request->total_tax : 0) + ($request->order_tax ? $request->order_tax : 0);
                    // $labor_bills = [];
                    // if($request->has('bills'))
                    // {
                    //     foreach ($request->bills as $key => $value) {
                    //         $labor_bills[$value['bill_rate_id']] = [
                    //             'labor_bill_id'   => $value['bill_id'],
                    //             'qty'   => $value['qty'],
                    //             'rate'   => $value['rate'],
                    //             'total' => $value['subtotal']
                    //         ];
                    //     }
                    // }
                    $sale = $saleData->update($sale_data);
                    if($sale && $old_document != '')
                    {
                        $this->delete_file($old_document,SALE_DOCUMENT_PATH);
                    }

                    $saleData->sale_products()->sync($products);
                    // $saleData->labor_bill_rates()->sync($labor_bills);
                    Transaction::where(['voucher_no'=>$request->invoice_no,'voucher_type'=>'INVOICE'])->delete();
                    $customer = Customer::with('coa')->find($request->customer_id);
                    $this->sale_balance_add($request->sale_id,$request->invoice_no,$request->grand_total,$total_tax,$sum_direct_cost,$customer->coa->id,$customer->name,$request->sale_date,$payment_data,$request->warehouse_id);
                    $output  = $this->store_message($sale, $request->sale_id);
                    DB::commit();
                } catch (Exception $e) {
                    DB::rollback();
                    $output = ['status' => 'error','message' => $e->getMessage()];
                }
                return response()->json($output);
            }else{
                return response()->json($this->unauthorized());
            }
        }else{
            return response()->json($this->unauthorized());
        }
    }

    public function delete(Request $request)
    {
        if($request->ajax()){
            if(permission('sale-delete'))
            {
                DB::beginTransaction();
                try {
                    $saleData = $this->model->with('sale_products')->find($request->id);
                    $invoice_no = $saleData->invoice_no;
                    $old_document = $saleData ? $saleData->document : '';
                    if(!$saleData->sale_products->isEmpty())
                    {
                        foreach ($saleData->sale_products as  $sale_product) {
                            $old_sold_qty = $sale_product->pivot->qty;
                            $sale_unit = Unit::find($sale_product->pivot->sale_unit_id);
                            if($sale_unit->operator == '*'){
                                $old_sold_qty = $old_sold_qty * $sale_unit->operation_value;
                            }else{
                                $old_sold_qty = $old_sold_qty / $sale_unit->operation_value;
                            }
                            if($saleData->status == 1){
                                $warehouse_product = WarehouseProduct::where([
                                    'warehouse_id'=>$saleData->warehouse_id,
                                    'product_id'=>$sale_product->id
                                    ])->first();
                                $warehouse_product->qty += $old_sold_qty;
                                $warehouse_product->update();

                                $product = Product::find($sale_product->id);
                                $product->qty += $old_sold_qty;
                                $product->update();
                            }


                        }
                        $saleData->sale_products()->detach();
                    }
                    // if(!$saleData->labor_bill_rates->isEmpty())
                    // {
                    //     $saleData->labor_bill_rates()->detach();
                    // }
                    Transaction::where(['voucher_no'=>$invoice_no,'voucher_type'=>'INVOICE'])->delete();
                    $result = $saleData->delete();
                    if($result)
                    {
                        if($old_document != '')
                        {
                            $this->delete_file($old_document,SALE_DOCUMENT_PATH);
                        }
                        $output = ['status' => 'success','message' => $this->responseMessage('Data Delete')];
                    }else{
                        $output = ['status' => 'error','message' => $this->responseMessage('Data Delete Failed')];
                    }
                    DB::commit();
                } catch (Exception $e) {
                    DB::rollback();
                    $output = ['status' => 'error','message' => $e->getMessage()];
                }
                return response()->json($output);
            }else{
                return response()->json($this->unauthorized());
            }
        }else{
            return response()->json($this->unauthorized());
        }
    }
    public function bulk_delete(Request $request)
    {
        if($request->ajax()){
            if(permission('sale-bulk-delete')){
                foreach ($request->ids as $id) {
                    DB::beginTransaction();
                    try {
                        $saleData = $this->model->with('sale_products')->find($id);
                        $invoice_no = $saleData->invoice_no;
                        $old_document = $saleData ? $saleData->document : '';

                        if(!$saleData->sale_products->isEmpty())
                        {
                            foreach ($saleData->sale_products as  $sale_product) {
                                $old_sold_qty = $sale_product->pivot->qty;
                                $sale_unit = Unit::find($sale_product->pivot->sale_unit_id);
                                if($sale_unit->operator == '*'){
                                    $old_sold_qty = $old_sold_qty * $sale_unit->operation_value;
                                }else{
                                    $old_sold_qty = $old_sold_qty / $sale_unit->operation_value;
                                }
                                if($saleData->status == 1){
                                    $warehouse_product = WarehouseProduct::where([
                                        'warehouse_id'=>$saleData->warehouse_id,
                                        'product_id'=>$sale_product->id
                                        ])->first();
                                    $warehouse_product->qty += $old_sold_qty;
                                    $warehouse_product->update();

                                    $product = Product::find($sale_product->id);
                                    $product->qty += $old_sold_qty;
                                    $product->update();
                                }
                            }
                            $saleData->sale_products()->detach();
                        }
                        // if(!$saleData->labor_bill_rates->isEmpty())
                        // {
                        //     $saleData->labor_bill_rates()->detach();
                        // }
                        Transaction::where(['voucher_no'=>$invoice_no,'voucher_type'=>'INVOICE'])->delete();
                        $result = $saleData->delete();
                        if($result)
                        {
                            if($old_document != '')
                            {
                                $this->delete_file($old_document,SALE_DOCUMENT_PATH);
                            }
                            $output = ['status' => 'success','message' => $this->responseMessage('Data Delete')];
                        }else{
                            $output = ['status' => 'error','message' => $this->responseMessage('Data Delete Failed')];
                        }
                        DB::commit();
                    } catch (Exception $e) {
                        DB::rollBack();
                        $output = ['status'=>'error','message'=>$e->getMessage()];
                    }
                    return response()->json($output);
                }
            }else{
                $output = $this->access_blocked();
            }
            return response()->json($output);
        }else{
            return response()->json($this->access_blocked());
        }
    }
    public function delivery_status_update(SaleDeliveryFormRequest $request)
    {
        $data = [
            'delivery_status' => $request->delivery_status,
            'delivery_date'   => $request->delivery_date,
        ];
        $result = $this->model->find($request->sale_id)->update($data);
        $output  = $this->store_message($result, $request->sale_id);
        return response()->json($output);
    }
    public function change_status(Request $request)
    {
        if($request->ajax())
        {
            if(permission('sale-approve')){
                if ($request->sale_status) {
                    DB::beginTransaction();
                    try {
                        $saleData = $this->model->with('sale_products')->find($request->sale_id);
                        if($request->sale_status == 1){
                            if(!$saleData->sale_products->isEmpty())
                            {
                                foreach ($saleData->sale_products as  $sale_product) {
                                    $old_sold_qty = $sale_product->pivot->qty;//Last insert qty
                                    $sale_unit = Unit::find($sale_product->pivot->sale_unit_id);//Fetch sale unit
                                    //Convert last insert qty to according to sale unit qty
                                    if($sale_unit->operator == '*'){
                                        $old_sold_qty = $old_sold_qty * $sale_unit->operation_value;
                                    }else{
                                        $old_sold_qty = $old_sold_qty / $sale_unit->operation_value;
                                    }
                                    //Remove qty from warehouse
                                    $warehouse_product = WarehouseProduct::where([
                                        ['warehouse_id',$saleData->warehouse_id],
                                        ['product_id',$sale_product->id],['qty','>',0]
                                        ])->first();
                                    $warehouse_product->qty -= $old_sold_qty;
                                    $warehouse_product->update();
                                    //Remove qty from product
                                    $product = Product::find($sale_product->id);
                                    $product->qty -= $old_sold_qty;
                                    $product->update();
                                }
                            }
                            Transaction::where([['voucher_no', $saleData->invoice_no],['voucher_type', (string) "INVOICE"]])->update(['approve'=>1]); //Update approval status of this sale transaction
                        }
                        //Change Sale Invoice Status
                        $saleData->status = $request->sale_status;
                        $saleData->status_change_by = Auth::user()->name;
                        $saleData->status_change_date = date('Y-m-d');
                        if($saleData->update())
                        {
                            $output = ['status'=>'success','message'=>$this->responseMessage('Approval Status')];
                        }else{
                            $output = ['status'=>'error','message'=>$this->responseMessage('Approval Status Failed')];
                        }
                        DB::commit();
                    } catch (\Throwable $th) {
                        DB::rollback();
                        $output = ['status'=>'error','message'=>$th->getMessage()];
                    }
                }else{
                    $output = ['status'=>'error','message'=>$this->responseMessage('Select Status')];
                }
                return response()->json($output);
            }
        }
    }
    public function hold(Request $request)
    {
        if($request->ajax()){
            if(permission('sale-add')){
                // dd($request->all());
                try {
                    $sale_data = [
                        'invoice_no'       => $request->invoice_no,
                        'warehouse_id'     => $request->warehouse_id,
                        'customer_id'      => $request->customer_id,
                        'item'             => $request->item,
                        'total_qty'        => $request->total_qty,
                        'total_discount'   => $request->total_discount,
                        'total_tax'        => $request->total_tax,
                        'total_price'      => $request->total_price,
                        'order_tax_rate'   => $request->order_tax_rate,
                        'order_tax'        => $request->order_tax,
                        'order_discount'   => $request->order_discount ? $request->order_discount : 0,
                        'shipping_cost'    => $request->shipping_cost ? $request->shipping_cost : 0,
                        'total_labor_cost' =>  0,
                        'grand_total'      => $request->grand_total,
                        'previous_due'     => $request->previous_due ? $request->previous_due : 0,
                        'paid_amount'      => $request->paid_amount ? $request->paid_amount : 0,
                        'due_amount'       => ($request->net_total - ($request->paid_amount ? $request->paid_amount : 0)),
                        'payment_status'   => $request->payment_status,
                        'payment_method'   => $request->payment_method ? $request->payment_method : null,
                        'account_id'       => $request->account_id ? $request->account_id : null,
                        'note'             => $request->note,
                        'sale_date'        => $request->sale_date,
                    ];

                    //purchase materials
                    $products = [];
                    if($request->has('products'))
                    {
                        foreach ($request->products as $key => $value) {
                            $unit = Unit::where('unit_name',$value['unit'])->first();
                            // if($unit->operator == '*'){
                            //     $qty = $value['qty'] * $unit->operation_value;
                            // }else{
                            //     $qty = $value['qty'] / $unit->operation_value;
                            // }
                            $products[] = [
                                'id'               => $value['id'],
                                'name'             => $value['name'],
                                'code'             => $value['code'],
                                'stock_qty'        => $value['stock_qty'],
                                'qty'              => $value['qty'],
                                'sale_unit_id'     => $unit ? $unit->id : null,
                                'unit_name'        => $value['unit'],
                                'net_unit_price'   => $value['net_unit_price'],
                                'discount'         => $value['discount'],
                                'tax_rate'         => $value['tax_rate'],
                                'tax'              => $value['tax'],
                                'total'            => $value['subtotal']
                            ];
                        }
                    }

                    // $labor_bills = [];
                    // if($request->has('bills'))
                    // {
                    //     foreach ($request->bills as $key => $value) {
                    //         $labor_bills[] = [
                    //             'bill_rate_id'  => $value['bill_rate_id'],
                    //             'labor_bill_id' => $value['bill_id'],
                    //             'qty'           => $value['qty'],
                    //             'rate'          => $value['rate'],
                    //             'total'         => $value['subtotal']
                    //         ];
                    //     }
                    // }
                    $data = [
                        'sale' => $sale_data,
                        'products'=>$products,
                        // 'labor_bills'=>$labor_bills
                    ];
                    Session::put('sale_data',$data);
                    // dd(Session::get('sale_data'));
                   if(Session::get('sale_data')){
                    $output = ['status' => 'success','message' => $this->responseMessage('Hold')];
                   }else{
                    $output = ['status' => 'error','message' => $this->responseMessage('Hold Failed')];
                   }
                } catch (Exception $e) {
                    $output = ['status' => 'error','message' => $e->getMessage()];
                }
                return response()->json($output);
            }else{
                return response()->json($this->unauthorized());
            }
        }else{
            return response()->json($this->unauthorized());
        }
    }

}
