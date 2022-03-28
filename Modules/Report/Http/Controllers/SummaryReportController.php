<?php

namespace Modules\Report\Http\Controllers;

use App\Models\Warehouse;
use Illuminate\Http\Request;
use App\Http\Controllers\BaseController;
use Modules\Maintenance\Entities\MaintenancePurchase;
use Modules\Maintenance\Entities\MaintenanceService;
use Modules\Purchase\Entities\Purchase;
use Modules\Report\Entities\SummaryReport;
use Modules\Sale\Entities\Sale;
use Modules\Transport\Entities\Transport;

class SummaryReportController extends BaseController
{
    public function __construct(SummaryReport $model)
    {
        $this->model = $model;
    }

    public function index()
    {
        if(permission('summary-report-access')){
            $setTitle = __('file.Report');
            $setSubTitle = __('file.Today Summary Report');
            $this->setPageData($setSubTitle,$setSubTitle,'fas fa-file-signature',[['name' => $setTitle,'link'=>'javascript::void();'],['name' => $setSubTitle]]);
            $data = [
                'sales' => Sale::with('customer:id,name,mobile')
                            ->where([['sale_date', date('Y-m-d')],['status',1]])->get(),
                'purchases' => Purchase::with('supplier:id,name,mobile')
                                    ->where([['purchase_date', date('Y-m-d')],['status',1]])
                                    ->get(),
                'machine_purchases' => MaintenancePurchase::with('supplier:id,name,mobile')
                                    ->where([['purchase_date', date('Y-m-d')],['status',1]])
                                    ->get(),
                'maintenance_services' => MaintenanceService::toBase()
                                    ->where([['service_date', date('Y-m-d')],['status',1]])
                                    ->get(),
                'transport_services' => Transport::toBase()->whereDate('created_at',date('Y-m-d'))->get(),
            ];
            return view('report::summary-report.index',$data);
        }else{
            return $this->access_blocked();
        }
    }

}
