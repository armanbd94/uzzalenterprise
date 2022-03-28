<?php

namespace Modules\Report\Entities;

use App\Models\BaseModel;
use Modules\Transport\Entities\Driver;

class TransportReport extends BaseModel
{
    protected $table = 'transports';
    protected $fillable = [
        'voucher_no', 'voucher_date', 'truck_no', 'driver_id', 'starting_point_meter', 'return_point_meter',
        'per_kilo_oil_cost', 'starting_date_time', 'return_date_time', 'total_income', 'total_expense', 'net_profit', 'net_income', 'note',
        'created_by', 'modified_by'
    ];

    /******************************************
     * * * Begin :: Custom Datatable Code * * *
    *******************************************/
    /******************************************
     * * * Begin :: Custom Datatable Code * * *
    *******************************************/
    //custom search column property
    protected $order = ['voucher_date' => 'desc'];
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

        $this->column_order = ['id','voucher_date','voucher_no','created_by', 'driver_name', 'net_profit'];
        $query = self::with('driver:id,name');
        if (!empty($this->start_date)) {
            $query->where('voucher_date', '>=',$this->start_date);
        }
        if (!empty($this->end_date)) {
            $query->where('voucher_date', '<=',$this->end_date);
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
        return self::toBase()->get()->count();
    }
    public function driver(){
        return $this->belongsTo(Driver::class);
    }
    /******************************************
     * * * End :: Custom Datatable Code * * *
    *******************************************/
}
