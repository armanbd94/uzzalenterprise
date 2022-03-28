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
     //Income Statement Route
     Route::get('income-statement-report','IncomeStatementReportController@report')->name('income.statement.report');
     //Closing Route
     Route::get('closing', 'ClosingReportController@index')->name('closing');
     Route::post('closing-data', 'ClosingReportController@closing_data')->name('closing.data');
     Route::post('closing/store', 'ClosingReportController@store')->name('closing.store');
     //Closing Report Route
     Route::get('closing-report', 'ClosingReportController@report')->name('closing.report');
     Route::post('closing-report/datatable-data', 'ClosingReportController@get_datatable_data')->name('closing.report.datatable.data');
     //Todays Purchase Report Route
     Route::get('todays-purchase-report', 'TodaysPurchaseReportController@index')->name('todays.purchase.report');
     Route::post('todays-purchase-report/datatable-data', 'TodaysPurchaseReportController@get_datatable_data')->name('todays.purchase.report.datatable.data');
     //Purchase Report Route
     Route::get('purchase-report', 'PurchaseReportController@index')->name('purchase.report');
     Route::post('purchase-report/datatable-data', 'PurchaseReportController@get_datatable_data')->name('purchase.report.datatable.data');
     //Todays Sales Report Route
     Route::get('todays-sales-report', 'TodaysSalesReportController@index')->name('todays.sales.report');
     Route::post('todays-sales-report/datatable-data', 'TodaysSalesReportController@get_datatable_data')->name('todays.sales.report.datatable.data');
     //Sales Report Route
     Route::get('sales-report', 'SalesReportController@index')->name('sales.report');
     Route::post('sales-report/datatable-data', 'SalesReportController@get_datatable_data')->name('sales.report.datatable.data');
     //Todays Customer Receipt Route
     Route::get('todays-customer-receipt', 'TodaysCustomerReceiptController@index')->name('todays.customer.receipt');
     Route::post('todays-customer-receipt/datatable-data', 'TodaysCustomerReceiptController@get_datatable_data')->name('todays.customer.receipt.datatable.data');
     //Salesmen Wise Sales Report Route
     Route::get('salesmen-wise-sales-report', 'SalesmenWiseSalesReportController@index')->name('salesmen.wise.sales.report');
     Route::post('salesmen-wise-sales-report/datatable-data', 'SalesmenWiseSalesReportController@get_datatable_data')->name('salesmen.wise.sales.report.datatable.data');
     //Due Report Route
     Route::get('due-report', 'DueReportController@index')->name('due.report');
     Route::post('due-report/datatable-data', 'DueReportController@get_datatable_data')->name('due.report.datatable.data');
     //Shipping Cost Report Route
     Route::get('shipping-cost-report', 'ShippingCostReportController@index')->name('shipping.cost.report');
     Route::post('shipping-cost-report/datatable-data', 'ShippingCostReportController@get_datatable_data')->name('shipping.cost.report.datatable.data');
     //Product Wise Sales Report Route
     Route::get('product-wise-sales-report', 'ProductWiseSalesReportController@index')->name('product.wise.sales.report');
     Route::post('product-wise-sales-report/datatable-data', 'ProductWiseSalesReportController@get_datatable_data')->name('product.wise.sales.report.datatable.data');
     //Production Report Route
     Route::get('production-report', 'ProductionReportController@index')->name('production.report');
     Route::post('production-report/datatable-data', 'ProductionReportController@get_datatable_data')->name('production.report.datatable.data');
     //Warehouse Report Route
     Route::get('warehouse-report', 'WarehouseReportController@index')->name('warehouse.report');
     Route::post('warehouse-report/datatable-data', 'WarehouseReportController@get_datatable_data')->name('warehouse.report.datatable.data');
     //Product Coupon Report Route
     Route::get('product-coupon-report', 'ProductCouponReportController@index')->name('product.coupon.report');
     Route::post('product-coupon-report/data', 'ProductCouponReportController@get_datatable_data')->name('product.coupon.report.data');
     //Warehouse Coupon Report Route
     Route::get('warehouse-coupon-report', 'WarehouseCouponReportController@index')->name('warehouse.coupon.report');
     Route::post('warehouse-coupon-report/data', 'WarehouseCouponReportController@report')->name('warehouse.coupon.report.data');
     //Machine Purchase Report Route
     Route::get('machine-purchase-report', 'MachinePurchaseReportController@index')->name('machine.purchase.report');
     Route::post('machine-purchase-report/datatable-data', 'MachinePurchaseReportController@get_datatable_data')->name('machine.purchase.report.datatable.data');
     //Maintenance Service Report Route
     Route::get('maintenance-service-report', 'MaintenanaceServiceReportController@index')->name('maintenance.service.report');
     Route::post('maintenance-service-report/datatable-data', 'MaintenanaceServiceReportController@get_datatable_data')->name('maintenance.service.report.datatable.data');
     //Maintenance Service Report Route
     Route::get('transport-report', 'TransportReportController@index')->name('transport.report');
     Route::post('transport-report/datatable-data', 'TransportReportController@get_datatable_data')->name('transport.report.datatable.data');
     //Labor Report
     Route::get('labor-bill-report', 'LaborReportController@index')->name('labor.bill.report');
     //Summary Report
     Route::get('summary-report', 'SummaryReportController@index')->name('summary.report');
});
