<?php

namespace Modules\Sale\Entities;

use App\Models\BaseModel;
use Modules\Product\Entities\Product;
use Modules\Customer\Entities\Customer;
use Modules\Setting\Entities\Warehouse;
use Modules\Setting\Entities\LaborBillRate;

class Sale extends BaseModel
{
    protected $fillable = [ 'invoice_no', 'warehouse_id', 'customer_id', 'item', 'total_qty', 'total_discount', 'total_tax',
    'total_labor_cost', 'total_price', 'order_tax_rate', 'order_tax', 'order_discount', 'shipping_cost', 'grand_total', 
    'paid_amount', 'due_amount', 'previous_due', 'payment_status', 'payment_method', 'account_id', 'document', 'note','type',
    'sale_date', 'delivery_status', 'delivery_date', 'status', 'status_change_by', 'status_change_date', 'created_by', 'modified_by'
    ];

    public function warehouse()
    {
        return $this->belongsTo(Warehouse::class)->withDefault(['name'=>'']);
    }
    
    public function customer()
    {
        return $this->belongsTo(Customer::class,'customer_id','id');
    }

    public function  sale_products()
    {
        return $this->belongsToMany(Product::class,'sale_products','sale_id',
        'product_id','id','id')
        ->withPivot('id','qty','delivered', 'delivered_warehouse_id', 'sale_unit_id', 'net_unit_price','discount', 'tax_rate', 'tax', 'total')
        ->withTimeStamps(); 
    }
    public function labor_bill_rates()
    {
        return $this->morphToMany(LaborBillRate::class,'rateable','rateables')
        ->withPivot(['labor_bill_id', 'qty', 'rate', 'total'])
        ->withTimestamps();
    }

     /******************************************
     * * * Begin :: Custom Datatable Code * * *
    *******************************************/
    //custom search column property
    protected $_invoice_no; 
    protected $_warehouse_id; 
    protected $_from_date; 
    protected $_to_date; 
    protected $_customer_id; 
    protected $_payment_status; 
    protected $_status; 
    protected $_delivery_status; 

    //methods to set custom search property value
    public function setInvoiceNo($invoice_no)
    {
        $this->_invoice_no = $invoice_no;
    }
    public function setWarehouseID($warehouse_id)
    {
        $this->_warehouse_id = $warehouse_id;
    }

    public function setFromDate($from_date)
    {
        $this->_from_date = $from_date;
    }
    public function setToDate($to_date)
    {
        $this->_to_date = $to_date;
    }
    public function setCustomerID($customer_id)
    {
        $this->_customer_id = $customer_id;
    }
    public function setDeliveryStatus($delivery_status)
    {
        $this->_delivery_status = $delivery_status;
    }
    public function setPaymentStatus($payment_status)
    {
        $this->_payment_status = $payment_status;
    }
    public function setStatus($status)
    {
        $this->_status = $status;
    }


    private function get_datatable_query()
    {
        //set column sorting index table column name wise (should match with frontend table header)
        if(permission('sale-bulk-delete')){
            $this->column_order = ['id','id','invoice_no','warehouse_id', 'custoemr_id', 'total_item', 'total_price', 'order_discount',
            'shipping_cost', 'grand_total','previous_due',null, 'paid_amount', 'due_amount', 'sale_date', 'payment_status','status','payment_method','delivery_status', 'delivery_date', null];
        
        }else{
            $this->column_order = ['id','invoice_no','warehouse_id', 'custoemr_id', 'total_item', 'total_price', 'order_discount',
            'shipping_cost', 'grand_total','previous_due',null, 'paid_amount', 'due_amount', 'sale_date', 'payment_status','status','payment_method','delivery_status', 'delivery_date', null];
        }
        
        $query = self::with('customer','warehouse')->where('type',1);

        //search query
        if (!empty($this->_invoice_no)) {
            $query->where('invoice_no', 'like', '%' . $this->_invoice_no . '%');
        }

        if (!empty($this->_from_date)) {
            $query->where('sale_date', '>=',$this->_from_date);
        }
        if (!empty($this->_to_date)) {
            $query->where('sale_date', '<=',$this->_to_date);
        }
        if (!empty($this->_warehouse_id)) {
            $query->where('warehouse_id', $this->_warehouse_id);
        }

        if (!empty($this->_customer_id)) {
            $query->where('customer_id', $this->_customer_id);
        }
        
        if (!empty($this->_payment_status)) {
            $query->where('payment_status', $this->_payment_status);
        }
        if (!empty($this->_status)) {
            $query->where('status', $this->_status);
        }
        if (!empty($this->_delivery_status)) {
            $query->where('delivery_status', $this->_delivery_status);
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
        return self::toBase()->where('type',1)->get()->count();
    }
    /******************************************
     * * * End :: Custom Datatable Code * * *
    *******************************************/


}
