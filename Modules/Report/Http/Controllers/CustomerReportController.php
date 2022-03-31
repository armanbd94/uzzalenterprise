<?php

namespace Modules\Report\Http\Controllers;

use Illuminate\Http\Request;
use Modules\Sale\Entities\Sale;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\App;
use Modules\Customer\Entities\Customer;
use App\Http\Controllers\BaseController;

class CustomerReportController extends BaseController
{
    public function index()
    {
        if(permission('customer-report-access')){
            $title = __('file.Customer Report');
            $this->setPageData($title,$title,'fas fa-file',[['name' => $title]]);
            $customers = Customer::allCustomers();
            return view('report::customer-report',compact('customers'));
        }else{
            return $this->access_blocked();
        }
    }

    public function report_data(Request $request)
    {

        $start_date  = $request->start_date;
        $end_date    = $request->end_date;
        $customer = Customer::with('coa')->find($request->customer_id);

        $table = '';
        $table .= '<table style="margin-bottom:10px !important;">
                    <tr>
                        <td class="text-center">
                            <h3 class="name m-0" style="text-transform: uppercase;"><b>'.(config('settings.title') ? config('settings.title') : env('APP_NAME')).'</b></h3>
                            <p style="font-weight: normal;font-weight:bold;    margin: 10px auto 5px auto;
                            font-weight: bold;background: black;border-radius: 10px;width: 250px;color: white;text-align: center;padding:5px 0;}">'.__('file.Customer Report').'</p>
                            <p style="font-weight: normal;margin:0;font-weight:bold;">'.__('file.Date').': '.translate(date('d-m-Y',strtotime($start_date)),App::getLocale()).' '.__('file.to').' '.translate(date('d-m-Y',strtotime($end_date)),App::getLocale()).'</p>
                            
                        </td>
                    </tr>
                </table>';
        
   

        $sales = Sale::with('hasManyProducts','warehouse')->where('customer_id', $customer->id)
        ->whereBetween('sale_date', [$start_date,$end_date])
        ->orderBy('sale_date','asc')
        ->orderBy('id','asc')
        ->get();

