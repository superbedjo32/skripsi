@extends('layouts.user')

@push('styles')
<style>
    .bg-hero {
        background-image: url('{{ asset('storage/AlunAlunBatu.jpeg') }}');
        background-size: cover;
        background-position: center;
    }
</style>
@endpush

@section('title', 'B-AREA Recommendation')

@section('content')
<!-- Hero Section -->
<section class="relative bg-hero h-screen flex items-center justify-center text-center text-white">
    <!-- Overlay -->
    <div class="absolute inset-0 bg-black bg-opacity-50"></div>

    <!-- Content -->
    <div class="relative z-10 px-6 max-w-4xl mx-auto">
        <h2 class="text-3xl md:text-5xl font-bold mb-4 leading-tight">
            Rekomendasi Penginapan di Jantung Wisata Alam Batu
        </h2>
        <p class="text-lg md:text-xl mb-8">
            Nama saya Firmansyah Alafair Hermawan NIM 2118108, web ini saya gunakan untuk syarat kelulusan ujian akhir saya.
        </p>
        <a href="{{ route('user.penginapan') }}" class="inline-block bg-blue-600 hover:bg-blue-700 text-white font-semibold px-8 py-3 rounded-full transition duration-300">
            Jelajahi
        </a>
    </div>
</section>
@endsection
