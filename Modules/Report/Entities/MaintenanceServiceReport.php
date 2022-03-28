<?php

namespace Modules\Report\Entities;

use App\Models\BaseModel;

class MaintenanceServiceReport extends BaseModel
{

    protected $table = 'maintenance_services';
    
    protected $fillable = [
        'memo_no', 'service_man', 'item', 'total_qty', 'total_discount', 'total_tax',
        'total_cost', 'order_tax_rate', 'order_tax', 'order_discount', 'shipping_cost', 'accessories_cost', 'grand_total', 'paid_amount',
        'purchase_status', 'payment_status', 'document', 'note', 'service_date', 'created_by', 'modified_by'
    ];

    
    

    /******************************************
     * * * Begin :: Custom Datatable Code * * *
    *******************************************/
    /******************************************
     * * * Begin :: Custom Datatable Code * * *
    *******************************************/
    //custom search column property
    protected $order = ['service_date' => 'desc'];
    protected $start_date; 
    protected $end_date; 

    //methods to set custom search property value

    public function setStartDate($start_date)
    {
        $this->start_date = $start_date;
    }
    public function setEndDate($end_date)
    {
        $this->end_date = $end_date;
    }

    private function get_datatable_query()
    {
        //set column sorting index table column name wise (should match with frontend table header)

        $this->column_order = ['id','service_date','memo_no','created_by',  'service_man', 'grand_total'];
        
        
        $query = self::where('status',1);
        if (!empty($this->start_date)) {
            $query->where('service_date', '>=',$this->start_date);
        }
        if (!empty($this->end_date)) {
            $query->where('service_date', '<=',$this->end_date);
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
        return self::where('status',1)->get()->count();
    }
    /******************************************
     * * * End :: Custom Datatable Code * * *
    *******************************************/
}