        $pre_balance_data = DB::table('transactions')
                            ->selectRaw('sum(debit) as predebit, sum(credit) as precredit')
                            ->where('voucher_date','<',$start_date)
                            ->where('chart_of_account_id',$customer->coa->id)
                            ->where('approve',1)
                            ->first();
        $due_balance = $pre_balance_data->predebit - $pre_balance_data->precredit;
        $transactions = DB::table('transactions')
                            ->whereBetween('voucher_date',[$start_date,$end_date])
                            ->where('chart_of_account_id',$customer->coa->id)
                            ->where([['approve',1],['credit','>',0]])
                            ->get();
        $table .= '<table class="table table-borderless" style="width:100%;margin-top:20px;">
                    <tr style="background: black;color: white;">
                        <td><b>'.$customer->name.'</b></td>
                        <td class="text-right">'.__('file.Previous Due').': '.translate(number_format($due_balance,2,'.',','),App::getLocale()).'</td>
                    </tr>
                </table>';
        $table .= "<table  id='product_table'><tbody>";
        $table .= "<tr  style='background: black;color: white;'>
                            <td style='text-align:center;'><b>".__('file.SL')."</b></td>
                            <td style='text-align:center;'><b>".__('file.Date')."</b></td>
                            <td style='text-align:center;'><b>".__('file.Vehicle No.')."</b></td>
                            <td style='text-align:center;'><b>".__('file.Warehouse')."</b></td>
                            <td style='text-align:center;'><b>".__('file.Product')."</b></td>
                            <td style='text-align:center;'><b>".__('file.Quantity')."</b></td>
                            <td style='text-align:center;'><b>".__('file.Price')."</b></td>
                            <td style='text-align:center;'><b>".__('file.Challan No')."</b></td>
                            <td style='text-align:center;'><b>".__('file.Total')."</b></td>
                            <td style='text-align:center;'><b>".__('file.Grand Total')."</b></td>
                            <td style='text-align:center;'><b>".__('file.Paid Amount')."</b></td>
                        </tr>";
        $total_vehicle = 0;
        $total_qty = 0;
        $total_debit = 0;
        $total_credit = 0;
        if(!$sales->isEmpty())
        {
            foreach ($sales as $key => $sale) {

                $total_debit += $sale->grand_total;
                $due_balance += $sale->grand_total;
                $vehicle_col = '<td>';
                $product_col = '<td>';
                $qty_col     = '<td>';
                $price_col   = '<td>';
                $challan_col = '<td>';
                $total_col   = '<td>';

                $table .= "<tr>
                            <td style='text-align:center;'>".translate(($key+1),App::getLocale())."</td>
                            <td>".translate((date('d-m-Y',strtotime($sale->sale_date))),App::getLocale())."</td>";
                            if(!$sale->hasManyProducts->isEmpty())
                            {
                                $vehicle_col .= '<ul>';
                                $product_col .= '<ul>';
                                $qty_col     .= '<ul>';
                                $price_col   .= '<ul>';
                                $challan_col .= '<ul>';
                                $total_col   .= '<ul>';
                                foreach ($sale->hasManyProducts as $item) {
                                    $total_vehicle += $item->vehicle_no ? 1 : 0;
                                    $total_qty += $item->qty ?? 0;
                                    $vehicle_col .= "<li>".($item->vehicle_no ?? '')."</li>";
                                    $product_col .= "<li>".$item->product->name."</li>";
                                    $qty_col     .= "<li class='text-center'>".translate(($item->qty ?? 0),App::getLocale())." (".$item->product->unit->unit_name.")</li>";
                                    $price_col   .= "<li class='text-right'>".translate(number_format($item->price,2,'.',','),App::getLocale())."</li>";
                                    $challan_col .= "<li class='text-center'>".translate(($item->challan_no ?? ''),App::getLocale())."</li>";
                                    $total_col   .= "<li class='text-right'>".translate(number_format($item->total,2,'.',','),App::getLocale())."</li>";
                                }
                                $vehicle_col .= '</ul>';
                                $product_col .= '</ul>';
                                $qty_col     .= '</ul>';
                                $price_col   .= '</ul>';
                                $challan_col .= '</ul>';
                                $total_col   .= '</ul>';
                            }
                            $vehicle_col .= '</td>';
                            $product_col .= '</td>';
                            $qty_col     .= '</td>';
                            $price_col   .= '</td>';
                            $challan_col .= '</td>';
                            $total_col   .= '</td>';
            
                            $table .= $vehicle_col;
                            $table .= "<td>".$sale->warehouse->name."</td>";      
                            $table .= $product_col;
                            $table .= $qty_col;
                            $table .= $price_col;
                            $table .= $challan_col;
                            $table .= $total_col;
                $table .= "<td style='text-align:right;'>".translate(number_format($total_debit,2,'.',','),App::getLocale())."</td>  
                           <td></td>
                        </tr>";
            }
        }

        if(!$transactions->isEmpty())
        {
            foreach ($transactions as $key => $transaction) {
                $payment = DB::table('transactions')
                            ->leftJoin('chart_of_accounts','transactions.chart_of_account_id','=','chart_of_accounts.id')
                            ->where([
                                ['chart_of_account_id','<>',$customer->coa->id],
                                ['voucher_no',$transaction->voucher_no],
                                ['voucher_date',$transaction->voucher_date],
                                ['approve',1],
                                ['debit','>',0]
                            ])
                            ->select('transactions.debit','chart_of_accounts.name')
                            ->first();
                if($payment)
                {
                    $total_credit += $payment->debit;
                    $due_balance -= $payment->debit;
                    $table .= "<tr style='background:#a5d6a7;'>
                                <td style='text-align:center;'>".translate(($key+1),App::getLocale())."</td>
                                <td>".translate((date('d-m-Y',strtotime($transaction->voucher_date))),App::getLocale())."</td>
                                <td>$payment->name</td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td style='text-align:right;'>".translate(number_format($payment->debit,2,'.',','),App::getLocale())."</td>  
                            </tr>";
                }
                
            }
        }

            
       
        $table .= "<tr>
                    <td colspan='2'><b>".__('file.Total')."</b></td>
                    <td style='text-align:center;'><b>".translate($total_vehicle,App::getLocale())."</b></td>
                    <td></td>
                    <td></td>
                    <td style='text-align:center;'><b>".translate(number_format($total_qty,2,'.',','),App::getLocale())."</b></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td style='text-align:right;'><b>".translate(number_format($total_debit,2,'.',','),App::getLocale())."</b></td>
                    <td style='text-align:right;'><b>".translate(number_format($total_credit,2,'.',','),App::getLocale())."</b></td>
                </tr>
                <tr><td colspan='11' style='text-align:center;'><b>".__('file.Total Due').": ".translate(number_format($due_balance,2,'.',','),App::getLocale())."</b></td></tr>";
        
        $table .= "</tbody></table>";
        return $table;

    }
}
