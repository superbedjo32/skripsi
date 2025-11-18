@extends('layouts.app')

@section('content')
    <div class="container-fluid">
        <!-- Page Heading -->
        <button type="button" data-bs-toggle="modal"
                            data-bs-target="#create" class="btn btn-primary mb-4">Tambah Data</button>

        <!-- DataTales Example -->
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">TF</h6>
            </div>
            <div class="card-body">
                <div class="table-responsive" style="max-height: 500px; overflow-y: auto;">
                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                        <thead>
                            <tr>
                                <th>No</th>
                                <th>Nama Penginapan</th>
                                @foreach ($fasilitas as $r)
                                    <th scope="col" class="w-10">{{ $r->nama_fasilitas }}</th>
                                @endforeach
                                @foreach ($kategori as $k)
                                    <th scope="col" class="w-10">{{ $k->nama_kategori }}</th>
                                @endforeach
                                <th scope="col" class="col-1 text-center">Magnitudo</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($hasil as $item)
                                <tr>
                                    <td>{{ $loop->iteration + ($tfIdfList->currentPage() - 1) * $tfIdfList->perPage() }}
                                    </td>
                                    <td>{{ $item['penginapan'] }}</td>

                                    @foreach ($item['data'] as $val)
                                        <td class="wrap-text">{{ number_format($val, 4) }}</td>
                                    @endforeach
                                    <td>{{ $item['hasil'] }}</td>

                                    <td>
                                        <button type="button" class="btn btn-danger"
                                            onclick="deleteTfIdf({{ $item['id'] }})">
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
                    <form action="" id="tf_idf_form" method="POST" enctype="multipart/form-data">
                        @csrf
                        <div class="mb-3">
                            <label for="penginapan" class="form-label">penginapan</label>
                            <select name="penginapan_id" class="form-select">
                                <option disabled selected>Pilih penginapan</option>
                                @foreach ($penginapan as $value)
                                    <option value="{{ $value->id_penginapan }}">{{ $value->nama_penginapan }}</option>
                                @endforeach
                            </select>
                        </div>
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-primary">Hitung</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script>
        function deleteTfIdf(id) {
                if (!confirm("Yakin ingin menghapus data ini?")) return;

                console.log('Menghapus TF ID:', id);
                $.ajax({
                    url: '/tfidf/' + id,
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
        $('#tf_idf_form').on('submit', function(event) {
            event.preventDefault();

            $.ajax({
                url: '/tfidf/store', // Sesuaikan dengan route Laravel kamu
                method: 'POST',
                data: $(this).serialize(),
                dataType: 'json',
                beforeSend: function() {
                    $('#tf_idf_form button[type="submit"]').attr('disabled', true);
                    $('#error-messages').html(''); // Kosongkan error lama
                },
                success: function(data) {
                    if (data.success) {
                        window.location.reload();
                        $('#tf_idf_form')[0].reset();
                    } else {
                        $('#error-messages').html(
                            '<div class="alert alert-danger">Terjadi kesalahan.</div>');
                    }
                },
                error: function(xhr) {
                    $('#tf_idf_form button[type="submit"]').attr('disabled', false);

                    if (xhr.status === 422) {
                        // Laravel validation error
                        let errors = xhr.responseJSON.errors;
                        let html = '<div class="alert alert-danger"><ul>';
                        $.each(errors, function(key, value) {
                            html += '<li>' + value[0] + '</li>';
                        });
                        html += '</ul></div>';
                        $('#error-messages').html(html);
                    } else {
                        // Error selain 422
                        console.error(xhr);
                        $('#error-messages').html(
                            '<div class="alert alert-danger">Terjadi kesalahan server.</div>'
                        );
                    }
                },
                complete: function() {
                    $('#tf_idf_form button[type="submit"]').attr('disabled', false);
                }
            });
        });
    </script>
@endsection
