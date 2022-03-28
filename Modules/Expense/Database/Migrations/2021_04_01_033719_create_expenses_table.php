<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateExpensesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('expenses', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('expense_item_id');
            $table->foreign('expense_item_id')->references('id')->on('expense_items');
            $table->string('voucher_no')->unique();
            $table->double('amount');
            $table->date('date');
            $table->enum('payment_type',['1','2','3'])->comment="1=Cash,2=Bank,3=Mobile";
            $table->unsignedBigInteger('account_id');
            $table->foreign('account_id')->references('id')->on('chart_of_accounts');
            $table->text('remarks')->nullable(); 
            $table->enum('status',['1','2','3'])->default(3)->comment="1=Approved,2=Canceled,3=Pending";
            $table->string('status_change_by')->nullable();
            $table->dateTime('status_change_date')->nullable();
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
        Schema::dropIfExists('expenses');
    }
}
