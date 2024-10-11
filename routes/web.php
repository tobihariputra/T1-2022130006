<?php

use App\Http\Controllers\HomeController;
use App\Http\Controllers\ProductController;
use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('welcome');
});

Route::resource('products', ProductController::class);
Route::get('/', [HomeController::class, 'index']);
Route::get('/', function () {
    return view('welcome');
});
Route::get('/dashboard', [HomeController::class, 'index'])->name('dashboard');
Route::get('/products/{product}', [ProductController::class, 'show'])->name('products.show');
Route::get('/product/{id}', [ProductController::class, 'show'])->name('product.show');
