<?php

namespace App\Http\Controllers;

use App\Models\kategori;
use App\Models\Penginapan;
use App\Models\Fasilitas;
use App\Models\Idf;
use App\Models\TfIdf;

use Illuminate\Http\Request;

class UserPenginapanController extends Controller
{
    public function index()
    {
        $kategori = kategori::all();
        $penginapan = Penginapan::all();
        $fasilitas = Fasilitas::all();
        return view('user.penginapan', compact('kategori', 'penginapan', 'fasilitas'));
    }

    public function rekomendasi(Request $request)
    {
        $kategori = $request->kategori;
        $harga = $request->harga;
        $fasilitas = $request->fasilitas;

        // Ambil IDF kategori
        $idfKategori = Idf::where('kategori_id', $kategori)->value('hasil');

        // Ambil IDF harga
        $idfHarga = Idf::where('kategori_id', $harga)->value('hasil');

        // Ambil IDF fasilitas (bisa banyak)
        $idfFasilitas = Idf::whereIn('fasilitas_id', $fasilitas)
            ->pluck('hasil', 'fasilitas_id'); // [ fasilitas_id => hasil ]

        // Hitung sum(fasilitas^2)
        $sumFasilitas = 0;
        foreach ($idfFasilitas as $value) {
            $sumFasilitas += pow($value, 2);
        }

        // Hitung MAG
        $MAG = sqrt(
            pow($idfKategori, 2) +
                pow($idfHarga, 2) +
                $sumFasilitas
        );

        // Format 4 angka belakang koma
        $MAG = round($MAG, 4);

        $fasilitasData = Fasilitas::all();
        $kategoriData = Kategori::all();
        $tfIdfList = TfIdf::with(['penginapan', 'tfIdfFasilitas', 'tfIdfKategori'])->paginate(100);

        $hasil = [];

        foreach ($tfIdfList as $tf) {

            $dataValues = [];

            // Loop fasilitas
            foreach ($fasilitasData as $f) {
                $match = $tf->tfIdfFasilitas->firstWhere('fasilitas_id', $f->id_fasilitas);
                $dataValues[] = [
                    'fasilitas_id' => $f->id_fasilitas,
                    'value' => $match ? number_format($match->value, 4) : number_format(0, 4)
                ];
            }

            // Loop kategori
            foreach ($kategoriData as $k) {
                $match = $tf->tfIdfKategori->firstWhere('kategori_id', $k->id_kategori);
                $dataValues[] = [
                    'kategori_id' => $k->id_kategori,
                    'value' => $match ? number_format($match->value, 4) : number_format(0, 4)
                ];
            }

            $hasil[] = [
                'id' => $tf->id,
                'id_penginapan' => $tf->penginapan->id_penginapan ?? '-',
                'penginapan' => $tf->penginapan->nama_penginapan ?? '-',
                'hasil' => number_format($tf->hasil, 4),
                'data' => $dataValues
            ];
        }

        // Hitung Cosine Similarity
        $cosineList = [];
        foreach ($hasil as $peng) {
            $dotProduct = 0;

            foreach ($peng['data'] as $item) {
                // Fasilitas
                if (isset($item['fasilitas_id'])) {
                    $id = $item['fasilitas_id'];
                    if (isset($idfFasilitas[$id])) {
                        $dotProduct += floatval($idfFasilitas[$id]) * floatval($item['value']);
                    }
                }

                // Kategori & Harga
                if (isset($item['kategori_id'])) {
                    $id = $item['kategori_id'];
                    if ($id == $kategori) {
                        $dotProduct += floatval($idfKategori) * floatval($item['value']);
                    }
                    if ($id == $harga) {
                        $dotProduct += floatval($idfHarga) * floatval($item['value']);
                    }
                }
            }

            $cosineValue = ($MAG > 0 && floatval($peng['hasil']) > 0)
                ? $dotProduct / ($MAG * floatval($peng['hasil']))
                : 0;

            $cosineList[] = [
                'id' => $peng['id'],
                'id_penginapan' => $peng['id_penginapan'],
                'penginapan' => $peng['penginapan'],
                'cosine_similarity' => round($cosineValue, 4)
            ];
        }

        // Filter > 0.8 dan ambil top 5
        $topCosine = collect($cosineList)
            ->where('cosine_similarity', '>', 0.8)
            ->sortByDesc('cosine_similarity')
            ->take(5)
            ->values();

        $topPenginapanIds = collect($topCosine)->pluck('id_penginapan')->toArray();

        // Ambil data penginapan lengkap sesuai top cosine
        $penginapanTop = Penginapan::whereIn('id_penginapan', $topPenginapanIds)
            ->with(['kategori', 'fasilitas']) // jika mau ambil relasi kategori & fasilitas
            ->get();

        // Gabungkan dengan nilai cosine_similarity
        $topPenginapanData = $penginapanTop->map(function ($item) use ($topCosine) {
            $cosine = collect($topCosine)->firstWhere('id_penginapan', $item->id_penginapan)['cosine_similarity'] ?? 0;
            return [
                'id_penginapan' => $item->id_penginapan,
                'nama_penginapan' => $item->nama_penginapan,
                'alamat' => $item->alamat,
                'bintang' => $item->bintang,
                'harga_min' => $item->harga_min,
                'harga_max' => $item->harga_max,
                'gambar' => $item->gambar,
                'deskripsi_singkat' => $item->deskripsi_singkat,
                'cosine_similarity' => round($cosine, 4),
                'kategori' => $item->kategori->pluck('nama_kategori', 'id_kategori'),
                'fasilitas' => $item->fasilitas->pluck('nama_fasilitas', 'id_fasilitas')
            ];
        });

        // Output
        $data = [
            'kategori' => [
                'id' => $kategori,
                'idf_hasil' => $idfKategori
            ],
            'harga' => [
                'id' => $harga,
                'idf_hasil' => $idfHarga
            ],
            'fasilitas' => $idfFasilitas,
            'MAG' => $MAG,
            'TF_IDF' => $hasil,
            "cosine_similarity" => $cosineList,
            'top_cosine' => $topCosine,
            "top_penginapan" => $topPenginapanData
        ];

        //return response()->json($data);
        return view('user.rekomendasi', compact('topPenginapanData'));
    }
}
