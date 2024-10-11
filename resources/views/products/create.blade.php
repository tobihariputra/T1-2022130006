@extends('layouts.app')

@section('content')
    <div class="container">
        <h1>Add New Product</h1>

        <form action="{{ route('products.store') }}" method="POST" enctype="multipart/form-data">
            @csrf

            <div class="mb-3">
                <label for="product_name" class="form-label">Product Name</label>
                <input type="text" class="form-control" id="product_name" name="product_name"
                    placeholder="Enter product name" value="{{ old('product_name') }}" required>
                @error('product_name')
                    <small class="text-danger">{{ $message }}</small>
                @enderror
            </div>

            <div class="mb-3">
                <label for="description" class="form-label">Description</label>
                <textarea class="form-control" id="description" name="description" rows="3" placeholder="Enter description">{{ old('description') }}</textarea>
                @error('description')
                    <small class="text-danger">{{ $message }}</small>
                @enderror
            </div>

            <div class="mb-3">
                <label for="retail_price" class="form-label">Retail Price</label>
                <input type="number" step="0.01" class="form-control" id="retail_price" name="retail_price"
                    placeholder="Enter retail price" value="{{ old('retail_price') }}" required>
                @error('retail_price')
                    <small class="text-danger">{{ $message }}</small>
                @enderror
            </div>

            <div class="mb-3">
                <label for="wholesale_price" class="form-label">Wholesale Price</label>
                <input type="number" step="0.01" class="form-control" id="wholesale_price" name="wholesale_price"
                    placeholder="Enter wholesale price" value="{{ old('wholesale_price') }}" required>
                @error('wholesale_price')
                    <small class="text-danger">{{ $message }}</small>
                @enderror
            </div>

            <div class="mb-3">
                <label for="origin" class="form-label">Origin</label>
                <input type="text" class="form-control" id="origin" name="origin" minlength="2" maxlength="2"
                    placeholder="Enter origin" value="{{ old('origin') }}" required>
                @error('origin')
                    <small class="text-danger">{{ $message }}</small>
                @enderror
            </div>

            <div class="mb-3">
                <label for="quantity" class="form-label">Quantity</label>
                <input type="number" class="form-control" id="quantity" name="quantity" placeholder="Enter quantity"
                    value="{{ old('quantity') }}" required>
                @error('quantity')
                    <small class="text-danger">{{ $message }}</small>
                @enderror
            </div>

            <div class="mb-3">
                <label for="product_image" class="form-label">Product Image</label>
                <input type="file" class="form-control" id="product_image" name="product_image">
                @error('product_image')
                    <small class="text-danger">{{ $message }}</small>
                @enderror
            </div>

            <button type="submit" class="btn btn-success">Add Product</button>
        </form>
    </div>
@endsection
