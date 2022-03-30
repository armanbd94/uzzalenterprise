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

     //Warehouse Routes
     Route::get('vehicle', 'VehicleController@index')->name('vehicle');
     Route::group(['prefix' => 'vehicle', 'as'=>'vehicle.'], function () {
         Route::post('datatable-data', 'VehicleController@get_datatable_data')->name('datatable.data');
         Route::post('store-or-update', 'VehicleController@store_or_update_data')->name('store.or.update');
         Route::post('edit', 'VehicleController@edit')->name('edit');
         Route::post('delete', 'VehicleController@delete')->name('delete');
         Route::post('bulk-delete', 'VehicleController@bulk_delete')->name('bulk.delete');
         Route::post('change-status', 'VehicleController@change_status')->name('change.status');
         Route::post('search', 'VehicleController@vehicle_search')->name('search');
     });

});
