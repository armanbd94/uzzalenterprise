<?php

namespace Modules\Sale\Entities;

use App\Models\User;
use App\Models\BaseModel;
use Illuminate\Support\Facades\DB;
use Modules\Product\Entities\Product;
use Modules\Sale\Entities\SaleProduct;
use Modules\Customer\Entities\Customer;
use Modules\Setting\Entities\Warehouse;
use Modules\Account\Entities\Transaction;
use Modules\Product\Entities\WarehouseProduct;

class Sale extends BaseModel
{
    protected $fillable = [
        'invoice_no','sale_date','warehouse_id','customer_id','item','total_qty','total_cost','total_price','shipping_cost',
        'grand_total','paid_amount','due_amount','payment_status','payment_method','account_id','document','note','creator_id','modifier_id'
    ];

    public function warehouse()
    {
        return $this->belongsTo(Warehouse::class);
    }
    public function customer()
    {
        return $this->belongsTo(Customer::class);
    }

    public function  sale_products()
    {
        return $this->belongsToMany(Product::class,'sale_products','sale_id','product_id','id','id')
        ->withTimeStamps()
        ->withPivot('qty', 'vehicle_no', 'challan_no', 'price', 'total','net_unit_cost','total_cost'); 
    }
    public function hasManyProducts()
    {
        return $this->hasMany(SaleProduct::class);
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
    protected $order = ['s.id' => 'desc'];
    //custom search column property
    protected $_invoice_no; 
    protected $_from_date; 
    protected $_to_date; 
    protected $_warehouse_id; 
    protected $_customer_id; 
    protected $_payment_status; 

    //methods to set custom search property value
    public function setInvoiceNo($invoice_no)
    {
        $this->_invoice_no = $invoice_no;
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
    public function setCustomerID($customer_id)
    {
        $this->_customer_id = $customer_id;
    }

    public function setPaymentStatus($payment_status)
    {
        $this->_payment_status = $payment_status;
    }


    private function get_datatable_query()
    {

        
        if (permission('sale-bulk-delete')){
            $this->column_order = [null,'s.id','s.sale_date','s.invoice_no','s.warehouse_id','s.customer_id', 's.item', 's.total_price', 
            's.shipping_cost', 's.grand_total', 's.paid_amount', 's.due_amount', 's.payment_status','s.account_id', null];
        }else{
            $this->column_order = ['s.id','s.sale_date','s.invoice_no','s.warehouse_id','s.customer_id', 's.item', 's.total_price', 
            's.shipping_cost', 's.grand_total', 's.paid_amount', 's.due_amount', 's.payment_status','s.account_id', null];
        }
        
        $query = DB::table('sales as s')
        ->join('customers as c','s.customer_id','=','c.id')
        ->join('warehouses as w','s.warehouse_id','=','w.id')
        ->leftJoin('chart_of_accounts as coa','s.account_id','=','coa.id')
        ->whereBetween('s.sale_date',[config('settings.session_start'),config('settings.session_end')])
        ->selectRaw('s.*,c.name as customer_name,c.mobile,w.name as warehouse_name,coa.name as account_name');

        //search query
        if (!empty($this->_invoice_no)) {
            $query->where('s.invoice_no', 'like', '%' . $this->_invoice_no . '%');
        }

        if (!empty($this->_from_date) && !empty($this->_to_date)) {
            $query->whereBetween('s.sale_date', [$this->_from_date,$this->_to_date]);
        }

        if (!empty($this->_customer_id)) {
            $query->where('s.customer_id', $this->_customer_id);
        }

        if (!empty($this->_payment_status)) {
            $query->where('s.payment_status', $this->_payment_status);
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
        return DB::table('sales')
        ->whereBetween('sale_date',[config('settings.session_start'),config('settings.session_end')])
        ->get()->count();
    }
    /******************************************
     * * * End :: Custom Datatable Code * * *
    *******************************************/

    public function sale_data($request)
    {
        return collect($request)->except(['_token','sale_id','products'])->merge( [ ($request['sale_id'] ? 'modifier_id' : 'creator_id') => auth()->user()->id])->all();
    }

    public function sale_products_data($warehouse_id,$value)
    {
        $product = Product::find($value['id']);

        if($product){
            
            $product->qty -= $value['qty'];
            $product->update();    
        }
        
        $warehouse_product = WarehouseProduct::where(['warehouse_id'=>$warehouse_id,'product_id'=>$value['id']])->first();
        if($warehouse_product){
            
            $warehouse_product->qty -= $value['qty'];
            $warehouse_product->save();
        }
        
        return [
            'vehicle_no' => $value['vehicle_no'],
            'challan_no' => $value['challan_no'],
            'qty'        => $value['qty'],
            'price'      => $value['price'],
            'total'      => $value['subtotal'],
            'net_unit_cost'      => $value['net_unit_cost'],
            'total_cost'      => $value['subtotal_cost'],
        ];
    }

    public function sale_balance_add(int $customer_coa_id, $request) {

        // customer debit
        $customer_debit = array(
            'chart_of_account_id' => $customer_coa_id,
            'voucher_no'          => $request->invoice_no,
            'voucher_type'        => 'Invoice',
            'voucher_date'        => $request->sale_date,
            'description'         => "Customer receivable amount $request->grand_total from sale Invoice No. $request->invoice_no",
            'debit'               => $request->grand_total,
            'credit'              => 0,
            'posted'              => 1,
            'approve'             => 1,
            'created_by'          => auth()->user()->name,
            'created_at'          => date('Y-m-d H:i:s')
        );

        //Inventory Credit
        $inventory_credit = array(
            'chart_of_account_id' => DB::table('chart_of_accounts')->where('code', '10101')->value('id'),
            'voucher_no'          => $request->invoice_no,
            'voucher_type'        => 'Invoice',
            'voucher_date'        => $request->sale_date,
            'description'         => "Inventory credit $request->total_cost for sale Invoice No. $request->invoice_no",
            'debit'               => 0,
            'credit'              => $request->total_cost,
            'posted'              => 1,
            'approve'             => 1,
            'created_by'          => auth()->user()->name,
            'created_at'          => date('Y-m-d H:i:s')
        ); 

        $product_sale_income = array(
            'chart_of_account_id' => DB::table('chart_of_accounts')->where('code', '301')->value('id'),
            'voucher_no'          => $request->invoice_no,
            'voucher_type'        => 'Invoice',
            'voucher_date'        => $request->sale_date,
            'description'         => 'Sale Income '.$request->grand_total.' from Invoice No. - ' . $request->invoice_no,
            'debit'               => 0,
            'credit'              => $request->grand_total,
            'posted'              => 1,
            'approve'             => 1,
            'created_by'          => auth()->user()->name,
            'created_at'          => date('Y-m-d H:i:s')
        ); 


        $transaction = Transaction::insert([
            $customer_debit,$inventory_credit,$product_sale_income
        ]);


        if($request->paid_amount && $request->paid_amount > 0)
        {
            $customer_credit = array(
                'chart_of_account_id' => $customer_coa_id,
                'voucher_no'          => $request->invoice_no,
                'voucher_type'        => 'Invoice',
                'voucher_date'        => $request->sale_date,
                'description'         => "Customer received amount $request->paid_amount  from sale Invoice No. $request->invoice_no",
                'debit'               => 0,
                'credit'              => $request->paid_amount,
                'posted'              => 1,
                'approve'             => 1,
                'created_by'          => auth()->user()->name,
                'created_at'          => date('Y-m-d H:i:s')
            );

            $payment = array(
                'chart_of_account_id' => $request->account_id,
                'voucher_no'          => $request->invoice_no,
                'voucher_type'        => 'Invoice',
                'voucher_date'        => $request->sale_date,
                'description'         => "Customer received amount $request->paid_amount  from sale Invoice No. $request->invoice_no",
                'debit'               => $request->paid_amount,
                'credit'              => 0,
                'posted'              => 1,
                'approve'             => 1,
                'created_by'          => auth()->user()->name,
                'created_at'          => date('Y-m-d H:i:s')
            );
            Transaction::insert([$customer_credit,$payment]);
        }
        return $transaction;
    }


    public function sale_products_remove($saleData)
    {
        
        foreach ($saleData->sale_products as  $product) {

            $sold_qty = $product->pivot->qty;
            $product_data = Product::find($product->id);
            if($product_data)
            {
                $product_data->qty += $sold_qty;
                $product_data->update();
            }
            $warehouse_product = WarehouseProduct::where([
                'warehouse_id'=>$saleData->warehouse_id,
                'product_id'=>$product->id])->first();
            if($warehouse_product)
            {
                $warehouse_product->qty += $sold_qty;
                $warehouse_product->update();
            }
        
        }
        return $saleData->sale_products()->detach();
        
    }


}
