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
                            <p style="font-weight: normal;margin:0;font-weight:bold;">Date: '.translate(date('d-m-Y',strtotime($start_date)),App::getLocale()).' to '.translate(date('d-m-Y',strtotime($end_date)),App::getLocale()).'</p>
                        </td>
                    </tr>
                </table>';
        $table .= "<table  id='product_table'>";
        $table_head = "<tr  style='background: black;color: white;'>
                            <td style='text-align:center;width:100px;'><b>".__('file.SL')."</b></td>
                            <td><b>".__('file.Product Name')."</b></td>
                            <td><b>".__('file.Purchased Amount')."</b></td>
                            <td><b>".__('file.Purchased Qty')."</b></td>
                            <td><b>".__('file.Sold Amount')."</b></td>
                            <td><b>".__('file.Sold Qty')."</b></td>
                            <td><b>".__('file.Profit Amount')."</b></td>
                            <td><b>".__('file.Available Stock')."</b></td>
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
            $total_purchase_amount = $total_purchase_qty = $total_sales_amount = $total_sales_qty = 0;
            foreach ($products as $key => $product) {
                    $total_purchase_amount = 
                    $total_purchase_qty = 
                    $total_sales_amount = 
                    $total_sales_qty = 0;
                    $table .= "<tr>
                                <td style='text-align:center;>".translate(($key+1),App::getLocale())."</td>
                                <td>$product->name</td>
                                <td style='text-align:right;'>".number_format($customer->balance,2,'.',',')."</td>
                            </tr>";
                
                
            }

            
        }else{
            $table .= "<tr>
                <td colspan='8' style='color:red;text-align:center;'>No Data Found</td>
                </tr>";
        }
        return $table;

    }
}
