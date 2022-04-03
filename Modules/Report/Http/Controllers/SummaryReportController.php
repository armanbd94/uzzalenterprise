<?php

namespace Modules\Report\Http\Controllers;

use App\Models\Warehouse;
use Illuminate\Http\Request;
use Modules\Sale\Entities\Sale;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\App;
use Modules\Customer\Entities\Customer;
use Modules\Purchase\Entities\Purchase;
use Modules\Supplier\Entities\Supplier;
use App\Http\Controllers\BaseController;
use Modules\Transport\Entities\Transport;
use Modules\Report\Entities\SummaryReport;
use Modules\Maintenance\Entities\MaintenanceService;
use Modules\Maintenance\Entities\MaintenancePurchase;

class SummaryReportController extends BaseController
{

    public function index()
    {
        if(permission('summary-report-access')){
            $setTitle = __('file.Report');
            $setSubTitle = __('file.Summary Report');
            $this->setPageData($setSubTitle,$setSubTitle,'fas fa-file-signature',[['name' => $setTitle,'link'=>'javascript::void();'],['name' => $setSubTitle]]);
            return view('report::summary-report.index');
        }else{
            return $this->access_blocked();
        }
    }

    public function report_data(Request $request)
    {
        $start_date  = $request->start_date;
        $end_date    = $request->end_date;

        $purchase = DB::table('purchases')
        ->whereBetween('purchase_date',[$start_date,$end_date])
        ->selectRaw('sum(grand_total) as total_purchase_amount,sum(total_qty) as total_purchase_qty')
        ->first();

        $sale = DB::table('sales')
        ->whereBetween('sale_date',[$start_date,$end_date])
        ->selectRaw('sum(grand_total) as total_sale_amount,sum(total_qty) as total_sale_qty')
        ->first();

        $total_supplier = Supplier::toBase()->get()->count();
        $total_customer = Customer::toBase()->get()->count();

        $supplier_transaction = DB::table('transactions as t')
                                ->join('chart_of_accounts as coa','t.chart_of_account_id','=','coa.id')
                                ->select(DB::raw("(SUM(t.debit) - SUM(t.credit)) as due"))
                                ->whereNotNull('coa.supplier_id')
                                ->where('t.voucher_date','<=',$end_date)
                                ->first();

        $customer_transaction = DB::table('transactions as t')
                            ->join('chart_of_accounts as coa','t.chart_of_account_id','=','coa.id')
                            ->select(DB::raw("(SUM(t.debit) - SUM(t.credit)) as due"))
                            ->whereNotNull('coa.customer_id')
                            ->where('t.voucher_date','<=',$end_date)
                            ->first();

        // dd($purchase,$sale,$total_supplier,$total_customer,$supplier_transaction,$customer_transaction);

        $table = '';
        $table .= '<table style="margin-bottom:10px !important;">
                    <tr>
                        <td class="text-center">
                            <h3 class="name m-0" style="text-transform: uppercase;"><b>'.(config('settings.title') ? config('settings.title') : env('APP_NAME')).'</b></h3>
                            <p style="font-weight: normal;font-weight:bold;    margin: 10px auto 5px auto;
                            font-weight: bold;background: black;border-radius: 10px;width: 250px;color: white;text-align: center;padding:5px 0;}">'.__('file.Summary Report').'</p>
                            <p style="font-weight: normal;margin:0;font-weight:bold;">'.__('file.Date').': '.translate(date('d-m-Y',strtotime($start_date)),App::getLocale()).' '.__('file.to').' '.translate(date('d-m-Y',strtotime($end_date)),App::getLocale()).'</p>
                            
                        </td>
                    </tr>
                </table>';

