<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class TfKategori extends Model
{
    use HasFactory;
    protected $table = 'tf_kategori';

    protected $fillable = [
        'tf_id',
        'kategori_id',
        'value',
    ];

     public function tf()
    {
        return $this->belongsTo(Tf::class, 'tf_id');
    }
}
