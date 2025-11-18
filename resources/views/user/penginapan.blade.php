@extends('layouts.user')

@section('title', 'Penginapan - B-AREA')

@section('content')
    <!-- Page Title -->
    <div class="container mx-auto px-6 py-12 text-center">
        <h1 class="text-3xl md:text-4xl font-bold text-gray-800 mb-8">
            Cari Rekomendasi Penginapan
        </h1>
    </div>

    <!-- Filter Form -->
    <div class="container mx-auto px-6 max-w-2xl">
        <form action="{{ route('user.penginapan.rekomendasi') }}" method="POST" class="space-y-6">
            @csrf
            <!-- Kategori -->
            <div>
                <label class="block text-sm font-medium text-gray-700 mb-2">
                    Kategori
                </label>
                <div class="flex flex-wrap gap-3">
                    @foreach ($kategori as $kat)
                        @if (in_array($kat->nama_kategori, ['Murah', 'Menengah', 'Mahal']))
                            @continue
                        @endif

                        <label class="flex items-center cursor-pointer">
                            <input type="radio" name="kategori" value="{{ $kat->id_kategori }}" class="sr-only peer">
                            <span
                                class="px-4 py-2 rounded-md border border-gray-300 text-sm font-medium text-gray-700 bg-white peer-checked:bg-teal-600 peer-checked:text-white peer-checked:border-teal-600 transition">
                                {{ $kat->nama_kategori }}
                            </span>
                        </label>
                    @endforeach

                </div>
            </div>

            <!-- Harga -->
            <div>
                <label for="harga" class="block text-sm font-medium text-gray-700 mb-2">
                    Harga
                </label>
                <select id="harga" name="harga"
                    class="w-full px-4 py-3 border border-gray-300 rounded-md text-gray-500 bg-gray-100 focus:outline-none focus:ring-2 focus:ring-teal-500 focus:border-transparent">
                    <option selected disabled>pilih harga</option>
                    @foreach ($kategori as $kat)
                        @if ($kat->nama_kategori == 'Murah')
                            <option value="{{ $kat->id_kategori }}">< Rp 500.000</option>
                        @elseif ($kat->nama_kategori == 'Menengah')
                            <option value={{ $kat->id_kategori }}>Rp 500.000 - Rp 1.000.000</option>
                        @elseif ($kat->nama_kategori == 'Mahal')
                            <option value={{ $kat->id_kategori }}>
                                > Rp 1.000.000</option>
                        @endif
                    @endforeach
                </select>
            </div>

            <!-- Fasilitas (Multiple Choice) -->
            <div>
                <label class="block text-sm font-medium text-gray-700 mb-2">
                    Fasilitas
                </label>
                <div class="grid grid-cols-2 gap-3 text-sm">
                    @foreach ($fasilitas as $fas)
                        <label class="flex items-center cursor-pointer">
                            <input type="checkbox" name="fasilitas[]"
                                value="{{ strtolower(str_replace(' ', '-', $fas->id_fasilitas)) }}" class="sr-only peer">
                            <div
                                class="w-5 h-5 border-2 border-gray-300 rounded mr-2 flex items-center justify-center peer-checked:border-teal-600 peer-checked:bg-teal-600 transition">
                                <svg class="w-3 h-3 text-white hidden peer-checked:block" fill="none"
                                    stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="3"
                                        d="M5 13l4 4L19 7" />
                                </svg>
                            </div>
                            <span class="text-gray-700">{{ $fas->nama_fasilitas }}</span>
                        </label>
                    @endforeach
                </div>
            </div>

            <!-- Submit Button -->
            <div class="pt-4">
                <button type="submit"
                    class="w-full bg-gray-400 hover:bg-gray-500 text-white font-medium py-3 px-6 rounded-md transition duration-200">
                    temukan penginapan
                </button>
            </div>
        </form>
    </div>
@endsection
