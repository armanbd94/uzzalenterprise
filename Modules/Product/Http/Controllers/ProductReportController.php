<?php

namespace Modules\Product\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\App;
use App\Http\Controllers\BaseController;

class ProductReportController extends BaseController
{
    public function index()
    {
        if(permission('product-report-access')){
            $title = __('file.Product Report');
            $this->setPageData($title,$title,'fas fa-file',[['name' => $title]]);
            return view('product::report');
        }else{
            return $this->access_blocked();
        }
    }

    public function report_data(Request $request)
    {

        $start_date = $request->start_date;
        $end_date   = $request->end_date;

        $table = '';
        $table .= '<table style="margin-bottom:10px !important;">
                    <tr>
                        <td class="text-center">
                            <h3 class="name m-0" style="text-transform: uppercase;"><b>'.(config('settings.title') ? config('settings.title') : env('APP_NAME')).'</b></h3>
                            <p style="font-weight: normal;font-weight:bold;    margin: 10px auto 5px auto;
                            font-weight: bold;background: black;border-radius: 10px;width: 250px;color: white;text-align: center;padding:5px 0;}">'.__('file.Product Report').'</p>
                            <p style="font-weight: normal;margin:0;font-weight:bold;">'.__('file.Date').': '.translate(date('d-m-Y',strtotime($start_date)),App::getLocale()).' '.__('file.to').' '.translate(date('d-m-Y',strtotime($end_date)),App::getLocale()).'</p>
                        </td>
                    </tr>
                </table>';
        $table .= "<table  id='product_table'><tbody>";
        $table_head = "<tr  style='background: black;color: white;'>
                            <td style='text-align:center;'><b>".__('file.SL')."</b></td>
                            <td style='text-align:left;'><b>".__('file.Product Name')."</b></td>
                            <td style='text-align:center;'><b>".__('file.Purchased Amount')."</b></td>
                            <td style='text-align:center;'><b>".__('file.Purchased Qty')."</b></td>
                            <td style='text-align:center;'><b>".__('file.Sold Amount')."</b></td>
                            <td style='text-align:center;'><b>".__('file.Sold Qty')."</b></td>
                            <td style='text-align:center;'><b>".__('file.Profit Amount')."</b></td>
                            <td style='text-align:center;'><b>".__('file.Current Stock')."</b></td>
                        </tr>";
        $table .= $table_head;
   

        $products = DB::table('products as pro')
            ->selectRaw("pro.id,pro.name,pro.code,
            (SELECT SUM(pp.total) FROM purchase_products AS pp INNER JOIN purchases ON pp.purchase_id = purchases.id WHERE 
            pp.product_id = pro.id AND purchases.purchase_date BETWEEN '$start_date' and '$end_date') as total_purchase_amount,
            (SELECT SUM(pp.qty) FROM purchase_products AS pp INNER JOIN purchases ON pp.purchase_id = purchases.id WHERE 
            pp.product_id = pro.id AND purchases.purchase_date BETWEEN '$start_date' and '$end_date') as total_purchase_qty,

            (SELECT SUM(sp.total) FROM sale_products AS sp INNER JOIN sales ON sp.sale_id = sales.id WHERE 
            sp.product_id = pro.id AND sales.sale_date BETWEEN '$start_date' and '$end_date') as total_sales_amount,
            (SELECT SUM(sp.qty) FROM sale_products AS sp INNER JOIN sales ON sp.sale_id = sales.id WHERE 
            sp.product_id = pro.id AND sales.sale_date BETWEEN '$start_date' and '$end_date') as total_sales_qty
  
            ")
            ->orderBy('pro.id','asc')
            ->get();

        if(!$products->isEmpty())
        {
            $total_purchase_amount = $total_purchase_qty = $total_sales_amount = $total_sales_qty = $total_profit = $total_available_qty = 0;
            foreach ($products as $key => $product) {

                    $purchase_amount = $product->total_purchase_amount ?? 0;
                    $purchase_qty    = $product->total_purchase_qty ?? 0;
                    $sales_amount    = $product->total_sales_amount ?? 0;
                    $sales_qty       = $product->total_sales_qty ?? 0;
                    if($purchase_qty > 0){
                        $profit = $sales_amount - (($purchase_amount / $purchase_qty) * $sales_qty);
                    }else{
                        $profit = $sales_amount;
                    }
                    if($purchase_qty > $sales_qty)
                    {
                        $available_qty = $purchase_qty - $sales_qty;
                    }else{
                        $available_qty = 0;
                    }
                    

                    $total_purchase_amount += $purchase_amount;
                    $total_purchase_qty    += $purchase_qty;
                    $total_sales_amount    += $sales_amount;
                    $total_sales_qty       += $sales_qty;
                    $total_profit          += $profit;
                    $total_available_qty   += $available_qty;
                    $table .= "<tr>
                                <td style='text-align:center;'>".translate(($key+1),App::getLocale())."</td>
                                <td>$product->name</td>
                                <td style='text-align:right;'>".translate(number_format($purchase_amount,2,'.',','),App::getLocale())."</td>
                                <td style='text-align:center;'>".translate(number_format($purchase_qty,2,'.',','),App::getLocale())."</td>
                                <td style='text-align:right;'>".translate(number_format($sales_amount,2,'.',','),App::getLocale())."</td>
                                <td style='text-align:center;'>".translate(number_format($sales_qty,2,'.',','),App::getLocale())."</td>
                                <td style='text-align:right;'>".translate(number_format($profit,2,'.',','),App::getLocale())."</td>
                                <td style='text-align:center;'>".translate(number_format($available_qty,2,'.',','),App::getLocale())."</td>
                            </tr>";
                
            }
            $table .= "<tr>
                            <td colspan='2'><b>".__('file.Total')."</b></td>
                            <td style='text-align:right;'><b>".translate(number_format($total_purchase_amount,2,'.',','),App::getLocale())."</b></td>
                            <td style='text-align:center;'><b>".translate(number_format($total_purchase_qty,2,'.',','),App::getLocale())."</b></td>
                            <td style='text-align:right;'><b>".translate(number_format($total_sales_amount,2,'.',','),App::getLocale())."</b></td>
                            <td style='text-align:center;'><b>".translate(number_format($total_sales_qty,2,'.',','),App::getLocale())."</b></td>
                            <td style='text-align:right;'><b>".translate(number_format($total_profit,2,'.',','),App::getLocale())."</b></td>
                            <td style='text-align:center;'><b>".translate(number_format($total_available_qty,2,'.',','),App::getLocale())."</b></td>
                        </tr>";

            
        }else{
            $table .= "<tr>
                <td colspan='8' style='color:red;text-align:center;'>No Data Found</td>
                </tr>";
        }
        $table .= "</tbody></table>";
        return $table;

    }
}
