<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class TfIdf extends Model
{
    use HasFactory;
    protected $table = 'tf_idf';
    protected $fillable = ['penginapan_id', 'tf_id', 'hasil'];

    public function tfIdfFasilitas()
    {
        return $this->hasMany(TfIdfFasilitas::class, 'tf_idf_id'); // ✅ benar
    }

    public function tfIdfKategori()
    {
        return $this->hasMany(TfIdfKategori::class, 'tf_idf_id'); // ✅ benar
    }


    public function tf()
    {
        return $this->belongsTo(Tf::class, 'tf_id');
    }


     public function penginapan()
    {
        return $this->belongsTo(Penginapan::class, 'penginapan_id', 'id_penginapan');
    }
}
