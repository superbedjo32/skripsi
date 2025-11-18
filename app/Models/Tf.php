<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use App\Models\Penginapan;
use App\Models\TfKategori;
use App\Models\TfFasilitas;

class Tf extends Model
{
    use HasFactory;
    protected $table = 'tf';
    protected $fillable = ['penginapan_id'];

    public function tfFasilitas()
    {
        return $this->hasMany(TfFasilitas::class, 'tf_id');
    }

    public function tfKategori()
    {
        return $this->hasMany(TfKategori::class, 'tf_id');
    }

    public function penginapan()
    {
        return $this->belongsTo(Penginapan::class, 'penginapan_id', 'id_penginapan');
    }

}
