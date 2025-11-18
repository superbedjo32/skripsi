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
        Schema::create('tf_idf_fasilitas', function (Blueprint $table) {
            $table->id();

            $table->unsignedBigInteger('tf_idf_id');
            $table->unsignedBigInteger('fasilitas_id');

            $table->foreign('tf_idf_id')
                ->references('id')
                ->on('tf_idf')
                ->onDelete('cascade');

            $table->foreign('fasilitas_id')
                ->references('id_fasilitas') // sesuaikan PK tabel fasilitas
                ->on('fasilitas')
                ->onDelete('cascade');

            $table->decimal('value', 8, 4);
            $table->timestamps();
        });

    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('tf_idf_fasilitas');
    }
};
