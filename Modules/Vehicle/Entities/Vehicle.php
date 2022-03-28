<?php

namespace Modules\Vehicle\Entities;

use App\Models\User;
use App\Models\BaseModel;


class Vehicle extends BaseModel
{

    protected $fillable = ['name','qty','status','creator_id','modifier_id'];

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
    //custom search column property
    protected $_name; 

    //methods to set custom search property value
    public function setName($name)
    {
        $this->_name = $name;
    }


    private function get_datatable_query()
    {
        //set column sorting index table column name wise (should match with frontend table header)
        if (permission('vehicle-bulk-delete')){
            $this->column_order = [null,'id','name', 'qty','status','creator_id','created_at',null];
        }else{
            $this->column_order = ['id','name', 'qty','status','creator_id','created_at',null];
        }
        
        $query = self::with('creator:id,name');

        //search query
        if (!empty($this->_name)) {
            $query->where('name', 'like', '%' . $this->_name . '%');
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
    
}
