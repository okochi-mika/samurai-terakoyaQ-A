<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use App\Models\User;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Post>
 */
class PostFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            // 'user_id' => \App\Models\User::factory(), // ← こうすれば自動的にユーザーも一緒に作られる
            'user_id' => 1, // ← こうすれば自動的にユーザーも一緒に作られる
            'title' => fake()->realText(20),
            'content' => fake()->realText(200)
        ];
    }
}