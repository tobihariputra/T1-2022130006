@extends('layouts.app')

@section('content')
    <div class="container mt-4">
        <h1>Edit Product</h1>

        <form method="POST" action="{{ route('products.update', $product->id) }}" enctype="multipart/form-data">
            @csrf
            @method('PUT')

            <div class="form-group">
                <label for="product_name">Product Name</label>
                <input type="text" name="product_name" class="form-control"
                    value="{{ old('product_name', $product->product_name) }}" required>
                @error('product_name')
                    <small class="text-danger">{{ $message }}</small>
                @enderror
            </div>

            <div class="form-group">
                <label for="description">Description</label>
                <textarea class="form-control" id="description" name="description" rows="3" placeholder="Enter description"
                    required>{{ old('description', $product->description) }}</textarea>
                @error('description')
                    <small class="text-danger">{{ $message }}</small>
                @enderror
            </div>

            <div class="form-group">
                <label for="retail_price">Retail Price</label>
                <input type="number" name="retail_price" class="form-control"
                    value="{{ old('retail_price', $product->retail_price) }}" required step="0.01">
                @error('retail_price')
                    <small class="text-danger">{{ $message }}</small>
                @enderror
            </div>

            <div class="form-group">
                <label for="wholesale_price">Wholesale Price</label>
                <input type="number" name="wholesale_price" class="form-control"
                    value="{{ old('wholesale_price', $product->wholesale_price) }}" required step="0.01">
                @error('wholesale_price')
                    <small class="text-danger">{{ $message }}</small>
                @enderror
            </div>

            <div class="form-group">
                <label for="origin">Origin</label>
                <input type="text" name="origin" class="form-control" value="{{ old('origin', $product->origin) }}"
                    maxlength="2" required>
                @error('origin')
                    <small class="text-danger">{{ $message }}</small>
                @enderror
            </div>

            <div class="form-group">
                <label for="quantity">Quantity</label>
                <input type="number" name="quantity" class="form-control"
                    value="{{ old('quantity', $product->quantity) }}" required min="0">
                @error('quantity')
                    <small class="text-danger">{{ $message }}</small>
                @enderror
            </div>

            <div class="form-group">
                <label for="product_image">Product Image</label>
                <input type="file" name="product_image" class="form-control" accept="image/*">
                <small class="form-text text-muted">Biarkan saja jika tidak mau ganti gambar.</small>
                @error('product_image')
                    <small class="text-danger">{{ $message }}</small>
                @enderror
            </div>
            <br>
            <button type="submit" class="btn btn-primary">Update Product</button>
            <a href="{{ route('products.index') }}" class="btn btn-secondary">Cancel</a>
        </form>
    </div>
@endsection
