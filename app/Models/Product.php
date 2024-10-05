<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    use HasFactory;

    // Tambahkan id ke dalam fillable
    protected $fillable = [
        'id',                // Menambahkan id
        'product_name',
        'description',
        'retail_price',
        'wholesale_price',
        'origin',
        'quantity',
        'product_image',
    ];

    // Jika Anda menggunakan timestamps
    public $timestamps = true; // Jika true, akan menggunakan created_at dan updated_at
}
