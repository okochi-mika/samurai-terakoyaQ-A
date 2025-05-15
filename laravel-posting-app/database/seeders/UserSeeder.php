<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
    
        DB::table('users')->insert([
            'name' => '大髙知 三佳',
            'email' => 'hiyoko_m@icloud.com',
            'email_verified_at' => '2023-06-01 00:00:00',
            'password' => bcrypt('Mika0110'),
            'remember_token' => Str::random(10),
            'created_at' => now(),
            'updated_at' => now()
        ]);

    }
}
