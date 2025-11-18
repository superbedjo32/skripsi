<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class FasilitasSeeder extends Seeder
{
    public function run(): void
    {
        DB::table('fasilitas')->insert([
            ['id_fasilitas' => 1, 'nama_fasilitas' => 'Televisi'],
            ['id_fasilitas' => 2, 'nama_fasilitas' => 'Wi-Fi'],
            ['id_fasilitas' => 3, 'nama_fasilitas' => 'Kolam Renang'],
            ['id_fasilitas' => 4, 'nama_fasilitas' => 'Restoran'],
        ]);
    }
}
