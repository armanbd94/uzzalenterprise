<?php

namespace Modules\Account\Http\Controllers\Report;

use Illuminate\Http\Request;
use App\Http\Controllers\BaseController;
use Modules\Account\Entities\Transaction;
use Modules\Account\Entities\ChartOfAccount;

class ProfitLossController extends BaseController
{
    public function __construct(Transaction $model)
    {
        $this->model = $model;
    }


    public function index()
    {
        if(permission('profit-loss-access')){
            $setTitle = __('file.Accounts');
            $setSubTitle = __('file.Report');
            $setChildTitle = __('file.Profit Loss');
            $this->setPageData($setChildTitle,$setChildTitle,'far fa-money-bill-alt',[['name'=>$setTitle,'link'=>'javascript::void(0);'],['name'=>$setSubTitle,'link'=>'javascript::void(0);'],['name'=>$setChildTitle]]);
            return view('account::report.profit-loss.index');
        }else{
            return $this->access_blocked();
        }
    }

    public function report(Request $request)
    {
        if ($request->ajax()) {
            $data = [
                'start_date'   => $request->start_date ? $request->start_date : date('Y-m-d'),
                'end_date'    => $request->end_date ? $request->end_date : date('Y-m-d'),
                'asset_accounts' => ChartOfAccount::where(['type'=>'I'])->orderBy('code','asc')->get(),
                'liability_accounts' => ChartOfAccount::where(['type'=>'E'])->orderBy('code','asc')->get(),
            ];
            // dd($data['asset_accounts']);
            return view('account::report.profit-loss.report',$data)->render();
        }
    }
}