        $table .= "<div style='width:100%;'>
                    <table  id='product_table' style='float:left;width:48%;'>
                        <tbody>
                            <tr><td colspan='3' style='text-align:center;'><h3>".__('file.Purchase Details')."<b></b></h3></td></tr>
                            <tr  style='background: black;color: white;'>
                                <td style='text-align:center;'><b>".__('file.SL')."</b></td>
                                <td style='text-align:left;'><b>".__('file.Details')."</b></td>
                                <td style='text-align:center;'><b>".__('file.Total')."</b></td>
                            </tr>
                            <tr>
                                <td style='text-align:center;'><b>".translate((1),App::getLocale())."</b></td>
                                <td style='text-align:left;'><b>".__('file.Total Supplier')."</b></td>
                                <td style='text-align:right;'><b>".translate($total_supplier,App::getLocale())."</b></td>
                            </tr>
                            <tr>
                                <td style='text-align:center;'><b>".translate((2),App::getLocale())."</b></td>
                                <td style='text-align:left;'><b>".__('file.Total Purchase Qty')."</b></td>
                                <td style='text-align:right;'><b>".translate(($purchase->total_purchase_qty ?? 0),App::getLocale())."</b></td>
                            </tr>
                            <tr>
                                <td style='text-align:center;'><b>".translate((3),App::getLocale())."</b></td>
                                <td style='text-align:left;'><b>".__('file.Total Purchase')."</b></td>
                                <td style='text-align:right;'><b>".translate(number_format(($purchase->total_purchase_amount ?? 0),2,'.',','),App::getLocale())."</b></td>
                            </tr>
                            <tr>
                                <td style='text-align:center;'><b>".translate((4),App::getLocale())."</b></td>
                                <td style='text-align:left;'><b>".__('file.Total Supplier Due')."</b></td>
                                <td style='text-align:right;'><b>".translate(number_format(($supplier_transaction->due ? str_replace('-','',$supplier_transaction->due) : 0),2,'.',','),App::getLocale())."</b></td>
                            </tr>
                        </tbody>
                    </table>
                    <table  id='product_table' style='float:right;width:48%;'>
                        <tbody>
                            <tr><td colspan='3' style='text-align:center;'><h3>".__('file.Sale Details')."<b></b></h3></td></tr>
                            <tr  style='background: black;color: white;'>
                                <td style='text-align:center;'><b>".__('file.SL')."</b></td>
                                <td style='text-align:left;'><b>".__('file.Details')."</b></td>
                                <td style='text-align:center;'><b>".__('file.Total')."</b></td>
                            </tr>
                            <tr>
                                <td style='text-align:center;'><b>".translate((1),App::getLocale())."</b></td>
                                <td style='text-align:left;'><b>".__('file.Total Customer')."</b></td>
                                <td style='text-align:right;'><b>".translate($total_customer,App::getLocale())."</b></td>
                            </tr>
                            <tr>
                                <td style='text-align:center;'><b>".translate((2),App::getLocale())."</b></td>
                                <td style='text-align:left;'><b>".__('file.Total Sale Qty')."</b></td>
                                <td style='text-align:right;'><b>".translate(($sale->total_sale_qty ?? 0),App::getLocale())."</b></td>
                            </tr>
                            <tr>
                                <td style='text-align:center;'><b>".translate((3),App::getLocale())."</b></td>
                                <td style='text-align:left;'><b>".__('file.Total Sale')."</b></td>
                                <td style='text-align:right;'><b>".translate(number_format(($sale->total_sale_amount ?? 0),2,'.',','),App::getLocale())."</b></td>
                            </tr>
                            <tr>
                                <td style='text-align:center;'><b>".translate((4),App::getLocale())."</b></td>
                                <td style='text-align:left;'><b>".__('file.Total Customer Due')."</b></td>
                                <td style='text-align:right;'><b>".translate(number_format(($customer_transaction->due ? str_replace('-','',$customer_transaction->due) : 0),2,'.',','),App::getLocale())."</b></td>
                            </tr>
                        </tbody>
                    </table>
                    </div>
                    ";

        return $table;

    }

}
