<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Fasilitas;

class FasilitasController extends Controller
{
    public function index()
    {
        $fasilitas = Fasilitas::all();
        return view('pages.fasilitas.index', compact('fasilitas'));
    }

    public function create()
    {
        return view('pages.fasilitas.add');
    }

    public function store(Request $request)
    {
        Fasilitas::create($request->all());

        return redirect()->route('fasilitas.index');
    }

    public function edit($id)
    {
        $fasilitas = Fasilitas::find($id);
        return view('pages.fasilitas.edit', compact('fasilitas'));
    }

    public function update(Request $request, $id)
    {
        $validated = $request->validate([
            'nama_fasilitas' => 'required|string|max:255',
        ]);

        Fasilitas::where('id_fasilitas', $id)->update($validated);

        return redirect()->route('fasilitas.index')->with('success', 'Data fasilitas berhasil diperbarui!');
    }

    public function delete($id)
    {
        Fasilitas::where('id_fasilitas', $id)->delete();

        return redirect()->route('fasilitas.index')->with('success', 'Data fasilitas berhasil dihapus!');
    }
}
