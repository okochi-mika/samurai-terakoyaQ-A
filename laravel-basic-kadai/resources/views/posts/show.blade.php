<!-- resources/views/posts/show.blade.php -->
<p><strong>ID</strong> {{ $post->id }}</p>
<p><strong>タイトル</strong>{{ $post->title }}</p>
<p><strong>本文</strong>{{ $post->content }}</p>
<p><strong>作成日時</strong>{{ $post->created_at }}</p>
<p><strong>更新日時</strong>{{ $post->updated_at }}</p>
