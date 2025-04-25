<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class ProductsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        // productsテーブルにサンプルデータを挿入
        DB::table('products')->insert([
            'product_name' => 'Sample Product',
            'price' => 1000,
            'vendor_code' => 1,  // vendorsテーブルに対応するvendor_codeを指定
            'created_at' => now(),
            'updated_at' => now(),
        ]);
    }
}
