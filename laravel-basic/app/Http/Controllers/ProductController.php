<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\Product;
use App\Models\Vendor;
use App\Http\Requests\ProductStoreRequest;
use App\Events\ProductAddedEvent;


class ProductController extends Controller
{
    public function index() {
        // productsテーブルからすべてのデータを取得し、変数$productsに代入する
        $products = DB::table('products')->get();

        // 変数$productsをproducts/index.blade.phpファイルに渡す
        return view('products.index', compact('products'));
    }    

    public function show($id) {
        // URL'/products/{id}'の'{id}'部分と主キー（idカラム）の値が一致するデータをproductsテーブルから取得し、変数$productに代入する
        $product = Product::find($id);

        // 変数$productをproducts/show.blade.phpファイルに渡す
        return view('products.show', compact('product'));
    }

    public function create() {
        $vendor_codes = Vendor::pluck('vendor_code');

        return view('products.create', compact('vendor_codes'));
    }

    public function store(ProductStoreRequest $request) {
    $product = new Product();
    $product->product_name = $request->input('product_name');
    $product->price = $request->input('price');
    $product->vendor_code = $request->input('vendor_code');

    // 画像ファイルがあれば処理
    if ($request->hasFile('image')) {
        $image_path = $request->file('image')->store('public/products');
        $product->image_name = basename($image_path);

        // 状態を確認（確認できたらこの行は削除またはコメントアウト）
        // dd([
        //     'image_path' => $image_path,
        //     'image_name' => $product->image_name,
        // ]);
    }

    // 最後に保存する
    $product->save();

    // ProductAddedEventを発生させる
    event(new ProductAddedEvent($product));

    return redirect("/products/{$product->id}");
}


}



