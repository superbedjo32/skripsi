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
        Schema::create('idf', function (Blueprint $table) {
            $table->id();

            $table->unsignedBigInteger('kategori_id')->nullable();
            $table->unsignedBigInteger('fasilitas_id')->nullable();

            $table->foreign('kategori_id')
                ->references('id_kategori')
                ->on('kategoris')
                ->onDelete('set null');

            $table->foreign('fasilitas_id')
                ->references('id_fasilitas')
                ->on('fasilitas')
                ->onDelete('set null');

            $table->integer('count');
            $table->decimal('hasil', 8, 4);

            $table->timestamps();
        });

    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('idf');
    }
};
