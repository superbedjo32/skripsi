@extends('layouts.app')

@section('content')
    <div class="container-fluid">
        <!-- Page Heading -->
        <button type="button" data-bs-toggle="modal" data-bs-target="#create" class="btn btn-primary mb-4">Tambah Data</button>

        <!-- DataTales Example -->
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">IDF</h6>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                        <thead>
                            <tr>
                                <th>No</th>
                                <th>Kategori</th>
                                <th>Fasilitas</th>
                                <th>Perhitungan</th>
                                <th>Hasil</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($idfList as $item)
                                <tr>
                                    <td>{{ $loop->iteration + ($idfList->currentPage() - 1) * $idfList->perPage() }}</td>
                                    <td>{{ $item->kategori->nama_kategori ?? '-' }}</td>
                                    <td>{{ $item->fasilitas->nama_fasilitas ?? '-' }}</td>
                                    <td>Log10({{ $totalCount }}/{{ $item->count }})</td>
                                    <td>{{ $item->hasil }}</td>
                                    <td>
                                        <button type="button" class="btn btn-danger"
                                            onclick="deleteIdf({{ $item->id }})">
                                            <i class='bx bx-trash'></i>
                                        </button>
                                    </td>
                                </tr>
                            @endforeach

                        </tbody>
                    </table>

                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="create" tabindex="-1" aria-labelledby="create" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="create">Tambah Data</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form action="" id="idf_form" method="POST" enctype="multipart/form-data">
                        @csrf
                        <div class="mb-3">
                            <label for="penginapan" class="form-label">Tipe</label>
                            <select name="type" id="type" class="form-select penginapan-select">
                                <option disabled selected>Pilih Penginapan</option>
                                <option value="fasilitas">fasilitas</option>
                                <option value="kategori">Kategori</option>
                            </select>
                        </div>

                        <div class="mb-3">
                            <label for="list" class="form-label">List</label>
                            <select name="item_id" id="item_id" class="form-select">
                                <option disabled selected>Pilih List</option>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label for="count" class="form-label">Count</label>
                            <input type="text" class="form-control" name="count" id="count" readonly>
                            <div class="invalid-feedback"></div>
                        </div>
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-primary">Simpan</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script>
        function deleteIdf(id) {
            if (!confirm("Yakin ingin menghapus data ini?")) return;

            console.log('Menghapus IDF ID:', id);
            $.ajax({
                url: '/idf/' + id,
                type: 'DELETE',
                data: {
                    _token: '{{ csrf_token() }}'
                },
                success: function(response) {
                    alert(response.success);
                    location.reload();
                },
                error: function(xhr) {
                    alert('Gagal menghapus data');
                }
            });
        }
        $(document).ready(function() {
            const daftarFasilitas = @json($fasilitas);
            const daftarKategori = @json($kategori);
            const fasilitasSummary = @json($fasilitasSummary);
            const kategoriSummary = @json($kategoriSummary);

            $('.penginapan-select').on('change', function() {
                const value = $(this).val();
                const $list = $(this).closest('form').find('#item_id');
                const $count = $(this).closest('form').find('#count');
                $list.empty();
                $count.val(''); // kosongkan count

                $list.append('<option disabled selected>Pilih List</option>');

                if (value === 'fasilitas') {
                    daftarFasilitas.forEach(function(item) {
                        $list.append(
                            `<option value="${item.id_fasilitas}">${item.nama_fasilitas}</option>`
                            );
                    });
                } else if (value === 'kategori') {
                    daftarKategori.forEach(function(item) {
                        $list.append(
                            `<option value="${item.id_kategori}">${item.nama_kategori}</option>`
                            );
                    });
                }
            });

            $('#item_id').on('change', function() {
                const penginapanType = $('.penginapan-select').val();
                const selectedId = $(this).val();
                let total = 0;

                if (penginapanType === 'fasilitas') {
                    const found = fasilitasSummary.find(item => item.id_fasilitas == selectedId);
                    total = found ? found.total : 0;
                } else if (penginapanType === 'kategori') {
                    const found = kategoriSummary.find(item => item.id_kategori == selectedId);
                    total = found ? found.total : 0;
                }

                $('#count').val(total);
            });

            $('#idf_form').on('submit', function(e) {
                e.preventDefault();

                $.ajax({
                    url: '/idf/store',
                    type: 'POST',
                    data: {
                        _token: '{{ csrf_token() }}',
                        count: $('#count').val(),
                        type: $('#type').val(),
                        item_id: $('#item_id').val(),
                    },
                    success: function(response) {
                        window.location.reload();
                    },
                    error: function(xhr) {
                        alert('Gagal menyimpan data');
                    }
                });

            });
        });
    </script>
@endsection
