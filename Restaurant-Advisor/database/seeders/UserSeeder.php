<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('user')->insert([
            'id'  => 1,
            'username'  => "groot",
            'email'  => "groot@gmail.com",
            'name'  => "groot",
            'firstname'  => "grooty",
            'age'  => 2,
            'password' => "azertyui",
        ]);

        DB::table('user')->insert([
            'id'  => 2,
            'username'  => "stitch",
            'email'  => "stitch@gmail.com",
            'name'  => "stitch",
            'firstname'  => "stitchy",
            'age'  => 3,
            'password' => "iuytreza",
        ]);
    }
}
