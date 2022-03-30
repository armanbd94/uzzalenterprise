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
    Route::get('purchase', 'PurchaseController@index')->name('purchase');
    Route::group(['prefix' => 'purchase', 'as'=>'purchase.'], function () {
        Route::get('add', 'PurchaseController@create')->name('add');
        Route::post('datatable-data', 'PurchaseController@get_datatable_data')->name('datatable.data');
        Route::post('store', 'PurchaseController@store')->name('store');
        Route::post('update', 'PurchaseController@update')->name('update');
        Route::get('edit/{id}', 'PurchaseController@edit')->name('edit');
        Route::get('view/{id}', 'PurchaseController@show')->name('view');
        Route::post('delete', 'PurchaseController@delete')->name('delete');
        Route::post('bulk-delete', 'PurchaseController@bulk_delete')->name('bulk.delete');
    });

});
