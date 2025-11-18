<?php

namespace App\Http\Controllers;

use App\Models\TfFasilitas;
use Illuminate\Http\Request;
use App\Models\Kategori;
use App\Models\Fasilitas;
use App\Models\Penginapan;
use App\Models\Tf;
use App\Models\TfKategori;

class TfController extends Controller
{
    public function index()
    {
        $fasilitas = Fasilitas::all(['id_fasilitas', 'nama_fasilitas']);
        $kategori = Kategori::all(['id_kategori', 'nama_kategori']);
        $penginapan = Penginapan::all();

        $tfList = Tf::with(['penginapan', 'tfFasilitas', 'tfKategori'])->get();

        $hasil = [];

        foreach ($tfList as $tf) {
            $fasilitasValues = [];
            foreach ($fasilitas as $r) {
                $match = $tf->tfFasilitas->firstWhere('fasilitas_id', $r->id_fasilitas); // ✅
                $fasilitasValues[] = $match ? $match->value : 0;
            }

            $kategoriValues = [];
            foreach ($kategori as $k) {
                $match = $tf->tfKategori->firstWhere('kategori_id', $k->id_kategori); // ✅
                $kategoriValues[] = $match ? $match->value : 0;
            }

            $hasil[] = [
                'id' => $tf->id,
                'penginapan' => $tf->penginapan->nama_penginapan,
                'data' => array_merge($kategoriValues, $fasilitasValues)
            ];
        }

        return view('pages.tf.index', [
            'hasil' => $hasil,
            'fasilitas' => $fasilitas,
            'kategori' => $kategori,
            'penginapan' => $penginapan,
            'tfList' => $tfList
        ]);
    }

    public function store(Request $request)
    {
        $tf = TF::create([
            'penginapan_id' => $request->penginapan_id
        ]);

        foreach ($request->fasilitas_id as $index => $fasilitas_id) {
            TfFasilitas::create([
                'tf_id' => $tf->id,
                'fasilitas_id' => $fasilitas_id,
                'value' => $request->fasilitas_value[$index]
            ]);
        }

        foreach ($request->kategori_id as $index => $kategori_id) {
            TfKategori::create([
                'tf_id' => $tf->id,
                'kategori_id' => $kategori_id,
                'value' => $request->kategori_value[$index]
            ]);
        }

        return response()->json(['success' => 'Data berhasil disimpan']);
    }

    public function destroy($id)
    {
        // Cari data tf berdasarkan id
        $tf = Tf::findOrFail($id);

        // Hapus dulu data terkait di tf_rasa dan tf_kategori
        $tf->tfFasilitas()->delete();
        $tf->tfKategori()->delete();

        // Hapus data tf
        $tf->delete();

        return response()->json(['success' => 'Data berhasil dihapus']);
    }
}
