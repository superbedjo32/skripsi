<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Penginapan;

class RekomendasiController extends Controller
{
    public function index(){
        $data = Penginapan::all();
        return view ('user.rekomendasi', compact('data'));
    }
}
