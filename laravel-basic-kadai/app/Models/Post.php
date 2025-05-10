<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Post extends Model
{
    // この2つのカラムだけに保存を許可する
    protected $fillable = ['title', 'content'];
}
