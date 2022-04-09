<?php

namespace Modules\Purchase\Entities;

use App\Models\User;
use App\Models\BaseModel;
use Illuminate\Support\Facades\DB;
use Modules\Product\Entities\Product;
use Modules\Setting\Entities\Warehouse;
use Modules\Supplier\Entities\Supplier;
use Modules\Account\Entities\Transaction;
use Modules\Product\Entities\WarehouseProduct;
use Modules\Purchase\Entities\PurchaseProduct;

class Purchase extends BaseModel
{
    protected $fillable = [
        'memo_no','purchase_date','warehouse_id','supplier_id','item','total_qty','total_cost','shipping_cost',
        'grand_total','paid_amount','due_amount','payment_status','payment_method','account_id','document','note','creator_id','modifier_id'
    ];

    public function warehouse()
    {
        return $this->belongsTo(Warehouse::class);
    }
    public function supplier()
    {
        return $this->belongsTo(Supplier::class);
    }

    public function  purchase_products()
    {
        return $this->belongsToMany(Product::class,'purchase_products','purchase_id','product_id','id','id')
        ->withTimeStamps()
        ->withPivot('qty', 'vehicle_no', 'challan_no', 'net_unit_cost', 
        'new_unit_cost', 'current_unit_cost', 'old_unit_cost', 'total'); 
    }
    public function hasManyProducts()
    {
        return $this->hasMany(PurchaseProduct::class);
    }

    public function creator()
    {
        return $this->belongsTo(User::class,'creator_id','id');
    }
    public function modifier()
    {
        return $this->belongsTo(User::class,'modifier_id','id');
    }

     /******************************************
     * * * Begin :: Custom Datatable Code * * *
    *******************************************/
    protected $order = ['p.id' => 'desc'];
    //custom search column property
    protected $_memo_no; 
    protected $_from_date; 
    protected $_to_date; 
    protected $_warehouse_id; 
    protected $_supplier_id; 
    protected $_payment_status; 

    //methods to set custom search property value
    public function setMemoNo($memo_no)
    {
        $this->_memo_no = $memo_no;
    }

    public function setFromDate($from_date)
    {
        $this->_from_date = $from_date;
    }
    public function setToDate($to_date)
    {
        $this->_to_date = $to_date;
    }
    public function setWarehouseID($warehouse_id)
    {
        $this->_warehouse_id = $warehouse_id;
    }
    public function setSupplierID($supplier_id)
    {
        $this->_supplier_id = $supplier_id;
    }

    public function setPaymentStatus($payment_status)
    {
        $this->_payment_status = $payment_status;
    }


    private function get_datatable_query()
    {

        
        if (permission('purchase-bulk-delete')){
            $this->column_order = [null,'p.id','p.purchase_date','p.memo_no','p.warehouse_id','p.supplier_id', 'p.item', 'p.total_cost', 
            'p.shipping_cost', 'p.grand_total', 'p.paid_amount', 'p.due_amount', 'p.payment_status','p.account_id', null];
        }else{
            $this->column_order = ['p.id','p.purchase_date','p.memo_no','p.warehouse_id','p.supplier_id', 'p.item', 'p.total_cost', 
            'p.shipping_cost', 'p.grand_total', 'p.paid_amount', 'p.due_amount', 'p.payment_status','p.account_id', null];
        }
        
        $query = DB::table('purchases as p')
        ->join('suppliers as s','p.supplier_id','=','s.id')
        ->join('warehouses as w','p.warehouse_id','=','w.id')
        ->leftJoin('chart_of_accounts as coa','p.account_id','=','coa.id')
        ->whereBetween('p.purchase_date',[config('settings.session_start'),config('settings.session_end')])
        ->selectRaw('p.*,s.name as supplier_name,s.mobile,w.name as warehouse_name,coa.name as account_name');

        //search query
        if (!empty($this->_memo_no)) {
            $query->where('p.memo_no', 'like', '%' . $this->_memo_no . '%');
        }

        if (!empty($this->_from_date) && !empty($this->_to_date)) {
            $query->whereBetween('p.purchase_date', [$this->_from_date,$this->_to_date]);
        }

        if (!empty($this->_supplier_id)) {
            $query->where('p.supplier_id', $this->_supplier_id);
        }

        if (!empty($this->_payment_status)) {
            $query->where('p.payment_status', $this->_payment_status);
        }

        //order by data fetching code
        if (isset($this->orderValue) && isset($this->dirValue)) { //orderValue is the index number of table header and dirValue is asc or desc
            $query->orderBy($this->column_order[$this->orderValue], $this->dirValue); //fetch data order by matching column
        } else if (isset($this->order)) {
            $query->orderBy(key($this->order), $this->order[key($this->order)]);
        }
        return $query;
    }

    public function getDatatableList()
    {
        $query = $this->get_datatable_query();
        if ($this->lengthVlaue != -1) {
            $query->offset($this->startVlaue)->limit($this->lengthVlaue);
        }
        return $query->get();
    }

    public function count_filtered()
    {
        $query = $this->get_datatable_query();
        return $query->get()->count();
    }

    public function count_all()
    {
        return DB::table('purchases')
        ->whereBetween('purchase_date',[config('settings.session_start'),config('settings.session_end')])
        ->get()->count();
    }
    /******************************************
     * * * End :: Custom Datatable Code * * *
    *******************************************/

    public function purchase_data($request)
    {
        // dd($request['purchase_id']);
        return collect($request)->except(['_token','purchase_id','products'])->merge( [ ($request['purchase_id'] ? 'modifier_id' : 'creator_id') => auth()->user()->id])->all();
    }

