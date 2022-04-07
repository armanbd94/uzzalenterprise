<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::group(['middleware' => ['auth','language']], function () {
    Route::get('account', 'AccountController@index')->name('account');
    Route::group(['prefix' => 'account', 'as'=>'account.'], function () {
        Route::post('list', 'AccountController@account_list')->name('list');
        Route::post('list/update', 'AccountController@accountListUpdate')->name('list.update');
    });

    //COA Routes
    Route::get('coa', 'COAController@index')->name('coa');
    Route::group(['prefix' => 'coa', 'as'=>'coa.'], function () {
        Route::post('datatable-data', 'COAController@get_datatable_data')->name('datatable.data');
        Route::post('store-or-update', 'COAController@store_or_update_data')->name('store.or.update');
        Route::post('edit', 'COAController@edit')->name('edit');
        Route::post('delete', 'COAController@delete')->name('delete');
        Route::post('parent-head', 'COAController@parent_head_data')->name('parent.head');

    });

    //Opening Balance Routes
    Route::resource('opening-balance', 'OpeningBalanceController')->only(['index','store']);

    //Cash Adjustment Routes
    Route::resource('cash-adjustment', 'CashAdjustmentController')->only(['index','store']);

    //Supplier Payment Route
    Route::get('supplier-payment', 'SupplierPaymentController@index')->name('supplier.payment');
    Route::group(['prefix' => 'supplier-payment', 'as'=>'supplier.payment.'], function () {
        Route::get('create', 'SupplierPaymentController@create')->name('create');
        Route::post('store', 'SupplierPaymentController@store')->name('store');
        Route::get('show/{id}/{payment_type}', 'SupplierPaymentController@show')->name('show');
        Route::get('edit/{voucher_no}', 'SupplierPaymentController@edit')->name('edit');
        Route::post('update', 'SupplierPaymentController@update')->name('update');
        Route::post('delete', 'SupplierPaymentController@delete')->name('delete');
        Route::post('datatable-data', 'SupplierPaymentController@get_datatable_data')->name('datatable.data');
    });

    //Customer Receive Route
    Route::get('customer-receive', 'CustomerReceiveController@index')->name('customer.receive');
    Route::group(['prefix' => 'customer-receive', 'as'=>'customer.receive.'], function () {
        Route::get('create', 'CustomerReceiveController@create')->name('create');
        Route::post('store', 'CustomerReceiveController@store')->name('store');
        Route::get('show/{id}/{payment_type}', 'CustomerReceiveController@show')->name('show');
        Route::get('edit/{voucher_no}', 'CustomerReceiveController@edit')->name('edit');
        Route::post('update', 'CustomerReceiveController@update')->name('update');
        Route::post('delete', 'CustomerReceiveController@delete')->name('delete');
        Route::post('datatable-data', 'CustomerReceiveController@get_datatable_data')->name('datatable.data');
    });

    //Debit Voucher Route
    Route::resource('debit-voucher', 'DebitVoucherController')->only(['index','store']);
    Route::post('debit-voucher/update', 'DebitVoucherController@update');

    //Credit Voucher Route
    Route::resource('credit-voucher', 'CreditVoucherController')->only(['index','store']);
    Route::post('credit-voucher/update', 'CreditVoucherController@update');

    //Contra Voucher Route
    Route::resource('contra-voucher', 'ContraVoucherController')->only(['index','store']);
    Route::post('contra-voucher/update', 'ContraVoucherController@update');

    //Journal Voucher Route
    Route::resource('journal-voucher', 'JournalVoucherController')->only(['index','store']);
    Route::post('journal-voucher/update', 'JournalVoucherController@update');

    //Journal Voucher Route
    Route::get('voucher-approval', 'VoucherApprovalController@index')->name('voucher.approval');
    Route::get('voucher-update/{voucher_no}', 'VoucherApprovalController@edit')->name('voucher.update');
    Route::post('voucher-approval/datatable-data', 'VoucherApprovalController@get_datatable_data')->name('voucher.approval.datatable.data');
    Route::post('voucher-approval/delete', 'VoucherApprovalController@delete')->name('voucher.approval.delete');
    Route::post('voucher-approval/approve', 'VoucherApprovalController@approve')->name('voucher.approval.approve');

    //Cash Book Route
    Route::get('cash-book', 'Report\CashBookController@index');
    Route::post('cash-book/report', 'Report\CashBookController@report');

    //Inventory Ledger Route
    Route::get('inventory-ledger', 'Report\InventoryLedgerController@index');
    Route::post('inventory-ledger/report', 'Report\InventoryLedgerController@report');

    //Bank Book Route
    Route::get('bank-book', 'Report\BankBookController@index');
    Route::post('bank-book/report', 'Report\BankBookController@report');

    //Mobile Bank Book Route
    Route::get('mobile-bank-book', 'Report\MobileBankBookController@index');
    Route::post('mobile-bank-book/report', 'Report\MobileBankBookController@report');

    //General Ledger Route
    Route::get('general-ledger', 'Report\GeneralLedgerController@index');
    Route::post('general-ledger/report', 'Report\GeneralLedgerController@report');

    //Trial Balance Route
    Route::get('trial-balance', 'Report\TrialBalanceController@index');
    Route::post('trial-balance/report', 'Report\TrialBalanceController@report');

    //Profit Loss Route
    Route::get('profit-loss', 'Report\ProfitLossController@index');
    Route::post('profit-loss/report', 'Report\ProfitLossController@report');

    //Cash Flow Route
    Route::get('cash-flow', 'Report\CashFlowController@index');
    Route::post('cash-flow/report', 'Report\CashFlowController@report');

    //General Ledger Route
    Route::get('general-ledger', 'Report\GeneralLedgerController@index');
    Route::post('general-ledger/report', 'Report\GeneralLedgerController@report');
    Route::post('general-ledger/transaction-heads', 'Report\GeneralLedgerController@transaction_heads');

    //Trial Balance Route
    Route::get('balance-sheet', 'Report\BalanceSheetController@index');
    Route::post('balance-sheet/report', 'Report\BalanceSheetController@report');

});
