<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\kategori;

class KategoriController extends Controller
{
    public function index() {
        $kategori = Kategori::all();
        return view('pages.kategori.index', compact('kategori'));
    }

    public function create() {
        return view('pages.kategori.add');
    }

    public function store(Request $request) {
        Kategori::create($request->all());

        return redirect()->route('kategori.index');
    }

    public function edit($id)
    {
        $kategori = Kategori::find($id);
        return view('pages.kategori.edit', compact('kategori'));
    }

    public function update(Request $request, $id)
    {
        $validated = $request->validate([
            'nama_kategori' => 'required|string|max:255',
        ]);

        Kategori::where('id_kategori', $id)->update($validated);

        return redirect()->route('kategori.index')->with('success', 'Data kategori berhasil diperbarui!');
    }

    public function delete($id)
    {
        Kategori::where('id_kategori', $id)->delete();

        return redirect()->route('kategori.index')->with('success', 'Data kategori berhasil dihapus!');
    }
}
