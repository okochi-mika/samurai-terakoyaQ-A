<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
       Schema::create('products', function (Blueprint $table) {
    $table->id();
    $table->string('product_name');
    $table->unsignedInteger('price');
    $table->unsignedInteger('vendor_code');
    $table->string('image_name')->nullable();
    $table->timestamps();

    $table->foreign('vendor_code')->references('vendor_code')->on('vendors')->onDelete('cascade');
});

    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('products');
    }
};