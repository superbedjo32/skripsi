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
        Schema::create('tf_idf_kategori', function (Blueprint $table) {
            $table->id();

            $table->unsignedBigInteger('tf_idf_id');
            $table->unsignedBigInteger('kategori_id');

            $table->foreign('tf_idf_id')
                ->references('id')
                ->on('tf_idf')
                ->onDelete('cascade');

            $table->foreign('kategori_id')
                ->references('id_kategori')
                ->on('kategoris')
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
        Schema::dropIfExists('tf_idf_kategori');
    }
};
