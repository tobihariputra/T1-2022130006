<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Faker\Factory as Faker;
use Illuminate\Support\Facades\DB;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        $faker = Faker::create();
        $lastProduct = DB::table('products')->orderBy('id', 'desc')->first();
        $startId = $lastProduct ? (int)ltrim($lastProduct->id, '0') + 1 : 1;

        $products = []; // Inisialisasi array produk di luar loop

        for ($i = 0; $i < 100; $i++) {
            $id = str_pad($startId + $i, 3, '0', STR_PAD_LEFT); // Gunakan padding yang sesuai (12 karakter)

            $product_name = $faker->word();
            $description = $faker->sentence();
            $retail_price = $faker->randomFloat(2, 1000, 10000000);
            $wholesale_price = $retail_price * 0.9;
            $origin = strtoupper($faker->countryCode());
            $quantity = $faker->numberBetween(1, 100);
            $created_at = $faker->dateTimeBetween('-1 years', 'now');
            $updated_at = $faker->dateTimeBetween($created_at, 'now');

            $products[] = [
                'id' => $id,
                'product_name' => $product_name,
                'description' => $description,
                'retail_price' => $retail_price,
                'wholesale_price' => $wholesale_price,
                'origin' => $origin,
                'quantity' => $quantity,
                'created_at' => $created_at,
                'updated_at' => $updated_at,
            ];
        }

        if (!empty($products)) {
            DB::table('products')->insert($products); // Masukkan data produk secara batch
        }
    }
}
