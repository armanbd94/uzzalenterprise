<?php

namespace Modules\Report\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\BaseController;
use App\Models\Warehouse;
use Modules\Report\Entities\DailyClosing;
use Modules\Report\Http\Requests\ClosingFormRequest;

class ClosingReportController extends BaseController
{
    public function __construct(DailyClosing $model)
    {
        $this->model = $model;
    }

    public function index()
    {
        if(permission('closing-access')){
            $setTitle = __('file.Report');
            $setSubTitle = __('file.Closing Account');
            $this->setPageData($setSubTitle,$setSubTitle,'fas fa-file-signature',[['name' => $setTitle,'link'=>'javascript::void();'],['name' => $setSubTitle]]);
            return view('report::closing-report.form');
        }else{
            return $this->access_blocked();
        }

    }

    public function closing_data(Request $request)
    {
        if ($request->ajax()) {
            $last_closing_amount_data = DailyClosing::select('amount')->latest('date')->first();
            $cash_data=  DB::table('transactions as t')
                        ->selectRaw('SUM(debit) AS cash_in_amount, SUM(credit) AS cash_out_amount')
                        ->leftjoin('chart_of_accounts as coa','t.chart_of_account_id' ,'=','coa.id')
                        ->where(['t.voucher_date' => date('Y-m-d'),'coa.code' => $this->coa_head_code('cash_in_hand')])
                        ->first();
            $last_closing_amount  = $last_closing_amount_data ? $last_closing_amount_data->amount : 0;
            $cash_in = $cash_data ? ($cash_data->cash_in_amount ?? 0) : 0;
            $cash_out = $cash_data ? ($cash_data->cash_out_amount ?? 0) : 0;
            if($last_closing_amount)
            {
                $cash_in_hand = ($last_closing_amount + $cash_in) - $cash_out;
            }else{
                $cash_in_hand = $cash_in - $cash_out;
            }

            $data = [
                "last_day_closing" => $last_closing_amount,
                "cash_in"          => $cash_in,
                "cash_out"         => $cash_out,
                "cash_in_hand"     => $cash_in_hand,
            ];
            return response()->json($data);

        }
    }

    public function store(Request $request)
    {
        if($request->ajax())
        {
            $closing_data = DB::table('daily_closings')->where(['date' => date('Y-m-d')])->get()->count();
            if($closing_data > 0)
            {
                $output = ['status' => 'error','message'=>'Already Closed Today'];
            }else{
                $data = [
                    'last_day_closing' => $request->last_day_closing ? str_replace( ',', '',$request->last_day_closing) : 0,
                    'cash_in'          => $request->cash_in ? str_replace( ',', '',$request->cash_in) : 0,
                    'cash_out'         => $request->cash_out ? str_replace( ',', '',$request->cash_out) : 0,
                    'amount'           => $request->cash_in_hand ? str_replace( ',', '',$request->cash_in_hand) : 0,
                    'date'             => date('Y-m-d'),
                    'thousands'        => $request->thousands ? $request->thousands : 0,
                    'five_hundred'     => $request->five_hundred ? $request->five_hundred : 0,
                    'two_hundred'      => $request->two_hundred ? $request->two_hundred : 0,
                    'hundred'          => $request->hundred ? $request->hundred : 0,
                    'fifty'            => $request->fifty ? $request->fifty : 0,
                    'twenty'           => $request->twenty ? $request->twenty : 0,
                    'ten'              => $request->ten ? $request->ten : 0,
                    'five'             => $request->five ? $request->five : 0,
                    'two'              => $request->two ? $request->two : 0,
                    'one'              => $request->one ? $request->one : 0,
                    'created_by'       => auth()->user()->name,
                ];
                $result = DailyClosing::create($data);
                $output = $this->store_message($result, null);
            }
            return response()->json($output);
        }
    }

    public function report()
    {
        if(permission('closing-report-access')){
            $setTitle = __('file.Report');
            $setSubTitle = __('file.Closing Account');
            $this->setPageData($setSubTitle,$setSubTitle,'fas fa-file-signature',[['name' => $setTitle,'link'=>'javascript::void();'],['name' => $setSubTitle]]);
            return view('report::closing-report.report');
        }else{
            return $this->access_blocked();
        }
    }

    public function get_datatable_data(Request $request)
    {
        if($request->ajax()){
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
                $row[] = date(config('settings.date_format',strtotime($value->date)));
                $row[] = $value->cash_in ? number_format($value->cash_in,2, '.', ',') :  number_format(0,2, '.', ',');
                $row[] = $value->cash_out ? number_format($value->cash_out,2, '.', ',') :  number_format(0,2, '.', ',');
                $row[] = number_format(($value->cash_in_hand),2, '.', ',');
                $data[] = $row;
            }
            return $this->datatable_draw($request->input('draw'),$this->model->count_all(),
            $this->model->count_filtered(), $data);

        }else{
            return response()->json($this->unauthorized());
        }
    }
}
