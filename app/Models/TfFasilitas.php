<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class TfFasilitas extends Model
{
    use HasFactory;
    protected $table = 'tf_fasilitas';

    protected $fillable = [
        'tf_id',
        'fasilitas_id',
        'value',
    ];

    public function tf()
    {
        return $this->belongsTo(Tf::class, 'tf_id'); // <-- pastikan ini juga pakai 'tf_id'
    }
}
