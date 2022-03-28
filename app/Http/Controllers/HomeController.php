<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\App;
use Modules\Sale\Entities\Sale;
use Illuminate\Support\Facades\Auth;
use Modules\Purchase\Entities\Purchase;
use App\Http\Controllers\BaseController;
use Modules\Account\Entities\Transaction;
use Modules\Transport\Entities\Transport;
use Modules\Account\Entities\ChartOfAccount;
use Modules\Maintenance\Entities\MaintenanceService;
use Modules\Maintenance\Entities\MaintenancePurchase;

class HomeController extends BaseController
{
    public function index()
    {
        if (permission('dashboard-access')){
            $setTitle = __('file.Dashboard');
            $this->setPageData($setTitle,$setTitle,'fas fa-technometer');
            // $start_date = date('Y-m-d');
            // $end_date   = date('Y-m-d');
            // $sale = Sale::toBase()->whereDate('sale_date','>=',$start_date)->whereDate('sale_date','<=',$end_date)->sum('grand_total');
            // $purchase = Purchase::toBase()->whereDate('purchase_date','>=',$start_date)->whereDate('purchase_date','<=',$end_date)->sum('grand_total');
            // $machine_purchase = MaintenancePurchase::toBase()->whereDate('purchase_date','>=',$start_date)->whereDate('purchase_date','<=',$end_date)->sum('grand_total');
            // $maintenance_service = MaintenanceService::toBase()->whereDate('service_date','>=',$start_date)->whereDate('service_date','<=',$end_date)->sum('grand_total');
            // $transport_service = Transport::toBase()->whereDate('created_at','>=',$start_date)->whereDate('created_at','<=',$end_date)->sum('net_profit');
            // $expense_accounts = ChartOfAccount::where('parent_name','Expense')->get();
            // $total_expense_amount = 0;
            // if (!$expense_accounts->isEmpty()) {
            //     foreach ($expense_accounts as $value) {
            //         $expense = Transaction::toBase()->where('chart_of_account_id',$value->id)->whereDate('voucher_date','>=',$start_date)->whereDate('voucher_date','<=',$end_date)->sum('debit');
            //         $total_expense_amount += $expense;
            //     }
            // }
            //  //Yearly Report
            //  $start = strtotime(date('Y').'-01-01');
            //  $end = strtotime(date('Y').'-12-31');

            //  $yearly_sale_amount = [];
            //  $yearly_purchase_amount = [];
            //  while ($start < $end) {
            //      $start_date  = date('Y').'-'.date('m',$start).'-01';
            //      $end_date  = date('Y').'-'.date('m',$start).'-31';

            //      $sale_amount = Sale::toBase()->whereDate('created_at','>=',$start_date)
            //      ->whereDate('created_at','<=',$end_date)->sum('grand_total');

            //      $purchase_amount = Purchase::toBase()->whereDate('created_at','>=',$start_date)
            //      ->whereDate('created_at','<=',$end_date)->sum('grand_total');

            //      $yearly_sale_amount[] = number_format($sale_amount,2,'.','');
            //      $yearly_purchase_amount[] = number_format($purchase_amount,2,'.','');
            //      $start = strtotime('+1 month',$start);
            //  }
            // return view('home',compact('sale','purchase','machine_purchase','maintenance_service',
            // 'transport_service','total_expense_amount','yearly_sale_amount','yearly_purchase_amount'));
            return view('home');
        }else{
            return redirect('unauthorized')->with(['status'=>'error','message'=>'Unauthorized Access Blocked']);
        }
    }

    public function dashboard_data($start_date,$end_date)
    {
        if($start_date && $end_date)
        {
            $sale = Sale::toBase()->whereDate('sale_date','>=',$start_date)->whereDate('sale_date','<=',$end_date)->sum('grand_total');
            $purchase = Purchase::toBase()->whereDate('purchase_date','>=',$start_date)->whereDate('purchase_date','<=',$end_date)->sum('grand_total');
            $machine_purchase = MaintenancePurchase::toBase()->whereDate('purchase_date','>=',$start_date)->whereDate('purchase_date','<=',$end_date)->sum('grand_total');
            $maintenance_service = MaintenanceService::toBase()->whereDate('service_date','>=',$start_date)->whereDate('service_date','<=',$end_date)->sum('grand_total');
            $transport_service = Transport::toBase()->whereDate('created_at','>=',$start_date)->whereDate('created_at','<=',$end_date)->sum('net_profit');
            $expense_accounts = ChartOfAccount::where('parent_name','Expense')->get();
            $total_expense_amount = 0;
            if (!$expense_accounts->isEmpty()) {
                foreach ($expense_accounts as $value) {
                    $expense = Transaction::toBase()->where('chart_of_account_id',$value->id)->whereDate('voucher_date','>=',$start_date)->whereDate('voucher_date','<=',$end_date)->sum('debit');
                    $total_expense_amount += $expense;
                }
            }
            $data = [
                'sale'                => $sale,
                'purchase'            => $purchase,
                'machine_purchase'    => $machine_purchase,
                'maintenance_service' => $maintenance_service,
                'transport_service'   => $transport_service,
                'expense'             => $total_expense_amount,
            ];
            return response()->json($data);
        }

    }
    public function unauthorized()
    {
        $this->setPageData('Unauthorized','Unauthorized','fas fa-ban',[['name' => 'Unauthorized']]);
        return view('unauthorized');
    }
}
