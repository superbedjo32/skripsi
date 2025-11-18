<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('penginapans', function (Blueprint $table) {
            // Kolom Primary Key
            $table->id('id_penginapan'); // id_penginapan (INT, Primary Key)

            // Kolom Data Penginapan
            $table->string('nama_penginapan', 150); // nama_penginapan (VARCHAR)

            // Foreign Key ke Tabel Kategori
            // Diasumsikan tabel 'kategori' sudah ada
            $table->unsignedBigInteger('id_kategori');
            $table->foreign('id_kategori')->references('id_kategori')->on('kategoris')->onDelete('cascade');

            // Kolom Detail Rating dan Harga
            $table->decimal('bintang', 2, 1)->nullable(); // bintang (DECIMAL(2, 1), bisa NULL)
            $table->integer('harga_min'); // harga_min (INT)
            $table->integer('harga_max'); // harga_max (INT)

            // Kolom Deskripsi
            $table->text('deskripsi_singkat')->nullable(); // deskripsi_singkat (TEXT, bisa NULL)

            // Kolom Default Laravel
            $table->timestamps(); // created_at dan updated_at
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('penginapans');
    }
};
