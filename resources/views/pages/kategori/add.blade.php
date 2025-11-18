@extends('layouts.app')

@section('content')
    <form action="{{ route('kategori.store') }}" method="POST">
        @csrf
        <div class="mb-3">
            <label for="exampleInputEmail1" class="form-label">Nama Kategori</label>
            <input type="text" class="form-control" id="nama_kategori" name="nama_kategori" aria-describedby="emailHelp">
        </div>
        <button type="submit" class="btn btn-primary">Simpan</button>
    </form>
@endsection
