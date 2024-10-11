@extends('layouts.app')

@section('title', "Product: $product->product_name")

@section('content')
    <div class="container mt-2">
        <h1 class="text-center mb-4">{{ $product->product_name }}</h1>

        <div class="modal fade" id="imageModal" tabindex="-1" aria-labelledby="imageModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-lg">
                <div class="modal-content">
                    <div class="modal-body">
                        <img src="{{ asset('storage/images/' . basename($product->product_image)) }}"
                            alt="{{ $product->product_name }}" class="img-fluid"
                            style="width: auto; height: auto; max-width: 100%;">
                    </div>
                </div>
            </div>
        </div>

        <div class="card">
            <div class="card-body">
                <div class="text-center">
                    <img src="{{ asset('storage/images/' . basename($product->product_image)) }}"
                        alt="{{ $product->product_name }}" class="img-fluid mb-3 product-image"
                        style="max-width: 500px; cursor: pointer;" data-bs-toggle="modal" data-bs-target="#imageModal">
                    @if (!$product->product_image)
                        <p class="text-danger">Image not available.</p>
                    @endif
                </div>

                <p><strong>ID:</strong> {{ ltrim($product->id, '0') }}</p>
                <p><strong>Retail Price:</strong>
                    Rp<strong>{{ number_format($product->retail_price, 0, ',', '.') }}</strong></p>
                <p><strong>Wholesale Price:</strong>
                    Rp<strong>{{ number_format($product->wholesale_price, 0, ',', '.') }}</strong></p>
                <p><strong>Origin:</strong> {{ $product->origin }}</p>
                <p><strong>Quantity:</strong> {{ $product->quantity }} units</p>
                <p><strong>Description:</strong> {{ $product->description ?: 'No description available.' }}</p>
            </div>
        </div>

        <div class="d-flex justify-content-between mt-4">
            @if ($previousProduct)
                <a href="{{ route('products.show', $previousProduct->id) }}" class="btn btn-info">
                    <i class="bi bi-arrow-left"></i> Previous
                </a>
            @else
                <div></div>
            @endif

            <div>
                <a href="{{ route('products.index') }}" class="btn btn-secondary">Back to Products</a>
                <a href="{{ route('products.edit', $product->id) }}" class="btn btn-warning">Edit Product</a>
                <form action="{{ route('products.destroy', $product->id) }}" method="POST" class="d-inline">
                    @csrf
                    @method('DELETE')
                    <button type="submit" class="btn btn-danger"
                        onclick="return confirm('Are you sure you want to delete this product?')">Delete Product</button>
                </form>
            </div>

            @if ($nextProduct)
                <a href="{{ route('products.show', $nextProduct->id) }}" class="btn btn-info">
                    Next <i class="bi bi-arrow-right"></i>
                </a>
            @else
                <div></div>
            @endif
        </div>
    </div>
@endsection
