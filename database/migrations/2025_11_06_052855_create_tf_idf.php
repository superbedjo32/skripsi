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
        Schema::create('tf_idf', function (Blueprint $table) {
            $table->id();

            $table->unsignedBigInteger('penginapan_id');
            $table->unsignedBigInteger('tf_id');

            $table->foreign('penginapan_id')
                ->references('id_penginapan')
                ->on('penginapans')
                ->onDelete('cascade');

            $table->foreign('tf_id')
                ->references('id')
                ->on('tf')
                ->onDelete('cascade');

            $table->decimal('hasil', 8, 4);
            $table->timestamps();
        });

    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('tf_idf');
    }
};
