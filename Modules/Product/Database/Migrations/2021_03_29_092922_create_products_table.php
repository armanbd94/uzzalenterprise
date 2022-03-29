<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateProductsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('products', function (Blueprint $table) {
            $table->id();
            $table->string('name')->index('name');
            $table->unsignedBigInteger('category_id');
            $table->foreign('category_id')->references('id')->on('categories');
            $table->string('code')->unique();
            $table->unsignedBigInteger('unit_id');
            $table->foreign('unit_id')->references('id')->on('units');
            $table->string('cost')->nullable();
            $table->string('old_cost')->nullable();
            $table->string('price');
            $table->double('qty')->nullable();
            $table->double('alert_qty')->nullable();
            $table->enum('status',['1','2'])->default('1')->comment = "1=Active, 2=Inactive";
            $table->enum('has_opening_stock',['1','2'])->default('2')->comment = "1=Yes, 2=No";
            $table->double('opening_stock_qty')->nullable();
            $table->double('opening_cost')->nullable();
            $table->unsignedBigInteger('opening_warehouse_id')->nullable();
            $table->foreign('opening_warehouse_id')->references('id')->on('warehouses');
            $table->string('created_by')->nullable();
            $table->string('modified_by')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('products');
    }
}
