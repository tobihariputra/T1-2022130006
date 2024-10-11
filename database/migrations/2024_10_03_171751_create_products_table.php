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
            $table->char('id', 12)->primary();
            $table->string('product_name', 255);
            $table->text('description')->nullable();
            $table->decimal('retail_price', 10, 2)->default(0.00);
            $table->decimal('wholesale_price', 10, 2)->default(0.00);
            $table->char('origin', 2);
            $table->unsignedInteger('quantity')->default(0);
            $table->text('product_image')->nullable();
            $table->timestamps();
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
