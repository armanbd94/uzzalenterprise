<?php
namespace Modules\Report\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\App;
use App\Http\Controllers\BaseController;

class PaymentReportController extends BaseController
{
    public function index()
    {
        if(permission('payment-report-access')){
            $title = __('file.Payment Report');
            $this->setPageData($title,$title,'fas fa-file',[['name' => $title]]);
            return view('report::payment-report');
        }else{
            return $this->access_blocked();
        }
    }

    public function report_data(Request $request)
    {

        $start_date  = $request->start_date;
        $end_date    = $request->end_date;
        $type = $request->type;
        
    
        $table = '';
        $table .= '<table style="margin-bottom:10px !important;">
                    <tr>
                        <td class="text-center">
                            <h3 class="name m-0" style="text-transform: uppercase;"><b>'.(config('settings.title') ? config('settings.title') : env('APP_NAME')).'</b></h3>
                            <p style="font-weight: normal;font-weight:bold;    margin: 10px auto 5px auto;
                            font-weight: bold;background: black;border-radius: 10px;width: 250px;color: white;text-align: center;padding:5px 0;}">'.__('file.Payment Report').'</p>
                            <p style="font-weight: normal;margin:0;font-weight:bold;">'.__('file.Date').': '.translate(date('d-m-Y',strtotime($start_date)),App::getLocale()).' '.__('file.to').' '.translate(date('d-m-Y',strtotime($end_date)),App::getLocale()).'</p>
                            
                        </td>
                    </tr>
                </table>';

        $table .= "<table  id='product_table'><tbody>";
        $table .= "<tr  style='background: black;color: white;'>
                            <td style='text-align:center;'><b>".__('file.SL')."</b></td>
                            <td style='text-align:center;'><b>".__('file.Date')."</b></td>
                            <td style='text-align:center;'><b>".__('file.Voucher Type')."</b></td>
                            <td style='text-align:left;'><b>".__('file.Voucher No.')."</b></td>
                            <td style='text-align:center;'><b>".__('file.Customer')."</b></td>
                            <td style='text-align:center;'><b>".__('file.Supplier')."</b></td>
                            <td style='text-align:center;'><b>".__('file.Account Head')."</b></td>
                            <td style='text-align:right;'><b>".__('file.Paid Amount')."</b></td>
                            <td style='text-align:center;'><b>".__('file.Created By')."</b></td>
                        </tr>";

        
        $accounts = DB::table('chart_of_accounts as coa');
        
        if($type == 1)
        {
            $accounts->leftJoin('customers as c','coa.customer_id','=','c.id')->whereNotNull('customer_id');
        }elseif ($type == 2) {
            $accounts->leftJoin('suppliers as s','coa.supplier_id','=','s.id')->whereNotNull('supplier_id');
        }else{
            $accounts->leftJoin('customers as c','coa.customer_id','=','c.id')
            ->leftJoin('suppliers as s','coa.supplier_id','=','s.id')
            ->whereNotNull('customer_id')
            ->orWhereNotNull('supplier_id');
        }
        
        $accounts = $accounts->select('coa.*')->get();
        $account_list = [];
        if(!$accounts->isEmpty())
        {
            foreach ($accounts as $account) {
                $account_list[] = $account->id;
            }
        }

        $transactions = DB::table('transactions as t')
        ->join('chart_of_accounts as coa','t.chart_of_account_id','=','coa.id')
        ->whereBetween('t.voucher_date',[$start_date,$end_date])
        ->whereIn('t.chart_of_account_id',$account_list)
        ->whereIn('t.voucher_type',['Invoice','Purchase','Advance','CR','PM'])
        ->selectRaw('t.id,t.voucher_no,t.voucher_date,t.voucher_type,t.debit,t.credit,t.chart_of_account_id,coa.name,coa.parent_name,t.created_by')
        ->orderBy('t.voucher_date','desc')
        ->orderBy('t.id','desc')
        ->get();
        // dd($transactions);
        if(!$transactions->isEmpty())
        {
            $i = 1;
            $total_amount   = 0;
            foreach ($transactions as $transaction) {
                $payment =  $supplier_name = $customer_name = '';
                if($transaction->voucher_type == 'Invoice')
                {
                    if($transaction->credit > 0)
                    {
                        $payment = DB::table('transactions as t')
                            ->join('chart_of_accounts as coa','t.chart_of_account_id','=','coa.id')
                            ->where([['t.voucher_no',$transaction->voucher_no],['t.chart_of_account_id','<>',$transaction->chart_of_account_id],['t.debit','>',0]])
                            ->selectRaw('t.id,t.debit,t.credit,coa.name,coa.parent_name,t.created_by')
                            ->first();
                        $customer_name = $transaction->name;
                    }
                }elseif($transaction->voucher_type == 'Purchase')
                {
                    if($transaction->debit > 0)
                    {
                        $payment = DB::table('transactions as t')
                        ->join('chart_of_accounts as coa','t.chart_of_account_id','=','coa.id')
                        ->where([['t.voucher_no',$transaction->voucher_no],['t.chart_of_account_id','<>',$transaction->chart_of_account_id],['t.credit','>',0]])
                        ->selectRaw('t.id,t.debit,t.credit,coa.name,coa.parent_name,t.created_by')
                        ->first();
                        $supplier_name = $transaction->name;
                    }
                }else{
                    
                    $payment = DB::table('transactions as t')
                            ->join('chart_of_accounts as coa','t.chart_of_account_id','=','coa.id')
                            ->where([['t.voucher_no',$transaction->voucher_no],['t.chart_of_account_id','<>',$transaction->chart_of_account_id]]);  
                    if($transaction->parent_name == 'Account Payable')
                    {
                        $payment->where('t.credit','>',0);
                        $supplier_name = $transaction->name;
                    }elseif ($transaction->parent_name == 'Customer Receivable') {
                        $payment->where('t.debit','>',0);
                        $customer_name = $transaction->name;
                    }
                    $payment = $payment->selectRaw('t.id,t.debit,t.credit,coa.name,coa.parent_name,t.created_by')->first();
    
                    
                }
                if($payment)
                {
                    $total_amount += $payment->debit ? $payment->debit : $payment->credit;
                    $table .= "<tr>
                    <td style='text-align:center;'>".translate($i++,App::getLocale())."</td>
                    <td style='text-align:center;'>".translate((date('d-m-Y',strtotime($transaction->voucher_date))),App::getLocale())."</td>
                    <td style='text-align:center;'>$transaction->voucher_type</td>
                    <td>$transaction->voucher_no</td>
                    <td>$customer_name</td>
                    <td>$supplier_name</td>
                    <td>$payment->name</td>
                    <td style='text-align:right;'>".translate(number_format($payment->debit ? $payment->debit : $payment->credit,2,'.',','),App::getLocale())."</td>  
                    <td style='text-align:center;'>$payment->created_by</td>
                    </tr>";
                }
                
            }

            if($total_amount > 0)
            {
                $table .= "<tr>
                <td colspan='7'>".__('file.Total')."</td>
                <td style='text-align:right;'>".translate(number_format($total_amount,2,'.',','),App::getLocale())."</td>  
                <td></td>
                </tr>";
            }else{
                $table .= "<tr><td colspan='9' style='color:red;'>No Data Found</td></tr>";
            }
        }

        $table .= "</tbody></table>";
        return $table;

    }
}
