<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Post; // Postモデルを使う

class PostController extends Controller
{
    // 投稿作成フォームを表示するアクション
    public function create()
    {
        return view('posts.create');
    }

    // 投稿データを保存するアクション
    public function store(Request $request)
    {
        // バリデーション
        $validated = $request->validate([
            'title' => 'required|max:20',
            'content' => 'required|max:200',
        ]);

        // postsテーブルに保存
        Post::create([
            'title' => $validated['title'],
            'content' => $validated['content'],
        ]);

        // 投稿一覧ページへリダイレクト
        return redirect('/posts');
    }

    // 投稿一覧ページを表示するアクション
    public function index()
    {
        // 投稿データを取得
        $posts = Post::all();


    // デバッグ: 取得したデータをログに出力する
    \Log::info($posts);
    

        // ビューにデータを渡して表示
        return view('posts.index', compact('posts'));
    }
}
