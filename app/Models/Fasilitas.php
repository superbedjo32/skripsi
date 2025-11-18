<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Fasilitas extends Model
{
    use HasFactory;

    protected $table = 'fasilitas';
    protected $primaryKey = 'id_fasilitas';

    protected $fillable = [
        'nama_fasilitas',
    ];

    // Relasi: Banyak Fasilitas dimiliki oleh banyak Penginapan (Many-to-Many)
    public function penginapan()
    {
        return $this->belongsToMany(
            Penginapan::class,
            'penginapan_fasilitas', // Nama tabel pivot
            'id_fasilitas',         // Foreign key model ini di tabel pivot
            'id_penginapan'         // Foreign key model target di tabel pivot
        );
    }
}
