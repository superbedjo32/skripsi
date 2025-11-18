<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hotel Bali & Lokasi Menginap</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="font-sans text-gray-800">

    <!-- Navbar -->
    <nav class="flex items-center justify-between px-8 py-4 shadow-md bg-white">
        <div class="flex items-center space-x-2">
            <img src="https://cdn6.agoda.net/images/mmvc/agoda-logo.svg" alt="Agoda Logo" class="h-6">
        </div>
        <ul class="flex items-center space-x-6 text-sm font-medium">
            <li><a href="#" class="hover:text-blue-600">Pesawat + Hotel</a></li>
            <li><a href="#" class="hover:text-blue-600">Akomodasi</a></li>
            <li><a href="#" class="hover:text-blue-600">Transportasi</a></li>
            <li><a href="#" class="hover:text-blue-600">Aktivitas</a></li>
            <li><a href="#" class="hover:text-blue-600">Kupon & Promo</a></li>
            <li><a href="#" class="hover:text-blue-600">Itinerari Perjalanan</a></li>
        </ul>
        <div class="flex space-x-3">
            <a href="#" class="text-blue-600">Masuk</a>
            <a href="#" class="border border-blue-600 text-blue-600 px-3 py-1 rounded-full hover:bg-blue-600 hover:text-white">Buat akun</a>
        </div>
    </nav>

    <!-- Hero Section -->
    <section class="relative bg-cover bg-center h-[90vh]" style="background-image: url('/images/bali.jpg');">
        <div class="absolute inset-0 bg-black bg-opacity-40"></div>

        <div class="relative z-10 flex flex-col items-center justify-center h-full text-white text-center px-4">
            <h1 class="text-4xl md:text-5xl font-bold mb-3">Hotel Bali & lokasi menginap</h1>
            <p class="text-lg mb-8">Cari untuk membandingkan harga dan menemukan penawaran terbaik dengan pembatalan gratis</p>

            <!-- Search Box -->
            <form class="bg-white rounded-2xl shadow-xl p-4 flex flex-col md:flex-row space-y-3 md:space-y-0 md:space-x-3 w-full max-w-4xl">
                <input type="text" name="lokasi" placeholder="Bali" class="flex-1 border border-gray-300 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-blue-400">
                <input type="date" name="checkin" class="border border-gray-300 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-blue-400">
                <input type="date" name="checkout" class="border border-gray-300 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-blue-400">
                <select name="tamu" class="border border-gray-300 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-blue-400">
                    <option>2 Dewasa - 1 Kamar</option>
                    <option>1 Dewasa - 1 Kamar</option>
                    <option>3 Dewasa - 2 Kamar</option>
                </select>
                <button type="submit" class="bg-blue-600 hover:bg-blue-700 text-white px-6 py-2 rounded-lg font-semibold">CARI</button>
            </form>
        </div>
    </section>

</body>
</html>
