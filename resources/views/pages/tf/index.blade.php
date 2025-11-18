@extends('layouts.app')

@section('content')
    <div class="container-fluid">
        <!-- Page Heading -->
        <button type="button" data-bs-toggle="modal" data-bs-target="#createModal" class="btn btn-primary mb-4">Tambah
            Data</button>

        <!-- DataTales Example -->
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">TF</h6>
            </div>
            <div class="card-body">
                <div class="table-responsive" style="max-height: 500px; overflow-y: auto;">
                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                        <thead colspan="4">
                            <tr>
                                <th scope="col" class="col-1 text-center">No</th>
                                <th scope="col" class="col-1 text-center">Penginapan</th>
                                @foreach ($kategori as $k)
                                    <th scope="col" class="w-10">{{ $k->nama_kategori }}</th>
                                @endforeach
                                @foreach ($fasilitas as $r)
                                    <th scope="col" class="w-10">{{ $r->nama_fasilitas }}</th>
                                @endforeach
                                <th scope="col" class="col-1 text-center">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($hasil as $item)
                                <tr>
                                    <td>{{ $loop->iteration }}</td>
                                    <td>{{ $item['penginapan'] }}</td>
                                    @foreach ($item['data'] as $val)
                                        <td>{{ $val }}</td>
                                    @endforeach
                                    <td>
                                        <button type="button" class="btn btn-danger"
                                            onclick="deleteTf({{ $item['id'] }})">
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

    <div class="modal fade" id="createModal" tabindex="-1" aria-labelledby="createModal" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5">Tambah Data</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form action="" id="tf_form" method="POST" enctype="multipart/form-data">
                        @csrf
                        <div class="mb-3">
                            <label for="penginapan" class="form-label">Penginapan</label>
                            <select name="penginapan_id" class="form-select">
                                <option disabled selected>Pilih Penginapan</option>
                                @foreach ($penginapan as $value)
                                    <option value="{{ $value->id_penginapan }}">{{ $value->nama_penginapan }}</option>
                                @endforeach
                            </select>
                        </div>
                        <div class="mb-3">
                            <label for="menu" class="form-label">Fasilitas</label>
                            <div class="table-responsive" style="max-height: 500px; overflow-y: auto;">
                                <span id="result"></span>
                                <table class="table table-bordered table-striped" id="fasilitas_table">
                                    <thead>
                                        <tr>
                                            <th width="35%">Fasilitas</th>
                                            <th width="35%">True/False</th>
                                            <th width="30%">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    </tbody>
                                </table>
                            </div>
                        </div>

                        <div class="mb-3">
                            <label for="menu" class="form-label">Kategori</label>
                            <div class="table-responsive" style="max-height: 500px; overflow-y: auto;">
                                <span id="result"></span>
                                <table class="table table-bordered table-striped" id="kategori_table">
                                    <thead>
                                        <tr>
                                            <th width="35%">Kategori</th>
                                            <th width="35%">True/False</th>
                                            <th width="30%">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    </tbody>
                                </table>
                            </div>
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
        function deleteTf(id) {
            if (!confirm("Yakin ingin menghapus data ini?")) return;

            console.log('Menghapus TF ID:', id);
            $.ajax({
                url: '/tf/' + id,
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
            var count_fasilitas = 1;
            var count_kategori = 1;

            $('#createModal').on('shown.bs.modal', function() {
                $('#fasilitas_table tbody').html('');
                $('#kategori_table tbody').html('');

                count_fasilitas = 1;
                count_kategori = 1;

                fasilitas_field(count_fasilitas);
                kategori_field(count_kategori);
            })

            $('.btn-update').on('click', function() {
                let id = $(this).data('id');
                let nama = $(this).data('nama');
                $('#update-id').val(id);
                $('#update-nama').val(nama);
            });

            // var count_fasilitas = 1;
            // fasilitas_field(count_fasilitas);

            function fasilitas_field(number) {
                const daftarfasilitas = @json($fasilitas);

                let html = '<tr>';
                html += '<td><select name="fasilitas_id[]" class="form-select">';
                html += '<option disabled selected>Pilih fasilitas</option>';
                daftarfasilitas.forEach(function(item) {
                    html += `<option value="${item.id_fasilitas}">${item.nama_fasilitas}</option>`;
                });
                html += '</select></td>';
                html +=
                    '<td><select name="fasilitas_value[]" class="form-select"><option disabled selected>Value</option><option value="1">1</option><option value="0">0</option></select></td>';

                if (number > 1) {
                    html +=
                        '<td><button type="button" id="remove_fasilitas" class="btn btn-danger remove">Remove</button></td></tr>';
                    $('#fasilitas_table tbody').append(html);
                } else {
                    html +=
                        '<td><button type="button" id="add_fasilitas" class="btn btn-success">Add</button></td></tr>';
                    $('#fasilitas_table tbody').html(html);
                }
            }

            $(document).on('click', '#add_fasilitas', function() {
                count_fasilitas++;
                fasilitas_field(count_fasilitas);
            });

            $(document).on('click', '#remove_fasilitas', function() {
                count_fasilitas--;
                $(this).closest("tr").remove();
            });


            // var count_kategori = 1;
            // kategori_field(count_kategori);

            function kategori_field(number) {
                const daftarKategori = @json($kategori);
                let html = '<tr>';
                html += '<td><select name="kategori_id[]" class="form-select">';
                html += '<option disabled selected>Pilih Kategori</option>';
                daftarKategori.forEach(function(item) {
                    html += `<option value="${item.id_kategori}">${item.nama_kategori}</option>`;
                });
                html += '</select></td>';
                html +=
                    '<td><select name="kategori_value[]" class="form-select"><option disabled selected>Value</option><option value="1">1</option><option value="0">0</option></select></td>';

                if (number > 1) {
                    html +=
                        '<td><button type="button" id="remove_kategori" class="btn btn-danger remove">Remove</button></td></tr>';
                    $('#kategori_table tbody').append(html);
                } else {
                    html +=
                        '<td><button type="button" id="add_kategori" class="btn btn-success">Add</button></td></tr>';
                    $('#kategori_table tbody').html(html);
                }
            }

            $(document).on('click', '#add_kategori', function() {
                count_kategori++;
                kategori_field(count_kategori);
            });

            $(document).on('click', '#remove_kategori', function() {
                count_kategori--;
                $(this).closest("tr").remove();
            });

            $('#tf_form').on('submit', function(event) {
                event.preventDefault();

                $.ajax({
                    url: '/tf/store', // Sesuaikan dengan route Laravel kamu
                    method: 'POST',
                    data: $(this).serialize(),
                    dataType: 'json',
                    beforeSend: function() {
                        $('#tf_form button[type="submit"]').attr('disabled', true);
                        $('#error-messages').html(''); // Kosongkan error lama
                    },
                    success: function(data) {
                        if (data.success) {
                            window.location.reload();
                            $('#tf_form')[0].reset();
                        } else {
                            $('#error-messages').html(
                                '<div class="alert alert-danger">Terjadi kesalahan.</div>');
                        }
                    },
                    error: function(xhr) {
                        $('#tf_form button[type="submit"]').attr('disabled', false);

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
                        $('#tf_form button[type="submit"]').attr('disabled', false);
                    }
                });
            });


        });
    </script>
@endsection
