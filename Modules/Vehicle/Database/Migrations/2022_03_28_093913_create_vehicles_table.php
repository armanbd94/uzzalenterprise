<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateVehiclesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('vehicles', function (Blueprint $table) {
            $table->id();
            $table->string('name')->unique();
            $table->float('qty');
            $table->enum('status',['1','2'])->default('1')->comment = "1=Active, 2=Inactive";
            $table->unsignedBigInteger('creator_id');
            $table->foreign('creator_id')->references('id')->on('users');
            $table->unsignedBigInteger('modifier_id');
            $table->foreign('modifier_id')->references('id')->on('users');
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
        Schema::dropIfExists('vehicles');
    }
}
