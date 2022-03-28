<?php

namespace Modules\Material\Entities;

use App\Models\Tax;
use App\Models\Unit;
use App\Models\BaseModel;

class Material extends BaseModel
{
    protected $fillable = ['material_name', 'material_code', 'unit_id', 'purchase_unit_id', 'cost', 'qty', 'alert_qty', 
    'tax_id', 'tax_method', 'status', 'has_opening_stock', 'opening_stock_qty', 'opening_warehouse_id', 'created_by', 'modified_by'];

    /******************************************
     * * * Begin :: Custom Datatable Code * * *
    *******************************************/
    //custom search column property
    protected $_material_name; 
    protected $_material_code; 
    protected $_status; 

    //methods to set custom search property value
    public function setMaterialName($material_name)
    {
        $this->_material_name = $material_name;
    }
    public function setMaterialCode($material_code)
    {
        $this->_material_code = $material_code;
    }
    public function setStatus($status)
    {
        $this->_status = $status;
    }


    private function get_datatable_query()
    {
        //set column sorting index table column name wise (should match with frontend table header)
        if (permission('material-bulk-delete')){
            $this->column_order = [null,'id','material_name','material_code','cost','unit_id','purchase_unit_id','qty', 'alert_qty', 'tax_id','tax_method','status',null];
        }else{
            $this->column_order = ['id','material_name','material_code','cost','unit_id', 'purchase_unit_id','qty','alert_qty', 'tax_id','tax_method','status',null];
        }
        
        $query = self::with('unit:id,unit_name,unit_code','purchase_unit:id,unit_name,unit_code');

        //search query
        if (!empty($this->_material_name)) {
            $query->where('material_name', 'like', '%' . $this->_material_name . '%');
        }
        if (!empty($this->_material_code)) {
            $query->where('material_code', 'like', '%' . $this->_material_code . '%');
        }
        if (!empty($this->_status)) {
            $query->where('status', $this->_status);
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
    /******************************************
     * * * End :: Custom Datatable Code * * *
    *******************************************/

    /***************************************
     * * * Begin :: Model Relationship * * *
    ****************************************/
    public function unit()
    {
        return $this->belongsTo(Unit::class,'unit_id','id');
    }
    public function purchase_unit()
    {
        return $this->belongsTo(Unit::class,'purchase_unit_id','id');
    }
    public function tax()
    {
        return $this->belongsTo(Tax::class)->orderBy('name','asc')->withDefault(['name'=>'No Tax','rate'=>0]);
    }
    public function opening_warehouse()
    {
        return $this->belongsTo(Warehouse::class,'opening_warehouse_id','id')->withDefault(['name' => '']);
    }
    /***************************************
     * * * End :: Model Relationship * * *
    ****************************************/
}
