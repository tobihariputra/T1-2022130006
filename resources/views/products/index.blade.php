@extends('layouts.app')

@section('content')
    <div class="container">
        <h1 class="mb-2">Product List</h1>

        @if (session('success'))
            <div class="alert alert-success">
                {{ session('success') }}
            </div>
        @endif

        <div class="d-flex justify-content-between mb-3">
            <a href="{{ route('products.create') }}" class="btn btn-success">Add New Product</a>
            <form class="d-flex" method="GET" action="{{ route('products.index') }}">
                <input class="form-control me-2" name="search" type="search" placeholder="Search" aria-label="Search"
                    value="{{ request('search') }}">
                <button class="btn btn-outline-primary" type="submit">Search</button>
            </form>
        </div>

        <div class="container mt-4">
            <div class="table-responsive">
                <table class="table table-bordered table-hover">
                    <thead class="thead-light">
                        <tr>
                            <th scope="col">ID</th>
                            <th scope="col">Product Name</th>
                            <th scope="col">Description</th>
                            <th scope="col">Retail Price</th>
                            <th scope="col">Wholesale Price</th>
                            <th scope="col">Origin</th>
                            <th scope="col">Quantity</th>
                            <th scope="col">Created At</th>
                            <th scope="col">Updated At</th>
                            <th scope="col">Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        @forelse($products as $product)
                            <tr>
                                <th scope="row" class="text-center align-middle">{{ ltrim($product->id, '0') }}</th>
                                <td>
                                    <a href="{{ route('products.show', $product->id) }}">{{ $product->product_name }}</a>
                                </td>
                                <td class="description">{{ $product->description ?: 'No description' }}</td>
                                <td>Rp{{ number_format($product->retail_price, 0, ',', '.') }}</td>
                                <td>Rp{{ number_format($product->wholesale_price, 0, ',', '.') }}</td>
                                <td>{{ $product->origin }}</td>
                                <td>{{ $product->quantity }}</td>
                                <td>{{ $product->created_at->format('Y-m-d H:i') }}</td>
                                <td>{{ $product->updated_at->format('Y-m-d H:i') }}</td>
                                <td class="actions">
                                    <a href="{{ route('products.edit', $product->id) }}"
                                        class="btn btn-warning btn-sm">Edit</a>
                                    <form action="{{ route('products.destroy', $product->id) }}" method="POST"
                                        style="display:inline;">
                                        @csrf
                                        @method('DELETE')
                                        <button type="submit" class="btn btn-danger btn-sm"
                                            onclick="return confirm('Are you sure you want to delete this product?')">Delete</button>
                                    </form>
                                </td>
                            </tr>
                        @empty
                            <tr>
                                <td colspan="10" class="text-center">No products added yet.</td>
                            </tr>
                        @endforelse
                    </tbody>
                </table>
                <div class="d-flex justify-content-center">
                    {{ $products->appends(request()->input())->links('pagination::bootstrap-4') }}

                </div>
                <div class="d-flex justify-content-center">
                    <p>Showing {{ $products->firstItem() }} to {{ $products->lastItem() }} of {{ $products->total() }}
                        results</p>
                </div>
            </div>
        </div>
    </div>
@endsection
