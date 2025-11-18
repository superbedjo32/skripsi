@extends('layouts.app')

@section('content')
    <form action="{{ route('fasilitas.store') }}" method="POST">
        @csrf
        <div class="mb-3">
            <label for="exampleInputEmail1" class="form-label">Nama Fasilitas</label>
            <input type="text" class="form-control" id="nama_fasilitas" name="nama_fasilitas" aria-describedby="emailHelp">
        </div>
        <button type="submit" class="btn btn-primary">Simpan</button>
    </form>
@endsection
