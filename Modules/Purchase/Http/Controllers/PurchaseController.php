<?php

namespace Modules\Purchase\Http\Controllers;

use Exception;
use App\Models\Tax;
use App\Models\Unit;
use App\Models\User;
use App\Traits\UploadAble;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Modules\Material\Entities\Material;
use Modules\Purchase\Entities\Purchase;
use Modules\Setting\Entities\LaborBill;
use Modules\Setting\Entities\Warehouse;
use Modules\Supplier\Entities\Supplier;
use App\Http\Controllers\BaseController;
use App\Notifications\MaterialPurchased;
use Modules\Account\Entities\Transaction;
use Illuminate\Support\Facades\Notification;
use Modules\Purchase\Entities\PurchasePayment;
use Modules\Material\Entities\WarehouseMaterial;
use Modules\Purchase\Http\Requests\PurchaseFormRequest;
use Illuminate\Support\Facades\Session;
use Modules\Purchase\Entities\PurchaseMaterial;

class PurchaseController extends BaseController
{

    use UploadAble;
    private const MEMO_NO = 1001;
    public function __construct(Purchase $model)
    {
        $this->model = $model;
    }

    public function index()
    {
        if(permission('purchase-access')){
            $setTitle = __('file.Purchase Manage');
            $this->setPageData($setTitle,$setTitle,'fas fa-shopping-cart',[['name' => $setTitle]]);
            $suppliers  = Supplier::activeMaterialSuppliers();
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
                if (!empty($request->purchase_status)) {
                    $this->model->setPurchaseStatus($request->purchase_status);
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
                    if(permission('purchase-approve')){
                        if($value->status != 1){
                            $action .= ' <a class="dropdown-item change_status"  data-id="' . $value->id . '" data-name="' . $value->memo_no . '" data-status="'.$value->status.'">'.$this->actionButton('Change Status').'</a>';
                        }
                    }
                    if(permission('purchase-payment-add')){
                        if($value->payment_status != 1){
                        $action .= ' <a class="dropdown-item add_payment" data-id="'.$value->id.'" data-due="'.($value->grand_total - $value->paid_amount).'">'.$this->actionButton('Add Payment').'</a>';
                        }
                    }
                    if(permission('purchase-payment-view')){
                        $action .= ' <a class="dropdown-item view_payment_list"  data-id="'.$value->id.'">'.$this->actionButton('Payment List').'</a>';
                    }

                    if(permission('purchase-delete')){
                        $action .= ' <a class="dropdown-item delete_data"  data-id="' . $value->id . '" data-name="' . $value->memo_no . '">'.$this->actionButton('Delete').'</a>';
                    }

                    $row = [];
                    if(permission('purchase-bulk-delete')){
                        $row[] = row_checkbox($value->id);//custom helper function to show the table each row checkbox
                    }
                    $row[] = $no;
                    $row[] = $value->memo_no;
                    $row[] = $value->warehouse->name;
                    $row[] = $value->supplier->company_name.' ( '.$value->supplier->name.')';
                    $row[] = $value->item;
                    $row[] = number_format($value->total_cost,2);
                    // $row[] = $value->order_discount ? number_format($value->order_discount,2) : 0;
                    $row[] = $value->purchase_material->net_unit_cost ? number_format($value->purchase_material->net_unit_cost,2) : 0;
                    // $row[] = $value->order_tax_rate ? number_format($value->order_tax_rate,2) : 0;
                    // $row[] = $value->order_tax ? number_format($value->order_tax,2) : 0;
                    $row[] = $value->shipping_cost ? number_format($value->shipping_cost,2) : 0;
                    $row[] = number_format($value->grand_total,2);
                    $row[] = number_format($value->paid_amount,2);
                    $row[] = number_format(($value->grand_total - $value->paid_amount),2);
                    $row[] = date(config('settings.date_format'),strtotime($value->purchase_date));
                    $row[] = APPROVE_STATUS_LABEL[$value->status];
                    $row[] = PURCHASE_STATUS_LABEL[$value->purchase_status];
                    $row[] = PAYMENT_STATUS_LABEL[$value->payment_status];
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
            $purchase = $this->model->select('memo_no')->orderBy('memo_no','desc')->first();
            $data = [
                'warehouses' => Warehouse::activeWarehouses(),
                'suppliers'  => Supplier::activeMaterialSuppliers(),
                'taxes'      => Tax::activeTaxes(),
                'labor_bills' => LaborBill::select('id','name')->where('status',1)->pluck('name','id'),
                'purchase_data' => Session::get('purchase_data')
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
                    $purchase_data = [
                        'memo_no'          => $request->memo_no,
                        'supplier_id'      => $request->supplier_id,
                        'warehouse_id'     => $request->warehouse_id,
                        'item'             => $request->item,
                        'total_qty'        => $request->total_qty,
                        'total_discount'   => $request->total_discount,
                        'total_tax'        => $request->total_tax,
                        'total_labor_cost' => 0,
                        'total_cost'       => $request->total_cost,
                        'order_tax_rate'   => $request->order_tax_rate,
                        'order_tax'        => $request->order_tax,
                        'order_discount'   => $request->order_discount ? $request->order_discount : null,
                        'shipping_cost'    => $request->shipping_cost ? $request->shipping_cost : null,
                        'grand_total'      => $request->grand_total,
                        'paid_amount'      => $request->paid_amount,
                        'purchase_status'  => $request->purchase_status,
                        'payment_status'   => $request->payment_status,
                        'note'             => $request->note,
                        'purchase_date'    => $request->purchase_date,
                        'created_by'       => auth()->user()->name
                    ];



                    $payment_data = [
                        'payment_method' => $request->payment_method,
                        'account_id'     => $request->account_id,
                        'paid_amount'    => $request->paid_amount,
                        'cheque_no'      => $request->cheque_number ? $request->cheque_number : '',
                    ];

                    if($request->hasFile('document')){
                        $purchase_data['document'] = $this->upload_file($request->file('document'),PURCHASE_DOCUMENT_PATH);
                    }

                    //purchase materials
                    $materials = [];
                    if($request->has('materials'))
                    {
                        foreach ($request->materials as $key => $value) {
                            $unit = Unit::where('unit_name',$value['unit'])->first();
                            if($unit->operator == '*'){
                                $qty = $value['received'] * $unit->operation_value;
                            }else{
                                $qty = $value['received'] / $unit->operation_value;
                            }


                            $materials[$value['id']] = [
                                'qty'              => $value['qty'],
                                'received'         => $value['received'],
                                'purchase_unit_id' => $unit ? $unit->id : null,
                                'net_unit_cost'    => $value['net_unit_cost'],
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
                    //         $labor_bills[$value['bill_rate_id']] = [
                    //             'labor_bill_id'   => $value['bill_id'],
                    //             'qty'   => $value['qty'],
                    //             'rate'   => $value['rate'],
                    //             'total' => $value['subtotal']
                    //         ];
                    //     }
                    // }

                    $result  = $this->model->create($purchase_data);
                    if(empty($result))
                    {
                        if($request->hasFile('document')){
                            $this->delete_file($purchase_data['document'], PURCHASE_DOCUMENT_PATH);
                        }
                    }
                    $purchase = $this->model->with('purchase_materials')->find($result->id);
                    if(count($materials) > 0){
                        $purchase->purchase_materials()->sync($materials);
                    }
                    // if(count($labor_bills) > 0){
                    //     $purchase->labor_bill_rates()->sync($labor_bills);
                    // }

                    $supplier = Supplier::with('coa')->find($request->supplier_id);
                    $this->purchase_balance_add($result->memo_no,$result->id,$request->grand_total,$supplier->coa->id,$supplier->name,$request->purchase_date,$payment_data);

                    if($purchase)
                    {
                        $users = User::where('role_id',2)->get();
                        Notification::send($users, new MaterialPurchased($purchase));

                    }

                    $output  = $this->store_message($result, $request->update_id);
                    if($result){
                        Session::forget('purchase_data');
                    }
                    DB::commit();
                    // return response()->json($output);
                } catch (Exception $e) {
                    DB::rollback();
                    $output = ['status' => 'error','message' => $e->getMessage()];
                    // return response()->json($output);
                }
            }else{
                $output       = $this->unauthorized();
            }
            return response()->json($output);
        }else{
            return response()->json($this->unauthorized());
        }
    }


    private function purchase_balance_add(string $purchase_no,string $purchase_id,$balance, int $supplier_coa_id, string $supplier_name, $purchase_date, array $payment_data) {
        if(!empty($purchase_no) && !empty($purchase_id) && !empty($balance) && !empty($supplier_coa_id) && !empty($supplier_name)  && !empty($purchase_date)){
            // supplier Credit
            $purchase_coa_transaction = array(
                'chart_of_account_id' => $supplier_coa_id,
                'voucher_no'          => $purchase_no,
                'voucher_type'        => 'Purchase',
                'voucher_date'        => $purchase_date,
                'description'         => 'Supplier '.$supplier_name,
                'debit'               => 0,
                'credit'              => $balance,
                'posted'              => 1,
                'approve'             => 2,
                'created_by'          => auth()->user()->name,
                'created_at'          => date('Y-m-d H:i:s')
            );

            //Inventory Debit
            $cosde = array(
                'chart_of_account_id' => DB::table('chart_of_accounts')->where('code', $this->coa_head_code('inventory'))->value('id'),
                'voucher_no'          => $purchase_no,
                'voucher_type'        => 'Purchase',
                'voucher_date'        => $purchase_date,
                'description'         => 'Inventory Debit For Supplier '.$supplier_name,
                'debit'               => $balance,
                'credit'              => 0,
                'posted'              => 1,
                'approve'             => 2,
                'created_by'          => auth()->user()->name,
                'created_at'          => date('Y-m-d H:i:s')
            );

             // Expense for company
            $expense = array(
                'chart_of_account_id' => DB::table('chart_of_accounts')->where('code', $this->coa_head_code('material_purchase'))->value('id'),
                'voucher_no'          => $purchase_no,
                'voucher_type'        => 'Purchase',
                'voucher_date'        => $purchase_date,
                'description'         => 'Company Credit For Supplier '.$supplier_name,
                'debit'               => $balance,
                'credit'              => 0,
                'posted'              => 1,
                'approve'             => 2,
                'created_by'          => auth()->user()->name,
                'created_at'          => date('Y-m-d H:i:s')
            );

            Transaction::insert([
                $purchase_coa_transaction,$cosde,$expense
            ]);


            if($payment_data['paid_amount'])
            {
                /****************/
                $supplierdebit = array(
                    'chart_of_account_id' => $supplier_coa_id,
                    'voucher_no'          => $purchase_no,
                    'voucher_type'        => 'Purchase',
                    'voucher_date'        => $purchase_date,
                    'description'         => 'Supplier .' . $supplier_name,
                    'debit'               => $payment_data['paid_amount'],
                    'credit'              => 0,
                    'posted'              => 1,
                    'approve'             => 2,
                    'created_by'          => auth()->user()->name,
                    'created_at'          => date('Y-m-d H:i:s')
                );
                if($payment_data['payment_method'] == 1){
                    //Cah In Hand For Supplier
                    $payment = array(
                        'chart_of_account_id' => $payment_data['account_id'],
                        'voucher_no'          => $purchase_no,
                        'voucher_type'        => 'Purchase',
                        'voucher_date'        => $purchase_date,
                        'description'         => 'Cash in Hand For Supplier ' . $supplier_name,
                        'debit'               => 0,
                        'credit'              => $payment_data['paid_amount'],
                        'posted'              => 1,
                        'approve'             => 2,
                        'created_by'          => auth()->user()->name,
                        'created_at'          => date('Y-m-d H:i:s')

                    );
                }else{
                    // Bank Ledger
                    $payment = array(
                        'chart_of_account_id' => $payment_data['account_id'],
                        'voucher_no'          => $purchase_no,
                        'voucher_type'        => 'Purchase',
                        'voucher_date'        => $purchase_date,
                        'description'         => 'Paid amount for Supplier  ' . $supplier_name,
                        'debit'               => 0,
                        'credit'              => $payment_data['paid_amount'],
                        'posted'              => 1,
                        'approve'             => 2,
                        'created_by'          => auth()->user()->name,
                        'created_at'          => date('Y-m-d H:i:s')
                    );
                }

                $supplier_debit_transaction = Transaction::create($supplierdebit);
                $payment_transaction        = Transaction::create($payment);

                if($supplier_debit_transaction && $payment_transaction){
                    PurchasePayment::create([
                        'purchase_id'                   => $purchase_id,
                        'account_id'                    => $payment_data['account_id'],
                        'transaction_id'                => $payment_transaction->id,
                        'supplier_debit_transaction_id' => $supplier_debit_transaction->id,
                        'amount'                        => $payment_data['paid_amount'],
                        'payment_method'                => $payment_data['payment_method'],
                        'cheque_no'                     => $payment_data['cheque_no'],
                        'created_by'                    => auth()->user()->name
                    ]);
                }
            }
        }
    }


    public function show(int $id)
    {
        if(permission('purchase-view')){
            $setTitle = __('file.Purchase');
            $setSubTitle = __('file.Purchase Details');
            $this->setPageData($setSubTitle,$setSubTitle,'fas fa-file',[['name'=>$setTitle,'link' => route('purchase')],['name' => $setSubTitle]]);
            $purchase = $this->model->with('purchase_materials','supplier')->find($id);
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
                'purchase'   => $this->model->with('purchase_materials','labor_bill_rates')->find($id),
                'warehouses' => Warehouse::activeWarehouses(),
                'suppliers'  => Supplier::activeMaterialSuppliers(),
                'taxes'      => Tax::activeTaxes(),
                'labor_bills' => LaborBill::select('id','name')->where('status',1)->pluck('name','id'),
            ];

            // dd($data['purchase']);
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
                    $purchaseData = $this->model->with('purchase_materials')->find($request->purchase_id);
                    $balance = $request->grand_total - $purchaseData->paid_amount;
                    if($balance == 0)
                    {
                        $payment_status = 1;//paid
                    }else if($balance == $purchaseData->grand_total)
                    {
                        $payment_status = 3;//due
                    }else{
                        $payment_status = 2;//partial
                    }

                    $purchase_data = [
                        'memo_no'          => $request->memo_no,
                        'supplier_id'      => $request->supplier_id,
                        'warehouse_id'     => $request->warehouse_id,
                        'item'             => $request->item,
                        'total_qty'        => $request->total_qty,
                        'total_discount'   => $request->total_discount,
                        'total_tax'        => $request->total_tax,
                        'total_labor_cost' =>  0,
                        'total_cost'       => $request->total_cost,
                        'order_tax_rate'   => $request->order_tax_rate,
                        'order_tax'        => $request->order_tax,
                        'order_discount'   => $request->order_discount ? $request->order_discount : null,
                        'shipping_cost'    => $request->shipping_cost ? $request->shipping_cost : null,
                        'grand_total'      => $request->grand_total,
                        'purchase_status'  => $request->purchase_status,
                        'payment_status'   => $payment_status,
                        'note'             => $request->note,
                        'purchase_date'    => $request->purchase_date,
                        'created_by'       => auth()->user()->name
                    ];

                    if($request->hasFile('document')){
                        $purchase_data['document'] = $this->upload_file($request->file('document'),PURCHASE_DOCUMENT_PATH);
                    }
                    // $purchaseData = $this->model->with('purchase_materials')->find($request->purchase_id);
                    $purchase_no = $purchaseData->memo_no;
                    $old_supplier_id = $purchaseData->supplier_id;
                    $old_document = $purchaseData ? $purchaseData->document : '';

                    if(!$purchaseData->purchase_materials->isEmpty())
                    {
                        foreach ($purchaseData->purchase_materials as  $purchase_material) {

                            $old_received_qty = $purchase_material->pivot->received;
                            $purchase_unit = Unit::find($purchase_material->pivot->purchase_unit_id);
                            if($purchase_unit->operator == '*'){
                                $old_received_qty = $old_received_qty * $purchase_unit->operation_value;
                            }else{
                                $old_received_qty = $old_received_qty / $purchase_unit->operation_value;
                            }

                            if($purchaseData->status == 1){
                                $material_data = Material::find($purchase_material->id);

                                $material_data->qty -= $old_received_qty;
                                $material_data->update();

                                $warehouse_material = WarehouseMaterial::where([
                                    ['warehouse_id',$purchaseData->warehouse_id],
                                    ['material_id',$purchase_material->id],['qty','>',0]])->first();
                                if($warehouse_material){
                                    $warehouse_material->qty -= $old_received_qty;
                                    $warehouse_material->update();
                                }

                            }
                        }
                    }

                    //purchase materials
                    $materials = [];
                    if($request->has('materials'))
                    {
                        foreach ($request->materials as $key => $value) {
                            $unit = Unit::where('unit_name',$value['unit'])->first();
                            if($unit->operator == '*'){
                                $qty = $value['received'] * $unit->operation_value;
                            }else{
                                $qty = $value['received'] / $unit->operation_value;
                            }

                            $materials[$value['id']] = [
                                'qty'              => $value['qty'],
                                'received'         => $value['received'],
                                'purchase_unit_id' => $unit ? $unit->id : null,
                                'net_unit_cost'    => $value['net_unit_cost'],
                                'discount'         => $value['discount'],
                                'tax_rate'         => $value['tax_rate'],
                                'tax'              => $value['tax'],
                                'total'            => $value['subtotal']
                            ];
                            if($purchaseData->status == 1){
                                $material = Material::find($value['id']);
                                $material->qty += $qty;
                                $material->save();

                                $warehouse_material = WarehouseMaterial::where(['warehouse_id'=>$request->warehouse_id,'material_id'=>$value['id']])->first();
                                if($warehouse_material){
                                    $warehouse_material->qty += $qty;
                                    $warehouse_material->save();
                                }else{
                                    WarehouseMaterial::create([
                                        'warehouse_id'=>$request->warehouse_id,
                                        'material_id'=>$value['id'],
                                        'qty' => $qty
                                    ]);
                                }
                            }
                        }
                    }

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

                    $purchase = $purchaseData->update($purchase_data);
                    if(empty($result))
                    {
                        if($request->hasFile('document')){
                            $this->delete_file($purchase_data['document'], PURCHASE_DOCUMENT_PATH);
                            if($purchase && $old_document != '')
                            {
                                $this->delete_file($old_document,PURCHASE_DOCUMENT_PATH);
                            }
                        }
                    }

                    $purchaseData->purchase_materials()->sync($materials);

                    $purchaseData = $this->model->with('purchase_materials')->find($request->purchase_id);

                    if($purchaseData->status == 1){
                        if(!$purchaseData->purchase_materials->isEmpty())
                        {
                            foreach ($purchaseData->purchase_materials as  $purchase_material) {

                                $purchaseMaterial = DB::table('purchase_materials as pm')
                                ->selectRaw('sum(pm.total) as total_material_cost,sum(pm.qty) as total_material_qty,sum(p.shipping_cost) as total_shipping_cost')
                                ->join('purchases as p','pm.purchase_id','=','p.id')
                                ->where([['pm.material_id',$purchase_material->id],['p.status',1]])
                                ->first();
                                $material_cost = ($purchaseMaterial->total_material_cost + $purchaseMaterial->total_shipping_cost) / $purchaseMaterial->total_material_qty;
                                $material_data = Material::find($purchase_material->id);
                                $material_data->cost = number_format($material_cost,2,'.','');
                                $material_data->update();
                            }
                        }
                    }
                    // $purchaseData->labor_bill_rates()->sync($labor_bills);

                    $supplier = Supplier::with('coa')->find($request->supplier_id);
                    if($request->supplier_id == $old_supplier_id){
                        $old_supplier_coa_id = $supplier->coa->id;
                    }else{
                        $old_supplier = Supplier::with('coa')->find($old_supplier_id);
                        $old_supplier_coa_id = $old_supplier->coa->id;
                    }

                    $this->purchase_balance_update($purchase_no,$request->purchase_id,$request->grand_total,$supplier->coa->id,$supplier->name,$request->purchase_date,$old_supplier_coa_id);
                    $output  = $this->store_message($purchase, $request->purchase_id);
                    DB::commit();
                    // return response()->json($output);
                } catch (Exception $e) {
                    DB::rollback();
                    $output = ['status' => 'error','message' => $e->getMessage()];
                    // return response()->json($output);
                }
            }else{
                $output       = $this->unauthorized();
            }
            return response()->json($output);
        }else{
            return response()->json($this->unauthorized());
        }
    }

