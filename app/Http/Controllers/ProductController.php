<?php

namespace App\Http\Controllers;

use App\Models\Product;
use Illuminate\Container\Attributes\Storage;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage as FacadesStorage;

class ProductController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $products = Product::all();
        return view('products.index', compact('products'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('products.create');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validated = $request->validate([
            'id' => 'required|string|max:12',
            'product_name' => 'required|string|max:255',
            'description' => 'nullable|string',
            'retail_price' => 'required|numeric',
            'wholesale_price' => 'required|numeric',
            'origin' => 'required|string|max:2',
            'quantity' => 'required|integer|min:0',
            'product_image' => 'nullable|image|mimes:jpg,png,jpeg|max:4096',
        ]);

        // Handle the product image upload
        if ($request->hasFile('product_image')) {
            $imageName = time() . '_' . $request->file('product_image')->getClientOriginalName();
            $request->file('product_image')->storeAs('images', $imageName, 'public');
            $validated['product_image'] = $imageName;
        }

        Product::create($validated);
        return redirect()->route('products.index')->with('success', 'Product added successfully!');
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $product = Product::findOrFail($id); // Menemukan produk berdasarkan ID
        return view('products.show', compact('product'));
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Product $product)
    {
        return view('products.edit', compact('product'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Product $product)
    {
        $validated = $request->validate([
            'product_name' => 'required|max:100',
            'description' => 'nullable|max:1000',
            'retail_price' => 'required|numeric',
            'wholesale_price' => 'required|numeric',
            'origin' => 'required|size:2',
            'quantity' => 'required|integer',
            'product_image' => 'nullable|image|mimes:jpeg,png,jpg,gif,svg|max:4096',
        ]);

        // Handle the product image upload
        if ($request->hasFile('product_image')) {
            $imageName = time() . '_' . $request->file('product_image')->getClientOriginalName();
            $request->file('product_image')->storeAs('images', $imageName, 'public');
            $validated['product_image'] = $imageName;
        }

        $product->update($validated);
        return redirect()->route('products.index')->with('success', 'Product updated successfully!');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Product $product)
    {
        // Optional: Delete the product image if it exists
        if ($product->product_image) {
            FacadesStorage::disk('public')->delete('images/' . $product->product_image);
        }

        $product->delete();
        return redirect()->route('products.index')->with('success', 'Product deleted successfully!');
    }
}
