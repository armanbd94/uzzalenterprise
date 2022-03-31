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

     Route::get('customer-report', 'CustomerReportController@index')->name('customer.report');
     Route::post('customer-report/data', 'CustomerReportController@report_data')->name('customer.report.data');
                                  
     Route::get('supplier-report', 'SupplierReportController@index')->name('supplier.report');
     Route::post('supplier-report/data', 'SupplierReportController@report_data')->name('supplier.report.data');
                                  
     Route::get('due-report', 'DueReportController@index')->name('due.report');
     Route::post('due-report/data', 'DueReportController@report_data')->name('due.report.data');
                                  
     //Summary Report
     Route::get('summary-report', 'SummaryReportController@index')->name('summary.report');
});
