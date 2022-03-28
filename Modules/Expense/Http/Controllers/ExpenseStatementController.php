<?php

namespace Modules\Expense\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\BaseController;
use Modules\Expense\Entities\ExpenseItem;
use Modules\Expense\Entities\ExpenseStatement;

class ExpenseStatementController extends BaseController
{
    public function __construct(ExpenseStatement $model)
    {
        $this->model = $model;
    }

    public function index()
    {
        if(permission('expense-access')){
            $setTitle = __('file.Expense');
            $setSubTitle = __('file.Expense Statement');
            $this->setPageData($setSubTitle,$setSubTitle,'fas fa-money-check-alt',[['name'=>$setTitle,'link'=>'javascript::void();'],['name' =>$setSubTitle]]);
            $expense_items = ExpenseItem::toBase()->get();
            return view('expense::expense-statement.index',compact('expense_items'));
        }else{
            return $this->access_blocked();
        }
    }

    public function get_datatable_data(Request $request)
    {
        if($request->ajax()){
            if(permission('expense-access')){

                if (!empty($request->expense_item_id)) {
                    $this->model->setExpenseItemID($request->expense_item_id);
                }
                if (!empty($request->start_date)) {
                    $this->model->setStartDate($request->start_date);
                }
                if (!empty($request->end_date)) {
                    $this->model->setEndDate($request->end_date);
                }

                $this->set_datatable_default_properties($request);//set datatable default properties
                $list = $this->model->getDatatableList();//get table data
                $data = [];
                $no = $request->input('start');
                foreach ($list as $value) {
                    $no++;
                    $row = [];
                    $row[] = $no;
                    $row[] = $value->date;
                    $row[] = $value->expense_item->name;
                    $row[] = $value->remarks;
                    $row[] = number_format($value->amount,2);
                    $data[] = $row;
                }
                return $this->datatable_draw($request->input('draw'),$this->model->count_all(),
                $this->model->count_filtered(), $data);
            }
        }else{
            return response()->json($this->unauthorized());
        }
    }
}
