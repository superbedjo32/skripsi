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
        Schema::create('tf_fasilitas', function (Blueprint $table) {
            $table->id();

            $table->unsignedBigInteger('tf_id');
            $table->unsignedBigInteger('fasilitas_id');

            $table->foreign('tf_id')
                ->references('id')
                ->on('tf')
                ->onDelete('cascade');

            $table->foreign('fasilitas_id')
                ->references('id_fasilitas') // sesuaikan dengan PK tabel fasilitas
                ->on('fasilitas')
                ->onDelete('cascade');

            $table->integer('value');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('tf_fasilitas');
    }
};
