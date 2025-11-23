<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>@yield('title', 'B-AREA Recommendation')</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://cdn.jsdelivr.net/npm/alpinejs@3.x.x/dist/cdn.min.js" defer></script>
    <link rel="icon" href="data:image/svg+xml,<svg xmlns=%22http://www.w3.org/2000/svg%22 viewBox=%220 0 100 100%22><rect width=%22100%25%22 height=%22100%25%22 fill=%22%23376fa8%22 rx=%2220%22/><text y=%22.9em%22 font-size=%2280%22 fill=%22white%22 font-weight=%22bold%22 text-anchor=%22middle%22 x=%2250%25%22> B </text></svg>">
    @stack('styles')
</head>
<body class="font-sans text-gray-800">

    <!-- Header -->
    <header class="bg-blue-600 text-white shadow-md">
        <div class="container mx-auto px-6 py-4 flex justify-between items-center">
            <h1 class="text-xl font-bold">B-AREA Recommendation</h1>
            <nav class="hidden md:flex space-x-6 text-sm">
                <a href="{{ route('user.home') }}" class="hover:text-teal-200">Beranda</a>
                <a href="{{ route(name: 'user.penginapan') }}" class="hover:text-teal-200">Penginapan</a>
                <a href="{{ route(name: 'user.rekomendasi') }}" class="hover:text-teal-200">Rekomendasi</a>
                <a href="#" class="hover:text-teal-200">Kontak</a>
            </nav>
            <div class="flex items-center space-x-4">
                @if (Auth::check())
                    <span class="text-sm text-teal-100">Halo, <strong>{{ Auth::user()->name }}</strong></span>
                    <form method="POST" action="{{ route('logout') }}" class="inline">
                        @csrf
                        <button type="submit" class="text-teal-200 text-sm hover:underline">Keluar</button>
                    </form>
                @else
                    <a href="{{ route('login') }}" class="text-teal-200 hover:text-white">Masuk</a>
                    <a href="{{ route('register') }}"
                       class="border border-teal-300 text-teal-300 px-3 py-1 rounded-full hover:bg-teal-500 hover:text-white transition">
                        Buat akun
                    </a>
                @endif
            </div>
        </div>
    </header>

    <!-- Main Content -->
    <main>
        @yield('content')
    </main>

    @stack('scripts')
</body>
</html>
