<?php

namespace Modules\Customer\Entities;

use App\Models\BaseModel;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;


class PaidCustomer extends BaseModel
{
    protected $table = 'customers';

    protected $fillable = [ 'name', 'company_name', 'mobile', 'email', 'customer_group_id','city', 'zipcode', 
    'address', 'status', 'created_by', 'modified_by'];


    /******************************************
     * * * Begin :: Custom Datatable Code * * *
    *******************************************/
    //custom search column property
    protected $_customer_id; 


    //methods to set custom search property value
    public function setCustomerID($customer_id)
    {
        $this->_customer_id = $customer_id;
    }

    private function get_datatable_query()
    {
        //set column sorting index table column name wise (should match with frontend table header)

        $this->column_order = ['c.id','c.name', 'c.company_name','c.customer_group_id','c.address','c.mobile','c.email','c.city','c.zipcode',null];
        
        
        $query = DB::table('customers as c')
        ->selectRaw('c.id,c.name,c.company_name,c.mobile,c.email,c.city,c.zipcode,c.address,cg.group_name, ((select ifnull(sum(debit),0) from transactions where chart_of_account_id= b.id)-(select ifnull(sum(credit),0) from transactions where chart_of_account_id= b.id)) as balance')
        ->leftjoin('chart_of_accounts as b', 'c.id', '=', 'b.customer_id')
        ->leftjoin('customer_groups as cg', 'c.customer_group_id', '=', 'cg.id')
        ->groupBy('c.id','b.id')
        ->having('balance','<=',0);

        //search query
        if (!empty($this->_customer_id)) {
            $query->where('c.id', $this->_customer_id);
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
        return DB::table('customers as c')
        ->selectRaw('c.id,c.name,c.company_name,c.mobile,c.email,c.city,c.zipcode,c.address,cg.group_name, ((select ifnull(sum(debit),0) from transactions where chart_of_account_id= b.id)-(select ifnull(sum(credit),0) from transactions where chart_of_account_id= b.id)) as balance')
        ->leftjoin('chart_of_accounts as b', 'c.id', '=', 'b.customer_id')
        ->leftjoin('customer_groups as cg', 'c.customer_group_id', '=', 'cg.id')
        ->groupBy('c.id','b.id')
        ->having('balance','<=',0)->get()->count();
    }
    /******************************************
     * * * End :: Custom Datatable Code * * *
    *******************************************/
}
