<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Kategori;
use App\Models\Fasilitas;
use App\Models\Penginapan;
use App\Models\Idf;

class IDFController extends Controller
{
    public function index()
    {
        $fasilitas = fasilitas::all();
        $kategori = Kategori::all();
        $totalCount = Penginapan::count();

         $idfList = Idf::with(['fasilitas', 'kategori'])->paginate(5);

        // Hitung total value untuk setiap fasilitas
        $fasilitasSummary = [];
        foreach ($fasilitas as $r) {
            $total = \App\Models\TfFasilitas::where('fasilitas_id', $r->id_fasilitas)->sum('value');
            $fasilitasSummary[] = [
                'id_fasilitas' => $r->id_fasilitas,
                'nama_fasilitas' => $r->nama_fasilitas,
                'total' => $total,
            ];
        }

        $kategoriSummary = [];
        foreach ($kategori as $k) {
            $total = \App\Models\TfKategori::where('kategori_id', $k->id_kategori)->sum('value');
            $kategoriSummary[] = [
                'id_kategori' => $k->id_kategori,
                'nama_kategori' => $k->nama_kategori,
                'total' => $total,
            ];
        }


        return view('pages.idf.index', compact('fasilitas', 'kategori', 'fasilitasSummary', 'kategoriSummary', 'totalCount', 'idfList'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'count' => 'required|numeric',
            'type' => 'required|in:fasilitas,kategori',
            'item_id' => 'required'
        ]);

        $inputCount = $request->count;
        $totalCount = Penginapan::count();

        $hasil = log10($totalCount / $inputCount);

        // Siapkan data dasar
        $data = [
            'count' => $inputCount,
            'hasil' => $hasil,
        ];

        // Tambahkan item_id ke kolom sesuai tipe
        if ($request->type === 'fasilitas') {
            $data['fasilitas_id'] = $request->item_id;
        } elseif ($request->type === 'kategori') {
            $data['kategori_id'] = $request->item_id;
        }

        // Simpan ke tabel idf
        $idf = \App\Models\idf::create($data);

        return response()->json([
            'success' => true,
            'message' => 'Data berhasil disimpan',
            'data' => $idf
        ]);
    }

    public function delete($id)
    {
        // Cari data tf berdasarkan id
        $idf = idf::findOrFail($id);

        // Hapus data idf
        $idf->delete();

        return response()->json(['success' => 'Data berhasil dihapus']);
    }
}
