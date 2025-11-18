<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class TfIdfFasilitas extends Model
{
    use HasFactory;
    protected $table = 'tf_idf_fasilitas';

    protected $fillable = [
        'tf_idf_id',
        'fasilitas_id',
        'value',
    ];

    public function tfIdf()
    {
        return $this->belongsTo(TfIdf::class, 'tf_idf_id'); // <-- pastikan ini juga pakai 'tf_id'
    }

    public function fasilitas()
    {
        return $this->belongsTo(Fasilitas::class, 'fasilitas_id');
    }
}
