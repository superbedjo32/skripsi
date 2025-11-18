<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Penginapan extends Model
{
    use HasFactory;

    protected $table = 'penginapans';
    protected $primaryKey = 'id_penginapan';

    protected $fillable = [
        'nama_penginapan',
        'alamat',
        'id_kategori',
        'bintang',
        'harga_min',
        'harga_max',
        'deskripsi_singkat',
        'gambar'
    ];

    // Relasi: Penginapan hanya memiliki satu Kategori (Many-to-One)
    public function kategori()
    {
        return $this->belongsTo(Kategori::class, 'id_kategori', 'id_kategori');
    }

    // Relasi: Satu Penginapan memiliki banyak Fasilitas (Many-to-Many)
    public function fasilitas()
    {
        return $this->belongsToMany(
            Fasilitas::class,
            'penginapan_fasilitas', // Nama tabel pivot
            'id_penginapan',        // Foreign key model ini di tabel pivot
            'id_fasilitas'          // Foreign key model target di tabel pivot
        );
    }
}
