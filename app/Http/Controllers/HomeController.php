<?php

namespace App\Http\Controllers;

use App\Models\Product;
use Illuminate\Http\Request;

class HomeController extends Controller
{
    public function index()
    {
        $totalQuantity = Product::sum('quantity');
        $mostExpensiveProduct = Product::orderBy('retail_price', 'desc')->first();
        $mostCheapestProduct = Product::orderBy('retail_price', 'asc')->first();
        $mostQuantityProduct = Product::orderBy('quantity', 'desc')->first();
        $fewestQuantityProduct = Product::orderBy('quantity', 'asc')->first();

        return view('dashboard', compact('totalQuantity', 'mostExpensiveProduct','mostCheapestProduct' ,'mostQuantityProduct', 'fewestQuantityProduct'));
    }
}
