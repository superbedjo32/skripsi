@extends('layouts.app')

@section('content')
    <div class="container-fluid">
        <!-- Page Heading -->
        <a href="{{ route('fasilitas.create') }}" class="btn btn-primary mb-4">Tambah Data</a>

        <!-- DataTales Example -->
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">Fasiltas</h6>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                        <thead>
                            <tr>
                                <th scope="col">No</th>
                                <th scope="col">Nama</th>
                                <th scope="col">Akse</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($fasilitas as $fas)
                                <tr>
                                    <td scope="row">{{ $loop->iteration }}</td>
                                    <td>{{ $fas->nama_fasilitas }}</td>
                                    <td>
                                        <a href="{{ route('fasilitas.edit', $fas->id_fasilitas) }}"
                                            class="btn btn-warning">Edit</a>

                                        <form action="{{ route('fasilitas.delete', $fas->id_fasilitas) }}" method="POST"
                                            class="d-inline" onsubmit="return confirm('Yakin ingin menghapus data ini?')">
                                            @csrf
                                            @method('DELETE')
                                            <button type="submit" class="btn btn-danger">Hapus</button>
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
