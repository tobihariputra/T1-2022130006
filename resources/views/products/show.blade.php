@extends('layouts.app')

@section('title', "Product: $product->product_name")

@section('content')
<div class="container mt-4">
    <h1 class="text-center mb-4">{{ $product->product_name }}</h1>

    <div class="card">
        <div class="card-body">
            <div class="text-center">
                <img src="{{ asset('storage/images/' . basename($product->product_image)) }}" alt="{{ $product->product_name }}" class="img-fluid mb-3" style="max-width: 300px;">
                @if (!$product->product_image)
                    <p class="text-danger">Image not available.</p>
                @endif
            </div>
            <p><strong>ID:</strong> {{ $product->id }}</p>
            <p><strong>Retail Price:</strong> $<strong>{{ number_format($product->retail_price, 2) }}</strong></p>
            <p><strong>Wholesale Price:</strong> $<strong>{{ number_format($product->wholesale_price, 2) }}</strong></p>
            <p><strong>Origin:</strong> {{ $product->origin }}</p>
            <p><strong>Quantity:</strong> {{ $product->quantity }} units</p>
            <p><strong>Description:</strong> {{ $product->description ?: 'No description available.' }}</p>
        </div>
    </div>

    <div class="text-center mt-4">
        <a href="{{ route('products.index') }}" class="btn btn-secondary">Back to Products</a>
        <a href="{{ route('products.edit', $product->id) }}" class="btn btn-warning">Edit Product</a>
        <form action="{{ route('products.destroy', $product->id) }}" method="POST" class="d-inline">
            @csrf
            @method('DELETE')
            <button type="submit" class="btn btn-danger">Delete Product</button>
        </form>
    </div>
</div>
@endsection
