<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class TfIdfKategori extends Model
{
    use HasFactory;
    protected $table = 'tf_idf_kategori';

    protected $fillable = [
        'tf_idf_id',
        'kategori_id',
        'value',
    ];

     public function tfIdf()
    {
        return $this->belongsTo(TfIdf::class, 'tf_idf_id');
    }

    public function kategori()
    {
        return $this->belongsTo(Kategori::class, 'kategori_id');
    }
}
