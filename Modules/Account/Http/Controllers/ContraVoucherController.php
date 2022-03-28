<?php

namespace Modules\Account\Http\Controllers;

use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\BaseController;
use Modules\Account\Entities\Transaction;
use Modules\Account\Entities\ChartOfAccount;
use Modules\Account\Http\Requests\ContraVoucherFormRequest;

class ContraVoucherController extends BaseController
{
    private const VOUCHER_PREFIX = 'CONTRAV';
    public function __construct(Transaction $model)
    {
        $this->model = $model;
    }


    public function index()
    {
        if(permission('contra-voucher-access')){
            $setTitle = __('file.Accounts');
            $setSubTitle = __('file.Contra Voucher');
            $this->setPageData($setSubTitle,$setSubTitle,'far fa-money-bill-alt',[['name'=>$setTitle],['name'=>$setSubTitle]]);
            $data = [
                'voucher_no'             => self::VOUCHER_PREFIX.'-'.date('Ymd').rand(1,999),
                'transactional_accounts' => ChartOfAccount::where(['status'=>1,'transaction'=>1])->orderBy('id','asc')->get(),
            ];
            return view('account::contra-voucher.create',$data);
        }else{
            return $this->access_blocked();
        }
    }

    public function store(ContraVoucherFormRequest $request)
    {
        if($request->ajax()){
            if(permission('contra-voucher-access')){
                // dd($request->all());
                DB::beginTransaction();
                try {
                    $contra_voucher_transaction = [];
                    if ($request->has('contra_account')) {
                        foreach ($request->contra_account as $key => $value) {
                            //Credit Insert
                            if(!empty($value['debit_amount']) || !empty($value['credit_amount'] ))
                            {
                                $contra_voucher_transaction[] = array(
                                    'chart_of_account_id' => $value['id'],
                                    'voucher_no'          => $request->voucher_no,
                                    'voucher_type'        => self::VOUCHER_PREFIX,
                                    'voucher_date'        => $request->voucher_date,
                                    'description'         => $request->remarks,
                                    'debit'               => $value['debit_amount'] ? $value['debit_amount'] : 0,
                                    'credit'              => $value['credit_amount'] ? $value['credit_amount'] : 0,
                                    'posted'              => 1,
                                    'approve'             => 2,
                                    'created_by'          => auth()->user()->name,
                                    'created_at'          => date('Y-m-d H:i:s')
                                );
                            }
                        }
                    }

                    $result = $this->model->insert($contra_voucher_transaction);
                    $output = $this->store_message($result, null);
                    DB::commit();
                } catch (Exception $e) {
                    DB::rollBack();
                    $output = ['status' => 'error','message' => $e->getMessage()];
                }
            }else{
                $output = $this->unauthorized();
            }
            return response()->json($output);
        }else{
            return response()->json($this->unauthorized());
        }
    }

    public function update(ContraVoucherFormRequest $request)
    {
        if($request->ajax()){
            if(permission('edit-voucher')){
                DB::beginTransaction();
                try {
                    Transaction::where('voucher_no',$request->voucher_no)->delete();
                    $contra_voucher_transaction = [];
                    if ($request->has('contra_account')) {
                        foreach ($request->contra_account as $key => $value) {
                            //Credit Insert
                            if(!empty($value['debit_amount']) || !empty($value['credit_amount'] ))
                            {
                                $contra_voucher_transaction[] = array(
                                    'chart_of_account_id' => $value['id'],
                                    'voucher_no'          => $request->voucher_no,
                                    'voucher_type'        => self::VOUCHER_PREFIX,
                                    'voucher_date'        => $request->voucher_date,
                                    'description'         => $request->remarks,
                                    'debit'               => $value['debit_amount'] ? $value['debit_amount'] : 0,
                                    'credit'              => $value['credit_amount'] ? $value['credit_amount'] : 0,
                                    'posted'              => 1,
                                    'approve'             => 2,
                                    'created_by'          => auth()->user()->name,
                                    'created_at'          => date('Y-m-d H:i:s')
                                );
                            }
                        }
                    }

                    $result = $this->model->insert($contra_voucher_transaction);
                    $output = $this->store_message($result, null);
                    DB::commit();
                } catch (Exception $e) {
                    DB::rollBack();
                    $output = ['status' => 'error','message' => $e->getMessage()];
                }
            }else{
                $output = $this->unauthorized();
            }
            return response()->json($output);
        }else{
            return response()->json($this->unauthorized());
        }
    }

}