    public function purchase_products_data($warehouse_id,$value)
    {
        $current_stock_qty = 0;
        $current_stock_value = 0;
        
        $product = Product::find($value['id']);
        $value['current_unit_cost'] = $product->cost ?? 0;
        $value['old_unit_cost'] = $product->old_cost ?? 0;
        $current_stock_qty = $product->qty;
        $current_stock_value = $product->qty * $value['current_unit_cost'];
        $value['new_unit_cost'] = ($current_stock_value + $value['subtotal']) / ($value['qty'] + $current_stock_qty);
        if($product){
            
            $product->qty += $value['qty'];
            $product->cost = $value['new_unit_cost'];
            $product->old_cost = $value['current_unit_cost'];
            $product->save();    
        }
        
        $warehouse_product = WarehouseProduct::where(['warehouse_id'=>$warehouse_id,'product_id'=>$value['id']])->first();
        if($warehouse_product){
            
            $warehouse_product->qty += $value['qty'];
            $warehouse_product->save();
        }else{
            WarehouseProduct::create([
                'warehouse_id' => $warehouse_id,
                'product_id'   => $value['id'],
                'qty'          => $value['qty']
            ]);
        }
        
        return [
            'purchase_id'       => $value['purchase_id'],
            'product_id'        => $value['id'],
            'vehicle_no'        => $value['vehicle_no'],
            'challan_no'        => $value['challan_no'],
            'qty'               => $value['qty'],
            'net_unit_cost'     => $value['net_unit_cost'],
            'total'             => $value['subtotal'],
            'new_unit_cost'     => $value['new_unit_cost'],
            'current_unit_cost' => $value['current_unit_cost'],
            'old_unit_cost'     => $value['old_unit_cost']
        ];
    }

    public function purchase_balance_add(int $supplier_coa_id, $request) {

        // supplier Credit
        $supplier_credit = array(
            'chart_of_account_id' => $supplier_coa_id,
            'voucher_no'          => $request->memo_no,
            'voucher_type'        => 'Purchase',
            'voucher_date'        => $request->purchase_date,
            'description'         => "Supplier payable amount $request->grand_total for purchase Memo No. $request->memo_no",
            'debit'               => 0,
            'credit'              => $request->grand_total,
            'posted'              => 1,
            'approve'             => 1,
            'created_by'          => auth()->user()->name,
            'created_at'          => date('Y-m-d H:i:s')
        );

        //Inventory Debit
        $inventory_debit = array(
            'chart_of_account_id' => DB::table('chart_of_accounts')->where('code', '10101')->value('id'),
            'voucher_no'          => $request->memo_no,
            'voucher_type'        => 'Purchase',
            'voucher_date'        => $request->purchase_date,
            'description'         => "Inventory debit $request->grand_total for purchase Memo No. $request->memo_no",
            'debit'               => $request->grand_total,
            'credit'              => 0,
            'posted'              => 1,
            'approve'             => 1,
            'created_by'          => auth()->user()->name,
            'created_at'          => date('Y-m-d H:i:s')
        ); 

        // Expense for company
        $expense_debit = array(
            'chart_of_account_id' => DB::table('chart_of_accounts')->where('code', '402')->value('id'),
            'voucher_no'          => $request->memo_no,
            'voucher_type'        => 'Purchase',
            'voucher_date'        => $request->purchase_date,
            'description'         => "Company expense $request->grand_total for purchase Memo No. $request->memo_no",
            'debit'               => $request->grand_total,
            'credit'              => 0,
            'posted'              => 1,
            'approve'             => 1,
            'created_by'          => auth()->user()->name,
            'created_at'          => date('Y-m-d H:i:s')
        ); 

        $transaction = Transaction::insert([
            $supplier_credit,$inventory_debit,$expense_debit
        ]);


        if($request->paid_amount && $request->paid_amount > 0)
        {
            $supplierdebit = array(
                'chart_of_account_id' => $supplier_coa_id,
                'voucher_no'          => $request->memo_no,
                'voucher_type'        => 'Purchase',
                'voucher_date'        => $request->purchase_date,
                'description'         => "Supplier paid amount $request->paid_amount for purchase Memo No. $request->memo_no",
                'debit'               => $request->paid_amount,
                'credit'              => 0,
                'posted'              => 1,
                'approve'             => 1,
                'created_by'          => auth()->user()->name,
                'created_at'          => date('Y-m-d H:i:s')
            );

            $payment = array(
                'chart_of_account_id' => $request->account_id,
                'voucher_no'          => $request->memo_no,
                'voucher_type'        => 'Purchase',
                'voucher_date'        => $request->purchase_date,
                'description'         => "Supplier paid amount $request->paid_amount for purchase Memo No. $request->memo_no",
                'debit'               => 0,
                'credit'              => $request->paid_amount,
                'posted'              => 1,
                'approve'             => 1,
                'created_by'          => auth()->user()->name,
                'created_at'          => date('Y-m-d H:i:s')
            );
            Transaction::insert([$supplierdebit,$payment]);
        }
        return $transaction;
    }


    public function purchase_products_remove($purchaseData)
    {
        
        foreach ($purchaseData->hasManyProducts as  $product) {

            $received_qty = $product->qty;
            $product_data = Product::find($product->id);
            if($product_data)
            {
                $product_data->qty -= $received_qty;
                $product_data->cost = $product->current_unit_cost;
                $product_data->old_cost = $product->old_unit_cost;
                $product_data->update();
            }
            $warehouse_product = WarehouseProduct::where([
                'warehouse_id'=>$purchaseData->warehouse_id,
                'product_id'=>$product->id])->first();
            if($warehouse_product)
            {
                $warehouse_product->qty -= $received_qty;
                $warehouse_product->update();
            }
        
        }
        return $purchaseData->hasManyProducts()->delete();
        
    }
}
