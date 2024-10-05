@extends('layouts.app')

@section('title', 'Dashboard')

@section('content')
<div class="container">
    <h1 class="text-center mb-4">Dashboard</h1>

    <div class="card mt-4">
        <div class="card-body">
            <h4 class="text-primary">Total Quantity: <strong>{{ $totalQuantity }}</strong></h4>

            @if($mostExpensiveProduct)
                <h4 class="text-success">Most Expensive Product:
                    <a href="{{ route('products.show', $mostExpensiveProduct->id) }}" class="link-info">
                        {{ $mostExpensiveProduct->product_name }}
                    </a> - $<strong>{{ number_format($mostExpensiveProduct->retail_price, 2) }}</strong>
                </h4>
            @else
                <h4 class="text-danger">No products available for most expensive product.</h4>
            @endif

            @if($mostQuantityProduct)
                <h4 class="text-success">Product with Most Quantity:
                    <a href="{{ route('products.show', $mostQuantityProduct->id) }}" class="link-info">
                        {{ $mostQuantityProduct->product_name }}
                    </a> - <strong>{{ $mostQuantityProduct->quantity }} units</strong>
                </h4>
            @else
                <h4 class="text-danger">No products available for most quantity.</h4>
            @endif
        </div>
    </div>

    <div class="text-center mt-4">
        <a href="{{ route('products.create') }}" class="btn btn-primary btn-lg">Add New Product</a>
    </div>
</div>
@endsection
