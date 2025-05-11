<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Post; // Postモデルを使うための宣言

class PostController extends Controller
{
    // 投稿一覧を表示するアクション
    public function index()
    {
        // postsテーブルからすべてのデータを取得（クエリビルダ）
        $posts = DB::table('posts')->get();

        // ビューにデータを渡す
        return view('posts.index', ['posts' => $posts]);
    }

    // 投稿の詳細を表示するアクション
    public function show($id)
    {
        // Eloquent ORMを使って、idが一致する投稿を取得
        $post = Post::find($id);

        // 投稿が見つからない場合は404エラーを返す
        if (!$post) {
            abort(404, '投稿が見つかりません');
        }

        // ビューにデータを渡して表示
        return view('posts.show', ['post' => $post]);
    }
}
