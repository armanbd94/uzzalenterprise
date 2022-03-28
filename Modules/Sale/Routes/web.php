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
    //Sale Routes
       Route::get('sale', 'SaleController@index')->name('sale');
       Route::group(['prefix' => 'sale', 'as'=>'sale.'], function () {
           Route::post('datatable-data', 'SaleController@get_datatable_data')->name('datatable.data');
           Route::get('add', 'SaleController@create')->name('add');
           Route::post('store', 'SaleController@store')->name('store');
           Route::post('hold', 'SaleController@hold')->name('hold');
           Route::get('details/{id}', 'SaleController@show')->name('show');
           Route::get('edit/{id}', 'SaleController@edit')->name('edit');
           Route::post('update', 'SaleController@update')->name('update');
           Route::post('delete', 'SaleController@delete')->name('delete');
           Route::post('bulk-delete', 'SaleController@bulk_delete')->name('bulk.delete');
        //    Route::post('invoice', 'SaleController@invoice')->name('invoice');
           Route::post('delivery-status-update', 'SaleController@delivery_status_update')->name('delivery.update');
           Route::post('change-status', 'SaleController@change_status')->name('change.status');
       });

       //Sale Product Search Routes
       Route::post('product-autocomplete-search', 'ProductController@product_autocomplete_search');
       Route::post('product-search', 'ProductController@product_search')->name('product.search');
});
