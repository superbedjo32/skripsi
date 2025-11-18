@extends('layouts.user')

@section('title', 'Rekomendasi Penginapan - B-AREA')

@section('content')

    <div class="container mx-auto px-6 py-12 text-center">
        <h1 class="text-3xl md:text-4xl font-bold text-gray-800 mb-4">
            Rekomendasi Penginapan
        </h1>
    </div>

    <div class="container mx-auto px-6 pb-12">
        <div class="grid grid-cols-1 md:grid-cols-3 gap-8 max-w-6xl mx-auto">

            @php $list = isset($topPenginapanData) ? $topPenginapanData : $data; @endphp

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

                <div x-data="{ open: false }" class="bg-white rounded-lg shadow-md overflow-hidden flex flex-col h-full">

                    <div class="w-full h-48 overflow-hidden">
                        <img src="{{ $gambar }}" alt="{{ $nama }}"
                            class="w-full h-full object-cover rounded-t-lg">
                    </div>

                    <div class="p-5 flex flex-col flex-grow">
                        <h3 class="text-lg font-semibold text-gray-800 mb-2">{{ $nama }}</h3>

                        <p class="text-sm text-gray-600 mb-3 flex-grow">
                            {{ $deskripsi }}
                        </p>

                        <div class="flex justify-between mb-2">
                            <span class="text-sm font-medium text-gray-700">
                                Rp {{ number_format($min) }} - Rp {{ number_format($max) }}/malam
                            </span>
                        </div>

                        <div class="flex items-center mb-4">
                            <span class="text-yellow-500 text-sm">{{ $bintang }} ⭐</span>
                        </div>

                        <!-- Tombol Detail -->
                        <button @click="open = true"
                            class="bg-blue-600 text-white px-4 py-2 rounded-md hover:bg-blue-700 transition">
                            Detail
                        </button>
                    </div>

                    {{-- <!-- Popup Modal -->
                <div x-show="open"
                     x-transition
                     class="fixed inset-0 bg-black/50 flex justify-center items-center z-50">

                    <div @click.outside="open = false"
                         class="bg-white rounded-lg shadow-lg w-11/12 md:w-1/2 p-6 relative">

                        <!-- Tombol Close -->
                        <button @click="open = false"
                            class="absolute top-3 right-3 text-gray-500 hover:text-gray-700 text-xl">
                            &times;
                        </button>

                        <h2 class="text-2xl font-bold mb-4">{{ $nama }}</h2>

                        <img src="{{ $gambar }}" class="w-full h-56 object-cover rounded mb-4">

                        <p class="text-gray-700 mb-3">
                            <strong>Alamat:</strong> {{ $alamat }}
                        </p>

                        <p class="text-gray-700 mb-3">
                            <strong>Harga:</strong> Rp {{ number_format($min) }} - Rp {{ number_format($max) }}/malam
                        </p>

                        <p class="text-gray-700 mb-4">
                            <strong>Bintang:</strong> {{ $bintang }} ⭐
                        </p>

                        <p class="text-gray-600 leading-relaxed">
                            {{ $deskripsi }}
                        </p>

                        <div class="mt-6 text-right">
                            <button @click="open = false"
                                class="bg-gray-600 text-white px-4 py-2 rounded-md hover:bg-gray-700">
                                Tutup
                            </button>
                        </div>

                    </div>

                </div> --}}
                    <!-- Popup Modal -->
                    <div x-show="open" x-transition
                        class="fixed inset-0 bg-black/50 flex justify-center items-center z-50">

                        <div @click.outside="open = false"
                            class="bg-white rounded-lg shadow-lg w-11/12 md:w-1/2 lg:w-1/2 p-6 relative max-h-[90vh] overflow-y-auto">

                            <!-- Tombol Close -->
                            <button @click="open = false"
                                class="absolute top-3 right-3 text-gray-500 hover:text-gray-700 text-xl">
                                &times;
                            </button>

                            <h2 class="text-2xl font-bold mb-4">{{ $nama }}</h2>

                            <img src="{{ $gambar }}" class="w-full h-56 object-cover rounded mb-4">

                            <p class="text-gray-700 mb-3">
                                <strong>Alamat:</strong> {{ $alamat }}
                            </p>

                            <p class="text-gray-700 mb-3">
                                <strong>Harga:</strong> Rp {{ number_format($min) }} - Rp {{ number_format($max) }}/malam
                            </p>

                            <p class="text-gray-700 mb-4">
                                <strong>Bintang:</strong> {{ $bintang }} ⭐
                            </p>

                            <p class="text-gray-600 leading-relaxed mb-6">
                                {{ $deskripsi }}
                            </p>

                            <!-- ===================== -->
                            <!-- Bagian Fasilitas -->
                            <!-- ===================== -->
                            {{-- <h3 class="text-xl font-semibold mb-2">Fasilitas</h3>

                            <ul class="list-disc ml-5 mb-6 text-gray-700">
                                @if (isset($peng->fasilitas))
                                    @foreach ($peng->fasilitas as $f)
                                        <li>{{ $f->nama_fasilitas }}</li>
                                    @endforeach
                                @elseif(isset($peng['fasilitas']))
                                    @foreach ($peng['fasilitas'] as $f)
                                        <li>{{ $f['nama_fasilitas'] }}</li>
                                    @endforeach
                                @else
                                    <li>Tidak ada data fasilitas.</li>
                                @endif
                            </ul> --}}
                            <h3 class="text-xl font-semibold mb-2">Fasilitas</h3>

                            <ul class="list-disc ml-5 mb-6 text-gray-700">

                                @php
                                    // Ambil fasilitas dari sumber mana saja (Eloquent atau Array)
                                    $fasilitas = $peng['fasilitas'] ?? ($peng->fasilitas ?? []);

                                    // Jika string dipisah menjadi array
                                    if (is_string($fasilitas)) {
                                        $fasilitas = array_map('trim', explode(',', $fasilitas));
                                    }
                                @endphp

                                @forelse($fasilitas as $f)
                                    {{-- Jika object Eloquent --}}
                                    @if (is_object($f))
                                        <li>{{ $f->nama_fasilitas }}</li>

                                        {{-- Jika array associative --}}
                                    @elseif(is_array($f) && isset($f['nama_fasilitas']))
                                        <li>{{ $f['nama_fasilitas'] }}</li>

                                        {{-- Jika string biasa --}}
                                    @elseif(is_string($f))
                                        <li>{{ $f }}</li>
                                    @endif

                                @empty
                                    <li>Tidak ada data fasilitas.</li>
                                @endforelse

                            </ul>



                            <!-- ===================== -->
                            <!-- Bagian Google Maps -->
                            <!-- ===================== -->
                            <h3 class="text-xl font-semibold mb-2">Lokasi di Google Maps</h3>

                            @php
                                $alamat = $peng['alamat'] ?? $peng->alamat;
                                $mapsLink =
                                    'https://www.google.com/maps?q=' . urlencode($alamat) . '&hl=id&z=15&output=embed';
                            @endphp

                            <iframe src="{{ $mapsLink }}" width="100%" height="250" allowfullscreen loading="lazy"
                                class="rounded mb-6">
                            </iframe>



                            <div class="mt-6 text-right">
                                <button @click="open = false"
                                    class="bg-gray-600 text-white px-4 py-2 rounded-md hover:bg-gray-700">
                                    Tutup
                                </button>
                            </div>

                        </div>

                    </div>

                </div>
            @endforeach

        </div>
    </div>

@endsection