    private function purchase_balance_update(string $purchase_no, string $purchase_id,$balance, int $supplier_coa_id, string $supplier_name,$purchase_date, $old_supplier_coa_id) {
        if(!empty($purchase_id) && !empty($balance) && !empty($supplier_coa_id) && !empty($supplier_name) && !empty($purchase_date) && !empty($old_supplier_coa_id)){

            if($supplier_coa_id != $old_supplier_coa_id)
            {
                PurchasePayment::where('purchase_id', $purchase_id)->delete();
                $remove_purchase_transaction = Transaction::where('voucher_no', (string) $purchase_no)->where('voucher_type', (string) "Purchase")->delete();
                // dd($remove_purchase_transaction);
                if($remove_purchase_transaction)
                {
                    $this->purchase_balance_add($purchase_no,$purchase_id,$balance,$supplier_coa_id,$supplier_name,$purchase_date,$payment_data = []);
                }
            }else{
                $purchase_coa_transaction = Transaction::where(['chart_of_account_id' => $supplier_coa_id,'voucher_no' => $purchase_id,'voucher_type'=> 'Purchase'])->first();
                if($purchase_coa_transaction)
                {
                    $purchase_coa_transaction->update([
                        'voucher_date' => $purchase_date,
                        'credit'       => $balance,
                        'modified_by'  => auth()->user()->name,
                        'updated_at'   => date('Y-m-d H:i:s')
                    ]);
                }

                $purchase_coscr = Transaction::where([
                    'chart_of_account_id' => DB::table('chart_of_accounts')->where('code', $this->coa_head_code('inventory'))->value('id'),
                    'voucher_no' => $purchase_id,'voucher_type'=> 'Purchase'])->first();
                if($purchase_coscr)
                {
                    $purchase_coscr->update([
                        'voucher_date' => $purchase_date,
                        'debit'        => $balance,
                        'modified_by'  => auth()->user()->name,
                        'updated_at'   => date('Y-m-d H:i:s')
                    ]);
                }
                $company_expense = Transaction::where([
                    'chart_of_account_id' => DB::table('chart_of_accounts')->where('code', $this->coa_head_code('material_purchase'))->value('id'),
                    'voucher_no' => $purchase_id,'voucher_type'=> 'Purchase'])->first();
                if($company_expense)
                {
                    $company_expense->update([
                        'voucher_date' => $purchase_date,
                        'debit'        => $balance,
                        'modified_by'  => auth()->user()->name,
                        'updated_at'   => date('Y-m-d H:i:s')
                    ]);
                }

            }

        }
    }

