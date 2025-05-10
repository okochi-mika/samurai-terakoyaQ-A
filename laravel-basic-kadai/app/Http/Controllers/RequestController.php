<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class RequestController extends Controller
{
  public function create() {
        return view('requests.create');
    } 

    public function confirm(Request $request) {
        // HTTPリクエストに含まれる、単一のパラメータの値を取得する     
        $user_name = $request->input('title');
        $message = $request->input('content');

        // HTTPリクエストメソッド（GET、POST、PUT、PATCH、DELETEなど）を取得する
        $method = $request->method();

        // HTTPリクエストのパスを取得する
        $path = $request->path();

        // HTTPリクエストのURLを取得する
        $url = $request->url();

        // HTTPリクエストを送信したクライアントのIPアドレスを取得する
        $ip = $request->ip();

        $variables = [
            'title',
            'content'
        ];

        return view('requests.confirm', compact($variables));
    } 
}
