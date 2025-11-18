<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Idf extends Model
{
    use HasFactory;

    protected $table = 'idf';

    protected $fillable = ['fasilitas_id', 'kategori_id', 'count', 'hasil'];
    public function kategori()
    {
        return $this->belongsTo(Kategori::class, 'kategori_id', 'id_kategori');
    }


    // Relasi ke tabel fasilitas
    public function fasilitas()
    {
        return $this->belongsTo(Fasilitas::class, 'fasilitas_id', 'id_fasilitas');
        // 'id_fasilitas' adalah primary key di tabel fasilitas
    }
}
