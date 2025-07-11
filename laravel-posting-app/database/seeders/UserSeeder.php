<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Support\Facades\Hash;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        //
        $user = new User();
        $user->name = "'大髙知 三佳";
        $user->email = 'hiyoko_m@icloud.com';
        $user->email_verified_at = Carbon::now();
        $user->password = Hash::make('Mika0110');
        $user->save();
    }
}