<?php

namespace Modules\Report\Http\Controllers;

use Illuminate\Http\Request;
use Modules\Sale\Entities\Sale;
use Illuminate\Support\Facades\DB;
use Modules\Purchase\Entities\Purchase;
use App\Http\Controllers\BaseController;
use Modules\OthersLaborBill\Entities\OtherLaborBill;
use Modules\Production\Entities\Production;
use Modules\Setting\Entities\LaborBillRate;

class LaborReportController extends BaseController
{
    public function index()
    {
        if(permission('labor-bill-report-access')){
            $setTitle = __('file.Report');
            $setSubTitle = __('file.Daily Labor Report');
            $this->setPageData($setSubTitle,$setSubTitle,'fas fa-file-signature',[['name' => $setTitle,'link'=>'javascript::void();'],['name' => $setSubTitle]]);
            $date = date('Y-m-d');
            $labor_bills = [];
            $total_bill = [];
            $sales = Sale::with('labor_bill_rates')->where([['status',1],['sale_date',$date]])->get();
            if($sales){
                foreach ($sales as $key => $sale) {
                    if(!$sale->labor_bill_rates->isEmpty())
                    {
                        foreach ($sale->labor_bill_rates as $key => $value) {
                            $labor_bills[] = [
                                'bill_name' => DB::table('labor_bills')->where('id',$value->pivot->labor_bill_id)->value('name'),
                                'bag_size' => $value->unit->unit_name,
                                'rate' => number_format($value->pivot->rate,2),
                                'qty' => $value->pivot->qty,
                                'total' => number_format($value->pivot->total,2),
                            ];
                            array_push($total_bill,$value->pivot->total);
                        }
                    }
                }
            }
            $others_labor_bill = OtherLaborBill::with('labor_bill_rates')->where([['status',1],['voucher_date',$date]])->get();
            if($others_labor_bill){
                foreach ($others_labor_bill as $key => $sale) {
                    if(!$sale->labor_bill_rates->isEmpty())
                    {
                        foreach ($sale->labor_bill_rates as $key => $value) {
                            $labor_bills[] = [
                                'bill_name' => DB::table('labor_bills')->where('id',$value->pivot->labor_bill_id)->value('name'),
                                'bag_size' => $value->unit->unit_name,
                                'rate' => number_format($value->pivot->rate,2),
                                'qty' => $value->pivot->qty,
                                'total' => number_format($value->pivot->total,2),
                            ];
                            array_push($total_bill,$value->pivot->total);
                        }
                    }
                }
            }
            $purchases = Purchase::with('labor_bill_rates')->where([['status',1],['purchase_date',$date]])->get();
            if($purchases){
                foreach ($purchases as $key => $purchase) {
                    if(!$purchase->labor_bill_rates->isEmpty())
                    {
                        foreach ($purchase->labor_bill_rates as $key => $value) {
                            $labor_bills[] = [
                                'bill_name' => DB::table('labor_bills')->where('id',$value->pivot->labor_bill_id)->value('name'),
                                'bag_size' => $value->unit->unit_name,
                                'rate' => number_format($value->pivot->rate,2),
                                'qty' => $value->pivot->qty,
                                'total' => number_format($value->pivot->total,2),
                            ];
                            array_push($total_bill,$value->pivot->total);
                        }
                    }
                }
            }
            $productions = Production::with('labor_bill_rates','bag_costs')->where([['status',1],['start_date',$date]])->get();
            if($productions){
                foreach ($productions as $key => $production) {
                    if(!$production->labor_bill_rates->isEmpty())
                    {
                        foreach ($production->labor_bill_rates as $key => $value) {
                            $labor_bills[] = [
                                'bill_name' => DB::table('labor_bills')->where('id',$value->pivot->labor_bill_id)->value('name'),
                                'bag_size' => $value->unit->unit_name,
                                'rate' => number_format($value->pivot->rate,2),
                                'qty' => $value->pivot->qty,
                                'total' => number_format($value->pivot->total,2),
                            ];
                            array_push($total_bill,$value->pivot->total);
                        }
                    }
                    if(!$production->bag_costs->isEmpty())
                    {
                        foreach ($production->bag_costs as $key => $value) {
                            if(!empty($value->pivot->labor_bill_rate_id)){
                                $bill_data = LaborBillRate::with('labor_bill','unit')->find($value->pivot->labor_bill_rate_id);
                                if($bill_data)
                                {
                                    $labor_bills[] = [
                                        'bill_name' => $bill_data->labor_bill->name,
                                        'bag_size' => $bill_data->unit->unit_name,
                                        'rate' => number_format($value->pivot->labor_bill_rate,2),
                                        'qty' => $value->pivot->weight,
                                        'total' => number_format(($value->pivot->labor_bill_rate * $value->pivot->weight),2),
                                    ];
                                    array_push($total_bill,($value->pivot->labor_bill_rate * $value->pivot->weight));
                                }
                            }
                        }
                    }
                }
            }
            $total_amount = count($total_bill) > 0 ? number_format(array_sum($total_bill),2) : 0.00;
            return view('report::labor-report.index',compact('labor_bills','total_amount'));
        }else{
            return $this->access_blocked();
        }
    }

}
