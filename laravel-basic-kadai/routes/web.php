<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\PostController; // PostControllerを使う宣言

Route::get('/', function () {
    return view('welcome');
});

Route::get('/posts', [PostController::class, 'index']); // ← これもOK

// /posts/{id}にアクセスしたとき、PostControllerのshowアクションを実行
Route::get('/posts/{id}', [PostController::class, 'show']);