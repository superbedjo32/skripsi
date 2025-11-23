@extends('layouts.user')

@section('title', 'Rekomendasi Penginapan - B-AREA')

@section('content')
    <div class="container mx-auto px-6 py-12 text-center">
        <h1 class="text-3xl md:text-4xl font-bold text-gray-800 mb-4">
            Rekomendasi Penginapan
        </h1>
    </div>

    <div class="container mx-auto px-6 pb-12">
        @php
            $list = isset($topPenginapanData) ? $topPenginapanData : $data;
            $hasData = $list->count() ?? count($list) > 0;
        @endphp

        @if ($hasData)
            <!-- ADA DATA → Tampilkan Grid Rekomendasi -->
            <div class="grid grid-cols-1 md:grid-cols-3 gap-8 max-w-6xl mx-auto">

                @php $nomor = 1; @endphp

                @foreach ($list as $peng)
                    @php
                        $gambar = isset($peng['gambar'])
                            ? ($peng['gambar']
                                ? asset('storage/' . $peng['gambar'])
                                : asset('storage/penginapan/no-image.png'))
                            : ($peng->gambar
                                ? asset('storage/' . $peng->gambar)
                                : asset('storage/penginapan/no-image.png'));

                        $nama = $peng['nama_penginapan'] ?? $peng->nama_penginapan;
                        $deskripsi = $peng['deskripsi_singkat'] ?? $peng->deskripsi_singkat;
                        $alamat = $peng['alamat'] ?? $peng->alamat;
                        $min = $peng['harga_min'] ?? $peng->harga_min;
                        $max = $peng['harga_max'] ?? $peng->harga_max;
                        $bintang = $peng['bintang'] ?? ($peng->bintang ?? 0);
                    @endphp

                    <!-- CARD DENGAN NOMOR URUT -->
                    <div x-data="{ open: false }"
                        class="relative bg-white rounded-lg shadow-md overflow-hidden flex flex-col h-full">

                        <!-- NOMOR URUT -->
                        <div class="absolute top-0 left-0 z-10">
                            <div
                                class="bg-gradient-to-br from-blue-600 to-blue-800 text-white font-bold text-2xl w-16 h-16 flex items-center justify-center rounded-br-3xl shadow-lg">
                                {{ $nomor++ }}
                            </div>
                        </div>

                        <div class="w-full h-48 overflow-hidden">
                            {{-- <img src="{{ $gambar }}" alt="{{ $nama }}"
                                class="w-full h-full object-cover rounded-t-lg hover:scale-105 transition duration-300"> --}}
                            <img src="{{ $gambar }}" alt="{{ $nama }}" loading="lazy"
                                class="w-full h-64 object-cover object-center hover:scale-105 transition duration-300">
                        </div>

                        <div class="p-5 flex flex-col flex-grow">
                            <h3 class="text-lg font-semibold text-gray-800 mb-2">{{ $nama }}</h3>

                            <p class="text-sm text-gray-600 mb-3 flex-grow line-clamp-3">
                                {{ Str::limit($deskripsi, 100) }}
                            </p>

                            <div class="flex justify-between mb-2">
                                <span class="text-sm font-medium text-gray-700">
                                    Rp {{ number_format($min) }} - Rp {{ number_format($max) }}/malam
                                </span>
                            </div>

                            <div class="flex items-center mb-4">
                                <span class="text-yellow-500 text-sm">{{ $bintang }} Stars</span>
                            </div>

                            <button @click="open = true"
                                class="bg-blue-600 text-white px-4 py-2 rounded-md hover:bg-blue-700 transition font-medium">
                                Lihat Detail
                            </button>
                        </div>

                        <!-- POPUP MODAL (tetap sama) -->
                        <div x-show="open" x-transition
                            class="fixed inset-0 bg-black/50 flex justify-center items-center z-50 p-4">

                            <div @click.outside="open = false"
                                class="bg-white rounded-lg shadow-2xl w-full max-w-4xl max-h-[90vh] overflow-y-auto relative">

                                <button @click="open = false"
                                    class="absolute top-4 right-4 text-gray-500 hover:text-gray-700 text-3xl z-10">
                                    ×
                                </button>

                                <div class="bg-gradient-to-r from-blue-600 to-blue-800 text-white p-6 rounded-t-lg">
                                    <div class="flex items-center gap-4">
                                        <div class="text-5xl font-bold">{{ $loop->iteration }}</div>
                                        <div>
                                            <h2 class="text-2xl font-bold">{{ $nama }}</h2>
                                            <p class="text-blue-100">Rekomendasi Teratas</p>
                                        </div>
                                    </div>
                                </div>

                                <div class="p-6">
                                    <div class="w-full overflow-hidden rounded-lg shadow-md mb-6 bg-gray-100">
                                        <img src="{{ $gambar }}" alt="{{ $nama }}" loading="lazy"
                                            class="w-full h-96 object-cover object-center">
                                    </div>

                                    <p class="text-gray-700 mb-3"><strong>Alamat:</strong> {{ $alamat }}</p>
                                    <p class="text-gray-700 mb-3"><strong>Harga:</strong> Rp {{ number_format($min) }} - Rp
                                        {{ number_format($max) }}/malam</p>
                                    <p class="text-gray-700 mb-6"><strong>Rating:</strong> {{ $bintang }} Stars</p>

                                    <p class="text-gray-600 leading-relaxed mb-6">{{ $deskripsi }}</p>

                                    <!-- Fasilitas -->
                                    <h3 class="text-xl font-semibold mb-3">Fasilitas</h3>
                                    <div class="flex flex-wrap gap-2 mb-6">
                                        @php
                                            $fasilitas = $peng['fasilitas'] ?? ($peng->fasilitas ?? []);
                                            if (is_string($fasilitas)) {
                                                $fasilitas = array_map('trim', explode(',', $fasilitas));
                                            }
                                        @endphp
                                        @forelse($fasilitas as $f)
                                            @if (is_object($f))
                                                <span
                                                    class="px-4 py-2 bg-blue-100 text-blue-700 rounded-full text-sm font-medium">{{ $f->nama_fasilitas }}</span>
                                            @elseif(is_array($f) && isset($f['nama_fasilitas']))
                                                <span
                                                    class="px-4 py-2 bg-blue-100 text-blue-700 rounded-full text-sm font-medium">{{ $f['nama_fasilitas'] }}</span>
                                            @elseif(is_string($f))
                                                <span
                                                    class="px-4 py-2 bg-blue-100 text-blue-700 rounded-full text-sm font-medium">{{ $f }}</span>
                                            @endif
                                        @empty
                                            <span class="text-gray-500 italic">Tidak ada fasilitas tercantum</span>
                                        @endforelse
                                    </div>

                                    <!-- Google Maps -->
                                    <h3 class="text-xl font-semibold mb-3">Lokasi</h3>
                                    @php
                                        $mapsLink =
                                            'https://www.google.com/maps?q=' .
                                            urlencode($alamat) .
                                            '&hl=id&z=15&output=embed';
                                    @endphp
                                    <iframe src="{{ $mapsLink }}" width="100%" height="300"
                                        class="rounded-lg border-0 mb-6" allowfullscreen loading="lazy"></iframe>

                                    <div class="text-right">
                                        <button @click="open = false"
                                            class="bg-gray-600 text-white px-6 py-3 rounded-md hover:bg-gray-700 font-medium">
                                            Tutup
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                @endforeach
            </div>
        @else
            <!-- TIDAK ADA DATA → Tampilkan Pesan Kosong -->
            <div class="text-center py-20">
                <div class="max-w-md mx-auto">
                    <div class="mb-6">
                        <svg class="w-24 h-24 mx-auto text-gray-300" fill="none" stroke="currentColor"
                            viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                d="M19 11H5m14 0a2 2 0 012 2v6a2 2 0 01-2 2H5a2 2 0 01-2-2v-6a2 2 0 012-2m14 0V9a2 2 0 00-2-2M5 11V9a2 2 0 012-2m0 0V5a2 2 0 012-2h6a2 2 0 012 2v2m-8 6h.01" />
                        </svg>
                    </div>
                    <h2 class="text-2xl font-bold text-gray-700 mb-3">
                        Tidak Ada Rekomendasi yang Cocok
                    </h2>
                    <p class="text-gray-500 leading-relaxed">
                        Maaf saat ini tidak ada penginapan yang sesuai dengan kriteria pencarian Anda,
                        Coba ubah filter harga, fasilitas, atau rating untuk melihat lebih banyak pilihan.
                    </p>
                    <div class="mt-8">
                        <a href="{{ route('user.penginapan') }}"
                            class="inline-block bg-blue-600 text-white px-6 py-3 rounded-lg font-medium hover:bg-blue-700 transition">
                            Ubah Filter Pencarian
                        </a>
                    </div>
                </div>
            </div>
        @endif
    </div>
@endsection
