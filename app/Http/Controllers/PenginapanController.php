<?php

namespace App\Http\Controllers;

use App\Models\Penginapan;
use Illuminate\Http\Request;
use App\Models\Fasilitas;
use App\Models\kategori;
use Illuminate\Support\Facades\Storage;

class PenginapanController extends Controller
{
    public function index()
    {
        // Load juga relasi kategori dan fasilitas agar tidak N+1 query
        $penginapan = Penginapan::with(['kategori', 'fasilitas'])->get();

        return view('pages.penginapan.index', compact('penginapan'));
    }

    public function create()
    {
        $fasilitas = Fasilitas::all();
        $kategori = Kategori::all();
        return view('pages.penginapan.add', compact('fasilitas', 'kategori'));
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'nama_penginapan'    => 'required|string|max:255',
            'alamat'             => 'required|string',
            'id_kategori'        => 'required|integer',
            'bintang'            => 'nullable|string|max:10',
            'harga_min'          => 'nullable|numeric',
            'harga_max'          => 'nullable|numeric',
            'deskripsi_singkat'  => 'nullable|string',
            'id_fasilitas'       => 'array',
            'gambar'             => 'nullable|image|mimes:jpg,jpeg,png,webp|max:2048'
        ]);

        // Upload Gambar (Jika Ada)
        $pathGambar = null;
        if ($request->hasFile('gambar')) {
            $pathGambar = $request->file('gambar')->store('penginapan', 'public');
            // Folder: storage/app/public/penginapan
            // URL: /storage/penginapan/xxxx.jpg
        }

        // Simpan penginapan utama
        $penginapan = Penginapan::create([
            'nama_penginapan'   => $validated['nama_penginapan'],
            'alamat'            => $validated['alamat'],
            'id_kategori'       => $validated['id_kategori'],
            'bintang'           => $validated['bintang'] ?? null,
            'harga_min'         => $validated['harga_min'] ?? null,
            'harga_max'         => $validated['harga_max'] ?? null,
            'deskripsi_singkat' => $validated['deskripsi_singkat'] ?? null,
            'gambar'            => $pathGambar,
        ]);

        // Simpan relasi fasilitas (jika ada)
        if (!empty($validated['id_fasilitas'])) {
            $penginapan->fasilitas()->attach($validated['id_fasilitas']);
        }

        return redirect()->route('penginapan.index')
            ->with('success', 'Data penginapan berhasil ditambahkan!');
    }

    public function edit($id)
    {
        $penginapan = Penginapan::with('fasilitas')->findOrFail($id);
        $fasilitas = Fasilitas::all();
        $kategori = Kategori::all();

        return view('pages.penginapan.edit', compact('penginapan', 'fasilitas', 'kategori'));
    }

    public function update(Request $request, $id)
    {
        // Validasi input
        $validated = $request->validate([
            'nama_penginapan'   => 'required|string|max:255',
            'alamat'            => 'required|string',
            'id_kategori'       => 'required|integer',
            'bintang'           => 'nullable|string|max:10',
            'harga_min'         => 'nullable|numeric',
            'harga_max'         => 'nullable|numeric',
            'deskripsi_singkat' => 'nullable|string',
            'id_fasilitas'      => 'array',
            'gambar'            => 'nullable|image|mimes:jpg,jpeg,png,webp|max:2048' // ✅ validasi gambar
        ]);

        // Cari data penginapan
        $penginapan = Penginapan::findOrFail($id);

        // Jika ada file gambar baru
        if ($request->hasFile('gambar')) {

            // Hapus gambar lama jika ada dan tidak memakai default/no-image
            if ($penginapan->gambar && Storage::disk('public')->exists($penginapan->gambar)) {
                Storage::disk('public')->delete($penginapan->gambar);
            }

            // Upload gambar baru
            $pathGambar = $request->file('gambar')->store('penginapan', 'public');
            $penginapan->gambar = $pathGambar; // simpan path baru
        }

        // Update data text
        $penginapan->update([
            'nama_penginapan'   => $validated['nama_penginapan'],
            'alamat'            => $validated['alamat'],
            'id_kategori'       => $validated['id_kategori'],
            'bintang'           => $validated['bintang'] ?? null,
            'harga_min'         => $validated['harga_min'] ?? null,
            'harga_max'         => $validated['harga_max'] ?? null,
            'deskripsi_singkat' => $validated['deskripsi_singkat'] ?? null,
            'gambar'            => $penginapan->gambar,
        ]);

        // Update relasi fasilitas (sync)
        if (!empty($validated['id_fasilitas'])) {
            $penginapan->fasilitas()->sync($validated['id_fasilitas']);
        } else {
            $penginapan->fasilitas()->sync([]);
        }

        return redirect()->route('penginapan.index')
            ->with('success', 'Data penginapan berhasil diperbarui!');
    }

    public function delete($id)
    {
        // Cari penginapan
        $penginapan = Penginapan::findOrFail($id);

        // Hapus gambar jika ada (dan bukan default)
        if ($penginapan->gambar && Storage::disk('public')->exists($penginapan->gambar)) {
            Storage::disk('public')->delete($penginapan->gambar);
        }

        // Hapus relasi tabel pivot
        $penginapan->fasilitas()->detach();

        // Hapus record penginapan
        $penginapan->delete();

        return redirect()->route('penginapan.index')
            ->with('success', 'Data penginapan berhasil dihapus!');
    }
}
