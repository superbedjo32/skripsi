@extends('layouts.app')

@section('content')
    <form action="{{ route('penginapan.store') }}" method="POST" enctype="multipart/form-data">
        @csrf
        <div class="mb-3">
            <label for="exampleInputEmail1" class="form-label">Nama Penginapan</label>
            <input type="text" class="form-control" id="nama_penginapan" name="nama_penginapan" aria-describedby="emailHelp">
        </div>
        <div class="mb-3">
            <label for="exampleInputEmail1" class="form-label">Alamat</label>
            <textarea class="form-control" placeholder="Alamat" id="alamat" name="alamat" style="height: 100px"></textarea>
        </div>
        <div class="mb-3">
            <label for="exampleInputEmail1" class="form-label">Kategori</label>
            <select class="form-control" aria-label="Kategori" name="id_kategori" id="id_kategori">
                <option selected disabled>Pilih Kategori</option>
                @foreach ($kategori as $kat)
                    <option value="{{ $kat->id_kategori }}">{{ $kat->nama_kategori }}</option>
                @endforeach
            </select>
        </div>
        <div class="mb-3">
            <label for="exampleInputEmail1" class="form-label">Fasilitas</label>
            <select class="form-control" multiple aria-label="Fasilitas" name="id_fasilitas[]" id="id_fasilitas">
                @foreach ($fasilitas as $fas)
                    <option value="{{ $fas->id_fasilitas }}">{{ $fas->nama_fasilitas }}</option>
                @endforeach
            </select>
        </div>
        <div class="mb-3">
            <label for="exampleInputEmail1" class="form-label">Bintang/rating</label>
            <input type="text" class="form-control" id="bintang" name="bintang" aria-describedby="emailHelp">
        </div>
        <div class="mb-3">
            <label for="exampleInputEmail1" class="form-label">Harga Minimal</label>
            <input type="text" class="form-control" id="harga_min" name="harga_min" aria-describedby="emailHelp">
        </div>
        <div class="mb-3">
            <label for="exampleInputEmail1" class="form-label">Harga Maksimal</label>
            <input type="text" class="form-control" id="harga_max" name="harga_max" aria-describedby="emailHelp">
        </div>
        <div class="mb-3">
            <label for="exampleInputEmail1" class="form-label">Deskripsi Singkat</label>
            <textarea class="form-control" placeholder="Deskripsi singkat" id="deskripsi_singkat" name="deskripsi_singkat"
                style="height: 100px"></textarea>
        </div>
        <div class="mb-3">
            <label for="gambar" class="form-label">Gambar</label>
            <input class="form-control" type="file" id="gambar" name="gambar">
        </div>
        <button type="submit" class="btn btn-primary">Simpan</button>
    </form>
@endsection
