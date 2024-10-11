@extends('layouts.app')

@section('title', 'Dashboard')

@section('content')
    <div class="container">
        <h1 class="mb-4">Dashboard</h1>

        <div class="card border-primary mt-4">
            <div class="card-body">
                <h4 class="text-primary">Total Quantity: <strong>{{ $totalQuantity }}</strong></h4>
            </div>
        </div>

        <div class="card border-success mt-4">
            <div class="card-body">
                @if ($mostExpensiveProduct)
                    <h4 class="text-success">Most Expensive Product:
                        <a href="{{ route('products.show', $mostExpensiveProduct->id) }}" class="link-info">
                            {{ $mostExpensiveProduct->product_name }}
                        </a> - Rp<strong>{{ number_format($mostExpensiveProduct->retail_price, 0, ',', '.') }}</strong>
                    </h4>
                @else
                    <h4 class="text-danger">No products available for most expensive product.</h4>
                @endif

                @if ($mostCheapestProduct)
                    <h4 class="text-success">Cheapest Product:
                        <a href="{{ route('products.show', $mostCheapestProduct->id) }}" class="link-info">
                            {{ $mostCheapestProduct->product_name }}
                        </a> - Rp<strong>{{ number_format($mostCheapestProduct->retail_price, 0, ',', '.') }}</strong>
                    </h4>
                @endif
            </div>
        </div>

        <div class="card border-danger mt-4">
            <div class="card-body">
                @if ($mostQuantityProduct)
                    <h4 class="text-danger">Product with Most Quantity:
                        <a href="{{ route('products.show', $mostQuantityProduct->id) }}" class="link-info">
                            {{ $mostQuantityProduct->product_name }}
                        </a> - <strong>{{ $mostQuantityProduct->quantity }} units</strong>
                    </h4>
                @else
                    <h4 class="text-danger">No products available for most quantity.</h4>
                @endif

                @if ($fewestQuantityProduct)
                    <h4 class="text-danger">Product with Fewest Quantity:
                        <a href="{{ route('products.show', $fewestQuantityProduct->id) }}" class="link-info">
                            {{ $fewestQuantityProduct->product_name }}
                        </a> - <strong>{{ $fewestQuantityProduct->quantity }} units</strong>
                    </h4>
                @endif
            </div>
        </div>

        <div class="text-center mt-4">
            <a href="{{ route('products.index') }}" class="btn btn-info btn-lg">Products</a>
            <a href="{{ route('products.create') }}" class="btn btn-success btn-lg">Add New Product</a>
        </div>
    </div>
@endsection
