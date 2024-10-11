<?php

namespace App\Http\Controllers;

use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class ProductController extends Controller
{
    public function index(Request $request)
    {
        $query = Product::query();

        if ($request->has('search') && $request->input('search') !== '') {
            $searchTerm = $request->input('search');

            $query->where(function ($q) use ($searchTerm) {
                $q->where('id', 'like', '%' . $searchTerm . '%')
                    ->orWhere('product_name', 'like', '%' . $searchTerm . '%')
                    ->orWhere('description', 'like', '%' . $searchTerm . '%')
                    ->orWhere('retail_price', 'like', '%' . $searchTerm . '%')
                    ->orWhere('wholesale_price', 'like', '%' . $searchTerm . '%')
                    ->orWhere('origin', 'like', '%' . $searchTerm . '%')
                    ->orWhere('quantity', 'like', '%' . $searchTerm . '%')
                    ->orWhere('created_at', 'like', '%' . $searchTerm . '%')
                    ->orWhere('updated_at', 'like', '%' . $searchTerm . '%');
            });
        }

        $products = $query->paginate(10);
        return view('products.index', compact('products'));
    }

    public function create()
    {
        return view('products.create');
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'product_name' => 'required|string|max:255',
            'description' => 'nullable|string',
            'retail_price' => 'required|numeric',
            'wholesale_price' => 'required|numeric',
            'origin' => 'required|string|max:2',
            'quantity' => 'required|integer|min:0',
            'product_image' => 'nullable|image|mimes:jpg,png,jpeg|max:4096',
        ]);


        $lastProduct = Product::orderBy('id', 'desc')->first();
        $newId = $lastProduct ? str_pad((int)$lastProduct->id + 1, 3, '0', STR_PAD_LEFT) : '001';

        if ($request->hasFile('product_image')) {
            $imageName = time() . '_' . $request->file('product_image')->getClientOriginalName();
            $request->file('product_image')->storeAs('images', $imageName, 'public');
            $validated['product_image'] = $imageName;
        }

        $validated['id'] = $newId;

        Product::create($validated);
        return redirect()->route('products.index')->with('success', 'Product added successfully!');
    }


    public function show(string $id)
    {
        $product = Product::findOrFail($id);

        $previousProduct = Product::where('id', '<', $id)->orderBy('id', 'desc')->first();
        $nextProduct = Product::where('id', '>', $id)->orderBy('id', 'asc')->first();

        return view('products.show', compact('product', 'previousProduct', 'nextProduct'));
    }

    public function edit(Product $product)
    {
        return view('products.edit', compact('product'));
    }

    public function update(Request $request, Product $product)
    {
        $validated = $request->validate([
            'product_name' => 'required|max:255',
            'description' => 'nullable|max:1000',
            'retail_price' => 'required|numeric',
            'wholesale_price' => 'required|numeric',
            'origin' => 'required|size:2',
            'quantity' => 'required|integer|min:0',
            'product_image' => 'nullable|image|mimes:jpeg,png,jpg,gif,svg|max:4096',
        ]);

        if ($request->hasFile('product_image')) {
            if ($product->product_image) {
                Storage::disk('public')->delete('images/' . $product->product_image);
            }

            $imageName = time() . '_' . $request->file('product_image')->getClientOriginalName();
            $request->file('product_image')->storeAs('images', $imageName, 'public');
            $validated['product_image'] = $imageName;
        }

        $product->update($validated);
        return redirect()->route('products.index')->with('success', 'Product updated successfully!');
    }

    public function destroy(Product $product)
    {
        if ($product->product_image) {
            Storage::disk('public')->delete('images/' . $product->product_image);
        }

        $product->delete();
        return redirect()->route('products.index')->with('success', 'Product deleted successfully!');
    }
}
