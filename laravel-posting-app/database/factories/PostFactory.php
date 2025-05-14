<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use App\Models\User;
use Faker\Factory as FakerFactory; // ← 追加

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Post>
 */
class PostFactory extends Factory
{
    protected $faker; // ← 追加

    public function __construct(...$args)
    {
        parent::__construct(...$args);
        $this->faker = FakerFactory::create('ja_JP'); // ← 日本語設定！
    }

    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'title' => $this->faker->sentence(),   // 日本語のタイトルに！
            'content' => $this->faker->paragraph(), // 日本語の段落に！
            'user_id' => User::inRandomOrder()->first()->id,
        ];
    }
}
