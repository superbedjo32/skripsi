<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        // 1. Tabel Fasilitas
        Schema::create('fasilitas', function (Blueprint $table) {
            $table->id('id_fasilitas'); // Primary Key: id_fasilitas
            $table->string('nama_fasilitas', 50)->unique(); // Contoh: Kolam Renang, Ruang Rapat
            $table->timestamps();
        });

        // 2. Tabel Penghubung (Pivot Table)
        Schema::create('penginapan_fasilitas', function (Blueprint $table) {
            // Kolom Foreign Key ke Penginapan dan Fasilitas
            $table->foreignId('id_penginapan')->constrained('penginapans', 'id_penginapan')->onDelete('cascade');
            $table->foreignId('id_fasilitas')->constrained('fasilitas', 'id_fasilitas')->onDelete('cascade');

            // Membuat kombinasi id_penginapan dan id_fasilitas menjadi Primary Key
            $table->primary(['id_penginapan', 'id_fasilitas']);

            // Tidak perlu timestamps pada tabel pivot sederhana
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('penginapan_fasilitas');
        Schema::dropIfExists('fasilitas');
    }
};
