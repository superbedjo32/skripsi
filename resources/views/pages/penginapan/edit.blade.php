@extends('layouts.app')

@section('content')
    <form action="{{ route('penginapan.update', $penginapan->id_penginapan) }}" method="POST" enctype="multipart/form-data">
        @csrf
        @method('PUT')

        <div class="mb-3">
            <label class="form-label">Nama Penginapan</label>
            <input type="text" class="form-control" id="nama_penginapan" name="nama_penginapan"
                value="{{ old('nama_penginapan', $penginapan->nama_penginapan) }}">
        </div>

        <div class="mb-3">
            <label class="form-label">Alamat</label>
            <textarea class="form-control" name="alamat" id="alamat" style="height: 100px">{{ old('alamat', $penginapan->alamat) }}</textarea>
        </div>

        <div class="mb-3">
            <label class="form-label">Kategori</label>
            <select class="form-control" name="id_kategori" id="id_kategori">
                <option disabled>Pilih Kategori</option>
                @foreach ($kategori as $kat)
                    <option value="{{ $kat->id_kategori }}"
                        {{ $penginapan->id_kategori == $kat->id_kategori ? 'selected' : '' }}>
                        {{ $kat->nama_kategori }}
                    </option>
                @endforeach
            </select>
        </div>

        <div class="mb-3">
            <label class="form-label">Fasilitas</label>
            <select class="form-control" multiple name="id_fasilitas[]" id="id_fasilitas">
                @foreach ($fasilitas as $fas)
                    <option value="{{ $fas->id_fasilitas }}"
                        {{ in_array($fas->id_fasilitas, $penginapan->fasilitas->pluck('id_fasilitas')->toArray()) ? 'selected' : '' }}>
                        {{ $fas->nama_fasilitas }}
                    </option>
                @endforeach
            </select>
        </div>

        <div class="mb-3">
            <label class="form-label">Bintang/rating</label>
            <input type="text" class="form-control" name="bintang" value="{{ old('bintang', $penginapan->bintang) }}">
        </div>

        <div class="mb-3">
            <label class="form-label">Harga Minimal</label>
            <input type="text" class="form-control" name="harga_min"
                value="{{ old('harga_min', $penginapan->harga_min) }}">
        </div>

        <div class="mb-3">
            <label class="form-label">Harga Maksimal</label>
            <input type="text" class="form-control" name="harga_max"
                value="{{ old('harga_max', $penginapan->harga_max) }}">
        </div>

        <div class="mb-3">
            <label class="form-label">Deskripsi Singkat</label>
            <textarea class="form-control" name="deskripsi_singkat" style="height: 100px">{{ old('deskripsi_singkat', $penginapan->deskripsi_singkat) }}</textarea>
        </div>
        <div class="mb-3">
            <label for="gambar" class="form-label">Gambar</label>
            <input class="form-control" type="file" id="gambar" name="gambar">
        </div>
        <button type="submit" class="btn btn-primary">Simpan Perubahan</button>
    </form>
@endsection