    public function delete(Request $request)
    {
        if($request->ajax()){
            if(permission('purchase-delete')){
                DB::beginTransaction();
                try {
                    $purchaseData = Purchase::with('purchase_materials')->find($request->id);
                    $memo_no = $purchaseData->memo_no;
                    $pmaterials = [];
                    if(!$purchaseData->purchase_materials->isEmpty())
                    {
                        foreach ($purchaseData->purchase_materials as  $purchase_material) {
                            $purchase_unit = Unit::find($purchase_material->pivot->purchase_unit_id);
                            if($purchase_unit->operator == '*'){
                                $received_qty = $purchase_material->pivot->received * $purchase_unit->operation_value;
                            }else{
                                $received_qty = $purchase_material->pivot->received / $purchase_unit->operation_value;
                            }
                            if($purchaseData->status == 1){
                                $material_data = Material::find($purchase_material->id);
                                if($material_data->qty > 0){
                                    $material_data->qty -= $received_qty;
                                    $material_data->update();
                                }

                                $warehouse_material = WarehouseMaterial::where([
                                    'warehouse_id'=>$purchaseData->warehouse_id,
                                    'material_id'=>$purchase_material->id])->first();
                                if($warehouse_material){
                                    if($warehouse_material->qty > 0)
                                    {
                                        $warehouse_material->qty -= $received_qty;
                                        $warehouse_material->update();
                                    }
                                }

                            }
                            array_push($pmaterials,$purchase_material->id);
                        }
                        $purchaseData->purchase_materials()->detach();
                    }

                        if(!empty($pmaterials) && count($pmaterials) > 0)
                        {
                            foreach ($pmaterials as  $material_id) {
                                $purchaseMaterial = DB::table('purchase_materials as pm')
                                ->selectRaw('sum(pm.total) as total_material_cost,sum(pm.qty) as total_material_qty,sum(p.shipping_cost) as total_shipping_cost')
                                ->join('purchases as p','pm.purchase_id','=','p.id')
                                ->where([['pm.material_id',$material_id],['p.status',1]])
                                ->first();
                                if($purchaseMaterial->total_material_qty != 0){
                                    $material_cost = ($purchaseMaterial->total_material_cost + $purchaseMaterial->total_shipping_cost) / $purchaseMaterial->total_material_qty;
                                }else{
                                    $material_cost = 0;
                                }
                                $material_data = Material::find($material_id);
                                $material_data->cost = number_format($material_cost,2,'.','');
                                $material_data->update();
                            }
                        }
                    // if(!$purchaseData->labor_bill_rates->isEmpty())
                    // {
                    //     $purchaseData->labor_bill_rates()->detach();
                    // }
                    PurchasePayment::where('purchase_id',$request->id)->delete();
                    Transaction::where('voucher_no', (string) $memo_no)->where('voucher_type', (string) "Purchase")->delete();

                    $result = $purchaseData->delete();
                    $output = $result ? ['status' => 'success','message' => $this->responseMessage('Data Delete')] : ['status' => 'error','message' => $this->responseMessage('Data Delete Failed')];
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
                foreach ($request->ids as $id) {
                    DB::beginTransaction();
                    try {
                        $purchaseData = Purchase::with('purchase_materials')->find($id);
                        $memo_no = $purchaseData->memo_no;
                        $pmaterials = [];
                        if(!$purchaseData->purchase_materials->isEmpty())
                        {
                            foreach ($purchaseData->purchase_materials as  $purchase_material) {
                                $purchase_unit = Unit::find($purchase_material->pivot->purchase_unit_id);
                                if($purchase_unit->operator == '*'){
                                    $received_qty = $purchase_material->pivot->received * $purchase_unit->operation_value;
                                }else{
                                    $received_qty = $purchase_material->pivot->received / $purchase_unit->operation_value;
                                }
                                if($purchaseData->status == 1){

                                    $material_data = Material::find($purchase_material->id);
                                    if($material_data->qty > 0){
                                        $material_data->qty -= $received_qty;
                                        $material_data->update();
                                    }

                                    $warehouse_material = WarehouseMaterial::where([
                                        'warehouse_id'=>$purchaseData->warehouse_id,
                                        'material_id'=>$purchase_material->id])->first();
                                    if($warehouse_material){
                                        if($warehouse_material->qty > 0)
                                        {
                                            $warehouse_material->qty -= $received_qty;
                                            $warehouse_material->update();
                                        }
                                    }
                                }
                                array_push($pmaterials,$purchase_material->id);
                            }
                            $purchaseData->purchase_materials()->detach();
                        }
                        if(!empty($pmaterials) && count($pmaterials) > 0)
                        {
                            foreach ($pmaterials as  $material_id) {
                                $purchaseMaterial = DB::table('purchase_materials as pm')
                                ->selectRaw('sum(pm.total) as total_material_cost,sum(pm.qty) as total_material_qty,sum(p.shipping_cost) as total_shipping_cost')
                                ->join('purchases as p','pm.purchase_id','=','p.id')
                                ->where([['pm.material_id',$material_id],['p.status',1]])
                                ->first();
                                if($purchaseMaterial->total_material_qty != 0){
                                    $material_cost = ($purchaseMaterial->total_material_cost + $purchaseMaterial->total_shipping_cost) / $purchaseMaterial->total_material_qty;
                                }else{
                                    $material_cost = 0;
                                }

                                $material_data = Material::find($material_id);
                                $material_data->cost = number_format($material_cost,2,'.','');
                                $material_data->update();
                            }
                        }
                        // if(!$purchaseData->labor_bill_rates->isEmpty())
                        // {
                        //     $purchaseData->labor_bill_rates()->detach();
                        // }
                        PurchasePayment::where('purchase_id',$id)->delete();
                        Transaction::where('voucher_no', (string) $memo_no)->where('voucher_type', (string) "Purchase")->delete();
                        $result = $purchaseData->delete();
                        $output = $result ? ['status' => 'success','message' => $this->responseMessage('Data Delete')] : ['status' => 'error','message' => $this->responseMessage('Data Delete Failed')];
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


    public function change_status(Request $request)
    {
        if($request->ajax())
        {
            if(permission('purchase-approve')){
                if ($request->purchase_status) {
                    DB::beginTransaction();
                    try {
                        $purchaseData = $this->model->with('purchase_materials')->find($request->purchase_id);
                        $purchaseData->status = $request->purchase_status;
                        $purchaseData->status_change_by = Auth::user()->name;
                        $purchaseData->status_change_date = date('Y-m-d');
                        if($purchaseData->update())
                        {
                            $output = ['status'=>'success','message'=>$this->responseMessage('Approval Status')];
                        }else{
                            $output = ['status'=>'error','message'=>$this->responseMessage('Approval Status Failed')];
                        }
                        // dd($purchaseData);
                        if($request->purchase_status == 1){
                            if(!$purchaseData->purchase_materials->isEmpty())
                            {
                                foreach ($purchaseData->purchase_materials as  $purchase_material) {

                                    $purchaseMaterial = DB::table('purchase_materials as pm')
                                    ->selectRaw('sum(pm.total) as total_material_cost,sum(pm.qty) as total_material_qty,sum(p.shipping_cost) as total_shipping_cost')
                                    ->join('purchases as p','pm.purchase_id','=','p.id')
                                    ->where([['pm.material_id',$purchase_material->id],['p.status',1]])
                                    ->first();

                                    $old_received_qty = $purchase_material->pivot->received ? $purchase_material->pivot->received : 0;
                                    $purchase_unit = Unit::find($purchase_material->pivot->purchase_unit_id);
                                    if($purchase_unit->operator == '*'){
                                        $old_received_qty = $old_received_qty * $purchase_unit->operation_value;
                                    }else{
                                        $old_received_qty = $old_received_qty / $purchase_unit->operation_value;
                                    }


                                    $material_cost = ($purchaseMaterial->total_material_cost + $purchaseMaterial->total_shipping_cost) / $purchaseMaterial->total_material_qty;
                                    $material_data = Material::find($purchase_material->id);
                                    $material_data->qty += $old_received_qty;
                                    $material_data->cost = number_format($material_cost,2,'.','');
                                    $material_data->update();

                                    $warehouse_material = WarehouseMaterial::where([
                                        'warehouse_id'=>$purchaseData->warehouse_id,
                                        'material_id'=>$purchase_material->id])->first();
                                    if($warehouse_material){
                                        $warehouse_material->qty += $old_received_qty;
                                        $warehouse_material->update();
                                    }else{
                                        WarehouseMaterial::create([
                                            'warehouse_id'=>$purchaseData->warehouse_id,
                                            'material_id'=> $purchase_material->id,
                                            'qty' => $old_received_qty
                                        ]);
                                    }
                                }
                            }
                            Transaction::where([['voucher_no', $purchaseData->memo_no],['voucher_type', (string) "Purchase"]])->update(['approve'=>1]);
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
            if(permission('purchase-add')){
                // dd($request->all());
                try {
                    $purchase_data = [
                        'memo_no'          => $request->memo_no,
                        'supplier_id'      => $request->supplier_id,
                        'warehouse_id'     => $request->warehouse_id,
                        'item'             => $request->item,
                        'total_qty'        => $request->total_qty,
                        'total_discount'   => $request->total_discount,
                        'total_tax'        => $request->total_tax,
                        'total_labor_cost' => null,
                        'total_cost'       => $request->total_cost,
                        'order_tax_rate'   => $request->order_tax_rate,
                        'order_tax'        => $request->order_tax,
                        'order_discount'   => $request->order_discount ? $request->order_discount : null,
                        'shipping_cost'    => $request->shipping_cost ? $request->shipping_cost : null,
                        'grand_total'      => $request->grand_total,
                        'paid_amount'      => $request->paid_amount ? $request->paid_amount : 0,
                        'due_amount'      =>  ($request->grand_total - ($request->paid_amount ? $request->paid_amount : 0)),
                        'purchase_status'  => $request->purchase_status,
                        'payment_status'   => $request->payment_status,
                        'note'             => $request->note,
                        'purchase_date'    => $request->purchase_date,
                        'created_by'       => auth()->user()->name,
                        'payment_method'   => $request->payment_method ? $request->payment_method : null,
                        'account_id'       => $request->account_id ? $request->account_id : null,
                        'cheque_no'      => $request->cheque_number ? $request->cheque_number : '',
                    ];
                    //purchase materials
                    $materials = [];
                    if($request->has('materials'))
                    {
                        foreach ($request->materials as $key => $value) {
                            $unit = Unit::where('unit_name',$value['unit'])->first();

                            $materials[] = [
                                'id'               => $value['id'],
                                'name'             => $value['name'],
                                'code'             => $value['code'],
                                'qty'              => $value['qty'],
                                'received'         => $value['received'],
                                'unit_name'        => $value['unit'],
                                'purchase_unit_id' => $unit ? $unit->id : null,
                                'net_unit_cost'    => $value['net_unit_cost'],
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
                    //             'labor_bill_id'   => $value['bill_id'],
                    //             'qty'   => $value['qty'],
                    //             'rate'   => $value['rate'],
                    //             'total' => $value['subtotal']
                    //         ];
                    //     }
                    // }
                    $data = [
                        'purchase' => $purchase_data,
                        'materials'=>$materials,
                        // 'labor_bills'=>$labor_bills
                    ];
                    Session::put('purchase_data',$data);
                    // dd(Session::get('sale_data'));
                   if(Session::get('purchase_data')){
                    $output = ['status' => 'success','message' => $this->responseMessage('Hold')];
                   }else{
                    $output = ['status' => 'error','message' => $this->responseMessage('Hold Failed')];
                   }

                } catch (Exception $e) {
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
}
