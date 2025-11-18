@extends('layouts.app')

@section('content')
    <div class="container-fluid">
        <!-- Page Heading -->
        <a href="{{ route('penginapan.create') }}" class="btn btn-primary mb-4">Tambah Data</a>

        <!-- DataTales Example -->
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">Penginapan</h6>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                        <thead>
                            <tr>
                                <th>No</th>
                                <th>Nama Penginapan</th>
                                <th>Alamat</th>
                                <th>Kategori</th>
                                <th>Bintang</th>
                                <th>Harga Min</th>
                                <th>Harga Max</th>
                                <th>Deskripsi Singkat</th>
                                <th>Gambar</th>
                                <th>Fasilitas</th>
                                <th>Aksi</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($penginapan as $peng)
                                <tr>
                                    <td>{{ $loop->iteration }}</td>
                                    <td>{{ $peng->nama_penginapan }}</td>
                                    <td>{{ $peng->alamat }}</td>
                                    <td>{{ $peng->kategori->nama_kategori ?? '-' }}</td>
                                    <td>{{ $peng->bintang ?? '-' }}</td>
                                    <td>{{ number_format($peng->harga_min, 0, ',', '.') }}</td>
                                    <td>{{ number_format($peng->harga_max, 0, ',', '.') }}</td>
                                    <td>{{ $peng->deskripsi_singkat }}</td>
                                    <td>
                                        <img src="{{ $peng->gambar ? asset('storage/' . $peng->gambar) : asset('storage/penginapan/no-image.png') }}"
                                            width="120" alt="gambar">
                                    </td>

                                    <td>
                                        @foreach ($peng->fasilitas as $fas)
                                            <span class="badge bg-info text-dark">{{ $fas->nama_fasilitas }}</span>
                                        @endforeach
                                    </td>
                                    <td>
                                        <a href="{{ route('penginapan.edit', $peng->id_penginapan) }}"
                                            class="btn btn-warning btn-sm">Edit</a>

                                        <form action="{{ route('penginapan.delete', $peng->id_penginapan) }}"
                                            method="POST" class="d-inline"
                                            onsubmit="return confirm('Yakin ingin menghapus data ini?')">
                                            @csrf
                                            @method('DELETE')
                                            <button type="submit" class="btn btn-danger btn-sm">Hapus</button>
                                        </form>
                                    </td>
                                </tr>
                            @endforeach
                        </tbody>
                    </table>

                </div>
            </div>
        </div>
    </div>
@endsection
