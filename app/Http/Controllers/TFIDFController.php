<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Kategori;
use App\Models\Fasilitas;
use App\Models\Penginapan;
use App\Models\TfIdf;
use App\Models\Tf;
use App\Models\TfIdfFasilitas;
use App\Models\TfIdfKategori;
use App\Models\Idf;

class TFIDFController extends Controller
{
    public function index()
    {
        $fasilitas = Fasilitas::all();
        $kategori = Kategori::all();
        $penginapan = Penginapan::all();
        $tfIdfList = TfIdf::with(['penginapan', 'tfIdfFasilitas', 'tfIdfKategori'])->paginate(100);

        $hasil = [];

        foreach ($tfIdfList as $tf) {
            $fasilitasValues = [];
            foreach ($fasilitas as $r) {
                $match = $tf->tfIdffasilitas->firstWhere('fasilitas_id', $r->id_fasilitas);
                $fasilitasValues[] = $match ? $match->value : 0;
            }

            $kategoriValues = [];
            foreach ($kategori as $k) {
                $match = $tf->tfIdfKategori->firstWhere('kategori_id', $k->id_kategori);
                $kategoriValues[] = $match ? $match->value : 0;
            }

            $hasil[] = [
                'id' => $tf->id,
                'penginapan' => $tf->penginapan->nama_penginapan ?? '-',
                'hasil' => $tf->hasil,
                'data' => array_merge($fasilitasValues, $kategoriValues)
            ];
        }

        return view('pages.tfidf.index', compact('fasilitas', 'kategori', 'penginapan', 'hasil', 'tfIdfList'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'penginapan_id' => 'required',
        ]);

        $fasilitas = Fasilitas::all();
        $kategori = Kategori::all();

        $tf = Tf::with(['penginapan', 'tfFasilitas', 'tfKategori'])
            ->where('penginapan_id', $request->penginapan_id)
            ->first();

            // dd($tf);
        if (!$tf) {
            return response()->json([
                'success' => false,
                'message' => 'Data tidak ditemukan'
            ], 404);
        }

        // --- FASILITAS ---
        $fasilitasValues = [];
        foreach ($fasilitas as $r) {
            $match = $tf->tfFasilitas->firstWhere('fasilitas_id', $r->id_fasilitas);
            $value = $match ? $match->value : 0;
            $fasilitasValues[] = [
                'fasilitas_id' => $r->id_fasilitas,
                'nama' => $r->nama_fasilitas,
                'value' => $value
            ];
        }

        $idffasilitas = Idf::whereNotNull('fasilitas_id')->with('fasilitas')->get();
        $idfDatafasilitas = $idffasilitas->map(function ($item) {
            return [
                'fasilitas_id' => $item->fasilitas_id,
                'nama' => $item->fasilitas->nama_fasilitas ?? null,
                'hasil' => $item->hasil
            ];
        });

        $tfidffasilitas = [];
        foreach ($fasilitasValues as $fasilitasItem) {
            $idfMatch = $idfDatafasilitas->firstWhere('fasilitas_id', $fasilitasItem['fasilitas_id']);
            $idfValue = $idfMatch ? $idfMatch['hasil'] : 0;
            $tfidffasilitas[] = [
                'fasilitas_id' => $fasilitasItem['fasilitas_id'],
                'nama' => $fasilitasItem['nama'],
                'tf' => $fasilitasItem['value'],
                'idf' => $idfValue,
                'tf_idf' => $fasilitasItem['value'] * $idfValue
            ];
        }

        // --- KATEGORI ---
        $kategoriValues = [];
        foreach ($kategori as $k) {
            $match = $tf->tfKategori->firstWhere('kategori_id', $k->id_kategori);
            $value = $match ? $match->value : 0;
            $kategoriValues[] = [
                'kategori_id' => $k->id_kategori,
                'nama' => $k->nama_kategori,
                'value' => $value
            ];
        }

        $idfKategori = Idf::whereNotNull('kategori_id')->with('kategori')->get();
        $idfDataKategori = $idfKategori->map(function ($item) {
            return [
                'kategori_id' => $item->kategori_id,
                'nama' => $item->kategori->nama_kategori ?? null,
                'hasil' => $item->hasil
            ];
        });

        $tfidfKategori = [];
        foreach ($kategoriValues as $katItem) {
            $idfMatch = $idfDataKategori->firstWhere('kategori_id', $katItem['kategori_id']);
            $idfValue = $idfMatch ? $idfMatch['hasil'] : 0;
            $tfidfKategori[] = [
                'kategori_id' => $katItem['kategori_id'],
                'nama' => $katItem['nama'],
                'tf' => $katItem['value'],
                'idf' => $idfValue,
                'tf_idf' => $katItem['value'] * $idfValue
            ];
        }

        // --- SIMPAN KE tf_idf ---
        $hasil = sqrt(
            collect($tfidffasilitas)->sum(fn($item) => pow($item['tf_idf'], 2)) +
                collect($tfidfKategori)->sum(fn($item) => pow($item['tf_idf'], 2))
        );

        $tfIdfModel = TfIdf::create([
            'penginapan_id' => $request->penginapan_id,
            'tf_id' => $tf->id,
            'hasil' => $hasil
        ]);

        foreach ($tfidffasilitas as $item) {
            TfIdfFasilitas::create([
                'tf_idf_id' => $tfIdfModel->id,
                'fasilitas_id' => $item['fasilitas_id'],
                'value' => $item['tf_idf']
            ]);
        }

        foreach ($tfidfKategori as $item) {
            TfIdfKategori::create([
                'tf_idf_id' => $tfIdfModel->id,
                'kategori_id' => $item['kategori_id'],
                'value' => $item['tf_idf']
            ]);
        }

        return response()->json([
            'success' => true,
            'penginapan' => $tf->penginapan->nama_penginapan,
            'hasil_fasilitas' => $fasilitasValues,
            'hasil_kategori' => $kategoriValues,
            'idf_fasilitas' => $idfDatafasilitas,
            'idf_kategori' => $idfDataKategori,
            'tf_idf_fasilitas' => $tfidffasilitas,
            'tf_idf_kategori' => $tfidfKategori
        ]);
    }

    public function delete($id)
    {
        // Cari data tf berdasarkan id
        $tf = TfIdf::findOrFail($id);

        // Hapus dulu data terkait di tf_rasa dan tf_kategori
        $tf->tfIdfFasilitas()->delete();
        $tf->tfIdfKategori()->delete();

        // Hapus data tf
        $tf->delete();

        return response()->json(['success' => 'Data berhasil dihapus']);
    }
}
