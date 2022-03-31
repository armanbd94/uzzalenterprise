<?php

namespace Modules\Report\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\App;
use Modules\Customer\Entities\Customer;
use App\Http\Controllers\BaseController;

class DueReportController extends BaseController
{
    public function index()
    {
        if(permission('due-report-access')){
            $title = __('file.Due Report');
            $this->setPageData($title,$title,'fas fa-file',[['name' => $title]]);
            $customers = Customer::allCustomers();
            return view('report::due-report',compact('customers'));
        }else{
            return $this->access_blocked();
        }
    }

    public function report_data(Request $request)
    {

        $start_date  = $request->start_date;
        $end_date    = $request->end_date;
        $customer_id = $request->customer_id;
        
    
        $table = '';
        $table .= '<table style="margin-bottom:10px !important;">
                    <tr>
                        <td class="text-center">
                            <h3 class="name m-0" style="text-transform: uppercase;"><b>'.(config('settings.title') ? config('settings.title') : env('APP_NAME')).'</b></h3>
                            <p style="font-weight: normal;font-weight:bold;    margin: 10px auto 5px auto;
                            font-weight: bold;background: black;border-radius: 10px;width: 250px;color: white;text-align: center;padding:5px 0;}">'.__('file.Due Report').'</p>
                            <p style="font-weight: normal;margin:0;font-weight:bold;">'.__('file.Date').': '.translate(date('d-m-Y',strtotime($start_date)),App::getLocale()).' '.__('file.to').' '.translate(date('d-m-Y',strtotime($end_date)),App::getLocale()).'</p>
                            
                        </td>
                    </tr>
                </table>';

        $table .= "<table  id='product_table'><tbody>";
        $table .= "<tr  style='background: black;color: white;'>
                            <td style='text-align:center;'><b>".__('file.SL')."</b></td>
                            <td style='text-align:center;'><b>".__('file.Customer')."</b></td>
                            <td style='text-align:center;'><b>".__('file.Grand Total')."</b></td>
                            <td style='text-align:center;'><b>".__('file.Paid Amount')."</b></td>
                            <td style='text-align:center;'><b>".__('file.Advance')."</b></td>
                            <td style='text-align:center;'><b>".__('file.Due Amount')."</b></td>
                        </tr>";

        $total_debit   = 0;
        $total_credit  = 0;
        $total_advance = 0;
        $total_due     = 0;
        $customers = DB::table('customers as c')
        ->join('chart_of_accounts as coa','c.id','=','coa.customer_id')
        ->selectRaw("c.id,c.name,c.company_name,c.mobile,
        (SELECT SUM(debit) FROM transactions WHERE transactions.chart_of_account_id = coa.id AND voucher_date BETWEEN '$start_date' AND '$end_date') AS total_debit,
        (SELECT SUM(credit) FROM transactions WHERE transactions.chart_of_account_id = coa.id AND voucher_date BETWEEN '$start_date' AND '$end_date') AS total_credit,
        (SELECT SUM(credit) FROM transactions WHERE transactions.chart_of_account_id = coa.id AND voucher_type = 'Advance' AND voucher_date BETWEEN '$start_date' AND '$end_date') AS total_advance,
        ((SELECT SUM(debit) FROM transactions WHERE transactions.chart_of_account_id = coa.id AND voucher_date BETWEEN '$start_date' AND '$end_date') - 
        (SELECT SUM(credit) FROM transactions WHERE transactions.chart_of_account_id = coa.id AND voucher_date BETWEEN '$start_date' AND '$end_date')) AS total_due
        ")
        ->when($customer_id,function($q) use ($customer_id){
            $q->where('c.id',$customer_id);
        })->get();
        if(!$customers->isEmpty()) {
            foreach ($customers as $key => $customer) {
                $total_debit   += $customer->total_debit ?? 0;
                $total_credit  += $customer->total_credit ?? 0;
                $total_advance += $customer->total_advance ?? 0;
                $total_due     += $customer->total_due ?? 0;
                $table .= "<tr>
                            <td style='text-align:center;'>".translate(($key+1),App::getLocale())."</td>
                            <td>$customer->name".($customer->company_name ? "<br>".$customer->company_name : "")."<br>".translate($customer->mobile,App::getLocale())."</td>
                            <td style='text-align:right;'>".translate(number_format($customer->total_debit,2,'.',','),App::getLocale())."</td>  
                            <td style='text-align:right;'>".translate(number_format($customer->total_credit,2,'.',','),App::getLocale())."</td>  
                            <td style='text-align:right;'>".translate(number_format($customer->total_advance,2,'.',','),App::getLocale())."</td>  
                            <td style='text-align:right;'>".translate(number_format($customer->total_due,2,'.',','),App::getLocale())."</td>  
                        </tr>";
            }
            $table .= "<tr>
                            <td colspan='2'><b>".__('file.Total')."</b></td>
                            <td style='text-align:right;'><b>".translate(number_format($total_debit,2,'.',','),App::getLocale())."</b></td>  
                            <td style='text-align:right;'><b>".translate(number_format($total_credit,2,'.',','),App::getLocale())."</b></td>  
                            <td style='text-align:right;'><b>".translate(number_format($total_advance,2,'.',','),App::getLocale())."</b></td>  
                            <td style='text-align:right;'><b>".translate(number_format($total_due,2,'.',','),App::getLocale())."</b></td>  
                        </tr>";
        }else{
            $table .= "<tr>
            <td colspan='6'><b>".__('file.No Data Found')."</b></td>
            </tr>";
        }

        $table .= "</tbody></table>";
        return $table;

    }
}
