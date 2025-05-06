<?php

use Illuminate\Support\Facades\Route;

// ルーティングを設定するコントローラを宣言する
use App\Http\Controllers\HelloController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\VendorController;
use App\Http\Controllers\RequestController;


/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

// Route::get('/hello", [HElloController::class, 'index']};

Route::get('/products', [ProductController::class, 'index']);

Route::get('/products/{id}', [ProductController::class, 'show']);

Route::get('/requests/create', [RequestController::class, 'create']);

Route::post('/requests/confirm', [RequestController::class, 'confirm'])->name('requests.confirm');

