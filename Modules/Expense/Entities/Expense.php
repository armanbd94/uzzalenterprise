<?php

namespace Modules\Expense\Entities;

use App\Models\BaseModel;
use Modules\Expense\Entities\ExpenseItem;
use Modules\Account\Entities\ChartOfAccount;

class Expense extends BaseModel
{
    protected $fillable = ['expense_item_id', 'voucher_no', 'amount', 'date', 'payment_type', 'account_id', 'remarks',
    'status','status_change_by','status_change_date', 'created_by', 'modified_by'];

    public function expense_item()
    {
        return $this->belongsTo(ExpenseItem::class);
    }

    public function coa()
    {
        return $this->belongsTo(ChartOfAccount::class,'account_id','id');
    }
    /******************************************
     * * * Begin :: Custom Datatable Code * * *
    *******************************************/
    //custom search column property
    protected $_expense_item_id; 
    protected $_status;
    //methods to set custom search property value
    public function setExpenseItemID($expense_item_id)
    {
        $this->_expense_item_id = $expense_item_id;
    }
    public function setStatus($status)
    {
        $this->_status = $status;
    }
    private function get_datatable_query()
    {
        //set column sorting index table column name wise (should match with frontend table header)
        if (permission('expense-bulk-delete')){
            $this->column_order = [null,'id','date','expense_item_id','remarks','payment_type','account_id','amount','status',null];
        }else{
            $this->column_order = ['id','date','expense_item_id','remarks','payment_type','account_id','amount','status',null];
        }
        
        $query = self::with('expense_item','coa');

        //search query
        if (!empty($this->_expense_item_id)) {
            $query->where('expense_item_id', $this->_expense_item_id);
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
}
