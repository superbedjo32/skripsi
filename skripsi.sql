-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Waktu pembuatan: 21 Des 2025 pada 13.16
-- Versi server: 8.0.30
-- Versi PHP: 8.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `skripsi`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `fasilitas`
--

CREATE TABLE `fasilitas` (
  `id_fasilitas` bigint UNSIGNED NOT NULL,
  `nama_fasilitas` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `fasilitas`
--

INSERT INTO `fasilitas` (`id_fasilitas`, `nama_fasilitas`, `created_at`, `updated_at`) VALUES
(1, 'Televisi', NULL, NULL),
(2, 'Wi-Fi', NULL, NULL),
(3, 'Kolam Renang', NULL, NULL),
(4, 'Restoran', NULL, NULL),
(5, 'Parkiran', '2025-11-06 00:19:05', '2025-11-06 00:19:05'),
(6, 'Taman', '2025-11-06 00:19:13', '2025-11-06 00:19:13'),
(7, 'Bisa untuk rombongan', '2025-11-06 00:19:24', '2025-11-06 00:19:24'),
(8, 'AC', '2025-11-06 00:19:32', '2025-11-06 00:19:32'),
(9, 'Pembatalan Gratis', '2025-11-06 00:19:42', '2025-11-06 00:19:42');

-- --------------------------------------------------------

--
-- Struktur dari tabel `idf`
--

CREATE TABLE `idf` (
  `id` bigint UNSIGNED NOT NULL,
  `kategori_id` bigint UNSIGNED DEFAULT NULL,
  `fasilitas_id` bigint UNSIGNED DEFAULT NULL,
  `count` int NOT NULL,
  `hasil` decimal(8,4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `idf`
--

INSERT INTO `idf` (`id`, `kategori_id`, `fasilitas_id`, `count`, `hasil`, `created_at`, `updated_at`) VALUES
(2, 1, NULL, 37, 0.1722, '2025-11-09 11:22:42', '2025-11-09 11:22:42'),
(3, 2, NULL, 13, 0.6264, '2025-11-09 11:22:52', '2025-11-09 11:22:52'),
(4, 3, NULL, 5, 1.0414, '2025-11-09 11:23:00', '2025-11-09 11:23:00'),
(5, 6, NULL, 29, 0.2780, '2025-11-09 11:23:08', '2025-11-09 11:23:08'),
(6, 5, NULL, 20, 0.4393, '2025-11-09 11:23:13', '2025-11-09 11:23:13'),
(7, 4, NULL, 6, 0.9622, '2025-11-09 11:23:21', '2025-11-09 11:23:21'),
(8, NULL, 1, 54, 0.0080, '2025-11-09 11:23:28', '2025-11-09 11:23:28'),
(9, NULL, 2, 54, 0.0080, '2025-11-09 11:23:33', '2025-11-09 11:23:33'),
(10, NULL, 3, 27, 0.3090, '2025-11-09 11:23:44', '2025-11-09 11:23:44'),
(11, NULL, 4, 31, 0.2490, '2025-11-09 11:23:59', '2025-11-09 11:23:59'),
(12, NULL, 5, 26, 0.3254, '2025-11-09 11:24:41', '2025-11-09 11:24:41'),
(13, NULL, 6, 28, 0.2932, '2025-11-09 11:25:42', '2025-11-09 11:25:42'),
(14, NULL, 7, 24, 0.3602, '2025-11-09 11:25:51', '2025-11-09 11:25:51'),
(15, NULL, 8, 33, 0.2218, '2025-11-09 11:25:58', '2025-11-09 11:25:58'),
(16, NULL, 9, 27, 0.3090, '2025-11-09 11:26:04', '2025-11-09 11:26:04');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategoris`
--

CREATE TABLE `kategoris` (
  `id_kategori` bigint UNSIGNED NOT NULL,
  `nama_kategori` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `kategoris`
--

INSERT INTO `kategoris` (`id_kategori`, `nama_kategori`, `created_at`, `updated_at`) VALUES
(1, 'Hotel', NULL, NULL),
(2, 'Villa', NULL, NULL),
(3, 'GuestHouse', NULL, NULL),
(4, 'Mahal', '2025-11-06 00:18:25', '2025-11-06 00:18:25'),
(5, 'Menengah', '2025-11-06 00:18:34', '2025-11-06 00:18:34'),
(6, 'Murah', '2025-11-06 00:18:41', '2025-11-06 00:18:41');

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_10_09_153743_create_kategoris_table', 1),
(5, '2025_10_09_153848_create_penginapans_table', 1),
(6, '2025_10_09_154118_create_fasilitas_and_pivot_tables', 1),
(7, '2025_10_13_052248_add_alamat_to_penginapans_table', 1),
(8, '2025_11_04_044857_add_role_to_users_table', 2),
(9, '2025_11_06_051527_create_tf_table', 3),
(10, '2025_11_06_052426_create_tf_kategori', 4),
(11, '2025_11_06_052536_create_tf_fasilitas', 4),
(12, '2025_11_06_052721_create_idf', 4),
(13, '2025_11_06_052855_create_tf_idf', 4),
(14, '2025_11_06_053107_create_tf_idf_fasilitas', 4),
(15, '2025_11_06_053300_create_tf_idf_kategori', 4),
(16, '2025_11_10_044555_add_gambar_to_penginapans_table', 5);

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `penginapans`
--

CREATE TABLE `penginapans` (
  `id_penginapan` bigint UNSIGNED NOT NULL,
  `nama_penginapan` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_kategori` bigint UNSIGNED NOT NULL,
  `bintang` decimal(2,1) DEFAULT NULL,
  `harga_min` int NOT NULL,
  `harga_max` int NOT NULL,
  `deskripsi_singkat` text COLLATE utf8mb4_unicode_ci,
  `gambar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `penginapans`
--

INSERT INTO `penginapans` (`id_penginapan`, `nama_penginapan`, `alamat`, `id_kategori`, `bintang`, `harga_min`, `harga_max`, `deskripsi_singkat`, `gambar`, `created_at`, `updated_at`) VALUES
(1, 'Golden Tulip Holland Resort', 'Jl. Bukit Panderman Hill Jl. Cherry No.10, Temas, Kec. Batu, Jawa Timur 65314, Indonesia', 1, 4.0, 1200000, 1500000, 'Hotel (Bintang 4) mewah di Jl. Bukit Panderman Hill Jl. Cherry No.10, Temas, Kec. Batu. Termasuk kriteria Mahal. Fasilitas lengkap: TV, Wi-Fi, Kolam Renang, dan Restoran tersedia.', 'penginapan/tJhOfKTR5EeauuCU5yghjG0DzFyvIRD27Vu03jo3.jpg', '2025-10-15 23:52:38', '2025-11-13 19:18:25'),
(2, 'Aston Inn Batu', 'Jl. Abdul Gani Atas No. 42, Ngaglik', 1, 4.0, 500000, 700000, 'Hotel (Bintang 4) modern dan nyaman di pusat Kota Batu, terletak di Jl. Abdul Gani Atas, Ngaglik. Termasuk kriteria Menengah. Fasilitas lengkap: TV, Wi-Fi, Kolam Renang, dan Restoran tersedia.', 'penginapan/bwjvjZtInuGJbc2KpHvC721B71Dazdfy5YDPCdO0.jpg', '2025-10-15 23:52:38', '2025-11-10 10:51:54'),
(3, 'The Onsen Hot Spring Resort', 'Jl. Arumdalu No.98, Songgokerto, Kec. Batu, Kota Batu, Jawa Timur 65312, Indonesia', 1, 3.0, 1800000, 2200000, 'Hotel unik dengan pemandian air panas di Jl. Arumdalu Songgoriti, Songgokerto. Termasuk kriteria Mahal. Fasilitas: TV, Wi-Fi, Restoran tersedia.', 'penginapan/dwEzhDRKWzkBAZWn20GIvcToZFERfoggwSyNiRqq.jpg', '2025-10-15 23:52:38', '2025-11-13 19:24:06'),
(4, 'The Batu Hotel & Villas', 'Jl. Sultan Agung No. 29, Sisir', 1, 3.0, 470000, 800000, 'Gabungan Hotel & Villa (Bintang 3) di pusat kota Jl. Sultan Agung, Sisir. Termasuk kriteria Murah. Fasilitas: TV, Wi-Fi, Kolam Renang, dan Restoran tersedia.', 'penginapan/WmMkUURHIGAU8CQzd0Y2GgRtbUc2hOt9SzaeHnMq.jpg', '2025-10-15 23:52:38', '2025-11-10 10:52:21'),
(5, 'Kontena Hotel', 'Jln. KH Jl. Agus Salim No.106, Temas, Batu, Batu City, East Java 65315, Indonesia', 1, 3.0, 350000, 500000, 'Hotel (Bintang 3) dengan konsep unik di Jln. KH Jl. Agus Salim No.106, Temas, Batu. Termasuk kriteria Murah. Fasilitas: TV, Wi-Fi, Kolam Renang tersedia; tidak ada Restoran.', 'penginapan/eUm3UdlGNDbiCVcFZUiz1XnQIL0IUCKRaD2nGlA2.jpg', '2025-10-15 23:52:38', '2025-11-13 19:25:00'),
(6, 'éL Hotel Kartika Wijaya Batu', 'Jl. Panglima Sudirman No.127, Pesanggrahan, Kec. Batu, Kota Batu, Jawa Timur 65313, Indonesia', 1, 4.0, 500000, 650000, 'Hotel bersejarah (Bintang 4) di Jl. Panglima Sudirman No.127, Pesanggrahan, Kec. Batu, Kota Batu. Termasuk kriteria Menengah. Fasilitas lengkap: TV, Wi-Fi, Kolam Renang, dan Restoran tersedia.', 'penginapan/c2vd77fFdVA1wcovLbinixZm3uuUsCaALGrU6ZSw.jpg', '2025-10-15 23:52:38', '2025-11-13 19:25:43'),
(7, 'Senyum World Hotel', 'Jl. Ir. Soekarno No.144, Beji, Kec. Junrejo, Kota Batu, Jawa Timur 65236, Indonesia', 1, 4.0, 500000, 750000, 'Hotel (Bintang 4) besar dan strategis di Jl. Ir. Soekarno No.144, Beji, Kec. Junrejo, Kota Batu. Termasuk kriteria Menengah. Fasilitas lengkap: TV, Wi-Fi, Kolam Renang, dan Restoran tersedia.', 'penginapan/SvexJPE6msGvi0QyWpCExd4wC7wEKytLWDmTZ8cz.jpg', '2025-10-15 23:52:38', '2025-11-13 19:27:11'),
(8, 'Amartahills Hotel and Resort', 'Jl. Abdul Gani Atas, Ngaglik', 1, 4.0, 800000, 1100000, 'Hotel & Resort (Bintang 4) dengan pemandangan indah di Jl. Abdul Gani Atas, Ngaglik. Termasuk kriteria Menengah. Fasilitas lengkap: TV, Wi-Fi, Kolam Renang, dan Restoran tersedia.', 'penginapan/aa0XpfvHbnnAOsApbTDMfhhiBNfG8U9vDbrfXxxj.jpg', '2025-10-15 23:52:38', '2025-11-10 10:56:35'),
(9, 'Riverstone Hotel & Cottage', 'Jl. Bukit Berbunga No. 100, Sidomulyo', 1, 3.0, 400000, 600000, 'Hotel & Cottage (Bintang 3) yang tenang di Jl. Bukit Berbunga, Sidomulyo. Termasuk kriteria Murah. Fasilitas lengkap: TV, Wi-Fi, Kolam Renang, dan Restoran tersedia.', 'penginapan/HpPh3FhPuB5KFALFyNLXpTDMvlJvSzTvE5QXFpfk.jpg', '2025-10-15 23:52:38', '2025-11-10 10:56:50'),
(10, 'Pondok Jatim Park Hotel & Café', 'Jl. Kartika No. 3, Sisir', 1, 3.0, 450000, 600000, 'Hotel (Bintang 3) dekat Jatim Park di Jl. Kartika, Sisir. Termasuk kriteria Murah. Fasilitas lengkap: TV, Wi-Fi, Kolam Renang, dan Restoran tersedia.', 'penginapan/dsJ9feruTnpxDDyyY7mg5qukzuegj0ITV7uWeVMG.jpg', '2025-10-15 23:52:38', '2025-11-10 10:57:23'),
(11, 'Apple Green Hotel Batu', 'Jl. Abdul Gani Atas No. 8, Ngaglik', 1, 3.0, 350000, 500000, 'Hotel (Bintang 3) di Jl. Abdul Gani Atas, Ngaglik. Termasuk kriteria Murah. Fasilitas: TV, Wi-Fi, Restoran tersedia.', 'penginapan/MTSgfaMgbrpmD0KS0ugTD9gb6eTQSyfIuu8u3Sl3.jpg', '2025-10-15 23:52:38', '2025-11-10 11:09:50'),
(12, 'RedDoorz Near Alun Alun Batu 2', 'Jl. Gondorejo No. 9, Oro-oro Ombo', 1, 2.0, 150000, 250000, 'Hotel Budget (Bintang 2) di Jl. Gondorejo, Oro-oro Ombo. Termasuk kriteria Murah. Fasilitas: TV, Wi-Fi tersedia.', 'penginapan/K4rdjCFR0wYcMGeoniVJf28iTkUnMbxCNyGSyXb1.jpg', '2025-10-15 23:52:38', '2025-11-10 11:10:06'),
(13, 'Spencer Green Hotel Batu', 'Jl. Raya Punten No. 100, Punten', 1, 3.0, 300000, 450000, 'Hotel (Bintang 3) dengan suasana hijau di Jl. Raya Punten. Termasuk kriteria Murah. Fasilitas: TV, Wi-Fi, Kolam Renang, Restoran tersedia.', 'penginapan/e5BLyWI4Y6Xz4dOt8ZlguiWYSO4E7peynE2HC529.jpg', '2025-10-15 23:52:38', '2025-11-10 11:10:21'),
(14, 'Ciptaningati Culture Hotel', 'Jl. Argopuro No.154, Sisir, Kec. Batu, Kota Batu', 1, 3.0, 450000, 550000, 'Hotel (Bintang 3) bernuansa budaya di Jl. Argopuro No.154, Sisir, Kec. Batu, Kota Batu. Termasuk kriteria Murah. Fasilitas: TV, Wi-Fi, Kolam Renang, Restoran tersedia.', 'penginapan/GlbzLzlFNjJ0s04weuVRuSyb02YE6gKwnXaqTwhm.jpg', '2025-10-15 23:52:38', '2025-11-10 11:10:39'),
(15, 'Samara Resort', 'Jl. Indragiri No. 1, Songgokerto', 1, 3.0, 400000, 650000, 'Resort (Bintang 3) yang nyaman di Jl. Indragiri, Songgokerto. Kriteria Murah. Fasilitas: TV, Wi-Fi, Kolam Renang, Restoran.', 'penginapan/VY6ic0xRegmWxH2lmHDv2OXeFYTwsIUkaa6mLGwh.jpg', '2025-10-15 23:52:38', '2025-11-10 11:10:53'),
(16, 'Hotel Batu Wonderland', 'Jl. Imam Bonjol No. 9, Sisir', 1, 3.0, 550000, 800000, 'Hotel (Bintang 3) dengan taman air mini di Jl. Imam Bonjol, Sisir. Kriteria Menengah. Fasilitas: TV, Wi-Fi, Kolam Renang, Restoran.', 'penginapan/azksrEJf8OjKYZuTbVNX9d3qlIm2D4fesRwDGI6I.jpg', '2025-10-15 23:52:38', '2025-11-10 11:11:09'),
(17, 'Royal Orchids Garden Hotel & Condominium', 'Jl. Indragiri No. 4, Songgokerto', 1, 4.0, 350000, 700000, 'Hotel & Condo (Bintang 4) di Jl. Indragiri, Songgokerto. Kriteria Murah. Fasilitas: TV, Wi-Fi, Kolam Renang, Restoran.', 'penginapan/4Xaei3zut00ngiVwg2GzopOx4vfIjxeNLAdzouaV.jpg', '2025-10-15 23:52:38', '2025-11-10 11:11:32'),
(18, 'Arimbi Guest House', 'Jl. Patimura No.9, RT.03/RW.08, Temas, Kec. Batu, Kota Batu', 3, NULL, 200000, 350000, 'Guesthouse minimalis di Jl. Patimura No.9, RT.03/RW.08, Temas, Kec. Batu, Kota Batu. Kriteria Murah. Fasilitas: TV, Wi-Fi.', 'penginapan/UKPjCZVOIFx0tpPNo60AhkJSSEZfKOcJhdPj4POl.jpg', '2025-10-15 23:52:38', '2025-11-10 11:12:33'),
(19, 'Kusuma Agrowisata Hotel', 'Jl. Abdul Gani Atas No. 9, Ngaglik', 1, 3.0, 600000, 900000, 'Hotel (Bintang 4) di perkebunan apel Jl. Abdul Gani Atas, Ngaglik. Kriteria Menengah. Fasilitas: TV, Wi-Fi, Kolam Renang, Restoran.', 'penginapan/bo0vWQ3Kuuj18RU93q29nAKpjUbnPR7FaSarPJ3L.jpg', '2025-10-15 23:52:38', '2025-11-10 11:12:47'),
(20, 'Purnama Hotel', 'Jl. Raya Punten No.1-15, Punten, Kec. Bumiaji, Kota Batu', 1, 3.0, 450000, 650000, 'Hotel (Bintang 3) di area sejuk Jl. Raya Punten No.1-15, Punten, Kec. Bumiaji, Kota Batu. Kriteria Murah. Fasilitas: TV, Wi-Fi, Kolam Renang, Restoran.', 'penginapan/o1N8RJODHMx3UbAOX9oiIhSA0oZ8w2JkL0DxssYx.jpg', '2025-10-15 23:52:38', '2025-11-10 11:13:08'),
(21, 'Victory Hotel', 'Jl. Raya Junggo No.107, Tulungrejo, Kec. Bumiaji, Kota Batu', 1, 2.0, 120000, 250000, 'Villa modern di Jl. Raya Junggo No.107, Tulungrejo, Kec. Bumiaji, Kota Batu. Kriteria Menengah. Fasilitas: TV, Wi-Fi, Kolam Renang.', 'penginapan/gJDqm2BYB23Jj7g3Qx0ZVIpAYVfBH7JewZE9811t.jpg', '2025-10-15 23:52:38', '2025-11-10 11:14:42'),
(22, 'Sans Hotel Queen Batu', 'Jalan Gandarsari RT 05/RW03 Gondang, Tulungrejo, Kec. Bumiaji, Kota Batu', 1, 3.0, 200000, 300000, 'Hotel Budget (Bintang 2) diJalan Gandarsari RT 05/RW03 Gondang, Tulungrejo, Kec. Bumiaji, Kota Batu. Kriteria Murah. Fasilitas: TV, Wi-Fi.', 'penginapan/7Qzfbwaou8CKiH9OJkYE6UY2ELVWv1lvgyDHtQLi.jpg', '2025-10-15 23:52:38', '2025-11-10 11:17:56'),
(23, 'Batuque Town Villa 2', 'Jl. Diponegoro No.8, Sisir, Kec. Batu, Kota Batu', 2, 4.0, 700000, 1200000, 'Villa sewa harian di Jl. Abdul Gani Atas No.8, Ngaglik, Kec. Batu, Kota Batu. Kriteria Menengah. Fasilitas: TV, Wi-Fi.', 'penginapan/i7sMYeNhIQglNiSqtDUisDBe9508a6TNJDTQ9zp0.jpg', '2025-10-15 23:52:38', '2025-11-10 11:18:10'),
(24, 'Villa Sunrise Batu', 'D\'JAGAD Land Block H-3 Perumahan D\'jagad Land Batu, Jl. Tvri No.1 Tahap 1, Oro-Oro Ombo, Kec. Batu, Kota Batu', 2, 3.0, 400000, 600000, 'Villa dengan pemandangan di D\'JAGAD Land Block H-3 Perumahan D\'jagad Land Batu, Jl. Tvri No.1 Tahap 1, Oro-Oro Ombo, Kec. Batu, Kota Batu. Kriteria Menengah. Fasilitas: TV, Wi-Fi.', 'penginapan/jPHxQi4wJhuOaJUB1YMjcR9J7ap8L7eVgcVdjrel.jpg', '2025-10-15 23:52:38', '2025-11-10 11:18:33'),
(25, 'Villa SaeSaNaRa Private Pool', '4G3P+9WP, Oro-Oro Ombo, Kec. Batu, Kota Batu', 2, 3.0, 3000000, 4500000, 'Villa mewah dengan kolam renang pribadi di 4G3P+9WP, Oro-Oro Ombo, Kec. Batu, Kota Batu. Kriteria Mahal. Fasilitas: TV, Wi-Fi, Kolam Renang.', 'penginapan/uy8SlEsqkk2UrXmk2YhnQh9nIp3rn5wWGI3Nm1ET.jpg', '2025-10-15 23:52:38', '2025-11-10 11:18:52'),
(26, 'Azcarya Villa Batu', 'Jl. Langsep, Sisir, Kec. Batu, Kota Batu', 2, NULL, 750000, 950000, 'Villa sewa harian di Jl. Langsep, Sisir, Kec. Batu, Kota Batu. Kriteria Menengah. Fasilitas: TV, Wi-Fi.', 'penginapan/yKSi7PIA6MP5DcojvhrxSnxFTAt0lC3SIgYEAwxA.jpg', '2025-10-15 23:52:38', '2025-11-10 11:19:10'),
(27, 'Villa Gita Batu', 'Jl. Suropati No.50, Ngaglik, Kec. Batu, Kota Batu', 2, NULL, 600000, 900000, 'Villa sewa harian di Jl. Suropati No.50, Ngaglik, Kec. Batu, Kota Batu. Kriteria Menengah. Fasilitas: TV, Wi-Fi.', 'penginapan/piFPZtgBeeovEows63taHg8ue3DfExpuEN37b70N.jpg', '2025-10-15 23:52:38', '2025-11-10 11:19:27'),
(28, 'Villa Khansa', 'Perumahan Delima Residence No.Kav.3, Temas, Batu', 2, 4.0, 500000, 700000, 'Villa sewa harian di Perumahan Delima Residence No.Kav.3, Temas, Batu. Kriteria Menengah. Fasilitas: TV, Wi-Fi.', 'penginapan/YkdYsHsvsGIqa8ksHlNQWx8CXgoPWSWWTHS1Xk2p.jpg', '2025-10-15 23:52:38', '2025-11-10 11:19:42'),
(29, 'Villa Three Angels by N2K', '4H36+7J7, Mojorejo, Kec. Junrejo, Kota Batu', 2, NULL, 800000, 1200000, 'Villa sewa harian di 4H36+7J7, Mojorejo, Kec. Junrejo, Kota Batu. Kriteria Menengah. Fasilitas: TV, Wi-Fi.', 'penginapan/DXYQT5D4rVyPgDvTErlUYWGDpKwIYkrHxnV8lpEK.jpg', '2025-10-15 23:52:38', '2025-11-10 11:19:57'),
(30, 'Gress Villa', 'Jl. Jambu Air Jl. Raya Songgoriti No.9, Songgokerto, Kec. Batu, Kota Batu', 2, NULL, 700000, 950000, 'Villa sewa harian di Jl. Jambu Air Jl. Raya Songgoriti No.9, Songgokerto, Kec. Batu, Kota Batu. Kriteria Menengah. Fasilitas: TV, Wi-Fi, Restoran (dekat).', 'penginapan/z37rwP5uLKse0C7trUpOvOuhLojMfUVrezjvIRrK.jpg', '2025-10-15 23:52:38', '2025-11-10 11:20:14'),
(31, 'Jambuluwuk Convention Hall & Resort', 'Jl. Trunojoyo No.99, Songgokerto, Kec. Batu, Kota Batu', 1, 5.0, 1500000, 2500000, 'Resort (Bintang 5) besar di Jl. Trunojoyo No.99, Songgokerto, Kec. Batu, Kota Batu. Kriteria Mahal. Fasilitas: TV, Wi-Fi, Kolam Renang, Restoran.', 'penginapan/KuDztypX5ehsntqplcwEpjkoa06f806F3CtuerHW.jpg', '2025-10-15 23:52:38', '2025-11-10 11:45:52'),
(32, 'Padi Heritage Hotel', 'Jl. Regulus No.9, Tlogomas, Kec. Lowokwaru, Kota Malang', 1, 3.0, 400000, 600000, 'Hotel (Bintang 3) dengan desain unik di Jl. Regulus No.9, Tlogomas, Kec. Lowokwaru, Kota Malang. Kriteria Murah. Fasilitas: TV, Wi-Fi, Restoran.', 'penginapan/xKe4mpt8BHU4eScefRbrkIRVD9fM6Bzbl0TJAphK.jpg', '2025-10-15 23:52:38', '2025-11-10 11:46:09'),
(33, 'The Singhasari Resort', 'Jl. Ir. Soekarno No.120, Beji, Kec. Batu, Kota Batu', 1, 5.0, 1300000, 1800000, 'Resort (Bintang 5) mewah di Jl. Raya Ir. Soekarno, Beji. Kriteria Mahal. Fasilitas: TV, Wi-Fi, Kolam Renang, Restoran,AC dan Pembatalan Gratis.', 'penginapan/pZtj655hxYTAod3aFU2KR8u6HXdzffepADVZ8kiN.jpg', '2025-10-15 23:52:38', '2025-11-10 11:46:29'),
(34, 'Hotel Mutiara Baru', 'Jl. Panglima Sudirman No.89, Pesanggrahan, Kec. Batu, Kota Batu', 1, 2.0, 180000, 300000, 'Hotel Budget (Bintang 2) di Jl. Panglima Sudirman No.89, Pesanggrahan, Kec. Batu, Kota Batu. Kriteria Murah. Fasilitas: TV, Wi-Fi.', 'penginapan/4DyYWxteAs8FcmWHVYO1R6ypiAMOqB0RGlJDFooS.jpg', '2025-10-15 23:52:38', '2025-11-10 11:46:47'),
(35, 'Hotel O 32', 'Jl. Oro-oro Ombo No. 75, Sisir', 1, 3.0, 300000, 450000, 'Hotel (Bintang 2) di Jl. Suropati No.32, Ngaglik, Batu. Kriteria Murah. Fasilitas: TV, Wi-Fi, Kolam Renang, Restoran, parkiran dan AC.', 'penginapan/OGMMTW5PnKvLo5tU89MoyRiFhgkCi8v3rHQPJBjP.jpg', '2025-10-15 23:52:38', '2025-11-10 11:47:06'),
(36, 'Hotel Gradia 2', 'Jl. Ikhwan Hadi 56, Batu', 1, 3.0, 450000, 650000, 'Hotel (Bintang 3) di Jl. Ikhwan Hadi 56, Batu. Kriteria Murah. Fasilitas: TV, Wi-Fi, Kolam Renang, Restoran.', 'penginapan/RMPiYEMamgYQ1JZMebPPFGNUFkkANtujuZLPWNDy.jpg', '2025-10-15 23:52:38', '2025-11-10 11:47:21'),
(37, 'Sekar Gambir Homestay Batu', 'Jl. Indragiri Gg. 6 No.120, Sumberejo, Kec. Batu, Kota Batu', 3, NULL, 200000, 250000, 'Guesthouse di Jl. Indragiri Gg. 6 No.120, Sumberejo, Kec. Batu, Kota Batu. Kriteria Murah. Fasilitas: TV, Wi-Fi dan Parkiran.', 'penginapan/zCWPbxfNwVyzdtdEQMnZvN0BC6iTvyEkCbnPLssZ.jpg', '2025-10-15 23:52:38', '2025-11-10 11:47:36'),
(38, 'Pohon Inn Hotel', 'Jl. Raya Oro-Oro Ombo No.9, Temas, Kec. Batu, Kota Batu', 1, 3.0, 600000, 850000, 'Hotel (Bintang 3) terintegrasi dengan Jatim Park 2 di Jl. Raya Oro-Oro Ombo No.9, Temas, Kec. Batu, Kota Batu. Kriteria Menengah. Fasilitas: TV, Wi-Fi, Kolam Renang, Restoran.', 'penginapan/QDEqlD2odzidX23AF51OugAGspntsPIdgWSsdneD.jpg', '2025-10-15 23:52:38', '2025-11-10 11:47:51'),
(39, 'Hotel Selecta', 'Jl. Raya Selecta No.1, Tulungrejo, Kec. Bumiaji, Kota Batu', 1, 3.0, 400000, 600000, 'Hotel (Bintang 3) bersejarah di  Jl. Raya Selecta No.1, Tulungrejo, Kec. Bumiaji, Kota Batu. Kriteria Murah. Fasilitas: TV, Wi-Fi, Kolam Renang, Restoran.', 'penginapan/VFGWdGi7uHB0ii5biADFAf9Dgado0c6PZUyTebdY.jpg', '2025-10-15 23:52:38', '2025-11-10 11:48:07'),
(40, 'Shakila Guest House', 'Jl. Arumdalu No.179, Songgokerto, Batu', 3, NULL, 200000, 450000, 'Guesthouse/Homestay di Jl. Arumdalu No.179, Songgokerto, Batu. Kriteria Murah. Fasilitas: TV, Wi-Fi.', 'penginapan/FMk9zsC3y3SLvdKiLh7ht8p7RXKyJFdGK1B7OpUR.jpg', '2025-10-15 23:52:38', '2025-11-10 11:48:21'),
(41, 'Villa Puncak Tidar', '2HQW+MQ5 Puncak Arjuna, Jl. Villa Safira, Doro, Karangwidoro, Kec. Dau, Kota Malang', 2, NULL, 900000, 1500000, 'Villa sewa harian di 2HQW+MQ5 Puncak Arjuna, Jl. Villa Safira, Doro, Karangwidoro, Kec. Dau, Kota Malang. Kriteria Menengah. Fasilitas: TV, Wi-Fi.', 'penginapan/UtqhJ7NmK8rvLL2olsAoNZbHZbvFBIha3uSC4a0G.jpg', '2025-10-15 23:52:38', '2025-11-10 11:48:39'),
(42, 'RedDoorz @ Junrejo Batu', 'Jl. Raya Junrejo, Batu', 1, NULL, 180000, 300000, 'Hotel Budget (Bintang 2) di Jl. Raya Junrejo, Junrejo. Kriteria Murah. Fasilitas: TV, Wi-Fi.', 'penginapan/dMTnKOptahacgNps4NbNeiVImiUxDKpvVkFcOk7z.jpg', '2025-10-15 23:52:38', '2025-11-10 11:48:54'),
(43, 'Hotel Solaris', 'Jl. Raya Karanglo No. 63, Karanglo', 1, 3.0, 450000, 650000, 'Hotel (Bintang 3) di Jl. Raya Karanglo, Karanglo. Kriteria Murah. Fasilitas: TV, Wi-Fi, Kolam Renang, Restoran.', 'penginapan/4b2Szgt5PAtItZ7IMgnmD8YSWHx3esQ950fhfwKk.jpg', '2025-10-15 23:52:38', '2025-11-10 11:49:11'),
(44, 'Shinta Guest House', 'Jl. Lasem No.6, Oro-oro Dowo, Kec. Klojen', 3, NULL, 250000, 400000, 'Guesthouse/Homestay di Jl. Lasem No.6, Oro-oro Dowo, Kec. Klojen. Kriteria Murah. Fasilitas: TV, Wi-Fi.', 'penginapan/3nRNQkoUEkBxiUK55i85t38yvD8seo2AYcKm31gK.jpg', '2025-10-15 23:52:38', '2025-11-10 11:49:26'),
(45, 'Villa Pinus Batu', 'Jl. Lintas Timur, Oro-oro Ombo', 2, NULL, 1100000, 1800000, 'Villa sewa harian di Jl. Lintas Timur, Oro-oro Ombo. Kriteria Mahal. Fasilitas: TV, Wi-Fi.', 'penginapan/Wlzz3Guxr5mvhG0Y53IiPJE4v3vD0aeVnyrX0VhU.jpg', '2025-10-15 23:52:38', '2025-11-10 11:49:43'),
(46, 'Hotel O near Alun Alun', 'Jl. Diponegoro No. 25, Sisir', 1, 2.0, 150000, 280000, 'Hotel Budget (Bintang 2) di Raya Punten, Jalan Bukit Berbunga Bumiaji, Kota Batu. Fasilitas: TV, Wi-Fi.', 'penginapan/eWlMBzU0gkAQZz7FyiqtWVyAZR8kIw5G2VeSxiTB.jpg', '2025-10-15 23:52:38', '2025-11-10 11:50:01'),
(47, 'Hanoman Hotel', 'Jl. Bukit Berbunga No.14, Sidomulyo, Kec. Batu, Kota Batu', 1, 4.0, 750000, 1000000, 'Hotel (Bintang 4)  di Jl. Bukit Berbunga No.14, Sidomulyo, Kec. Batu, Kota Batu. Kriteria Menengah. Fasilitas: TV, Wi-Fi, Kolam Renang, Restoran.', 'penginapan/i6Xc38utm89iw53GfBQKBlKfQ6cnrR3wLyCQ0yVh.jpg', '2025-10-15 23:52:38', '2025-11-10 11:50:17'),
(48, 'Briggs Inn Batu', 'Jl. Ir. Soekarno No.377, Mojorejo, Kec. Junrejo, Kota Batu', 1, 3.0, 250000, 450000, 'Hotel (Bintang 3) di Jl. Ir. Soekarno No.377, Mojorejo, Kec. Junrejo, Kota Batu. Kriteria Murah. Fasilitas: TV, Wi-Fi, Restoran.', 'penginapan/g8fYU0oGu0WNssnZUO2RgzwEwPbe6jzayYMR0H8K.jpg', '2025-10-15 23:52:38', '2025-11-10 11:50:37'),
(49, 'Villa Apel', 'Jl. Abdul Gani Atas No.09, Ngaglik, Kec. Batu, Kota Batu', 2, NULL, 800000, 950000, 'Villa sewa harian di Jl. Abdul Gani Atas No.09, Ngaglik, Kec. Batu, Kota Batu. Kriteria Menengah. Fasilitas: TV, Wi-Fi.', 'penginapan/ujmnS16R99BC7dqBBOI55ehhNXBz246Yl4N8vdOB.jpg', '2025-10-15 23:52:38', '2025-11-10 11:50:55'),
(50, 'Hotel Palem Sari', 'Jalan Raya Punten No. 2 Punten Bumiaji, Punten, Kec. Batu, Kota Batu', 1, 3.0, 350000, 500000, 'Hotel (Bintang 3) di Jalan Raya Punten No. 2 Punten Bumiaji, Punten, Kec. Batu, Kota Batu. Kriteria Murah. Fasilitas: TV, Wi-Fi, Kolam Renang, Restoran.', 'penginapan/QHoYKXpPkVi28Szwv1MvlMbXfAY4cpd8PV9eypfw.jpg', '2025-10-15 23:52:38', '2025-11-10 11:51:15'),
(51, 'De View Hotel', 'Jalan Raya Selecta No.157, Punten, Kec. Bumiaji, Kota Batu', 1, 3.0, 420000, 600000, 'Hotel (Bintang 3) dengan pemandangan di Jalan Raya Selecta No.157, Punten, Kec. Bumiaji, Kota Batu. Kriteria Murah. Fasilitas: TV, Wi-Fi, Restoran.', 'penginapan/paPT3UFs4DgnkAgUFuN8VY5ryPQwUp3gYcy0qGGP.jpg', '2025-10-15 23:52:38', '2025-11-10 11:45:37'),
(52, 'Villa Panderman View', '4G5F+J2P, Jl. Bukit Panderman Hill, Sisir, Kec. Batu, Kota Batu', 2, NULL, 700000, 1000000, 'Villa sewa harian dengan pemandangan di 4G5F+J2P, Jl. Bukit Panderman Hill, Sisir, Kec. Batu, Kota Batu. Kriteria Menengah. Fasilitas: TV, Wi-Fi.', 'penginapan/C9ufo4exPhuRJvZAFNwu9RBqIZanV2gG2EOjk2HM.jpg', '2025-10-15 23:52:38', '2025-11-10 11:45:22'),
(53, 'Golden Hill Hotel', 'Jl. Raya Oro-Oro Ombo No.11, Temas, Kec. Batu, Kota Batu', 1, 4.0, 650000, 900000, 'Hotel (Bintang 4) dan Resort di Jl. Raya Oro-Oro Ombo No.11, Temas, Kec. Batu, Kota Batu. Kriteria Menengah. Fasilitas: TV, Wi-Fi, Kolam Renang, Restoran.', 'penginapan/l0J5YgW63j0tFavzRub0heX1HN68l4aazeOvow6M.jpg', '2025-10-15 23:52:38', '2025-11-10 11:45:05'),
(54, 'Villa Mulyono', 'Jalan Purwosenjoto RT04 RW03 Bumiaji, Bulukerto, Batu', 2, 3.0, 600000, 950000, 'Villa sewa harian di Jalan Purwosenjoto RT04 RW03 Bumiaji, Bulukerto, Batu. Kriteria Menengah. Fasilitas: TV, Wi-Fi.', 'penginapan/SUBYjNPGZnJaxXsno4PB0XkzF0lCXg5i2DlcBH6u.jpg', '2025-10-15 23:52:38', '2025-11-10 11:44:48'),
(55, 'Muslim Guest House Batu', 'Jl. Ir. Soekarno Gang 4 No. 8, Desa Dadaprejo, Kota Batu', 3, NULL, 220000, 380000, 'Guesthouse/Homestay sederhana di Jl. Ir. Soekarno Gang 4 No. 8, Desa Dadaprejo, Kota Batu. Kriteria Murah. Fasilitas: TV, Wi-Fi.', 'penginapan/aFFirzJudTTiR0DMvtUJXpPGlwFgzElKn2EAeaHN.jpg', '2025-10-15 23:52:38', '2025-11-10 11:44:34');

-- --------------------------------------------------------

--
-- Struktur dari tabel `penginapan_fasilitas`
--

CREATE TABLE `penginapan_fasilitas` (
  `id_penginapan` bigint UNSIGNED NOT NULL,
  `id_fasilitas` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `penginapan_fasilitas`
--

INSERT INTO `penginapan_fasilitas` (`id_penginapan`, `id_fasilitas`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(53, 1),
(54, 1),
(1, 2),
(2, 2),
(3, 2),
(4, 2),
(5, 2),
(6, 2),
(7, 2),
(8, 2),
(9, 2),
(10, 2),
(11, 2),
(12, 2),
(13, 2),
(14, 2),
(15, 2),
(16, 2),
(17, 2),
(18, 2),
(19, 2),
(20, 2),
(21, 2),
(22, 2),
(23, 2),
(24, 2),
(25, 2),
(26, 2),
(27, 2),
(28, 2),
(29, 2),
(30, 2),
(31, 2),
(32, 2),
(33, 2),
(34, 2),
(35, 2),
(36, 2),
(37, 2),
(38, 2),
(39, 2),
(40, 2),
(41, 2),
(42, 2),
(43, 2),
(44, 2),
(45, 2),
(46, 2),
(47, 2),
(48, 2),
(49, 2),
(50, 2),
(51, 2),
(52, 2),
(53, 2),
(54, 2),
(55, 2),
(1, 3),
(2, 3),
(5, 3),
(6, 3),
(7, 3),
(8, 3),
(9, 3),
(10, 3),
(13, 3),
(14, 3),
(15, 3),
(16, 3),
(17, 3),
(19, 3),
(20, 3),
(22, 3),
(25, 3),
(31, 3),
(33, 3),
(35, 3),
(36, 3),
(38, 3),
(39, 3),
(40, 3),
(41, 3),
(45, 3),
(47, 3),
(49, 3),
(50, 3),
(51, 3),
(53, 3),
(54, 3),
(1, 4),
(2, 4),
(3, 4),
(4, 4),
(6, 4),
(7, 4),
(8, 4),
(9, 4),
(10, 4),
(11, 4),
(13, 4),
(14, 4),
(15, 4),
(16, 4),
(17, 4),
(19, 4),
(22, 4),
(30, 4),
(31, 4),
(32, 4),
(35, 4),
(36, 4),
(38, 4),
(39, 4),
(41, 4),
(52, 4),
(31, 5),
(35, 5),
(39, 5),
(48, 5),
(55, 5),
(31, 6),
(32, 6),
(41, 6),
(38, 7),
(21, 8),
(32, 8),
(33, 8),
(35, 8),
(38, 8),
(39, 8),
(41, 8),
(32, 9),
(33, 9);

-- --------------------------------------------------------

--
-- Struktur dari tabel `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('2aRjZqc3me5Sls7kUAtVhzmAcGA7cvc7ndHzalWq', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiTGttVzRlN2Q2QVVyWG1NYkFwVDZGbllFT1ozTk4xZXZ5dWo3VW1WNyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC90ZmlkZiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7fQ==', 1765736650),
('CKzjDpRqRqD77iB1RFOOjHZ7twaYqWLk5Cw3ruAo', 6, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiTXVUbHhjOW5IQzNXNGxBb3JXWUhGcnBhb3pyczNtaTBRcUhiTktHTyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC91c2VyL3Jla29tZW5kYXNpIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6Njt9', 1765508271),
('F4rNNGRYzx1qHO0OGud6EkRT5828Zuje9DnLnfKJ', 6, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiWVZBcm5ROUlrSmpoRldNMFVWd1R1cmE1cFNLUE1lWXZpdmViWGk1MiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC91c2VyL2hvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aTo2O30=', 1766317779),
('pHpIx1rf9vwfWrrO9n5tkiyyMnC2qCQ8vHd1t8IG', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibTVwQXhCZllTVEhlV25CR1pYQmU4bG1HbVVtV0F1TzNVQ3hMeGd5MCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1765745035);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tf`
--

CREATE TABLE `tf` (
  `id` bigint UNSIGNED NOT NULL,
  `penginapan_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `tf`
--

INSERT INTO `tf` (`id`, `penginapan_id`, `created_at`, `updated_at`) VALUES
(4, 1, '2025-11-06 02:30:18', '2025-11-06 02:30:18'),
(5, 2, '2025-11-06 02:33:05', '2025-11-06 02:33:05'),
(6, 3, '2025-11-06 02:35:49', '2025-11-06 02:35:49'),
(7, 4, '2025-11-06 02:38:27', '2025-11-06 02:38:27'),
(8, 5, '2025-11-06 02:41:11', '2025-11-06 02:41:11'),
(9, 6, '2025-11-06 02:44:22', '2025-11-06 02:44:22'),
(10, 7, '2025-11-06 02:46:38', '2025-11-06 02:46:38'),
(11, 8, '2025-11-06 02:49:22', '2025-11-06 02:49:22'),
(16, 9, '2025-11-06 02:54:41', '2025-11-06 02:54:41'),
(17, 10, '2025-11-06 02:59:30', '2025-11-06 02:59:30'),
(18, 11, '2025-11-06 03:02:28', '2025-11-06 03:02:28'),
(19, 12, '2025-11-06 03:05:04', '2025-11-06 03:05:04'),
(20, 13, '2025-11-06 03:07:13', '2025-11-06 03:07:13'),
(21, 14, '2025-11-06 03:09:07', '2025-11-06 03:09:07'),
(22, 15, '2025-11-06 03:11:47', '2025-11-06 03:11:47'),
(23, 16, '2025-11-08 01:51:16', '2025-11-08 01:51:16'),
(24, 17, '2025-11-08 01:55:47', '2025-11-08 01:55:47'),
(25, 18, '2025-11-08 01:58:01', '2025-11-08 01:58:01'),
(26, 19, '2025-11-08 02:59:06', '2025-11-08 02:59:06'),
(27, 20, '2025-11-08 03:04:49', '2025-11-08 03:04:49'),
(28, 21, '2025-11-09 09:38:20', '2025-11-09 09:38:20'),
(29, 22, '2025-11-09 09:40:30', '2025-11-09 09:40:30'),
(30, 23, '2025-11-09 09:47:52', '2025-11-09 09:47:52'),
(31, 24, '2025-11-09 09:50:46', '2025-11-09 09:50:46'),
(32, 25, '2025-11-09 09:53:17', '2025-11-09 09:53:17'),
(33, 26, '2025-11-09 09:55:57', '2025-11-09 09:55:57'),
(34, 27, '2025-11-09 09:58:52', '2025-11-09 09:58:52'),
(35, 28, '2025-11-09 10:01:47', '2025-11-09 10:01:47'),
(36, 29, '2025-11-09 10:04:44', '2025-11-09 10:04:44'),
(37, 30, '2025-11-09 10:06:59', '2025-11-09 10:06:59'),
(38, 31, '2025-11-09 10:09:53', '2025-11-09 10:09:53'),
(39, 32, '2025-11-09 10:14:59', '2025-11-09 10:14:59'),
(40, 33, '2025-11-09 10:17:01', '2025-11-09 10:17:01'),
(41, 34, '2025-11-09 10:19:58', '2025-11-09 10:19:58'),
(42, 35, '2025-11-09 10:23:01', '2025-11-09 10:23:01'),
(43, 36, '2025-11-09 10:26:39', '2025-11-09 10:26:39'),
(44, 37, '2025-11-09 10:29:51', '2025-11-09 10:29:51'),
(45, 38, '2025-11-09 10:33:11', '2025-11-09 10:33:11'),
(46, 39, '2025-11-09 10:34:45', '2025-11-09 10:34:45'),
(47, 40, '2025-11-09 10:37:00', '2025-11-09 10:37:00'),
(48, 41, '2025-11-09 10:39:27', '2025-11-09 10:39:27'),
(49, 42, '2025-11-09 10:42:28', '2025-11-09 10:42:28'),
(50, 43, '2025-11-09 10:47:36', '2025-11-09 10:47:36'),
(51, 44, '2025-11-09 10:51:02', '2025-11-09 10:51:02'),
(52, 45, '2025-11-09 10:53:27', '2025-11-09 10:53:27'),
(53, 46, '2025-11-09 10:57:07', '2025-11-09 10:57:07'),
(54, 47, '2025-11-09 11:00:02', '2025-11-09 11:00:02'),
(55, 48, '2025-11-09 11:04:33', '2025-11-09 11:04:33'),
(56, 49, '2025-11-09 11:08:05', '2025-11-09 11:08:05'),
(57, 50, '2025-11-09 11:10:07', '2025-11-09 11:10:07'),
(58, 51, '2025-11-09 11:11:41', '2025-11-09 11:11:41'),
(59, 52, '2025-11-09 11:15:04', '2025-11-09 11:15:04'),
(60, 53, '2025-11-09 11:17:41', '2025-11-09 11:17:41'),
(61, 54, '2025-11-09 11:20:20', '2025-11-09 11:20:20'),
(62, 55, '2025-11-09 11:22:12', '2025-11-09 11:22:12');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tf_fasilitas`
--

CREATE TABLE `tf_fasilitas` (
  `id` bigint UNSIGNED NOT NULL,
  `tf_id` bigint UNSIGNED NOT NULL,
  `fasilitas_id` bigint UNSIGNED NOT NULL,
  `value` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `tf_fasilitas`
--

INSERT INTO `tf_fasilitas` (`id`, `tf_id`, `fasilitas_id`, `value`, `created_at`, `updated_at`) VALUES
(19, 4, 1, 1, '2025-11-06 02:30:18', '2025-11-06 02:30:18'),
(20, 4, 2, 1, '2025-11-06 02:30:18', '2025-11-06 02:30:18'),
(21, 4, 3, 1, '2025-11-06 02:30:18', '2025-11-06 02:30:18'),
(22, 4, 4, 1, '2025-11-06 02:30:18', '2025-11-06 02:30:18'),
(23, 4, 5, 1, '2025-11-06 02:30:18', '2025-11-06 02:30:18'),
(24, 4, 6, 1, '2025-11-06 02:30:18', '2025-11-06 02:30:18'),
(25, 4, 7, 0, '2025-11-06 02:30:18', '2025-11-06 02:30:18'),
(26, 4, 8, 1, '2025-11-06 02:30:18', '2025-11-06 02:30:18'),
(27, 4, 9, 0, '2025-11-06 02:30:18', '2025-11-06 02:30:18'),
(28, 5, 1, 1, '2025-11-06 02:33:05', '2025-11-06 02:33:05'),
(29, 5, 2, 1, '2025-11-06 02:33:05', '2025-11-06 02:33:05'),
(30, 5, 3, 1, '2025-11-06 02:33:05', '2025-11-06 02:33:05'),
(31, 5, 4, 1, '2025-11-06 02:33:05', '2025-11-06 02:33:05'),
(32, 5, 5, 1, '2025-11-06 02:33:05', '2025-11-06 02:33:05'),
(33, 5, 6, 0, '2025-11-06 02:33:05', '2025-11-06 02:33:05'),
(34, 5, 7, 1, '2025-11-06 02:33:05', '2025-11-06 02:33:05'),
(35, 5, 8, 0, '2025-11-06 02:33:05', '2025-11-06 02:33:05'),
(36, 5, 9, 0, '2025-11-06 02:33:05', '2025-11-06 02:33:05'),
(37, 6, 1, 1, '2025-11-06 02:35:49', '2025-11-06 02:35:49'),
(38, 6, 2, 1, '2025-11-06 02:35:49', '2025-11-06 02:35:49'),
(39, 6, 3, 0, '2025-11-06 02:35:49', '2025-11-06 02:35:49'),
(40, 6, 4, 1, '2025-11-06 02:35:49', '2025-11-06 02:35:49'),
(41, 6, 5, 0, '2025-11-06 02:35:49', '2025-11-06 02:35:49'),
(42, 6, 6, 0, '2025-11-06 02:35:49', '2025-11-06 02:35:49'),
(43, 6, 7, 1, '2025-11-06 02:35:49', '2025-11-06 02:35:49'),
(44, 6, 8, 1, '2025-11-06 02:35:49', '2025-11-06 02:35:49'),
(45, 6, 9, 1, '2025-11-06 02:35:49', '2025-11-06 02:35:49'),
(46, 7, 1, 1, '2025-11-06 02:38:27', '2025-11-06 02:38:27'),
(47, 7, 2, 1, '2025-11-06 02:38:27', '2025-11-06 02:38:27'),
(48, 7, 3, 1, '2025-11-06 02:38:27', '2025-11-06 02:38:27'),
(49, 7, 4, 1, '2025-11-06 02:38:27', '2025-11-06 02:38:27'),
(50, 7, 5, 0, '2025-11-06 02:38:27', '2025-11-06 02:38:27'),
(51, 7, 6, 1, '2025-11-06 02:38:27', '2025-11-06 02:38:27'),
(52, 7, 7, 1, '2025-11-06 02:38:27', '2025-11-06 02:38:27'),
(53, 7, 8, 1, '2025-11-06 02:38:27', '2025-11-06 02:38:27'),
(54, 7, 9, 0, '2025-11-06 02:38:27', '2025-11-06 02:38:27'),
(55, 8, 1, 1, '2025-11-06 02:41:11', '2025-11-06 02:41:11'),
(56, 8, 2, 1, '2025-11-06 02:41:11', '2025-11-06 02:41:11'),
(57, 8, 3, 1, '2025-11-06 02:41:11', '2025-11-06 02:41:11'),
(58, 8, 4, 0, '2025-11-06 02:41:11', '2025-11-06 02:41:11'),
(59, 8, 5, 1, '2025-11-06 02:41:11', '2025-11-06 02:41:11'),
(60, 8, 6, 1, '2025-11-06 02:41:11', '2025-11-06 02:41:11'),
(61, 8, 7, 0, '2025-11-06 02:41:11', '2025-11-06 02:41:11'),
(62, 8, 8, 1, '2025-11-06 02:41:11', '2025-11-06 02:41:11'),
(63, 8, 9, 0, '2025-11-06 02:41:11', '2025-11-06 02:41:11'),
(64, 9, 1, 1, '2025-11-06 02:44:22', '2025-11-06 02:44:22'),
(65, 9, 2, 1, '2025-11-06 02:44:22', '2025-11-06 02:44:22'),
(66, 9, 3, 1, '2025-11-06 02:44:22', '2025-11-06 02:44:22'),
(67, 9, 4, 1, '2025-11-06 02:44:22', '2025-11-06 02:44:22'),
(68, 9, 5, 0, '2025-11-06 02:44:22', '2025-11-06 02:44:22'),
(69, 9, 6, 1, '2025-11-06 02:44:22', '2025-11-06 02:44:22'),
(70, 9, 7, 1, '2025-11-06 02:44:22', '2025-11-06 02:44:22'),
(71, 9, 8, 1, '2025-11-06 02:44:22', '2025-11-06 02:44:22'),
(72, 9, 9, 0, '2025-11-06 02:44:22', '2025-11-06 02:44:22'),
(73, 10, 1, 1, '2025-11-06 02:46:38', '2025-11-06 02:46:38'),
(74, 10, 2, 1, '2025-11-06 02:46:39', '2025-11-06 02:46:39'),
(75, 10, 3, 1, '2025-11-06 02:46:39', '2025-11-06 02:46:39'),
(76, 10, 4, 1, '2025-11-06 02:46:39', '2025-11-06 02:46:39'),
(77, 10, 5, 0, '2025-11-06 02:46:39', '2025-11-06 02:46:39'),
(78, 10, 6, 0, '2025-11-06 02:46:39', '2025-11-06 02:46:39'),
(79, 10, 7, 1, '2025-11-06 02:46:39', '2025-11-06 02:46:39'),
(80, 10, 8, 0, '2025-11-06 02:46:39', '2025-11-06 02:46:39'),
(81, 10, 9, 1, '2025-11-06 02:46:39', '2025-11-06 02:46:39'),
(82, 11, 1, 1, '2025-11-06 02:49:22', '2025-11-06 02:49:22'),
(83, 11, 2, 1, '2025-11-06 02:49:22', '2025-11-06 02:49:22'),
(84, 11, 3, 1, '2025-11-06 02:49:22', '2025-11-06 02:49:22'),
(85, 11, 4, 1, '2025-11-06 02:49:22', '2025-11-06 02:49:22'),
(86, 11, 5, 0, '2025-11-06 02:49:22', '2025-11-06 02:49:22'),
(87, 11, 6, 0, '2025-11-06 02:49:22', '2025-11-06 02:49:22'),
(88, 11, 7, 1, '2025-11-06 02:49:22', '2025-11-06 02:49:22'),
(89, 11, 8, 0, '2025-11-06 02:49:22', '2025-11-06 02:49:22'),
(90, 11, 9, 1, '2025-11-06 02:49:22', '2025-11-06 02:49:22'),
(91, 16, 1, 1, '2025-11-06 02:54:41', '2025-11-06 02:54:41'),
(92, 16, 2, 1, '2025-11-06 02:54:41', '2025-11-06 02:54:41'),
(93, 16, 3, 1, '2025-11-06 02:54:41', '2025-11-06 02:54:41'),
(94, 16, 4, 1, '2025-11-06 02:54:41', '2025-11-06 02:54:41'),
(95, 16, 5, 1, '2025-11-06 02:54:41', '2025-11-06 02:54:41'),
(96, 16, 6, 1, '2025-11-06 02:54:41', '2025-11-06 02:54:41'),
(97, 16, 7, 1, '2025-11-06 02:54:41', '2025-11-06 02:54:41'),
(98, 16, 8, 1, '2025-11-06 02:54:41', '2025-11-06 02:54:41'),
(99, 16, 9, 1, '2025-11-06 02:54:41', '2025-11-06 02:54:41'),
(100, 17, 1, 1, '2025-11-06 02:59:30', '2025-11-06 02:59:30'),
(101, 17, 2, 1, '2025-11-06 02:59:30', '2025-11-06 02:59:30'),
(102, 17, 3, 1, '2025-11-06 02:59:30', '2025-11-06 02:59:30'),
(103, 17, 4, 1, '2025-11-06 02:59:30', '2025-11-06 02:59:30'),
(104, 17, 5, 1, '2025-11-06 02:59:30', '2025-11-06 02:59:30'),
(105, 17, 6, 1, '2025-11-06 02:59:30', '2025-11-06 02:59:30'),
(106, 17, 7, 0, '2025-11-06 02:59:30', '2025-11-06 02:59:30'),
(107, 17, 8, 0, '2025-11-06 02:59:30', '2025-11-06 02:59:30'),
(108, 17, 9, 0, '2025-11-06 02:59:30', '2025-11-06 02:59:30'),
(109, 18, 1, 1, '2025-11-06 03:02:28', '2025-11-06 03:02:28'),
(110, 18, 2, 1, '2025-11-06 03:02:28', '2025-11-06 03:02:28'),
(111, 18, 3, 0, '2025-11-06 03:02:28', '2025-11-06 03:02:28'),
(112, 18, 4, 1, '2025-11-06 03:02:28', '2025-11-06 03:02:28'),
(113, 18, 5, 1, '2025-11-06 03:02:28', '2025-11-06 03:02:28'),
(114, 18, 6, 1, '2025-11-06 03:02:28', '2025-11-06 03:02:28'),
(115, 18, 7, 1, '2025-11-06 03:02:28', '2025-11-06 03:02:28'),
(116, 18, 8, 1, '2025-11-06 03:02:28', '2025-11-06 03:02:28'),
(117, 18, 9, 0, '2025-11-06 03:02:28', '2025-11-06 03:02:28'),
(118, 19, 1, 1, '2025-11-06 03:05:04', '2025-11-06 03:05:04'),
(119, 19, 2, 1, '2025-11-06 03:05:04', '2025-11-06 03:05:04'),
(120, 19, 3, 0, '2025-11-06 03:05:04', '2025-11-06 03:05:04'),
(121, 19, 4, 0, '2025-11-06 03:05:04', '2025-11-06 03:05:04'),
(122, 19, 5, 0, '2025-11-06 03:05:04', '2025-11-06 03:05:04'),
(123, 19, 6, 0, '2025-11-06 03:05:04', '2025-11-06 03:05:04'),
(124, 19, 7, 0, '2025-11-06 03:05:04', '2025-11-06 03:05:04'),
(125, 19, 8, 1, '2025-11-06 03:05:04', '2025-11-06 03:05:04'),
(126, 19, 9, 1, '2025-11-06 03:05:04', '2025-11-06 03:05:04'),
(127, 20, 1, 1, '2025-11-06 03:07:13', '2025-11-06 03:07:13'),
(128, 20, 2, 1, '2025-11-06 03:07:13', '2025-11-06 03:07:13'),
(129, 20, 3, 1, '2025-11-06 03:07:13', '2025-11-06 03:07:13'),
(130, 20, 4, 1, '2025-11-06 03:07:13', '2025-11-06 03:07:13'),
(131, 20, 5, 0, '2025-11-06 03:07:13', '2025-11-06 03:07:13'),
(132, 20, 6, 1, '2025-11-06 03:07:13', '2025-11-06 03:07:13'),
(133, 20, 7, 0, '2025-11-06 03:07:13', '2025-11-06 03:07:13'),
(134, 20, 8, 0, '2025-11-06 03:07:13', '2025-11-06 03:07:13'),
(135, 20, 9, 1, '2025-11-06 03:07:13', '2025-11-06 03:07:13'),
(136, 21, 1, 1, '2025-11-06 03:09:07', '2025-11-06 03:09:07'),
(137, 21, 2, 1, '2025-11-06 03:09:07', '2025-11-06 03:09:07'),
(138, 21, 3, 1, '2025-11-06 03:09:07', '2025-11-06 03:09:07'),
(139, 21, 4, 1, '2025-11-06 03:09:07', '2025-11-06 03:09:07'),
(140, 21, 5, 0, '2025-11-06 03:09:07', '2025-11-06 03:09:07'),
(141, 21, 6, 0, '2025-11-06 03:09:07', '2025-11-06 03:09:07'),
(142, 21, 7, 1, '2025-11-06 03:09:07', '2025-11-06 03:09:07'),
(143, 21, 8, 0, '2025-11-06 03:09:07', '2025-11-06 03:09:07'),
(144, 21, 9, 1, '2025-11-06 03:09:07', '2025-11-06 03:09:07'),
(145, 22, 1, 1, '2025-11-06 03:11:47', '2025-11-06 03:11:47'),
(146, 22, 2, 1, '2025-11-06 03:11:47', '2025-11-06 03:11:47'),
(147, 22, 3, 1, '2025-11-06 03:11:47', '2025-11-06 03:11:47'),
(148, 22, 4, 1, '2025-11-06 03:11:47', '2025-11-06 03:11:47'),
(149, 22, 5, 0, '2025-11-06 03:11:47', '2025-11-06 03:11:47'),
(150, 22, 6, 0, '2025-11-06 03:11:47', '2025-11-06 03:11:47'),
(151, 22, 7, 0, '2025-11-06 03:11:47', '2025-11-06 03:11:47'),
(152, 22, 8, 1, '2025-11-06 03:11:47', '2025-11-06 03:11:47'),
(153, 22, 9, 1, '2025-11-06 03:11:47', '2025-11-06 03:11:47'),
(154, 23, 1, 1, '2025-11-08 01:51:16', '2025-11-08 01:51:16'),
(155, 23, 2, 1, '2025-11-08 01:51:16', '2025-11-08 01:51:16'),
(156, 23, 3, 1, '2025-11-08 01:51:16', '2025-11-08 01:51:16'),
(157, 23, 4, 1, '2025-11-08 01:51:16', '2025-11-08 01:51:16'),
(158, 23, 5, 0, '2025-11-08 01:51:16', '2025-11-08 01:51:16'),
(159, 23, 6, 1, '2025-11-08 01:51:16', '2025-11-08 01:51:16'),
(160, 23, 7, 0, '2025-11-08 01:51:16', '2025-11-08 01:51:16'),
(161, 23, 8, 0, '2025-11-08 01:51:16', '2025-11-08 01:51:16'),
(162, 23, 9, 1, '2025-11-08 01:51:16', '2025-11-08 01:51:16'),
(163, 24, 1, 1, '2025-11-08 01:55:47', '2025-11-08 01:55:47'),
(164, 24, 2, 1, '2025-11-08 01:55:47', '2025-11-08 01:55:47'),
(165, 24, 3, 1, '2025-11-08 01:55:47', '2025-11-08 01:55:47'),
(166, 24, 4, 1, '2025-11-08 01:55:47', '2025-11-08 01:55:47'),
(167, 24, 5, 1, '2025-11-08 01:55:47', '2025-11-08 01:55:47'),
(168, 24, 6, 0, '2025-11-08 01:55:47', '2025-11-08 01:55:47'),
(169, 24, 7, 0, '2025-11-08 01:55:47', '2025-11-08 01:55:47'),
(170, 24, 8, 0, '2025-11-08 01:55:47', '2025-11-08 01:55:47'),
(171, 24, 9, 0, '2025-11-08 01:55:47', '2025-11-08 01:55:47'),
(172, 25, 1, 1, '2025-11-08 01:58:01', '2025-11-08 01:58:01'),
(173, 25, 2, 1, '2025-11-08 01:58:01', '2025-11-08 01:58:01'),
(174, 25, 3, 0, '2025-11-08 01:58:01', '2025-11-08 01:58:01'),
(175, 25, 4, 0, '2025-11-08 01:58:01', '2025-11-08 01:58:01'),
(176, 25, 5, 1, '2025-11-08 01:58:01', '2025-11-08 01:58:01'),
(177, 25, 6, 1, '2025-11-08 01:58:01', '2025-11-08 01:58:01'),
(178, 25, 7, 1, '2025-11-08 01:58:01', '2025-11-08 01:58:01'),
(179, 25, 8, 1, '2025-11-08 01:58:01', '2025-11-08 01:58:01'),
(180, 25, 9, 1, '2025-11-08 01:58:01', '2025-11-08 01:58:01'),
(181, 26, 1, 1, '2025-11-08 02:59:06', '2025-11-08 02:59:06'),
(182, 26, 2, 1, '2025-11-08 02:59:06', '2025-11-08 02:59:06'),
(183, 26, 3, 1, '2025-11-08 02:59:06', '2025-11-08 02:59:06'),
(184, 26, 4, 1, '2025-11-08 02:59:06', '2025-11-08 02:59:06'),
(185, 26, 6, 0, '2025-11-08 02:59:06', '2025-11-08 02:59:06'),
(186, 26, 5, 0, '2025-11-08 02:59:06', '2025-11-08 02:59:06'),
(187, 26, 7, 1, '2025-11-08 02:59:06', '2025-11-08 02:59:06'),
(188, 26, 8, 1, '2025-11-08 02:59:06', '2025-11-08 02:59:06'),
(189, 26, 9, 0, '2025-11-08 02:59:06', '2025-11-08 02:59:06'),
(190, 27, 1, 1, '2025-11-08 03:04:49', '2025-11-08 03:04:49'),
(191, 27, 2, 1, '2025-11-08 03:04:49', '2025-11-08 03:04:49'),
(192, 27, 3, 1, '2025-11-08 03:04:49', '2025-11-08 03:04:49'),
(193, 27, 4, 1, '2025-11-08 03:04:49', '2025-11-08 03:04:49'),
(194, 27, 5, 1, '2025-11-08 03:04:49', '2025-11-08 03:04:49'),
(195, 27, 6, 0, '2025-11-08 03:04:49', '2025-11-08 03:04:49'),
(196, 27, 7, 0, '2025-11-08 03:04:49', '2025-11-08 03:04:49'),
(197, 27, 8, 1, '2025-11-08 03:04:49', '2025-11-08 03:04:49'),
(198, 27, 9, 1, '2025-11-08 03:04:49', '2025-11-08 03:04:49'),
(199, 28, 1, 1, '2025-11-09 09:38:20', '2025-11-09 09:38:20'),
(200, 28, 2, 0, '2025-11-09 09:38:20', '2025-11-09 09:38:20'),
(201, 28, 3, 0, '2025-11-09 09:38:20', '2025-11-09 09:38:20'),
(202, 28, 4, 0, '2025-11-09 09:38:20', '2025-11-09 09:38:20'),
(203, 28, 5, 0, '2025-11-09 09:38:20', '2025-11-09 09:38:20'),
(204, 28, 6, 1, '2025-11-09 09:38:20', '2025-11-09 09:38:20'),
(205, 28, 7, 1, '2025-11-09 09:38:20', '2025-11-09 09:38:20'),
(206, 28, 8, 1, '2025-11-09 09:38:20', '2025-11-09 09:38:20'),
(207, 28, 9, 0, '2025-11-09 09:38:20', '2025-11-09 09:38:20'),
(208, 29, 1, 1, '2025-11-09 09:40:30', '2025-11-09 09:40:30'),
(209, 29, 2, 1, '2025-11-09 09:40:30', '2025-11-09 09:40:30'),
(210, 29, 3, 0, '2025-11-09 09:40:30', '2025-11-09 09:40:30'),
(211, 29, 4, 0, '2025-11-09 09:40:30', '2025-11-09 09:40:30'),
(212, 29, 5, 0, '2025-11-09 09:40:30', '2025-11-09 09:40:30'),
(213, 29, 6, 0, '2025-11-09 09:40:30', '2025-11-09 09:40:30'),
(214, 29, 7, 0, '2025-11-09 09:40:30', '2025-11-09 09:40:30'),
(215, 29, 8, 1, '2025-11-09 09:40:30', '2025-11-09 09:40:30'),
(216, 29, 9, 1, '2025-11-09 09:40:30', '2025-11-09 09:40:30'),
(217, 30, 1, 1, '2025-11-09 09:47:52', '2025-11-09 09:47:52'),
(218, 30, 2, 1, '2025-11-09 09:47:52', '2025-11-09 09:47:52'),
(219, 30, 3, 0, '2025-11-09 09:47:52', '2025-11-09 09:47:52'),
(220, 30, 4, 0, '2025-11-09 09:47:52', '2025-11-09 09:47:52'),
(221, 30, 5, 1, '2025-11-09 09:47:52', '2025-11-09 09:47:52'),
(222, 30, 6, 0, '2025-11-09 09:47:52', '2025-11-09 09:47:52'),
(223, 30, 7, 1, '2025-11-09 09:47:52', '2025-11-09 09:47:52'),
(224, 30, 8, 1, '2025-11-09 09:47:52', '2025-11-09 09:47:52'),
(225, 30, 9, 1, '2025-11-09 09:47:52', '2025-11-09 09:47:52'),
(226, 31, 1, 1, '2025-11-09 09:50:46', '2025-11-09 09:50:46'),
(227, 31, 2, 1, '2025-11-09 09:50:46', '2025-11-09 09:50:46'),
(228, 31, 3, 0, '2025-11-09 09:50:46', '2025-11-09 09:50:46'),
(229, 31, 4, 0, '2025-11-09 09:50:46', '2025-11-09 09:50:46'),
(230, 31, 5, 0, '2025-11-09 09:50:46', '2025-11-09 09:50:46'),
(231, 31, 6, 1, '2025-11-09 09:50:46', '2025-11-09 09:50:46'),
(232, 31, 7, 0, '2025-11-09 09:50:46', '2025-11-09 09:50:46'),
(233, 31, 8, 0, '2025-11-09 09:50:46', '2025-11-09 09:50:46'),
(234, 31, 9, 0, '2025-11-09 09:50:46', '2025-11-09 09:50:46'),
(235, 32, 1, 1, '2025-11-09 09:53:17', '2025-11-09 09:53:17'),
(236, 32, 2, 1, '2025-11-09 09:53:17', '2025-11-09 09:53:17'),
(237, 32, 3, 1, '2025-11-09 09:53:17', '2025-11-09 09:53:17'),
(238, 32, 4, 0, '2025-11-09 09:53:17', '2025-11-09 09:53:17'),
(239, 32, 5, 1, '2025-11-09 09:53:17', '2025-11-09 09:53:17'),
(240, 32, 6, 0, '2025-11-09 09:53:17', '2025-11-09 09:53:17'),
(241, 32, 7, 0, '2025-11-09 09:53:17', '2025-11-09 09:53:17'),
(242, 32, 8, 1, '2025-11-09 09:53:17', '2025-11-09 09:53:17'),
(243, 32, 9, 0, '2025-11-09 09:53:17', '2025-11-09 09:53:17'),
(244, 33, 1, 1, '2025-11-09 09:55:57', '2025-11-09 09:55:57'),
(245, 33, 2, 1, '2025-11-09 09:55:57', '2025-11-09 09:55:57'),
(246, 33, 3, 0, '2025-11-09 09:55:57', '2025-11-09 09:55:57'),
(247, 33, 4, 0, '2025-11-09 09:55:57', '2025-11-09 09:55:57'),
(248, 33, 5, 1, '2025-11-09 09:55:57', '2025-11-09 09:55:57'),
(249, 33, 6, 1, '2025-11-09 09:55:57', '2025-11-09 09:55:57'),
(250, 33, 7, 1, '2025-11-09 09:55:57', '2025-11-09 09:55:57'),
(251, 33, 8, 0, '2025-11-09 09:55:57', '2025-11-09 09:55:57'),
(252, 33, 9, 1, '2025-11-09 09:55:57', '2025-11-09 09:55:57'),
(253, 34, 1, 1, '2025-11-09 09:58:52', '2025-11-09 09:58:52'),
(254, 34, 2, 1, '2025-11-09 09:58:52', '2025-11-09 09:58:52'),
(255, 34, 3, 0, '2025-11-09 09:58:52', '2025-11-09 09:58:52'),
(256, 34, 4, 0, '2025-11-09 09:58:52', '2025-11-09 09:58:52'),
(257, 34, 5, 1, '2025-11-09 09:58:52', '2025-11-09 09:58:52'),
(258, 34, 6, 1, '2025-11-09 09:58:52', '2025-11-09 09:58:52'),
(259, 34, 7, 0, '2025-11-09 09:58:52', '2025-11-09 09:58:52'),
(260, 34, 8, 0, '2025-11-09 09:58:52', '2025-11-09 09:58:52'),
(261, 34, 9, 1, '2025-11-09 09:58:52', '2025-11-09 09:58:52'),
(262, 35, 1, 1, '2025-11-09 10:01:47', '2025-11-09 10:01:47'),
(263, 35, 2, 1, '2025-11-09 10:01:47', '2025-11-09 10:01:47'),
(264, 35, 3, 0, '2025-11-09 10:01:47', '2025-11-09 10:01:47'),
(265, 35, 4, 0, '2025-11-09 10:01:47', '2025-11-09 10:01:47'),
(266, 35, 5, 0, '2025-11-09 10:01:47', '2025-11-09 10:01:47'),
(267, 35, 6, 0, '2025-11-09 10:01:47', '2025-11-09 10:01:47'),
(268, 35, 7, 0, '2025-11-09 10:01:47', '2025-11-09 10:01:47'),
(269, 35, 8, 0, '2025-11-09 10:01:47', '2025-11-09 10:01:47'),
(270, 35, 9, 0, '2025-11-09 10:01:47', '2025-11-09 10:01:47'),
(271, 36, 1, 1, '2025-11-09 10:04:44', '2025-11-09 10:04:44'),
(272, 36, 2, 1, '2025-11-09 10:04:44', '2025-11-09 10:04:44'),
(273, 36, 3, 0, '2025-11-09 10:04:44', '2025-11-09 10:04:44'),
(274, 36, 4, 0, '2025-11-09 10:04:44', '2025-11-09 10:04:44'),
(275, 36, 5, 0, '2025-11-09 10:04:44', '2025-11-09 10:04:44'),
(276, 36, 6, 1, '2025-11-09 10:04:44', '2025-11-09 10:04:44'),
(277, 36, 7, 1, '2025-11-09 10:04:44', '2025-11-09 10:04:44'),
(278, 36, 8, 0, '2025-11-09 10:04:44', '2025-11-09 10:04:44'),
(279, 36, 9, 0, '2025-11-09 10:04:44', '2025-11-09 10:04:44'),
(280, 37, 1, 1, '2025-11-09 10:06:59', '2025-11-09 10:06:59'),
(281, 37, 2, 1, '2025-11-09 10:06:59', '2025-11-09 10:06:59'),
(282, 37, 3, 0, '2025-11-09 10:06:59', '2025-11-09 10:06:59'),
(283, 37, 4, 1, '2025-11-09 10:06:59', '2025-11-09 10:06:59'),
(284, 37, 5, 0, '2025-11-09 10:06:59', '2025-11-09 10:06:59'),
(285, 37, 6, 0, '2025-11-09 10:06:59', '2025-11-09 10:06:59'),
(286, 37, 7, 0, '2025-11-09 10:06:59', '2025-11-09 10:06:59'),
(287, 37, 8, 1, '2025-11-09 10:06:59', '2025-11-09 10:06:59'),
(288, 37, 9, 0, '2025-11-09 10:06:59', '2025-11-09 10:06:59'),
(289, 38, 1, 1, '2025-11-09 10:09:53', '2025-11-09 10:09:53'),
(290, 38, 2, 1, '2025-11-09 10:09:53', '2025-11-09 10:09:53'),
(291, 38, 3, 1, '2025-11-09 10:09:53', '2025-11-09 10:09:53'),
(292, 38, 4, 1, '2025-11-09 10:09:53', '2025-11-09 10:09:53'),
(293, 38, 5, 1, '2025-11-09 10:09:53', '2025-11-09 10:09:53'),
(294, 38, 6, 1, '2025-11-09 10:09:53', '2025-11-09 10:09:53'),
(295, 38, 7, 0, '2025-11-09 10:09:53', '2025-11-09 10:09:53'),
(296, 38, 8, 0, '2025-11-09 10:09:53', '2025-11-09 10:09:53'),
(297, 38, 9, 0, '2025-11-09 10:09:53', '2025-11-09 10:09:53'),
(298, 39, 1, 1, '2025-11-09 10:14:59', '2025-11-09 10:14:59'),
(299, 39, 2, 1, '2025-11-09 10:14:59', '2025-11-09 10:14:59'),
(300, 39, 3, 0, '2025-11-09 10:14:59', '2025-11-09 10:14:59'),
(301, 39, 4, 1, '2025-11-09 10:14:59', '2025-11-09 10:14:59'),
(302, 39, 5, 0, '2025-11-09 10:14:59', '2025-11-09 10:14:59'),
(303, 39, 6, 1, '2025-11-09 10:14:59', '2025-11-09 10:14:59'),
(304, 39, 7, 1, '2025-11-09 10:14:59', '2025-11-09 10:14:59'),
(305, 39, 8, 1, '2025-11-09 10:14:59', '2025-11-09 10:14:59'),
(306, 39, 9, 1, '2025-11-09 10:14:59', '2025-11-09 10:14:59'),
(307, 40, 1, 1, '2025-11-09 10:17:01', '2025-11-09 10:17:01'),
(308, 40, 2, 1, '2025-11-09 10:17:01', '2025-11-09 10:17:01'),
(309, 40, 3, 1, '2025-11-09 10:17:01', '2025-11-09 10:17:01'),
(310, 40, 4, 1, '2025-11-09 10:17:01', '2025-11-09 10:17:01'),
(311, 40, 5, 0, '2025-11-09 10:17:01', '2025-11-09 10:17:01'),
(312, 40, 6, 0, '2025-11-09 10:17:01', '2025-11-09 10:17:01'),
(313, 40, 7, 0, '2025-11-09 10:17:01', '2025-11-09 10:17:01'),
(314, 40, 8, 1, '2025-11-09 10:17:01', '2025-11-09 10:17:01'),
(315, 40, 9, 1, '2025-11-09 10:17:01', '2025-11-09 10:17:01'),
(316, 41, 1, 1, '2025-11-09 10:19:58', '2025-11-09 10:19:58'),
(317, 41, 2, 1, '2025-11-09 10:19:58', '2025-11-09 10:19:58'),
(318, 41, 3, 0, '2025-11-09 10:19:58', '2025-11-09 10:19:58'),
(319, 41, 4, 0, '2025-11-09 10:19:58', '2025-11-09 10:19:58'),
(320, 41, 5, 0, '2025-11-09 10:19:58', '2025-11-09 10:19:58'),
(321, 41, 6, 0, '2025-11-09 10:19:58', '2025-11-09 10:19:58'),
(322, 41, 7, 0, '2025-11-09 10:19:58', '2025-11-09 10:19:58'),
(323, 41, 8, 0, '2025-11-09 10:19:58', '2025-11-09 10:19:58'),
(324, 41, 9, 0, '2025-11-09 10:19:58', '2025-11-09 10:19:58'),
(325, 42, 1, 1, '2025-11-09 10:23:01', '2025-11-09 10:23:01'),
(326, 42, 2, 1, '2025-11-09 10:23:01', '2025-11-09 10:23:01'),
(327, 42, 3, 1, '2025-11-09 10:23:01', '2025-11-09 10:23:01'),
(328, 42, 4, 1, '2025-11-09 10:23:01', '2025-11-09 10:23:01'),
(329, 42, 5, 1, '2025-11-09 10:23:01', '2025-11-09 10:23:01'),
(330, 42, 6, 0, '2025-11-09 10:23:01', '2025-11-09 10:23:01'),
(331, 42, 7, 0, '2025-11-09 10:23:01', '2025-11-09 10:23:01'),
(332, 42, 8, 1, '2025-11-09 10:23:01', '2025-11-09 10:23:01'),
(333, 42, 9, 0, '2025-11-09 10:23:01', '2025-11-09 10:23:01'),
(334, 43, 1, 1, '2025-11-09 10:26:39', '2025-11-09 10:26:39'),
(335, 43, 2, 1, '2025-11-09 10:26:39', '2025-11-09 10:26:39'),
(336, 43, 3, 1, '2025-11-09 10:26:39', '2025-11-09 10:26:39'),
(337, 43, 4, 1, '2025-11-09 10:26:39', '2025-11-09 10:26:39'),
(338, 43, 5, 1, '2025-11-09 10:26:39', '2025-11-09 10:26:39'),
(339, 43, 6, 1, '2025-11-09 10:26:39', '2025-11-09 10:26:39'),
(340, 43, 7, 1, '2025-11-09 10:26:39', '2025-11-09 10:26:39'),
(341, 43, 8, 1, '2025-11-09 10:26:39', '2025-11-09 10:26:39'),
(342, 43, 9, 1, '2025-11-09 10:26:39', '2025-11-09 10:26:39'),
(343, 44, 1, 1, '2025-11-09 10:29:51', '2025-11-09 10:29:51'),
(344, 44, 2, 1, '2025-11-09 10:29:51', '2025-11-09 10:29:51'),
(345, 44, 3, 0, '2025-11-09 10:29:51', '2025-11-09 10:29:51'),
(346, 44, 4, 0, '2025-11-09 10:29:51', '2025-11-09 10:29:51'),
(347, 44, 5, 1, '2025-11-09 10:29:51', '2025-11-09 10:29:51'),
(348, 44, 6, 0, '2025-11-09 10:29:51', '2025-11-09 10:29:51'),
(349, 44, 7, 0, '2025-11-09 10:29:51', '2025-11-09 10:29:51'),
(350, 44, 8, 0, '2025-11-09 10:29:51', '2025-11-09 10:29:51'),
(351, 44, 9, 0, '2025-11-09 10:29:51', '2025-11-09 10:29:51'),
(352, 45, 1, 1, '2025-11-09 10:33:11', '2025-11-09 10:33:11'),
(353, 45, 2, 1, '2025-11-09 10:33:11', '2025-11-09 10:33:11'),
(354, 45, 3, 1, '2025-11-09 10:33:11', '2025-11-09 10:33:11'),
(355, 45, 4, 1, '2025-11-09 10:33:11', '2025-11-09 10:33:11'),
(356, 45, 5, 0, '2025-11-09 10:33:11', '2025-11-09 10:33:11'),
(357, 45, 6, 0, '2025-11-09 10:33:11', '2025-11-09 10:33:11'),
(358, 45, 7, 1, '2025-11-09 10:33:11', '2025-11-09 10:33:11'),
(359, 45, 8, 1, '2025-11-09 10:33:11', '2025-11-09 10:33:11'),
(360, 45, 9, 1, '2025-11-09 10:33:11', '2025-11-09 10:33:11'),
(361, 46, 1, 1, '2025-11-09 10:34:45', '2025-11-09 10:34:45'),
(362, 46, 2, 1, '2025-11-09 10:34:45', '2025-11-09 10:34:45'),
(363, 46, 3, 1, '2025-11-09 10:34:45', '2025-11-09 10:34:45'),
(364, 46, 4, 1, '2025-11-09 10:34:45', '2025-11-09 10:34:45'),
(365, 46, 5, 1, '2025-11-09 10:34:45', '2025-11-09 10:34:45'),
(366, 46, 6, 0, '2025-11-09 10:34:45', '2025-11-09 10:34:45'),
(367, 46, 7, 0, '2025-11-09 10:34:45', '2025-11-09 10:34:45'),
(368, 46, 8, 1, '2025-11-09 10:34:45', '2025-11-09 10:34:45'),
(369, 46, 9, 0, '2025-11-09 10:34:45', '2025-11-09 10:34:45'),
(370, 47, 1, 1, '2025-11-09 10:37:00', '2025-11-09 10:37:00'),
(371, 47, 2, 1, '2025-11-09 10:37:00', '2025-11-09 10:37:00'),
(372, 47, 3, 0, '2025-11-09 10:37:00', '2025-11-09 10:37:00'),
(373, 47, 4, 0, '2025-11-09 10:37:00', '2025-11-09 10:37:00'),
(374, 47, 5, 0, '2025-11-09 10:37:00', '2025-11-09 10:37:00'),
(375, 47, 6, 1, '2025-11-09 10:37:00', '2025-11-09 10:37:00'),
(376, 47, 7, 0, '2025-11-09 10:37:00', '2025-11-09 10:37:00'),
(377, 47, 8, 0, '2025-11-09 10:37:00', '2025-11-09 10:37:00'),
(378, 47, 9, 1, '2025-11-09 10:37:00', '2025-11-09 10:37:00'),
(379, 48, 1, 1, '2025-11-09 10:39:28', '2025-11-09 10:39:28'),
(380, 48, 2, 1, '2025-11-09 10:39:28', '2025-11-09 10:39:28'),
(381, 48, 3, 0, '2025-11-09 10:39:28', '2025-11-09 10:39:28'),
(382, 48, 4, 0, '2025-11-09 10:39:28', '2025-11-09 10:39:28'),
(383, 48, 5, 0, '2025-11-09 10:39:28', '2025-11-09 10:39:28'),
(384, 48, 6, 1, '2025-11-09 10:39:28', '2025-11-09 10:39:28'),
(385, 48, 7, 1, '2025-11-09 10:39:28', '2025-11-09 10:39:28'),
(386, 48, 8, 1, '2025-11-09 10:39:28', '2025-11-09 10:39:28'),
(387, 48, 9, 1, '2025-11-09 10:39:28', '2025-11-09 10:39:28'),
(388, 49, 1, 1, '2025-11-09 10:42:28', '2025-11-09 10:42:28'),
(389, 49, 2, 1, '2025-11-09 10:42:28', '2025-11-09 10:42:28'),
(390, 49, 3, 0, '2025-11-09 10:42:28', '2025-11-09 10:42:28'),
(391, 49, 4, 0, '2025-11-09 10:42:28', '2025-11-09 10:42:28'),
(392, 49, 5, 1, '2025-11-09 10:42:28', '2025-11-09 10:42:28'),
(393, 49, 6, 0, '2025-11-09 10:42:28', '2025-11-09 10:42:28'),
(394, 49, 7, 1, '2025-11-09 10:42:28', '2025-11-09 10:42:28'),
(395, 49, 8, 1, '2025-11-09 10:42:28', '2025-11-09 10:42:28'),
(396, 49, 9, 1, '2025-11-09 10:42:28', '2025-11-09 10:42:28'),
(397, 50, 1, 1, '2025-11-09 10:47:36', '2025-11-09 10:47:36'),
(398, 50, 2, 1, '2025-11-09 10:47:36', '2025-11-09 10:47:36'),
(399, 50, 3, 1, '2025-11-09 10:47:36', '2025-11-09 10:47:36'),
(400, 50, 4, 1, '2025-11-09 10:47:36', '2025-11-09 10:47:36'),
(401, 50, 5, 1, '2025-11-09 10:47:36', '2025-11-09 10:47:36'),
(402, 50, 6, 0, '2025-11-09 10:47:36', '2025-11-09 10:47:36'),
(403, 50, 7, 1, '2025-11-09 10:47:36', '2025-11-09 10:47:36'),
(404, 50, 8, 1, '2025-11-09 10:47:36', '2025-11-09 10:47:36'),
(405, 50, 9, 1, '2025-11-09 10:47:36', '2025-11-09 10:47:36'),
(406, 51, 1, 1, '2025-11-09 10:51:02', '2025-11-09 10:51:02'),
(407, 51, 2, 1, '2025-11-09 10:51:02', '2025-11-09 10:51:02'),
(408, 51, 3, 0, '2025-11-09 10:51:02', '2025-11-09 10:51:02'),
(409, 51, 4, 0, '2025-11-09 10:51:02', '2025-11-09 10:51:02'),
(410, 51, 5, 0, '2025-11-09 10:51:02', '2025-11-09 10:51:02'),
(411, 51, 6, 0, '2025-11-09 10:51:02', '2025-11-09 10:51:02'),
(412, 51, 7, 0, '2025-11-09 10:51:02', '2025-11-09 10:51:02'),
(413, 51, 8, 0, '2025-11-09 10:51:02', '2025-11-09 10:51:02'),
(414, 51, 9, 1, '2025-11-09 10:51:02', '2025-11-09 10:51:02'),
(415, 52, 1, 1, '2025-11-09 10:53:27', '2025-11-09 10:53:27'),
(416, 52, 2, 1, '2025-11-09 10:53:27', '2025-11-09 10:53:27'),
(417, 52, 3, 0, '2025-11-09 10:53:27', '2025-11-09 10:53:27'),
(418, 52, 4, 0, '2025-11-09 10:53:27', '2025-11-09 10:53:27'),
(419, 52, 5, 1, '2025-11-09 10:53:27', '2025-11-09 10:53:27'),
(420, 52, 6, 1, '2025-11-09 10:53:27', '2025-11-09 10:53:27'),
(421, 52, 7, 0, '2025-11-09 10:53:27', '2025-11-09 10:53:27'),
(422, 52, 8, 0, '2025-11-09 10:53:27', '2025-11-09 10:53:27'),
(423, 52, 9, 0, '2025-11-09 10:53:27', '2025-11-09 10:53:27'),
(424, 53, 1, 1, '2025-11-09 10:57:07', '2025-11-09 10:57:07'),
(425, 53, 2, 1, '2025-11-09 10:57:07', '2025-11-09 10:57:07'),
(426, 53, 3, 0, '2025-11-09 10:57:07', '2025-11-09 10:57:07'),
(427, 53, 4, 0, '2025-11-09 10:57:07', '2025-11-09 10:57:07'),
(428, 53, 5, 1, '2025-11-09 10:57:07', '2025-11-09 10:57:07'),
(429, 53, 6, 0, '2025-11-09 10:57:07', '2025-11-09 10:57:07'),
(430, 53, 7, 1, '2025-11-09 10:57:07', '2025-11-09 10:57:07'),
(431, 53, 8, 1, '2025-11-09 10:57:07', '2025-11-09 10:57:07'),
(432, 53, 9, 0, '2025-11-09 10:57:07', '2025-11-09 10:57:07'),
(433, 54, 1, 1, '2025-11-09 11:00:02', '2025-11-09 11:00:02'),
(434, 54, 2, 1, '2025-11-09 11:00:02', '2025-11-09 11:00:02'),
(435, 54, 3, 1, '2025-11-09 11:00:02', '2025-11-09 11:00:02'),
(436, 54, 4, 1, '2025-11-09 11:00:02', '2025-11-09 11:00:02'),
(437, 54, 5, 1, '2025-11-09 11:00:02', '2025-11-09 11:00:02'),
(438, 54, 6, 1, '2025-11-09 11:00:02', '2025-11-09 11:00:02'),
(439, 54, 7, 0, '2025-11-09 11:00:02', '2025-11-09 11:00:02'),
(440, 54, 8, 1, '2025-11-09 11:00:02', '2025-11-09 11:00:02'),
(441, 54, 9, 1, '2025-11-09 11:00:02', '2025-11-09 11:00:02'),
(442, 55, 1, 1, '2025-11-09 11:04:33', '2025-11-09 11:04:33'),
(443, 55, 2, 1, '2025-11-09 11:04:33', '2025-11-09 11:04:33'),
(444, 55, 3, 0, '2025-11-09 11:04:33', '2025-11-09 11:04:33'),
(445, 55, 4, 1, '2025-11-09 11:04:33', '2025-11-09 11:04:33'),
(446, 55, 5, 1, '2025-11-09 11:04:33', '2025-11-09 11:04:33'),
(447, 55, 6, 0, '2025-11-09 11:04:33', '2025-11-09 11:04:33'),
(448, 55, 7, 0, '2025-11-09 11:04:33', '2025-11-09 11:04:33'),
(449, 55, 8, 0, '2025-11-09 11:04:33', '2025-11-09 11:04:33'),
(450, 55, 9, 0, '2025-11-09 11:04:33', '2025-11-09 11:04:33'),
(451, 56, 1, 1, '2025-11-09 11:08:05', '2025-11-09 11:08:05'),
(452, 56, 2, 1, '2025-11-09 11:08:05', '2025-11-09 11:08:05'),
(453, 56, 3, 0, '2025-11-09 11:08:05', '2025-11-09 11:08:05'),
(454, 56, 4, 0, '2025-11-09 11:08:05', '2025-11-09 11:08:05'),
(455, 56, 5, 1, '2025-11-09 11:08:05', '2025-11-09 11:08:05'),
(456, 56, 6, 1, '2025-11-09 11:08:05', '2025-11-09 11:08:05'),
(457, 56, 7, 0, '2025-11-09 11:08:05', '2025-11-09 11:08:05'),
(458, 56, 8, 0, '2025-11-09 11:08:05', '2025-11-09 11:08:05'),
(459, 56, 9, 1, '2025-11-09 11:08:05', '2025-11-09 11:08:05'),
(460, 57, 1, 1, '2025-11-09 11:10:07', '2025-11-09 11:10:07'),
(461, 57, 2, 1, '2025-11-09 11:10:07', '2025-11-09 11:10:07'),
(462, 57, 3, 1, '2025-11-09 11:10:07', '2025-11-09 11:10:07'),
(463, 57, 4, 1, '2025-11-09 11:10:07', '2025-11-09 11:10:07'),
(464, 57, 5, 0, '2025-11-09 11:10:07', '2025-11-09 11:10:07'),
(465, 57, 6, 1, '2025-11-09 11:10:07', '2025-11-09 11:10:07'),
(466, 57, 7, 0, '2025-11-09 11:10:07', '2025-11-09 11:10:07'),
(467, 57, 8, 0, '2025-11-09 11:10:07', '2025-11-09 11:10:07'),
(468, 57, 9, 0, '2025-11-09 11:10:07', '2025-11-09 11:10:07'),
(469, 58, 1, 1, '2025-11-09 11:11:41', '2025-11-09 11:11:41'),
(470, 58, 2, 1, '2025-11-09 11:11:41', '2025-11-09 11:11:41'),
(471, 58, 3, 0, '2025-11-09 11:11:41', '2025-11-09 11:11:41'),
(472, 58, 4, 1, '2025-11-09 11:11:41', '2025-11-09 11:11:41'),
(473, 58, 5, 0, '2025-11-09 11:11:41', '2025-11-09 11:11:41'),
(474, 58, 6, 1, '2025-11-09 11:11:41', '2025-11-09 11:11:41'),
(475, 58, 7, 0, '2025-11-09 11:11:41', '2025-11-09 11:11:41'),
(476, 58, 8, 1, '2025-11-09 11:11:41', '2025-11-09 11:11:41'),
(477, 58, 9, 0, '2025-11-09 11:11:41', '2025-11-09 11:11:41'),
(478, 59, 1, 1, '2025-11-09 11:15:04', '2025-11-09 11:15:04'),
(479, 59, 2, 1, '2025-11-09 11:15:04', '2025-11-09 11:15:04'),
(480, 59, 3, 0, '2025-11-09 11:15:04', '2025-11-09 11:15:04'),
(481, 59, 4, 0, '2025-11-09 11:15:04', '2025-11-09 11:15:04'),
(482, 59, 5, 0, '2025-11-09 11:15:04', '2025-11-09 11:15:04'),
(483, 59, 6, 1, '2025-11-09 11:15:04', '2025-11-09 11:15:04'),
(484, 59, 7, 1, '2025-11-09 11:15:04', '2025-11-09 11:15:04'),
(485, 59, 8, 1, '2025-11-09 11:15:04', '2025-11-09 11:15:04'),
(486, 59, 9, 0, '2025-11-09 11:15:04', '2025-11-09 11:15:04'),
(487, 60, 1, 1, '2025-11-09 11:17:41', '2025-11-09 11:17:41'),
(488, 60, 2, 1, '2025-11-09 11:17:41', '2025-11-09 11:17:41'),
(489, 60, 3, 1, '2025-11-09 11:17:41', '2025-11-09 11:17:41'),
(490, 60, 4, 1, '2025-11-09 11:17:41', '2025-11-09 11:17:41'),
(491, 60, 5, 0, '2025-11-09 11:17:41', '2025-11-09 11:17:41'),
(492, 60, 6, 0, '2025-11-09 11:17:41', '2025-11-09 11:17:41'),
(493, 60, 7, 0, '2025-11-09 11:17:41', '2025-11-09 11:17:41'),
(494, 60, 8, 1, '2025-11-09 11:17:41', '2025-11-09 11:17:41'),
(495, 60, 9, 0, '2025-11-09 11:17:41', '2025-11-09 11:17:41'),
(496, 61, 1, 1, '2025-11-09 11:20:20', '2025-11-09 11:20:20'),
(497, 61, 2, 1, '2025-11-09 11:20:20', '2025-11-09 11:20:20'),
(498, 61, 3, 0, '2025-11-09 11:20:20', '2025-11-09 11:20:20'),
(499, 61, 4, 0, '2025-11-09 11:20:20', '2025-11-09 11:20:20'),
(500, 61, 5, 1, '2025-11-09 11:20:20', '2025-11-09 11:20:20'),
(501, 61, 6, 1, '2025-11-09 11:20:20', '2025-11-09 11:20:20'),
(502, 61, 7, 1, '2025-11-09 11:20:20', '2025-11-09 11:20:20'),
(503, 61, 8, 1, '2025-11-09 11:20:20', '2025-11-09 11:20:20'),
(504, 61, 9, 1, '2025-11-09 11:20:20', '2025-11-09 11:20:20'),
(505, 62, 1, 0, '2025-11-09 11:22:12', '2025-11-09 11:22:12'),
(506, 62, 2, 1, '2025-11-09 11:22:12', '2025-11-09 11:22:12'),
(507, 62, 3, 0, '2025-11-09 11:22:12', '2025-11-09 11:22:12'),
(508, 62, 4, 0, '2025-11-09 11:22:12', '2025-11-09 11:22:12'),
(509, 62, 5, 0, '2025-11-09 11:22:12', '2025-11-09 11:22:12'),
(510, 62, 6, 1, '2025-11-09 11:22:12', '2025-11-09 11:22:12'),
(511, 62, 7, 0, '2025-11-09 11:22:12', '2025-11-09 11:22:12'),
(512, 62, 8, 1, '2025-11-09 11:22:12', '2025-11-09 11:22:12'),
(513, 62, 9, 0, '2025-11-09 11:22:12', '2025-11-09 11:22:12');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tf_idf`
--

CREATE TABLE `tf_idf` (
  `id` bigint UNSIGNED NOT NULL,
  `penginapan_id` bigint UNSIGNED NOT NULL,
  `tf_id` bigint UNSIGNED NOT NULL,
  `hasil` decimal(8,4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `tf_idf`
--

INSERT INTO `tf_idf` (`id`, `penginapan_id`, `tf_id`, `hasil`, `created_at`, `updated_at`) VALUES
(3, 1, 4, 1.1637, '2025-11-09 11:30:49', '2025-11-09 11:30:49'),
(4, 2, 5, 0.7848, '2025-11-09 11:34:46', '2025-11-09 11:34:46'),
(5, 3, 6, 1.1367, '2025-11-09 11:35:02', '2025-11-09 11:35:02'),
(6, 4, 7, 0.7276, '2025-11-09 11:35:15', '2025-11-09 11:35:15'),
(7, 5, 8, 0.6660, '2025-11-09 11:35:24', '2025-11-09 11:35:24'),
(8, 6, 9, 0.8032, '2025-11-09 11:35:34', '2025-11-09 11:35:34'),
(9, 7, 10, 0.7781, '2025-11-09 11:35:42', '2025-11-09 11:35:42'),
(10, 8, 11, 0.7781, '2025-11-09 11:35:46', '2025-11-09 11:35:46'),
(11, 9, 16, 0.8549, '2025-11-09 11:35:53', '2025-11-09 11:35:53'),
(12, 10, 17, 0.6756, '2025-11-09 11:50:04', '2025-11-09 11:50:04'),
(13, 11, 18, 0.7347, '2025-11-09 11:50:50', '2025-11-09 11:50:50'),
(14, 12, 19, 0.5017, '2025-11-09 11:51:21', '2025-11-09 11:51:21'),
(15, 13, 20, 0.6678, '2025-11-09 11:51:54', '2025-11-09 11:51:54'),
(16, 14, 21, 0.6998, '2025-11-09 11:52:06', '2025-11-09 11:52:06'),
(17, 15, 22, 0.6397, '2025-11-09 11:52:18', '2025-11-09 11:52:18'),
(18, 16, 23, 0.7495, '2025-11-09 11:52:23', '2025-11-09 11:52:23'),
(19, 17, 24, 0.6086, '2025-11-09 11:52:30', '2025-11-09 11:52:30'),
(20, 18, 25, 1.2760, '2025-11-09 11:52:38', '2025-11-09 11:52:38'),
(21, 19, 26, 0.7478, '2025-11-09 11:52:44', '2025-11-09 11:52:44'),
(22, 20, 27, 0.7177, '2025-11-09 11:52:50', '2025-11-09 11:52:50'),
(23, 21, 28, 0.6098, '2025-11-09 11:53:01', '2025-11-09 11:53:01'),
(24, 22, 29, 0.5017, '2025-11-09 11:53:07', '2025-11-09 11:53:07'),
(25, 23, 30, 0.9827, '2025-11-09 11:53:16', '2025-11-09 11:53:16'),
(26, 24, 31, 0.8194, '2025-11-09 11:53:31', '2025-11-09 11:53:31'),
(27, 25, 32, 1.2526, '2025-11-09 11:53:39', '2025-11-09 11:53:39'),
(28, 26, 33, 1.0013, '2025-11-09 11:53:46', '2025-11-09 11:53:46'),
(29, 27, 34, 0.9342, '2025-11-09 11:53:51', '2025-11-09 11:53:51'),
(30, 28, 35, 0.7652, '2025-11-09 11:53:56', '2025-11-09 11:53:56'),
(42, 29, 36, 0.8951, '2025-11-09 11:57:07', '2025-11-09 11:57:07'),
(43, 30, 37, 0.8347, '2025-11-09 11:57:25', '2025-11-09 11:57:25'),
(44, 31, 38, 1.1423, '2025-11-09 11:57:45', '2025-11-09 11:57:45'),
(45, 32, 39, 0.7276, '2025-11-09 11:57:58', '2025-11-09 11:57:58'),
(46, 33, 40, 1.1215, '2025-11-09 11:58:09', '2025-11-09 11:58:09'),
(47, 34, 41, 0.3272, '2025-11-09 11:58:18', '2025-11-09 11:58:18'),
(48, 35, 42, 0.6478, '2025-11-09 11:59:08', '2025-11-09 11:59:08'),
(49, 36, 43, 0.8549, '2025-11-09 11:59:13', '2025-11-09 11:59:13'),
(50, 37, 44, 1.1260, '2025-11-09 11:59:20', '2025-11-09 11:59:20'),
(51, 38, 45, 0.8091, '2025-11-09 11:59:25', '2025-11-09 11:59:25'),
(52, 38, 45, 0.8091, '2025-11-09 11:59:34', '2025-11-09 11:59:34'),
(53, 40, 47, 1.1590, '2025-11-09 11:59:50', '2025-11-09 11:59:50'),
(54, 41, 48, 0.9726, '2025-11-09 11:59:55', '2025-11-09 11:59:55'),
(55, 42, 49, 0.6981, '2025-11-09 12:00:00', '2025-11-09 12:00:00'),
(56, 43, 50, 0.8030, '2025-11-09 12:00:05', '2025-11-09 12:00:05'),
(57, 44, 51, 1.1213, '2025-11-09 12:00:25', '2025-11-09 12:00:25'),
(58, 45, 52, 1.2289, '2025-11-09 12:00:29', '2025-11-09 12:00:29'),
(59, 46, 53, 0.6260, '2025-11-09 12:00:34', '2025-11-09 12:00:34'),
(60, 47, 54, 0.8466, '2025-11-09 12:00:38', '2025-11-09 12:00:38'),
(61, 48, 55, 0.5244, '2025-11-09 12:00:43', '2025-11-09 12:00:43'),
(62, 49, 56, 0.9342, '2025-11-09 12:00:48', '2025-11-09 12:00:48'),
(63, 50, 57, 0.5920, '2025-11-09 12:00:53', '2025-11-09 12:00:53'),
(64, 51, 58, 0.5516, '2025-11-09 12:01:00', '2025-11-09 12:01:00'),
(65, 52, 59, 0.9222, '2025-11-09 12:01:06', '2025-11-09 12:01:06'),
(66, 53, 60, 0.6553, '2025-11-09 12:01:11', '2025-11-09 12:01:11'),
(67, 54, 61, 1.0256, '2025-11-09 12:01:16', '2025-11-09 12:01:16'),
(68, 55, 62, 1.1389, '2025-11-09 12:01:20', '2025-11-09 12:01:20');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tf_idf_fasilitas`
--

CREATE TABLE `tf_idf_fasilitas` (
  `id` bigint UNSIGNED NOT NULL,
  `tf_idf_id` bigint UNSIGNED NOT NULL,
  `fasilitas_id` bigint UNSIGNED NOT NULL,
  `value` decimal(8,4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `tf_idf_fasilitas`
--

INSERT INTO `tf_idf_fasilitas` (`id`, `tf_idf_id`, `fasilitas_id`, `value`, `created_at`, `updated_at`) VALUES
(19, 3, 1, 0.0080, '2025-11-09 11:30:49', '2025-11-09 11:30:49'),
(20, 3, 2, 0.0080, '2025-11-09 11:30:49', '2025-11-09 11:30:49'),
(21, 3, 3, 0.3090, '2025-11-09 11:30:49', '2025-11-09 11:30:49'),
(22, 3, 4, 0.2490, '2025-11-09 11:30:49', '2025-11-09 11:30:49'),
(23, 3, 5, 0.3254, '2025-11-09 11:30:49', '2025-11-09 11:30:49'),
(24, 3, 6, 0.2932, '2025-11-09 11:30:49', '2025-11-09 11:30:49'),
(25, 3, 7, 0.0000, '2025-11-09 11:30:49', '2025-11-09 11:30:49'),
(26, 3, 8, 0.2218, '2025-11-09 11:30:49', '2025-11-09 11:30:49'),
(27, 3, 9, 0.0000, '2025-11-09 11:30:49', '2025-11-09 11:30:49'),
(28, 4, 1, 0.0080, '2025-11-09 11:34:46', '2025-11-09 11:34:46'),
(29, 4, 2, 0.0080, '2025-11-09 11:34:46', '2025-11-09 11:34:46'),
(30, 4, 3, 0.3090, '2025-11-09 11:34:46', '2025-11-09 11:34:46'),
(31, 4, 4, 0.2490, '2025-11-09 11:34:46', '2025-11-09 11:34:46'),
(32, 4, 5, 0.3254, '2025-11-09 11:34:46', '2025-11-09 11:34:46'),
(33, 4, 6, 0.0000, '2025-11-09 11:34:46', '2025-11-09 11:34:46'),
(34, 4, 7, 0.3602, '2025-11-09 11:34:46', '2025-11-09 11:34:46'),
(35, 4, 8, 0.0000, '2025-11-09 11:34:46', '2025-11-09 11:34:46'),
(36, 4, 9, 0.0000, '2025-11-09 11:34:46', '2025-11-09 11:34:46'),
(37, 5, 1, 0.0080, '2025-11-09 11:35:02', '2025-11-09 11:35:02'),
(38, 5, 2, 0.0080, '2025-11-09 11:35:02', '2025-11-09 11:35:02'),
(39, 5, 3, 0.0000, '2025-11-09 11:35:02', '2025-11-09 11:35:02'),
(40, 5, 4, 0.2490, '2025-11-09 11:35:02', '2025-11-09 11:35:02'),
(41, 5, 5, 0.0000, '2025-11-09 11:35:02', '2025-11-09 11:35:02'),
(42, 5, 6, 0.0000, '2025-11-09 11:35:02', '2025-11-09 11:35:02'),
(43, 5, 7, 0.3602, '2025-11-09 11:35:02', '2025-11-09 11:35:02'),
(44, 5, 8, 0.2218, '2025-11-09 11:35:02', '2025-11-09 11:35:02'),
(45, 5, 9, 0.3090, '2025-11-09 11:35:02', '2025-11-09 11:35:02'),
(46, 6, 1, 0.0080, '2025-11-09 11:35:15', '2025-11-09 11:35:15'),
(47, 6, 2, 0.0080, '2025-11-09 11:35:15', '2025-11-09 11:35:15'),
(48, 6, 3, 0.3090, '2025-11-09 11:35:15', '2025-11-09 11:35:15'),
(49, 6, 4, 0.2490, '2025-11-09 11:35:15', '2025-11-09 11:35:15'),
(50, 6, 5, 0.0000, '2025-11-09 11:35:15', '2025-11-09 11:35:15'),
(51, 6, 6, 0.2932, '2025-11-09 11:35:15', '2025-11-09 11:35:15'),
(52, 6, 7, 0.3602, '2025-11-09 11:35:15', '2025-11-09 11:35:15'),
(53, 6, 8, 0.2218, '2025-11-09 11:35:15', '2025-11-09 11:35:15'),
(54, 6, 9, 0.0000, '2025-11-09 11:35:15', '2025-11-09 11:35:15'),
(55, 7, 1, 0.0080, '2025-11-09 11:35:24', '2025-11-09 11:35:24'),
(56, 7, 2, 0.0080, '2025-11-09 11:35:24', '2025-11-09 11:35:24'),
(57, 7, 3, 0.3090, '2025-11-09 11:35:24', '2025-11-09 11:35:24'),
(58, 7, 4, 0.0000, '2025-11-09 11:35:24', '2025-11-09 11:35:24'),
(59, 7, 5, 0.3254, '2025-11-09 11:35:24', '2025-11-09 11:35:24'),
(60, 7, 6, 0.2932, '2025-11-09 11:35:24', '2025-11-09 11:35:24'),
(61, 7, 7, 0.0000, '2025-11-09 11:35:24', '2025-11-09 11:35:24'),
(62, 7, 8, 0.2218, '2025-11-09 11:35:24', '2025-11-09 11:35:24'),
(63, 7, 9, 0.0000, '2025-11-09 11:35:24', '2025-11-09 11:35:24'),
(64, 8, 1, 0.0080, '2025-11-09 11:35:34', '2025-11-09 11:35:34'),
(65, 8, 2, 0.0080, '2025-11-09 11:35:34', '2025-11-09 11:35:34'),
(66, 8, 3, 0.3090, '2025-11-09 11:35:34', '2025-11-09 11:35:34'),
(67, 8, 4, 0.2490, '2025-11-09 11:35:34', '2025-11-09 11:35:34'),
(68, 8, 5, 0.0000, '2025-11-09 11:35:34', '2025-11-09 11:35:34'),
(69, 8, 6, 0.2932, '2025-11-09 11:35:34', '2025-11-09 11:35:34'),
(70, 8, 7, 0.3602, '2025-11-09 11:35:34', '2025-11-09 11:35:34'),
(71, 8, 8, 0.2218, '2025-11-09 11:35:34', '2025-11-09 11:35:34'),
(72, 8, 9, 0.0000, '2025-11-09 11:35:34', '2025-11-09 11:35:34'),
(73, 9, 1, 0.0080, '2025-11-09 11:35:42', '2025-11-09 11:35:42'),
(74, 9, 2, 0.0080, '2025-11-09 11:35:42', '2025-11-09 11:35:42'),
(75, 9, 3, 0.3090, '2025-11-09 11:35:42', '2025-11-09 11:35:42'),
(76, 9, 4, 0.2490, '2025-11-09 11:35:42', '2025-11-09 11:35:42'),
(77, 9, 5, 0.0000, '2025-11-09 11:35:42', '2025-11-09 11:35:42'),
(78, 9, 6, 0.0000, '2025-11-09 11:35:42', '2025-11-09 11:35:42'),
(79, 9, 7, 0.3602, '2025-11-09 11:35:42', '2025-11-09 11:35:42'),
(80, 9, 8, 0.0000, '2025-11-09 11:35:42', '2025-11-09 11:35:42'),
(81, 9, 9, 0.3090, '2025-11-09 11:35:42', '2025-11-09 11:35:42'),
(82, 10, 1, 0.0080, '2025-11-09 11:35:46', '2025-11-09 11:35:46'),
(83, 10, 2, 0.0080, '2025-11-09 11:35:46', '2025-11-09 11:35:46'),
(84, 10, 3, 0.3090, '2025-11-09 11:35:46', '2025-11-09 11:35:46'),
(85, 10, 4, 0.2490, '2025-11-09 11:35:46', '2025-11-09 11:35:46'),
(86, 10, 5, 0.0000, '2025-11-09 11:35:46', '2025-11-09 11:35:46'),
(87, 10, 6, 0.0000, '2025-11-09 11:35:46', '2025-11-09 11:35:46'),
(88, 10, 7, 0.3602, '2025-11-09 11:35:46', '2025-11-09 11:35:46'),
(89, 10, 8, 0.0000, '2025-11-09 11:35:46', '2025-11-09 11:35:46'),
(90, 10, 9, 0.3090, '2025-11-09 11:35:46', '2025-11-09 11:35:46'),
(91, 11, 1, 0.0080, '2025-11-09 11:35:53', '2025-11-09 11:35:53'),
(92, 11, 2, 0.0080, '2025-11-09 11:35:53', '2025-11-09 11:35:53'),
(93, 11, 3, 0.3090, '2025-11-09 11:35:53', '2025-11-09 11:35:53'),
(94, 11, 4, 0.2490, '2025-11-09 11:35:53', '2025-11-09 11:35:53'),
(95, 11, 5, 0.3254, '2025-11-09 11:35:53', '2025-11-09 11:35:53'),
(96, 11, 6, 0.2932, '2025-11-09 11:35:53', '2025-11-09 11:35:53'),
(97, 11, 7, 0.3602, '2025-11-09 11:35:53', '2025-11-09 11:35:53'),
(98, 11, 8, 0.2218, '2025-11-09 11:35:53', '2025-11-09 11:35:53'),
(99, 11, 9, 0.3090, '2025-11-09 11:35:53', '2025-11-09 11:35:53'),
(100, 12, 1, 0.0080, '2025-11-09 11:50:04', '2025-11-09 11:50:04'),
(101, 12, 2, 0.0080, '2025-11-09 11:50:04', '2025-11-09 11:50:04'),
(102, 12, 3, 0.3090, '2025-11-09 11:50:04', '2025-11-09 11:50:04'),
(103, 12, 4, 0.2490, '2025-11-09 11:50:04', '2025-11-09 11:50:04'),
(104, 12, 5, 0.3254, '2025-11-09 11:50:04', '2025-11-09 11:50:04'),
(105, 12, 6, 0.2932, '2025-11-09 11:50:04', '2025-11-09 11:50:04'),
(106, 12, 7, 0.0000, '2025-11-09 11:50:04', '2025-11-09 11:50:04'),
(107, 12, 8, 0.0000, '2025-11-09 11:50:04', '2025-11-09 11:50:04'),
(108, 12, 9, 0.0000, '2025-11-09 11:50:04', '2025-11-09 11:50:04'),
(109, 13, 1, 0.0080, '2025-11-09 11:50:50', '2025-11-09 11:50:50'),
(110, 13, 2, 0.0080, '2025-11-09 11:50:50', '2025-11-09 11:50:50'),
(111, 13, 3, 0.0000, '2025-11-09 11:50:50', '2025-11-09 11:50:50'),
(112, 13, 4, 0.2490, '2025-11-09 11:50:50', '2025-11-09 11:50:50'),
(113, 13, 5, 0.3254, '2025-11-09 11:50:50', '2025-11-09 11:50:50'),
(114, 13, 6, 0.2932, '2025-11-09 11:50:50', '2025-11-09 11:50:50'),
(115, 13, 7, 0.3602, '2025-11-09 11:50:50', '2025-11-09 11:50:50'),
(116, 13, 8, 0.2218, '2025-11-09 11:50:50', '2025-11-09 11:50:50'),
(117, 13, 9, 0.0000, '2025-11-09 11:50:50', '2025-11-09 11:50:50'),
(118, 14, 1, 0.0080, '2025-11-09 11:51:21', '2025-11-09 11:51:21'),
(119, 14, 2, 0.0080, '2025-11-09 11:51:21', '2025-11-09 11:51:21'),
(120, 14, 3, 0.0000, '2025-11-09 11:51:21', '2025-11-09 11:51:21'),
(121, 14, 4, 0.0000, '2025-11-09 11:51:21', '2025-11-09 11:51:21'),
(122, 14, 5, 0.0000, '2025-11-09 11:51:21', '2025-11-09 11:51:21'),
(123, 14, 6, 0.0000, '2025-11-09 11:51:21', '2025-11-09 11:51:21'),
(124, 14, 7, 0.0000, '2025-11-09 11:51:21', '2025-11-09 11:51:21'),
(125, 14, 8, 0.2218, '2025-11-09 11:51:21', '2025-11-09 11:51:21'),
(126, 14, 9, 0.3090, '2025-11-09 11:51:21', '2025-11-09 11:51:21'),
(127, 15, 1, 0.0080, '2025-11-09 11:51:54', '2025-11-09 11:51:54'),
(128, 15, 2, 0.0080, '2025-11-09 11:51:54', '2025-11-09 11:51:54'),
(129, 15, 3, 0.3090, '2025-11-09 11:51:54', '2025-11-09 11:51:54'),
(130, 15, 4, 0.2490, '2025-11-09 11:51:54', '2025-11-09 11:51:54'),
(131, 15, 5, 0.0000, '2025-11-09 11:51:54', '2025-11-09 11:51:54'),
(132, 15, 6, 0.2932, '2025-11-09 11:51:54', '2025-11-09 11:51:54'),
(133, 15, 7, 0.0000, '2025-11-09 11:51:54', '2025-11-09 11:51:54'),
(134, 15, 8, 0.0000, '2025-11-09 11:51:54', '2025-11-09 11:51:54'),
(135, 15, 9, 0.3090, '2025-11-09 11:51:54', '2025-11-09 11:51:54'),
(136, 16, 1, 0.0080, '2025-11-09 11:52:06', '2025-11-09 11:52:06'),
(137, 16, 2, 0.0080, '2025-11-09 11:52:06', '2025-11-09 11:52:06'),
(138, 16, 3, 0.3090, '2025-11-09 11:52:06', '2025-11-09 11:52:06'),
(139, 16, 4, 0.2490, '2025-11-09 11:52:06', '2025-11-09 11:52:06'),
(140, 16, 5, 0.0000, '2025-11-09 11:52:06', '2025-11-09 11:52:06'),
(141, 16, 6, 0.0000, '2025-11-09 11:52:06', '2025-11-09 11:52:06'),
(142, 16, 7, 0.3602, '2025-11-09 11:52:06', '2025-11-09 11:52:06'),
(143, 16, 8, 0.0000, '2025-11-09 11:52:06', '2025-11-09 11:52:06'),
(144, 16, 9, 0.3090, '2025-11-09 11:52:06', '2025-11-09 11:52:06'),
(145, 17, 1, 0.0080, '2025-11-09 11:52:18', '2025-11-09 11:52:18'),
(146, 17, 2, 0.0080, '2025-11-09 11:52:18', '2025-11-09 11:52:18'),
(147, 17, 3, 0.3090, '2025-11-09 11:52:18', '2025-11-09 11:52:18'),
(148, 17, 4, 0.2490, '2025-11-09 11:52:18', '2025-11-09 11:52:18'),
(149, 17, 5, 0.0000, '2025-11-09 11:52:18', '2025-11-09 11:52:18'),
(150, 17, 6, 0.0000, '2025-11-09 11:52:18', '2025-11-09 11:52:18'),
(151, 17, 7, 0.0000, '2025-11-09 11:52:18', '2025-11-09 11:52:18'),
(152, 17, 8, 0.2218, '2025-11-09 11:52:18', '2025-11-09 11:52:18'),
(153, 17, 9, 0.3090, '2025-11-09 11:52:18', '2025-11-09 11:52:18'),
(154, 18, 1, 0.0080, '2025-11-09 11:52:23', '2025-11-09 11:52:23'),
(155, 18, 2, 0.0080, '2025-11-09 11:52:23', '2025-11-09 11:52:23'),
(156, 18, 3, 0.3090, '2025-11-09 11:52:23', '2025-11-09 11:52:23'),
(157, 18, 4, 0.2490, '2025-11-09 11:52:23', '2025-11-09 11:52:23'),
(158, 18, 5, 0.0000, '2025-11-09 11:52:23', '2025-11-09 11:52:23'),
(159, 18, 6, 0.2932, '2025-11-09 11:52:23', '2025-11-09 11:52:23'),
(160, 18, 7, 0.0000, '2025-11-09 11:52:23', '2025-11-09 11:52:23'),
(161, 18, 8, 0.0000, '2025-11-09 11:52:23', '2025-11-09 11:52:23'),
(162, 18, 9, 0.3090, '2025-11-09 11:52:23', '2025-11-09 11:52:23'),
(163, 19, 1, 0.0080, '2025-11-09 11:52:30', '2025-11-09 11:52:30'),
(164, 19, 2, 0.0080, '2025-11-09 11:52:30', '2025-11-09 11:52:30'),
(165, 19, 3, 0.3090, '2025-11-09 11:52:30', '2025-11-09 11:52:30'),
(166, 19, 4, 0.2490, '2025-11-09 11:52:30', '2025-11-09 11:52:30'),
(167, 19, 5, 0.3254, '2025-11-09 11:52:30', '2025-11-09 11:52:30'),
(168, 19, 6, 0.0000, '2025-11-09 11:52:30', '2025-11-09 11:52:30'),
(169, 19, 7, 0.0000, '2025-11-09 11:52:30', '2025-11-09 11:52:30'),
(170, 19, 8, 0.0000, '2025-11-09 11:52:30', '2025-11-09 11:52:30'),
(171, 19, 9, 0.0000, '2025-11-09 11:52:30', '2025-11-09 11:52:30'),
(172, 20, 1, 0.0080, '2025-11-09 11:52:38', '2025-11-09 11:52:38'),
(173, 20, 2, 0.0080, '2025-11-09 11:52:38', '2025-11-09 11:52:38'),
(174, 20, 3, 0.0000, '2025-11-09 11:52:38', '2025-11-09 11:52:38'),
(175, 20, 4, 0.0000, '2025-11-09 11:52:38', '2025-11-09 11:52:38'),
(176, 20, 5, 0.3254, '2025-11-09 11:52:38', '2025-11-09 11:52:38'),
(177, 20, 6, 0.2932, '2025-11-09 11:52:38', '2025-11-09 11:52:38'),
(178, 20, 7, 0.3602, '2025-11-09 11:52:38', '2025-11-09 11:52:38'),
(179, 20, 8, 0.2218, '2025-11-09 11:52:38', '2025-11-09 11:52:38'),
(180, 20, 9, 0.3090, '2025-11-09 11:52:38', '2025-11-09 11:52:38'),
(181, 21, 1, 0.0080, '2025-11-09 11:52:44', '2025-11-09 11:52:44'),
(182, 21, 2, 0.0080, '2025-11-09 11:52:44', '2025-11-09 11:52:44'),
(183, 21, 3, 0.3090, '2025-11-09 11:52:44', '2025-11-09 11:52:44'),
(184, 21, 4, 0.2490, '2025-11-09 11:52:44', '2025-11-09 11:52:44'),
(185, 21, 5, 0.0000, '2025-11-09 11:52:44', '2025-11-09 11:52:44'),
(186, 21, 6, 0.0000, '2025-11-09 11:52:44', '2025-11-09 11:52:44'),
(187, 21, 7, 0.3602, '2025-11-09 11:52:44', '2025-11-09 11:52:44'),
(188, 21, 8, 0.2218, '2025-11-09 11:52:44', '2025-11-09 11:52:44'),
(189, 21, 9, 0.0000, '2025-11-09 11:52:44', '2025-11-09 11:52:44'),
(190, 22, 1, 0.0080, '2025-11-09 11:52:50', '2025-11-09 11:52:50'),
(191, 22, 2, 0.0080, '2025-11-09 11:52:50', '2025-11-09 11:52:50'),
(192, 22, 3, 0.3090, '2025-11-09 11:52:50', '2025-11-09 11:52:50'),
(193, 22, 4, 0.2490, '2025-11-09 11:52:50', '2025-11-09 11:52:50'),
(194, 22, 5, 0.3254, '2025-11-09 11:52:50', '2025-11-09 11:52:50'),
(195, 22, 6, 0.0000, '2025-11-09 11:52:50', '2025-11-09 11:52:50'),
(196, 22, 7, 0.0000, '2025-11-09 11:52:50', '2025-11-09 11:52:50'),
(197, 22, 8, 0.2218, '2025-11-09 11:52:50', '2025-11-09 11:52:50'),
(198, 22, 9, 0.3090, '2025-11-09 11:52:50', '2025-11-09 11:52:50'),
(199, 23, 1, 0.0080, '2025-11-09 11:53:01', '2025-11-09 11:53:01'),
(200, 23, 2, 0.0000, '2025-11-09 11:53:01', '2025-11-09 11:53:01'),
(201, 23, 3, 0.0000, '2025-11-09 11:53:01', '2025-11-09 11:53:01'),
(202, 23, 4, 0.0000, '2025-11-09 11:53:01', '2025-11-09 11:53:01'),
(203, 23, 5, 0.0000, '2025-11-09 11:53:01', '2025-11-09 11:53:01'),
(204, 23, 6, 0.2932, '2025-11-09 11:53:01', '2025-11-09 11:53:01'),
(205, 23, 7, 0.3602, '2025-11-09 11:53:01', '2025-11-09 11:53:01'),
(206, 23, 8, 0.2218, '2025-11-09 11:53:01', '2025-11-09 11:53:01'),
(207, 23, 9, 0.0000, '2025-11-09 11:53:01', '2025-11-09 11:53:01'),
(208, 24, 1, 0.0080, '2025-11-09 11:53:07', '2025-11-09 11:53:07'),
(209, 24, 2, 0.0080, '2025-11-09 11:53:07', '2025-11-09 11:53:07'),
(210, 24, 3, 0.0000, '2025-11-09 11:53:07', '2025-11-09 11:53:07'),
(211, 24, 4, 0.0000, '2025-11-09 11:53:07', '2025-11-09 11:53:07'),
(212, 24, 5, 0.0000, '2025-11-09 11:53:07', '2025-11-09 11:53:07'),
(213, 24, 6, 0.0000, '2025-11-09 11:53:07', '2025-11-09 11:53:07'),
(214, 24, 7, 0.0000, '2025-11-09 11:53:07', '2025-11-09 11:53:07'),
(215, 24, 8, 0.2218, '2025-11-09 11:53:07', '2025-11-09 11:53:07'),
(216, 24, 9, 0.3090, '2025-11-09 11:53:07', '2025-11-09 11:53:07'),
(217, 25, 1, 0.0080, '2025-11-09 11:53:16', '2025-11-09 11:53:16'),
(218, 25, 2, 0.0080, '2025-11-09 11:53:16', '2025-11-09 11:53:16'),
(219, 25, 3, 0.0000, '2025-11-09 11:53:16', '2025-11-09 11:53:16'),
(220, 25, 4, 0.0000, '2025-11-09 11:53:16', '2025-11-09 11:53:16'),
(221, 25, 5, 0.3254, '2025-11-09 11:53:16', '2025-11-09 11:53:16'),
(222, 25, 6, 0.0000, '2025-11-09 11:53:16', '2025-11-09 11:53:16'),
(223, 25, 7, 0.3602, '2025-11-09 11:53:16', '2025-11-09 11:53:16'),
(224, 25, 8, 0.2218, '2025-11-09 11:53:16', '2025-11-09 11:53:16'),
(225, 25, 9, 0.3090, '2025-11-09 11:53:16', '2025-11-09 11:53:16'),
(226, 26, 1, 0.0080, '2025-11-09 11:53:31', '2025-11-09 11:53:31'),
(227, 26, 2, 0.0080, '2025-11-09 11:53:31', '2025-11-09 11:53:31'),
(228, 26, 3, 0.0000, '2025-11-09 11:53:31', '2025-11-09 11:53:31'),
(229, 26, 4, 0.0000, '2025-11-09 11:53:31', '2025-11-09 11:53:31'),
(230, 26, 5, 0.0000, '2025-11-09 11:53:31', '2025-11-09 11:53:31'),
(231, 26, 6, 0.2932, '2025-11-09 11:53:31', '2025-11-09 11:53:31'),
(232, 26, 7, 0.0000, '2025-11-09 11:53:31', '2025-11-09 11:53:31'),
(233, 26, 8, 0.0000, '2025-11-09 11:53:31', '2025-11-09 11:53:31'),
(234, 26, 9, 0.0000, '2025-11-09 11:53:31', '2025-11-09 11:53:31'),
(235, 27, 1, 0.0080, '2025-11-09 11:53:39', '2025-11-09 11:53:39'),
(236, 27, 2, 0.0080, '2025-11-09 11:53:39', '2025-11-09 11:53:39'),
(237, 27, 3, 0.3090, '2025-11-09 11:53:39', '2025-11-09 11:53:39'),
(238, 27, 4, 0.0000, '2025-11-09 11:53:39', '2025-11-09 11:53:39'),
(239, 27, 5, 0.3254, '2025-11-09 11:53:39', '2025-11-09 11:53:39'),
(240, 27, 6, 0.0000, '2025-11-09 11:53:39', '2025-11-09 11:53:39'),
(241, 27, 7, 0.0000, '2025-11-09 11:53:39', '2025-11-09 11:53:39'),
(242, 27, 8, 0.2218, '2025-11-09 11:53:39', '2025-11-09 11:53:39'),
(243, 27, 9, 0.0000, '2025-11-09 11:53:39', '2025-11-09 11:53:39'),
(244, 28, 1, 0.0080, '2025-11-09 11:53:46', '2025-11-09 11:53:46'),
(245, 28, 2, 0.0080, '2025-11-09 11:53:46', '2025-11-09 11:53:46'),
(246, 28, 3, 0.0000, '2025-11-09 11:53:46', '2025-11-09 11:53:46'),
(247, 28, 4, 0.0000, '2025-11-09 11:53:46', '2025-11-09 11:53:46'),
(248, 28, 5, 0.3254, '2025-11-09 11:53:46', '2025-11-09 11:53:46'),
(249, 28, 6, 0.2932, '2025-11-09 11:53:46', '2025-11-09 11:53:46'),
(250, 28, 7, 0.3602, '2025-11-09 11:53:46', '2025-11-09 11:53:46'),
(251, 28, 8, 0.0000, '2025-11-09 11:53:46', '2025-11-09 11:53:46'),
(252, 28, 9, 0.3090, '2025-11-09 11:53:46', '2025-11-09 11:53:46'),
(253, 29, 1, 0.0080, '2025-11-09 11:53:51', '2025-11-09 11:53:51'),
(254, 29, 2, 0.0080, '2025-11-09 11:53:51', '2025-11-09 11:53:51'),
(255, 29, 3, 0.0000, '2025-11-09 11:53:51', '2025-11-09 11:53:51'),
(256, 29, 4, 0.0000, '2025-11-09 11:53:51', '2025-11-09 11:53:51'),
(257, 29, 5, 0.3254, '2025-11-09 11:53:51', '2025-11-09 11:53:51'),
(258, 29, 6, 0.2932, '2025-11-09 11:53:51', '2025-11-09 11:53:51'),
(259, 29, 7, 0.0000, '2025-11-09 11:53:51', '2025-11-09 11:53:51'),
(260, 29, 8, 0.0000, '2025-11-09 11:53:51', '2025-11-09 11:53:51'),
(261, 29, 9, 0.3090, '2025-11-09 11:53:51', '2025-11-09 11:53:51'),
(262, 30, 1, 0.0080, '2025-11-09 11:53:56', '2025-11-09 11:53:56'),
(263, 30, 2, 0.0080, '2025-11-09 11:53:56', '2025-11-09 11:53:56'),
(264, 30, 3, 0.0000, '2025-11-09 11:53:56', '2025-11-09 11:53:56'),
(265, 30, 4, 0.0000, '2025-11-09 11:53:56', '2025-11-09 11:53:56'),
(266, 30, 5, 0.0000, '2025-11-09 11:53:56', '2025-11-09 11:53:56'),
(267, 30, 6, 0.0000, '2025-11-09 11:53:56', '2025-11-09 11:53:56'),
(268, 30, 7, 0.0000, '2025-11-09 11:53:56', '2025-11-09 11:53:56'),
(269, 30, 8, 0.0000, '2025-11-09 11:53:56', '2025-11-09 11:53:56'),
(270, 30, 9, 0.0000, '2025-11-09 11:53:56', '2025-11-09 11:53:56'),
(370, 42, 1, 0.0080, '2025-11-09 11:57:07', '2025-11-09 11:57:07'),
(371, 42, 2, 0.0080, '2025-11-09 11:57:07', '2025-11-09 11:57:07'),
(372, 42, 3, 0.0000, '2025-11-09 11:57:07', '2025-11-09 11:57:07'),
(373, 42, 4, 0.0000, '2025-11-09 11:57:07', '2025-11-09 11:57:07'),
(374, 42, 5, 0.0000, '2025-11-09 11:57:07', '2025-11-09 11:57:07'),
(375, 42, 6, 0.2932, '2025-11-09 11:57:07', '2025-11-09 11:57:07'),
(376, 42, 7, 0.3602, '2025-11-09 11:57:07', '2025-11-09 11:57:07'),
(377, 42, 8, 0.0000, '2025-11-09 11:57:07', '2025-11-09 11:57:07'),
(378, 42, 9, 0.0000, '2025-11-09 11:57:07', '2025-11-09 11:57:07'),
(379, 43, 1, 0.0080, '2025-11-09 11:57:25', '2025-11-09 11:57:25'),
(380, 43, 2, 0.0080, '2025-11-09 11:57:25', '2025-11-09 11:57:25'),
(381, 43, 3, 0.0000, '2025-11-09 11:57:25', '2025-11-09 11:57:25'),
(382, 43, 4, 0.2490, '2025-11-09 11:57:25', '2025-11-09 11:57:25'),
(383, 43, 5, 0.0000, '2025-11-09 11:57:25', '2025-11-09 11:57:25'),
(384, 43, 6, 0.0000, '2025-11-09 11:57:25', '2025-11-09 11:57:25'),
(385, 43, 7, 0.0000, '2025-11-09 11:57:25', '2025-11-09 11:57:25'),
(386, 43, 8, 0.2218, '2025-11-09 11:57:25', '2025-11-09 11:57:25'),
(387, 43, 9, 0.0000, '2025-11-09 11:57:25', '2025-11-09 11:57:25'),
(388, 44, 1, 0.0080, '2025-11-09 11:57:45', '2025-11-09 11:57:45'),
(389, 44, 2, 0.0080, '2025-11-09 11:57:45', '2025-11-09 11:57:45'),
(390, 44, 3, 0.3090, '2025-11-09 11:57:45', '2025-11-09 11:57:45'),
(391, 44, 4, 0.2490, '2025-11-09 11:57:45', '2025-11-09 11:57:45'),
(392, 44, 5, 0.3254, '2025-11-09 11:57:45', '2025-11-09 11:57:45'),
(393, 44, 6, 0.2932, '2025-11-09 11:57:45', '2025-11-09 11:57:45'),
(394, 44, 7, 0.0000, '2025-11-09 11:57:45', '2025-11-09 11:57:45'),
(395, 44, 8, 0.0000, '2025-11-09 11:57:45', '2025-11-09 11:57:45'),
(396, 44, 9, 0.0000, '2025-11-09 11:57:45', '2025-11-09 11:57:45'),
(397, 45, 1, 0.0080, '2025-11-09 11:57:58', '2025-11-09 11:57:58'),
(398, 45, 2, 0.0080, '2025-11-09 11:57:58', '2025-11-09 11:57:58'),
(399, 45, 3, 0.0000, '2025-11-09 11:57:58', '2025-11-09 11:57:58'),
(400, 45, 4, 0.2490, '2025-11-09 11:57:58', '2025-11-09 11:57:58'),
(401, 45, 5, 0.0000, '2025-11-09 11:57:58', '2025-11-09 11:57:58'),
(402, 45, 6, 0.2932, '2025-11-09 11:57:58', '2025-11-09 11:57:58'),
(403, 45, 7, 0.3602, '2025-11-09 11:57:58', '2025-11-09 11:57:58'),
(404, 45, 8, 0.2218, '2025-11-09 11:57:58', '2025-11-09 11:57:58'),
(405, 45, 9, 0.3090, '2025-11-09 11:57:58', '2025-11-09 11:57:58'),
(406, 46, 1, 0.0080, '2025-11-09 11:58:09', '2025-11-09 11:58:09'),
(407, 46, 2, 0.0080, '2025-11-09 11:58:09', '2025-11-09 11:58:09'),
(408, 46, 3, 0.3090, '2025-11-09 11:58:09', '2025-11-09 11:58:09'),
(409, 46, 4, 0.2490, '2025-11-09 11:58:09', '2025-11-09 11:58:09'),
(410, 46, 5, 0.0000, '2025-11-09 11:58:09', '2025-11-09 11:58:09'),
(411, 46, 6, 0.0000, '2025-11-09 11:58:09', '2025-11-09 11:58:09'),
(412, 46, 7, 0.0000, '2025-11-09 11:58:09', '2025-11-09 11:58:09'),
(413, 46, 8, 0.2218, '2025-11-09 11:58:09', '2025-11-09 11:58:09'),
(414, 46, 9, 0.3090, '2025-11-09 11:58:09', '2025-11-09 11:58:09'),
(415, 47, 1, 0.0080, '2025-11-09 11:58:18', '2025-11-09 11:58:18'),
(416, 47, 2, 0.0080, '2025-11-09 11:58:18', '2025-11-09 11:58:18'),
(417, 47, 3, 0.0000, '2025-11-09 11:58:18', '2025-11-09 11:58:18'),
(418, 47, 4, 0.0000, '2025-11-09 11:58:18', '2025-11-09 11:58:18'),
(419, 47, 5, 0.0000, '2025-11-09 11:58:18', '2025-11-09 11:58:18'),
(420, 47, 6, 0.0000, '2025-11-09 11:58:18', '2025-11-09 11:58:18'),
(421, 47, 7, 0.0000, '2025-11-09 11:58:18', '2025-11-09 11:58:18'),
(422, 47, 8, 0.0000, '2025-11-09 11:58:18', '2025-11-09 11:58:18'),
(423, 47, 9, 0.0000, '2025-11-09 11:58:18', '2025-11-09 11:58:18'),
(424, 48, 1, 0.0080, '2025-11-09 11:59:08', '2025-11-09 11:59:08'),
(425, 48, 2, 0.0080, '2025-11-09 11:59:08', '2025-11-09 11:59:08'),
(426, 48, 3, 0.3090, '2025-11-09 11:59:08', '2025-11-09 11:59:08'),
(427, 48, 4, 0.2490, '2025-11-09 11:59:08', '2025-11-09 11:59:08'),
(428, 48, 5, 0.3254, '2025-11-09 11:59:08', '2025-11-09 11:59:08'),
(429, 48, 6, 0.0000, '2025-11-09 11:59:08', '2025-11-09 11:59:08'),
(430, 48, 7, 0.0000, '2025-11-09 11:59:08', '2025-11-09 11:59:08'),
(431, 48, 8, 0.2218, '2025-11-09 11:59:08', '2025-11-09 11:59:08'),
(432, 48, 9, 0.0000, '2025-11-09 11:59:08', '2025-11-09 11:59:08'),
(433, 49, 1, 0.0080, '2025-11-09 11:59:13', '2025-11-09 11:59:13'),
(434, 49, 2, 0.0080, '2025-11-09 11:59:13', '2025-11-09 11:59:13'),
(435, 49, 3, 0.3090, '2025-11-09 11:59:13', '2025-11-09 11:59:13'),
(436, 49, 4, 0.2490, '2025-11-09 11:59:13', '2025-11-09 11:59:13'),
(437, 49, 5, 0.3254, '2025-11-09 11:59:13', '2025-11-09 11:59:13'),
(438, 49, 6, 0.2932, '2025-11-09 11:59:13', '2025-11-09 11:59:13'),
(439, 49, 7, 0.3602, '2025-11-09 11:59:13', '2025-11-09 11:59:13'),
(440, 49, 8, 0.2218, '2025-11-09 11:59:13', '2025-11-09 11:59:13'),
(441, 49, 9, 0.3090, '2025-11-09 11:59:13', '2025-11-09 11:59:13'),
(442, 50, 1, 0.0080, '2025-11-09 11:59:20', '2025-11-09 11:59:20'),
(443, 50, 2, 0.0080, '2025-11-09 11:59:20', '2025-11-09 11:59:20'),
(444, 50, 3, 0.0000, '2025-11-09 11:59:20', '2025-11-09 11:59:20'),
(445, 50, 4, 0.0000, '2025-11-09 11:59:20', '2025-11-09 11:59:20'),
(446, 50, 5, 0.3254, '2025-11-09 11:59:20', '2025-11-09 11:59:20'),
(447, 50, 6, 0.0000, '2025-11-09 11:59:20', '2025-11-09 11:59:20'),
(448, 50, 7, 0.0000, '2025-11-09 11:59:20', '2025-11-09 11:59:20'),
(449, 50, 8, 0.0000, '2025-11-09 11:59:20', '2025-11-09 11:59:20'),
(450, 50, 9, 0.0000, '2025-11-09 11:59:20', '2025-11-09 11:59:20'),
(451, 51, 1, 0.0080, '2025-11-09 11:59:25', '2025-11-09 11:59:25'),
(452, 51, 2, 0.0080, '2025-11-09 11:59:25', '2025-11-09 11:59:25'),
(453, 51, 3, 0.3090, '2025-11-09 11:59:25', '2025-11-09 11:59:25'),
(454, 51, 4, 0.2490, '2025-11-09 11:59:25', '2025-11-09 11:59:25'),
(455, 51, 5, 0.0000, '2025-11-09 11:59:25', '2025-11-09 11:59:25'),
(456, 51, 6, 0.0000, '2025-11-09 11:59:25', '2025-11-09 11:59:25'),
(457, 51, 7, 0.3602, '2025-11-09 11:59:25', '2025-11-09 11:59:25'),
(458, 51, 8, 0.2218, '2025-11-09 11:59:25', '2025-11-09 11:59:25'),
(459, 51, 9, 0.3090, '2025-11-09 11:59:25', '2025-11-09 11:59:25'),
(460, 52, 1, 0.0080, '2025-11-09 11:59:34', '2025-11-09 11:59:34'),
(461, 52, 2, 0.0080, '2025-11-09 11:59:34', '2025-11-09 11:59:34'),
(462, 52, 3, 0.3090, '2025-11-09 11:59:34', '2025-11-09 11:59:34'),
(463, 52, 4, 0.2490, '2025-11-09 11:59:34', '2025-11-09 11:59:34'),
(464, 52, 5, 0.0000, '2025-11-09 11:59:34', '2025-11-09 11:59:34'),
(465, 52, 6, 0.0000, '2025-11-09 11:59:34', '2025-11-09 11:59:34'),
(466, 52, 7, 0.3602, '2025-11-09 11:59:34', '2025-11-09 11:59:34'),
(467, 52, 8, 0.2218, '2025-11-09 11:59:34', '2025-11-09 11:59:34'),
(468, 52, 9, 0.3090, '2025-11-09 11:59:34', '2025-11-09 11:59:34'),
(469, 53, 1, 0.0080, '2025-11-09 11:59:50', '2025-11-09 11:59:50'),
(470, 53, 2, 0.0080, '2025-11-09 11:59:50', '2025-11-09 11:59:50'),
(471, 53, 3, 0.0000, '2025-11-09 11:59:50', '2025-11-09 11:59:50'),
(472, 53, 4, 0.0000, '2025-11-09 11:59:50', '2025-11-09 11:59:50'),
(473, 53, 5, 0.0000, '2025-11-09 11:59:50', '2025-11-09 11:59:50'),
(474, 53, 6, 0.2932, '2025-11-09 11:59:50', '2025-11-09 11:59:50'),
(475, 53, 7, 0.0000, '2025-11-09 11:59:50', '2025-11-09 11:59:50'),
(476, 53, 8, 0.0000, '2025-11-09 11:59:50', '2025-11-09 11:59:50'),
(477, 53, 9, 0.3090, '2025-11-09 11:59:50', '2025-11-09 11:59:50'),
(478, 54, 1, 0.0080, '2025-11-09 11:59:55', '2025-11-09 11:59:55'),
(479, 54, 2, 0.0080, '2025-11-09 11:59:55', '2025-11-09 11:59:55'),
(480, 54, 3, 0.0000, '2025-11-09 11:59:55', '2025-11-09 11:59:55'),
(481, 54, 4, 0.0000, '2025-11-09 11:59:55', '2025-11-09 11:59:55'),
(482, 54, 5, 0.0000, '2025-11-09 11:59:55', '2025-11-09 11:59:55'),
(483, 54, 6, 0.2932, '2025-11-09 11:59:55', '2025-11-09 11:59:55'),
(484, 54, 7, 0.3602, '2025-11-09 11:59:55', '2025-11-09 11:59:55'),
(485, 54, 8, 0.2218, '2025-11-09 11:59:55', '2025-11-09 11:59:55'),
(486, 54, 9, 0.3090, '2025-11-09 11:59:55', '2025-11-09 11:59:55'),
(487, 55, 1, 0.0080, '2025-11-09 12:00:00', '2025-11-09 12:00:00'),
(488, 55, 2, 0.0080, '2025-11-09 12:00:00', '2025-11-09 12:00:00'),
(489, 55, 3, 0.0000, '2025-11-09 12:00:00', '2025-11-09 12:00:00'),
(490, 55, 4, 0.0000, '2025-11-09 12:00:00', '2025-11-09 12:00:00'),
(491, 55, 5, 0.3254, '2025-11-09 12:00:00', '2025-11-09 12:00:00'),
(492, 55, 6, 0.0000, '2025-11-09 12:00:00', '2025-11-09 12:00:00'),
(493, 55, 7, 0.3602, '2025-11-09 12:00:00', '2025-11-09 12:00:00'),
(494, 55, 8, 0.2218, '2025-11-09 12:00:00', '2025-11-09 12:00:00'),
(495, 55, 9, 0.3090, '2025-11-09 12:00:00', '2025-11-09 12:00:00'),
(496, 56, 1, 0.0080, '2025-11-09 12:00:05', '2025-11-09 12:00:05'),
(497, 56, 2, 0.0080, '2025-11-09 12:00:05', '2025-11-09 12:00:05'),
(498, 56, 3, 0.3090, '2025-11-09 12:00:05', '2025-11-09 12:00:05'),
(499, 56, 4, 0.2490, '2025-11-09 12:00:05', '2025-11-09 12:00:05'),
(500, 56, 5, 0.3254, '2025-11-09 12:00:05', '2025-11-09 12:00:05'),
(501, 56, 6, 0.0000, '2025-11-09 12:00:05', '2025-11-09 12:00:05'),
(502, 56, 7, 0.3602, '2025-11-09 12:00:05', '2025-11-09 12:00:05'),
(503, 56, 8, 0.2218, '2025-11-09 12:00:05', '2025-11-09 12:00:05'),
(504, 56, 9, 0.3090, '2025-11-09 12:00:05', '2025-11-09 12:00:05'),
(505, 57, 1, 0.0080, '2025-11-09 12:00:25', '2025-11-09 12:00:25'),
(506, 57, 2, 0.0080, '2025-11-09 12:00:25', '2025-11-09 12:00:25'),
(507, 57, 3, 0.0000, '2025-11-09 12:00:25', '2025-11-09 12:00:25'),
(508, 57, 4, 0.0000, '2025-11-09 12:00:25', '2025-11-09 12:00:25'),
(509, 57, 5, 0.0000, '2025-11-09 12:00:25', '2025-11-09 12:00:25'),
(510, 57, 6, 0.0000, '2025-11-09 12:00:25', '2025-11-09 12:00:25'),
(511, 57, 7, 0.0000, '2025-11-09 12:00:25', '2025-11-09 12:00:25'),
(512, 57, 8, 0.0000, '2025-11-09 12:00:25', '2025-11-09 12:00:25'),
(513, 57, 9, 0.3090, '2025-11-09 12:00:25', '2025-11-09 12:00:25'),
(514, 58, 1, 0.0080, '2025-11-09 12:00:29', '2025-11-09 12:00:29'),
(515, 58, 2, 0.0080, '2025-11-09 12:00:29', '2025-11-09 12:00:29'),
(516, 58, 3, 0.0000, '2025-11-09 12:00:29', '2025-11-09 12:00:29'),
(517, 58, 4, 0.0000, '2025-11-09 12:00:29', '2025-11-09 12:00:29'),
(518, 58, 5, 0.3254, '2025-11-09 12:00:29', '2025-11-09 12:00:29'),
(519, 58, 6, 0.2932, '2025-11-09 12:00:29', '2025-11-09 12:00:29'),
(520, 58, 7, 0.0000, '2025-11-09 12:00:29', '2025-11-09 12:00:29'),
(521, 58, 8, 0.0000, '2025-11-09 12:00:29', '2025-11-09 12:00:29'),
(522, 58, 9, 0.0000, '2025-11-09 12:00:29', '2025-11-09 12:00:29'),
(523, 59, 1, 0.0080, '2025-11-09 12:00:34', '2025-11-09 12:00:34'),
(524, 59, 2, 0.0080, '2025-11-09 12:00:34', '2025-11-09 12:00:34'),
(525, 59, 3, 0.0000, '2025-11-09 12:00:34', '2025-11-09 12:00:34'),
(526, 59, 4, 0.0000, '2025-11-09 12:00:34', '2025-11-09 12:00:34'),
(527, 59, 5, 0.3254, '2025-11-09 12:00:34', '2025-11-09 12:00:34'),
(528, 59, 6, 0.0000, '2025-11-09 12:00:34', '2025-11-09 12:00:34'),
(529, 59, 7, 0.3602, '2025-11-09 12:00:34', '2025-11-09 12:00:34'),
(530, 59, 8, 0.2218, '2025-11-09 12:00:34', '2025-11-09 12:00:34'),
(531, 59, 9, 0.0000, '2025-11-09 12:00:34', '2025-11-09 12:00:34'),
(532, 60, 1, 0.0080, '2025-11-09 12:00:38', '2025-11-09 12:00:38'),
(533, 60, 2, 0.0080, '2025-11-09 12:00:38', '2025-11-09 12:00:38'),
(534, 60, 3, 0.3090, '2025-11-09 12:00:38', '2025-11-09 12:00:38'),
(535, 60, 4, 0.2490, '2025-11-09 12:00:38', '2025-11-09 12:00:38'),
(536, 60, 5, 0.3254, '2025-11-09 12:00:38', '2025-11-09 12:00:38'),
(537, 60, 6, 0.2932, '2025-11-09 12:00:38', '2025-11-09 12:00:38'),
(538, 60, 7, 0.0000, '2025-11-09 12:00:38', '2025-11-09 12:00:38'),
(539, 60, 8, 0.2218, '2025-11-09 12:00:38', '2025-11-09 12:00:38'),
(540, 60, 9, 0.3090, '2025-11-09 12:00:38', '2025-11-09 12:00:38'),
(541, 61, 1, 0.0080, '2025-11-09 12:00:43', '2025-11-09 12:00:43'),
(542, 61, 2, 0.0080, '2025-11-09 12:00:43', '2025-11-09 12:00:43'),
(543, 61, 3, 0.0000, '2025-11-09 12:00:43', '2025-11-09 12:00:43'),
(544, 61, 4, 0.2490, '2025-11-09 12:00:43', '2025-11-09 12:00:43'),
(545, 61, 5, 0.3254, '2025-11-09 12:00:43', '2025-11-09 12:00:43'),
(546, 61, 6, 0.0000, '2025-11-09 12:00:43', '2025-11-09 12:00:43'),
(547, 61, 7, 0.0000, '2025-11-09 12:00:43', '2025-11-09 12:00:43'),
(548, 61, 8, 0.0000, '2025-11-09 12:00:43', '2025-11-09 12:00:43'),
(549, 61, 9, 0.0000, '2025-11-09 12:00:43', '2025-11-09 12:00:43'),
(550, 62, 1, 0.0080, '2025-11-09 12:00:48', '2025-11-09 12:00:48'),
(551, 62, 2, 0.0080, '2025-11-09 12:00:48', '2025-11-09 12:00:48'),
(552, 62, 3, 0.0000, '2025-11-09 12:00:48', '2025-11-09 12:00:48'),
(553, 62, 4, 0.0000, '2025-11-09 12:00:48', '2025-11-09 12:00:48'),
(554, 62, 5, 0.3254, '2025-11-09 12:00:48', '2025-11-09 12:00:48'),
(555, 62, 6, 0.2932, '2025-11-09 12:00:48', '2025-11-09 12:00:48'),
(556, 62, 7, 0.0000, '2025-11-09 12:00:48', '2025-11-09 12:00:48'),
(557, 62, 8, 0.0000, '2025-11-09 12:00:48', '2025-11-09 12:00:48'),
(558, 62, 9, 0.3090, '2025-11-09 12:00:48', '2025-11-09 12:00:48'),
(559, 63, 1, 0.0080, '2025-11-09 12:00:53', '2025-11-09 12:00:53'),
(560, 63, 2, 0.0080, '2025-11-09 12:00:53', '2025-11-09 12:00:53'),
(561, 63, 3, 0.3090, '2025-11-09 12:00:53', '2025-11-09 12:00:53'),
(562, 63, 4, 0.2490, '2025-11-09 12:00:53', '2025-11-09 12:00:53'),
(563, 63, 5, 0.0000, '2025-11-09 12:00:53', '2025-11-09 12:00:53'),
(564, 63, 6, 0.2932, '2025-11-09 12:00:53', '2025-11-09 12:00:53'),
(565, 63, 7, 0.0000, '2025-11-09 12:00:53', '2025-11-09 12:00:53'),
(566, 63, 8, 0.0000, '2025-11-09 12:00:53', '2025-11-09 12:00:53'),
(567, 63, 9, 0.0000, '2025-11-09 12:00:53', '2025-11-09 12:00:53'),
(568, 64, 1, 0.0080, '2025-11-09 12:01:00', '2025-11-09 12:01:00'),
(569, 64, 2, 0.0080, '2025-11-09 12:01:00', '2025-11-09 12:01:00'),
(570, 64, 3, 0.0000, '2025-11-09 12:01:00', '2025-11-09 12:01:00'),
(571, 64, 4, 0.2490, '2025-11-09 12:01:00', '2025-11-09 12:01:00'),
(572, 64, 5, 0.0000, '2025-11-09 12:01:00', '2025-11-09 12:01:00'),
(573, 64, 6, 0.2932, '2025-11-09 12:01:00', '2025-11-09 12:01:00'),
(574, 64, 7, 0.0000, '2025-11-09 12:01:00', '2025-11-09 12:01:00'),
(575, 64, 8, 0.2218, '2025-11-09 12:01:00', '2025-11-09 12:01:00'),
(576, 64, 9, 0.0000, '2025-11-09 12:01:00', '2025-11-09 12:01:00'),
(577, 65, 1, 0.0080, '2025-11-09 12:01:06', '2025-11-09 12:01:06'),
(578, 65, 2, 0.0080, '2025-11-09 12:01:06', '2025-11-09 12:01:06'),
(579, 65, 3, 0.0000, '2025-11-09 12:01:06', '2025-11-09 12:01:06'),
(580, 65, 4, 0.0000, '2025-11-09 12:01:06', '2025-11-09 12:01:06'),
(581, 65, 5, 0.0000, '2025-11-09 12:01:06', '2025-11-09 12:01:06'),
(582, 65, 6, 0.2932, '2025-11-09 12:01:06', '2025-11-09 12:01:06'),
(583, 65, 7, 0.3602, '2025-11-09 12:01:06', '2025-11-09 12:01:06'),
(584, 65, 8, 0.2218, '2025-11-09 12:01:06', '2025-11-09 12:01:06'),
(585, 65, 9, 0.0000, '2025-11-09 12:01:06', '2025-11-09 12:01:06'),
(586, 66, 1, 0.0080, '2025-11-09 12:01:11', '2025-11-09 12:01:11'),
(587, 66, 2, 0.0080, '2025-11-09 12:01:11', '2025-11-09 12:01:11'),
(588, 66, 3, 0.3090, '2025-11-09 12:01:11', '2025-11-09 12:01:11'),
(589, 66, 4, 0.2490, '2025-11-09 12:01:11', '2025-11-09 12:01:11'),
(590, 66, 5, 0.0000, '2025-11-09 12:01:11', '2025-11-09 12:01:11'),
(591, 66, 6, 0.0000, '2025-11-09 12:01:11', '2025-11-09 12:01:11'),
(592, 66, 7, 0.0000, '2025-11-09 12:01:11', '2025-11-09 12:01:11'),
(593, 66, 8, 0.2218, '2025-11-09 12:01:11', '2025-11-09 12:01:11'),
(594, 66, 9, 0.0000, '2025-11-09 12:01:11', '2025-11-09 12:01:11'),
(595, 67, 1, 0.0080, '2025-11-09 12:01:16', '2025-11-09 12:01:16'),
(596, 67, 2, 0.0080, '2025-11-09 12:01:16', '2025-11-09 12:01:16'),
(597, 67, 3, 0.0000, '2025-11-09 12:01:16', '2025-11-09 12:01:16'),
(598, 67, 4, 0.0000, '2025-11-09 12:01:16', '2025-11-09 12:01:16'),
(599, 67, 5, 0.3254, '2025-11-09 12:01:16', '2025-11-09 12:01:16'),
(600, 67, 6, 0.2932, '2025-11-09 12:01:16', '2025-11-09 12:01:16'),
(601, 67, 7, 0.3602, '2025-11-09 12:01:16', '2025-11-09 12:01:16'),
(602, 67, 8, 0.2218, '2025-11-09 12:01:16', '2025-11-09 12:01:16'),
(603, 67, 9, 0.3090, '2025-11-09 12:01:16', '2025-11-09 12:01:16'),
(604, 68, 1, 0.0000, '2025-11-09 12:01:20', '2025-11-09 12:01:20'),
(605, 68, 2, 0.0080, '2025-11-09 12:01:20', '2025-11-09 12:01:20'),
(606, 68, 3, 0.0000, '2025-11-09 12:01:20', '2025-11-09 12:01:20'),
(607, 68, 4, 0.0000, '2025-11-09 12:01:20', '2025-11-09 12:01:20'),
(608, 68, 5, 0.0000, '2025-11-09 12:01:20', '2025-11-09 12:01:20'),
(609, 68, 6, 0.2932, '2025-11-09 12:01:20', '2025-11-09 12:01:20'),
(610, 68, 7, 0.0000, '2025-11-09 12:01:20', '2025-11-09 12:01:20'),
(611, 68, 8, 0.2218, '2025-11-09 12:01:20', '2025-11-09 12:01:20'),
(612, 68, 9, 0.0000, '2025-11-09 12:01:20', '2025-11-09 12:01:20');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tf_idf_kategori`
--

CREATE TABLE `tf_idf_kategori` (
  `id` bigint UNSIGNED NOT NULL,
  `tf_idf_id` bigint UNSIGNED NOT NULL,
  `kategori_id` bigint UNSIGNED NOT NULL,
  `value` decimal(8,4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `tf_idf_kategori`
--

INSERT INTO `tf_idf_kategori` (`id`, `tf_idf_id`, `kategori_id`, `value`, `created_at`, `updated_at`) VALUES
(13, 3, 1, 0.1722, '2025-11-09 11:30:49', '2025-11-09 11:30:49'),
(14, 3, 2, 0.0000, '2025-11-09 11:30:49', '2025-11-09 11:30:49'),
(15, 3, 3, 0.0000, '2025-11-09 11:30:49', '2025-11-09 11:30:49'),
(16, 3, 4, 0.9622, '2025-11-09 11:30:49', '2025-11-09 11:30:49'),
(17, 3, 5, 0.0000, '2025-11-09 11:30:49', '2025-11-09 11:30:49'),
(18, 3, 6, 0.0000, '2025-11-09 11:30:49', '2025-11-09 11:30:49'),
(19, 4, 1, 0.1722, '2025-11-09 11:34:46', '2025-11-09 11:34:46'),
(20, 4, 2, 0.0000, '2025-11-09 11:34:46', '2025-11-09 11:34:46'),
(21, 4, 3, 0.0000, '2025-11-09 11:34:46', '2025-11-09 11:34:46'),
(22, 4, 4, 0.0000, '2025-11-09 11:34:46', '2025-11-09 11:34:46'),
(23, 4, 5, 0.4393, '2025-11-09 11:34:46', '2025-11-09 11:34:46'),
(24, 4, 6, 0.0000, '2025-11-09 11:34:46', '2025-11-09 11:34:46'),
(25, 5, 1, 0.1722, '2025-11-09 11:35:02', '2025-11-09 11:35:02'),
(26, 5, 2, 0.0000, '2025-11-09 11:35:02', '2025-11-09 11:35:02'),
(27, 5, 3, 0.0000, '2025-11-09 11:35:02', '2025-11-09 11:35:02'),
(28, 5, 4, 0.9622, '2025-11-09 11:35:02', '2025-11-09 11:35:02'),
(29, 5, 5, 0.0000, '2025-11-09 11:35:02', '2025-11-09 11:35:02'),
(30, 5, 6, 0.0000, '2025-11-09 11:35:02', '2025-11-09 11:35:02'),
(31, 6, 1, 0.1722, '2025-11-09 11:35:15', '2025-11-09 11:35:15'),
(32, 6, 2, 0.0000, '2025-11-09 11:35:15', '2025-11-09 11:35:15'),
(33, 6, 3, 0.0000, '2025-11-09 11:35:15', '2025-11-09 11:35:15'),
(34, 6, 4, 0.0000, '2025-11-09 11:35:15', '2025-11-09 11:35:15'),
(35, 6, 5, 0.0000, '2025-11-09 11:35:15', '2025-11-09 11:35:15'),
(36, 6, 6, 0.2780, '2025-11-09 11:35:15', '2025-11-09 11:35:15'),
(37, 7, 1, 0.1722, '2025-11-09 11:35:24', '2025-11-09 11:35:24'),
(38, 7, 2, 0.0000, '2025-11-09 11:35:24', '2025-11-09 11:35:24'),
(39, 7, 3, 0.0000, '2025-11-09 11:35:24', '2025-11-09 11:35:24'),
(40, 7, 4, 0.0000, '2025-11-09 11:35:24', '2025-11-09 11:35:24'),
(41, 7, 5, 0.0000, '2025-11-09 11:35:24', '2025-11-09 11:35:24'),
(42, 7, 6, 0.2780, '2025-11-09 11:35:24', '2025-11-09 11:35:24'),
(43, 8, 1, 0.1722, '2025-11-09 11:35:34', '2025-11-09 11:35:34'),
(44, 8, 2, 0.0000, '2025-11-09 11:35:34', '2025-11-09 11:35:34'),
(45, 8, 3, 0.0000, '2025-11-09 11:35:34', '2025-11-09 11:35:34'),
(46, 8, 4, 0.0000, '2025-11-09 11:35:34', '2025-11-09 11:35:34'),
(47, 8, 5, 0.4393, '2025-11-09 11:35:34', '2025-11-09 11:35:34'),
(48, 8, 6, 0.0000, '2025-11-09 11:35:34', '2025-11-09 11:35:34'),
(49, 9, 1, 0.1722, '2025-11-09 11:35:42', '2025-11-09 11:35:42'),
(50, 9, 2, 0.0000, '2025-11-09 11:35:42', '2025-11-09 11:35:42'),
(51, 9, 3, 0.0000, '2025-11-09 11:35:42', '2025-11-09 11:35:42'),
(52, 9, 4, 0.0000, '2025-11-09 11:35:42', '2025-11-09 11:35:42'),
(53, 9, 5, 0.4393, '2025-11-09 11:35:42', '2025-11-09 11:35:42'),
(54, 9, 6, 0.0000, '2025-11-09 11:35:42', '2025-11-09 11:35:42'),
(55, 10, 1, 0.1722, '2025-11-09 11:35:46', '2025-11-09 11:35:46'),
(56, 10, 2, 0.0000, '2025-11-09 11:35:46', '2025-11-09 11:35:46'),
(57, 10, 3, 0.0000, '2025-11-09 11:35:46', '2025-11-09 11:35:46'),
(58, 10, 4, 0.0000, '2025-11-09 11:35:46', '2025-11-09 11:35:46'),
(59, 10, 5, 0.4393, '2025-11-09 11:35:46', '2025-11-09 11:35:46'),
(60, 10, 6, 0.0000, '2025-11-09 11:35:46', '2025-11-09 11:35:46'),
(61, 11, 1, 0.1722, '2025-11-09 11:35:53', '2025-11-09 11:35:53'),
(62, 11, 2, 0.0000, '2025-11-09 11:35:53', '2025-11-09 11:35:53'),
(63, 11, 3, 0.0000, '2025-11-09 11:35:53', '2025-11-09 11:35:53'),
(64, 11, 4, 0.0000, '2025-11-09 11:35:53', '2025-11-09 11:35:53'),
(65, 11, 5, 0.0000, '2025-11-09 11:35:53', '2025-11-09 11:35:53'),
(66, 11, 6, 0.2780, '2025-11-09 11:35:53', '2025-11-09 11:35:53'),
(67, 12, 1, 0.1722, '2025-11-09 11:50:04', '2025-11-09 11:50:04'),
(68, 12, 2, 0.0000, '2025-11-09 11:50:04', '2025-11-09 11:50:04'),
(69, 12, 3, 0.0000, '2025-11-09 11:50:04', '2025-11-09 11:50:04'),
(70, 12, 4, 0.0000, '2025-11-09 11:50:04', '2025-11-09 11:50:04'),
(71, 12, 5, 0.0000, '2025-11-09 11:50:04', '2025-11-09 11:50:04'),
(72, 12, 6, 0.2780, '2025-11-09 11:50:04', '2025-11-09 11:50:04'),
(73, 13, 1, 0.1722, '2025-11-09 11:50:50', '2025-11-09 11:50:50'),
(74, 13, 2, 0.0000, '2025-11-09 11:50:50', '2025-11-09 11:50:50'),
(75, 13, 3, 0.0000, '2025-11-09 11:50:50', '2025-11-09 11:50:50'),
(76, 13, 4, 0.0000, '2025-11-09 11:50:50', '2025-11-09 11:50:50'),
(77, 13, 5, 0.0000, '2025-11-09 11:50:50', '2025-11-09 11:50:50'),
(78, 13, 6, 0.2780, '2025-11-09 11:50:50', '2025-11-09 11:50:50'),
(79, 14, 1, 0.1722, '2025-11-09 11:51:21', '2025-11-09 11:51:21'),
(80, 14, 2, 0.0000, '2025-11-09 11:51:21', '2025-11-09 11:51:21'),
(81, 14, 3, 0.0000, '2025-11-09 11:51:21', '2025-11-09 11:51:21'),
(82, 14, 4, 0.0000, '2025-11-09 11:51:21', '2025-11-09 11:51:21'),
(83, 14, 5, 0.0000, '2025-11-09 11:51:21', '2025-11-09 11:51:21'),
(84, 14, 6, 0.2780, '2025-11-09 11:51:21', '2025-11-09 11:51:21'),
(85, 15, 1, 0.1722, '2025-11-09 11:51:54', '2025-11-09 11:51:54'),
(86, 15, 2, 0.0000, '2025-11-09 11:51:54', '2025-11-09 11:51:54'),
(87, 15, 3, 0.0000, '2025-11-09 11:51:54', '2025-11-09 11:51:54'),
(88, 15, 4, 0.0000, '2025-11-09 11:51:54', '2025-11-09 11:51:54'),
(89, 15, 5, 0.0000, '2025-11-09 11:51:54', '2025-11-09 11:51:54'),
(90, 15, 6, 0.2780, '2025-11-09 11:51:54', '2025-11-09 11:51:54'),
(91, 16, 1, 0.1722, '2025-11-09 11:52:06', '2025-11-09 11:52:06'),
(92, 16, 2, 0.0000, '2025-11-09 11:52:06', '2025-11-09 11:52:06'),
(93, 16, 3, 0.0000, '2025-11-09 11:52:06', '2025-11-09 11:52:06'),
(94, 16, 4, 0.0000, '2025-11-09 11:52:06', '2025-11-09 11:52:06'),
(95, 16, 5, 0.0000, '2025-11-09 11:52:06', '2025-11-09 11:52:06'),
(96, 16, 6, 0.2780, '2025-11-09 11:52:06', '2025-11-09 11:52:06'),
(97, 17, 1, 0.1722, '2025-11-09 11:52:18', '2025-11-09 11:52:18'),
(98, 17, 2, 0.0000, '2025-11-09 11:52:18', '2025-11-09 11:52:18'),
(99, 17, 3, 0.0000, '2025-11-09 11:52:18', '2025-11-09 11:52:18'),
(100, 17, 4, 0.0000, '2025-11-09 11:52:18', '2025-11-09 11:52:18'),
(101, 17, 5, 0.0000, '2025-11-09 11:52:18', '2025-11-09 11:52:18'),
(102, 17, 6, 0.2780, '2025-11-09 11:52:18', '2025-11-09 11:52:18'),
(103, 18, 1, 0.1722, '2025-11-09 11:52:23', '2025-11-09 11:52:23'),
(104, 18, 2, 0.0000, '2025-11-09 11:52:23', '2025-11-09 11:52:23'),
(105, 18, 3, 0.0000, '2025-11-09 11:52:23', '2025-11-09 11:52:23'),
(106, 18, 4, 0.0000, '2025-11-09 11:52:23', '2025-11-09 11:52:23'),
(107, 18, 5, 0.4393, '2025-11-09 11:52:23', '2025-11-09 11:52:23'),
(108, 18, 6, 0.0000, '2025-11-09 11:52:23', '2025-11-09 11:52:23'),
(109, 19, 1, 0.1722, '2025-11-09 11:52:30', '2025-11-09 11:52:30'),
(110, 19, 2, 0.0000, '2025-11-09 11:52:30', '2025-11-09 11:52:30'),
(111, 19, 3, 0.0000, '2025-11-09 11:52:30', '2025-11-09 11:52:30'),
(112, 19, 4, 0.0000, '2025-11-09 11:52:30', '2025-11-09 11:52:30'),
(113, 19, 5, 0.0000, '2025-11-09 11:52:30', '2025-11-09 11:52:30'),
(114, 19, 6, 0.2780, '2025-11-09 11:52:30', '2025-11-09 11:52:30'),
(115, 20, 1, 0.0000, '2025-11-09 11:52:38', '2025-11-09 11:52:38'),
(116, 20, 2, 0.0000, '2025-11-09 11:52:38', '2025-11-09 11:52:38'),
(117, 20, 3, 1.0414, '2025-11-09 11:52:38', '2025-11-09 11:52:38'),
(118, 20, 4, 0.0000, '2025-11-09 11:52:38', '2025-11-09 11:52:38'),
(119, 20, 5, 0.0000, '2025-11-09 11:52:38', '2025-11-09 11:52:38'),
(120, 20, 6, 0.2780, '2025-11-09 11:52:38', '2025-11-09 11:52:38'),
(121, 21, 1, 0.1722, '2025-11-09 11:52:44', '2025-11-09 11:52:44'),
(122, 21, 2, 0.0000, '2025-11-09 11:52:44', '2025-11-09 11:52:44'),
(123, 21, 3, 0.0000, '2025-11-09 11:52:44', '2025-11-09 11:52:44'),
(124, 21, 4, 0.0000, '2025-11-09 11:52:44', '2025-11-09 11:52:44'),
(125, 21, 5, 0.4393, '2025-11-09 11:52:44', '2025-11-09 11:52:44'),
(126, 21, 6, 0.0000, '2025-11-09 11:52:44', '2025-11-09 11:52:44'),
(127, 22, 1, 0.1722, '2025-11-09 11:52:50', '2025-11-09 11:52:50'),
(128, 22, 2, 0.0000, '2025-11-09 11:52:50', '2025-11-09 11:52:50'),
(129, 22, 3, 0.0000, '2025-11-09 11:52:50', '2025-11-09 11:52:50'),
(130, 22, 4, 0.0000, '2025-11-09 11:52:50', '2025-11-09 11:52:50'),
(131, 22, 5, 0.0000, '2025-11-09 11:52:50', '2025-11-09 11:52:50'),
(132, 22, 6, 0.2780, '2025-11-09 11:52:50', '2025-11-09 11:52:50'),
(133, 23, 1, 0.1722, '2025-11-09 11:53:01', '2025-11-09 11:53:01'),
(134, 23, 2, 0.0000, '2025-11-09 11:53:01', '2025-11-09 11:53:01'),
(135, 23, 3, 0.0000, '2025-11-09 11:53:01', '2025-11-09 11:53:01'),
(136, 23, 4, 0.0000, '2025-11-09 11:53:01', '2025-11-09 11:53:01'),
(137, 23, 5, 0.0000, '2025-11-09 11:53:01', '2025-11-09 11:53:01'),
(138, 23, 6, 0.2780, '2025-11-09 11:53:01', '2025-11-09 11:53:01'),
(139, 24, 1, 0.1722, '2025-11-09 11:53:07', '2025-11-09 11:53:07'),
(140, 24, 2, 0.0000, '2025-11-09 11:53:07', '2025-11-09 11:53:07'),
(141, 24, 3, 0.0000, '2025-11-09 11:53:07', '2025-11-09 11:53:07'),
(142, 24, 4, 0.0000, '2025-11-09 11:53:07', '2025-11-09 11:53:07'),
(143, 24, 5, 0.0000, '2025-11-09 11:53:07', '2025-11-09 11:53:07'),
(144, 24, 6, 0.2780, '2025-11-09 11:53:07', '2025-11-09 11:53:07'),
(145, 25, 1, 0.0000, '2025-11-09 11:53:16', '2025-11-09 11:53:16'),
(146, 25, 2, 0.6264, '2025-11-09 11:53:16', '2025-11-09 11:53:16'),
(147, 25, 3, 0.0000, '2025-11-09 11:53:16', '2025-11-09 11:53:16'),
(148, 25, 4, 0.0000, '2025-11-09 11:53:16', '2025-11-09 11:53:16'),
(149, 25, 5, 0.4393, '2025-11-09 11:53:16', '2025-11-09 11:53:16'),
(150, 25, 6, 0.0000, '2025-11-09 11:53:16', '2025-11-09 11:53:16'),
(151, 26, 1, 0.0000, '2025-11-09 11:53:31', '2025-11-09 11:53:31'),
(152, 26, 2, 0.6264, '2025-11-09 11:53:31', '2025-11-09 11:53:31'),
(153, 26, 3, 0.0000, '2025-11-09 11:53:31', '2025-11-09 11:53:31'),
(154, 26, 4, 0.0000, '2025-11-09 11:53:31', '2025-11-09 11:53:31'),
(155, 26, 5, 0.4393, '2025-11-09 11:53:31', '2025-11-09 11:53:31'),
(156, 26, 6, 0.0000, '2025-11-09 11:53:31', '2025-11-09 11:53:31'),
(157, 27, 1, 0.0000, '2025-11-09 11:53:39', '2025-11-09 11:53:39'),
(158, 27, 2, 0.6264, '2025-11-09 11:53:39', '2025-11-09 11:53:39'),
(159, 27, 3, 0.0000, '2025-11-09 11:53:39', '2025-11-09 11:53:39'),
(160, 27, 4, 0.9622, '2025-11-09 11:53:39', '2025-11-09 11:53:39'),
(161, 27, 5, 0.0000, '2025-11-09 11:53:39', '2025-11-09 11:53:39'),
(162, 27, 6, 0.0000, '2025-11-09 11:53:39', '2025-11-09 11:53:39'),
(163, 28, 1, 0.0000, '2025-11-09 11:53:46', '2025-11-09 11:53:46'),
(164, 28, 2, 0.6264, '2025-11-09 11:53:46', '2025-11-09 11:53:46'),
(165, 28, 3, 0.0000, '2025-11-09 11:53:46', '2025-11-09 11:53:46'),
(166, 28, 4, 0.0000, '2025-11-09 11:53:46', '2025-11-09 11:53:46'),
(167, 28, 5, 0.4393, '2025-11-09 11:53:46', '2025-11-09 11:53:46'),
(168, 28, 6, 0.0000, '2025-11-09 11:53:46', '2025-11-09 11:53:46'),
(169, 29, 1, 0.0000, '2025-11-09 11:53:51', '2025-11-09 11:53:51'),
(170, 29, 2, 0.6264, '2025-11-09 11:53:51', '2025-11-09 11:53:51'),
(171, 29, 3, 0.0000, '2025-11-09 11:53:51', '2025-11-09 11:53:51'),
(172, 29, 4, 0.0000, '2025-11-09 11:53:51', '2025-11-09 11:53:51'),
(173, 29, 5, 0.4393, '2025-11-09 11:53:51', '2025-11-09 11:53:51'),
(174, 29, 6, 0.0000, '2025-11-09 11:53:51', '2025-11-09 11:53:51'),
(175, 30, 1, 0.0000, '2025-11-09 11:53:56', '2025-11-09 11:53:56'),
(176, 30, 2, 0.6264, '2025-11-09 11:53:56', '2025-11-09 11:53:56'),
(177, 30, 3, 0.0000, '2025-11-09 11:53:56', '2025-11-09 11:53:56'),
(178, 30, 4, 0.0000, '2025-11-09 11:53:56', '2025-11-09 11:53:56'),
(179, 30, 5, 0.4393, '2025-11-09 11:53:56', '2025-11-09 11:53:56'),
(180, 30, 6, 0.0000, '2025-11-09 11:53:56', '2025-11-09 11:53:56'),
(247, 42, 1, 0.0000, '2025-11-09 11:57:07', '2025-11-09 11:57:07'),
(248, 42, 2, 0.6264, '2025-11-09 11:57:07', '2025-11-09 11:57:07'),
(249, 42, 3, 0.0000, '2025-11-09 11:57:07', '2025-11-09 11:57:07'),
(250, 42, 4, 0.0000, '2025-11-09 11:57:07', '2025-11-09 11:57:07'),
(251, 42, 5, 0.4393, '2025-11-09 11:57:07', '2025-11-09 11:57:07'),
(252, 42, 6, 0.0000, '2025-11-09 11:57:07', '2025-11-09 11:57:07'),
(253, 43, 1, 0.0000, '2025-11-09 11:57:25', '2025-11-09 11:57:25'),
(254, 43, 2, 0.6264, '2025-11-09 11:57:25', '2025-11-09 11:57:25'),
(255, 43, 3, 0.0000, '2025-11-09 11:57:25', '2025-11-09 11:57:25'),
(256, 43, 4, 0.0000, '2025-11-09 11:57:25', '2025-11-09 11:57:25'),
(257, 43, 5, 0.4393, '2025-11-09 11:57:25', '2025-11-09 11:57:25'),
(258, 43, 6, 0.0000, '2025-11-09 11:57:25', '2025-11-09 11:57:25'),
(259, 44, 1, 0.1722, '2025-11-09 11:57:45', '2025-11-09 11:57:45'),
(260, 44, 2, 0.0000, '2025-11-09 11:57:45', '2025-11-09 11:57:45'),
(261, 44, 3, 0.0000, '2025-11-09 11:57:45', '2025-11-09 11:57:45'),
(262, 44, 4, 0.9622, '2025-11-09 11:57:45', '2025-11-09 11:57:45'),
(263, 44, 5, 0.0000, '2025-11-09 11:57:45', '2025-11-09 11:57:45'),
(264, 44, 6, 0.0000, '2025-11-09 11:57:45', '2025-11-09 11:57:45'),
(265, 45, 1, 0.1722, '2025-11-09 11:57:58', '2025-11-09 11:57:58'),
(266, 45, 2, 0.0000, '2025-11-09 11:57:58', '2025-11-09 11:57:58'),
(267, 45, 3, 0.0000, '2025-11-09 11:57:58', '2025-11-09 11:57:58'),
(268, 45, 4, 0.0000, '2025-11-09 11:57:58', '2025-11-09 11:57:58'),
(269, 45, 5, 0.0000, '2025-11-09 11:57:58', '2025-11-09 11:57:58'),
(270, 45, 6, 0.2780, '2025-11-09 11:57:58', '2025-11-09 11:57:58'),
(271, 46, 1, 0.1722, '2025-11-09 11:58:09', '2025-11-09 11:58:09'),
(272, 46, 2, 0.0000, '2025-11-09 11:58:09', '2025-11-09 11:58:09'),
(273, 46, 3, 0.0000, '2025-11-09 11:58:09', '2025-11-09 11:58:09'),
(274, 46, 4, 0.9622, '2025-11-09 11:58:09', '2025-11-09 11:58:09'),
(275, 46, 5, 0.0000, '2025-11-09 11:58:09', '2025-11-09 11:58:09'),
(276, 46, 6, 0.0000, '2025-11-09 11:58:09', '2025-11-09 11:58:09'),
(277, 47, 1, 0.1722, '2025-11-09 11:58:18', '2025-11-09 11:58:18'),
(278, 47, 2, 0.0000, '2025-11-09 11:58:18', '2025-11-09 11:58:18'),
(279, 47, 3, 0.0000, '2025-11-09 11:58:18', '2025-11-09 11:58:18'),
(280, 47, 4, 0.0000, '2025-11-09 11:58:18', '2025-11-09 11:58:18'),
(281, 47, 5, 0.0000, '2025-11-09 11:58:18', '2025-11-09 11:58:18'),
(282, 47, 6, 0.2780, '2025-11-09 11:58:18', '2025-11-09 11:58:18'),
(283, 48, 1, 0.1722, '2025-11-09 11:59:08', '2025-11-09 11:59:08'),
(284, 48, 2, 0.0000, '2025-11-09 11:59:08', '2025-11-09 11:59:08'),
(285, 48, 3, 0.0000, '2025-11-09 11:59:08', '2025-11-09 11:59:08'),
(286, 48, 4, 0.0000, '2025-11-09 11:59:08', '2025-11-09 11:59:08'),
(287, 48, 5, 0.0000, '2025-11-09 11:59:08', '2025-11-09 11:59:08'),
(288, 48, 6, 0.2780, '2025-11-09 11:59:08', '2025-11-09 11:59:08'),
(289, 49, 1, 0.1722, '2025-11-09 11:59:13', '2025-11-09 11:59:13'),
(290, 49, 2, 0.0000, '2025-11-09 11:59:13', '2025-11-09 11:59:13'),
(291, 49, 3, 0.0000, '2025-11-09 11:59:13', '2025-11-09 11:59:13'),
(292, 49, 4, 0.0000, '2025-11-09 11:59:13', '2025-11-09 11:59:13'),
(293, 49, 5, 0.0000, '2025-11-09 11:59:13', '2025-11-09 11:59:13'),
(294, 49, 6, 0.2780, '2025-11-09 11:59:13', '2025-11-09 11:59:13'),
(295, 50, 1, 0.0000, '2025-11-09 11:59:20', '2025-11-09 11:59:20'),
(296, 50, 2, 0.0000, '2025-11-09 11:59:20', '2025-11-09 11:59:20'),
(297, 50, 3, 1.0414, '2025-11-09 11:59:20', '2025-11-09 11:59:20'),
(298, 50, 4, 0.0000, '2025-11-09 11:59:20', '2025-11-09 11:59:20'),
(299, 50, 5, 0.0000, '2025-11-09 11:59:20', '2025-11-09 11:59:20'),
(300, 50, 6, 0.2780, '2025-11-09 11:59:20', '2025-11-09 11:59:20'),
(301, 51, 1, 0.1722, '2025-11-09 11:59:25', '2025-11-09 11:59:25'),
(302, 51, 2, 0.0000, '2025-11-09 11:59:25', '2025-11-09 11:59:25'),
(303, 51, 3, 0.0000, '2025-11-09 11:59:25', '2025-11-09 11:59:25'),
(304, 51, 4, 0.0000, '2025-11-09 11:59:25', '2025-11-09 11:59:25'),
(305, 51, 5, 0.4393, '2025-11-09 11:59:25', '2025-11-09 11:59:25'),
(306, 51, 6, 0.0000, '2025-11-09 11:59:25', '2025-11-09 11:59:25'),
(307, 52, 1, 0.1722, '2025-11-09 11:59:34', '2025-11-09 11:59:34'),
(308, 52, 2, 0.0000, '2025-11-09 11:59:34', '2025-11-09 11:59:34'),
(309, 52, 3, 0.0000, '2025-11-09 11:59:34', '2025-11-09 11:59:34'),
(310, 52, 4, 0.0000, '2025-11-09 11:59:34', '2025-11-09 11:59:34'),
(311, 52, 5, 0.4393, '2025-11-09 11:59:34', '2025-11-09 11:59:34'),
(312, 52, 6, 0.0000, '2025-11-09 11:59:34', '2025-11-09 11:59:34'),
(313, 53, 1, 0.0000, '2025-11-09 11:59:50', '2025-11-09 11:59:50'),
(314, 53, 2, 0.0000, '2025-11-09 11:59:50', '2025-11-09 11:59:50'),
(315, 53, 3, 1.0414, '2025-11-09 11:59:50', '2025-11-09 11:59:50'),
(316, 53, 4, 0.0000, '2025-11-09 11:59:50', '2025-11-09 11:59:50'),
(317, 53, 5, 0.0000, '2025-11-09 11:59:50', '2025-11-09 11:59:50'),
(318, 53, 6, 0.2780, '2025-11-09 11:59:50', '2025-11-09 11:59:50'),
(319, 54, 1, 0.0000, '2025-11-09 11:59:55', '2025-11-09 11:59:55'),
(320, 54, 2, 0.6264, '2025-11-09 11:59:55', '2025-11-09 11:59:55'),
(321, 54, 3, 0.0000, '2025-11-09 11:59:55', '2025-11-09 11:59:55'),
(322, 54, 4, 0.0000, '2025-11-09 11:59:55', '2025-11-09 11:59:55'),
(323, 54, 5, 0.4393, '2025-11-09 11:59:55', '2025-11-09 11:59:55'),
(324, 54, 6, 0.0000, '2025-11-09 11:59:55', '2025-11-09 11:59:55'),
(325, 55, 1, 0.1722, '2025-11-09 12:00:00', '2025-11-09 12:00:00'),
(326, 55, 2, 0.0000, '2025-11-09 12:00:00', '2025-11-09 12:00:00'),
(327, 55, 3, 0.0000, '2025-11-09 12:00:00', '2025-11-09 12:00:00'),
(328, 55, 4, 0.0000, '2025-11-09 12:00:00', '2025-11-09 12:00:00'),
(329, 55, 5, 0.0000, '2025-11-09 12:00:00', '2025-11-09 12:00:00'),
(330, 55, 6, 0.2780, '2025-11-09 12:00:00', '2025-11-09 12:00:00'),
(331, 56, 1, 0.1722, '2025-11-09 12:00:05', '2025-11-09 12:00:05'),
(332, 56, 2, 0.0000, '2025-11-09 12:00:05', '2025-11-09 12:00:05'),
(333, 56, 3, 0.0000, '2025-11-09 12:00:05', '2025-11-09 12:00:05'),
(334, 56, 4, 0.0000, '2025-11-09 12:00:05', '2025-11-09 12:00:05'),
(335, 56, 5, 0.0000, '2025-11-09 12:00:05', '2025-11-09 12:00:05'),
(336, 56, 6, 0.2780, '2025-11-09 12:00:05', '2025-11-09 12:00:05'),
(337, 57, 1, 0.0000, '2025-11-09 12:00:25', '2025-11-09 12:00:25'),
(338, 57, 2, 0.0000, '2025-11-09 12:00:25', '2025-11-09 12:00:25'),
(339, 57, 3, 1.0414, '2025-11-09 12:00:25', '2025-11-09 12:00:25'),
(340, 57, 4, 0.0000, '2025-11-09 12:00:25', '2025-11-09 12:00:25'),
(341, 57, 5, 0.0000, '2025-11-09 12:00:25', '2025-11-09 12:00:25'),
(342, 57, 6, 0.2780, '2025-11-09 12:00:25', '2025-11-09 12:00:25'),
(343, 58, 1, 0.0000, '2025-11-09 12:00:29', '2025-11-09 12:00:29'),
(344, 58, 2, 0.6264, '2025-11-09 12:00:29', '2025-11-09 12:00:29'),
(345, 58, 3, 0.0000, '2025-11-09 12:00:29', '2025-11-09 12:00:29'),
(346, 58, 4, 0.9622, '2025-11-09 12:00:29', '2025-11-09 12:00:29'),
(347, 58, 5, 0.0000, '2025-11-09 12:00:29', '2025-11-09 12:00:29'),
(348, 58, 6, 0.0000, '2025-11-09 12:00:29', '2025-11-09 12:00:29'),
(349, 59, 1, 0.1722, '2025-11-09 12:00:34', '2025-11-09 12:00:34'),
(350, 59, 2, 0.0000, '2025-11-09 12:00:34', '2025-11-09 12:00:34'),
(351, 59, 3, 0.0000, '2025-11-09 12:00:34', '2025-11-09 12:00:34'),
(352, 59, 4, 0.0000, '2025-11-09 12:00:34', '2025-11-09 12:00:34'),
(353, 59, 5, 0.0000, '2025-11-09 12:00:34', '2025-11-09 12:00:34'),
(354, 59, 6, 0.2780, '2025-11-09 12:00:34', '2025-11-09 12:00:34'),
(355, 60, 1, 0.1722, '2025-11-09 12:00:38', '2025-11-09 12:00:38'),
(356, 60, 2, 0.0000, '2025-11-09 12:00:38', '2025-11-09 12:00:38'),
(357, 60, 3, 0.0000, '2025-11-09 12:00:38', '2025-11-09 12:00:38'),
(358, 60, 4, 0.0000, '2025-11-09 12:00:38', '2025-11-09 12:00:38'),
(359, 60, 5, 0.4393, '2025-11-09 12:00:38', '2025-11-09 12:00:38'),
(360, 60, 6, 0.0000, '2025-11-09 12:00:38', '2025-11-09 12:00:38'),
(361, 61, 1, 0.1722, '2025-11-09 12:00:43', '2025-11-09 12:00:43'),
(362, 61, 2, 0.0000, '2025-11-09 12:00:43', '2025-11-09 12:00:43'),
(363, 61, 3, 0.0000, '2025-11-09 12:00:43', '2025-11-09 12:00:43'),
(364, 61, 4, 0.0000, '2025-11-09 12:00:43', '2025-11-09 12:00:43'),
(365, 61, 5, 0.0000, '2025-11-09 12:00:43', '2025-11-09 12:00:43'),
(366, 61, 6, 0.2780, '2025-11-09 12:00:43', '2025-11-09 12:00:43'),
(367, 62, 1, 0.0000, '2025-11-09 12:00:48', '2025-11-09 12:00:48'),
(368, 62, 2, 0.6264, '2025-11-09 12:00:48', '2025-11-09 12:00:48'),
(369, 62, 3, 0.0000, '2025-11-09 12:00:48', '2025-11-09 12:00:48'),
(370, 62, 4, 0.0000, '2025-11-09 12:00:48', '2025-11-09 12:00:48'),
(371, 62, 5, 0.4393, '2025-11-09 12:00:48', '2025-11-09 12:00:48'),
(372, 62, 6, 0.0000, '2025-11-09 12:00:48', '2025-11-09 12:00:48'),
(373, 63, 1, 0.1722, '2025-11-09 12:00:53', '2025-11-09 12:00:53'),
(374, 63, 2, 0.0000, '2025-11-09 12:00:53', '2025-11-09 12:00:53'),
(375, 63, 3, 0.0000, '2025-11-09 12:00:53', '2025-11-09 12:00:53'),
(376, 63, 4, 0.0000, '2025-11-09 12:00:53', '2025-11-09 12:00:53'),
(377, 63, 5, 0.0000, '2025-11-09 12:00:53', '2025-11-09 12:00:53'),
(378, 63, 6, 0.2780, '2025-11-09 12:00:53', '2025-11-09 12:00:53'),
(379, 64, 1, 0.1722, '2025-11-09 12:01:00', '2025-11-09 12:01:00'),
(380, 64, 2, 0.0000, '2025-11-09 12:01:00', '2025-11-09 12:01:00'),
(381, 64, 3, 0.0000, '2025-11-09 12:01:00', '2025-11-09 12:01:00'),
(382, 64, 4, 0.0000, '2025-11-09 12:01:00', '2025-11-09 12:01:00'),
(383, 64, 5, 0.0000, '2025-11-09 12:01:00', '2025-11-09 12:01:00'),
(384, 64, 6, 0.2780, '2025-11-09 12:01:00', '2025-11-09 12:01:00'),
(385, 65, 1, 0.0000, '2025-11-09 12:01:06', '2025-11-09 12:01:06'),
(386, 65, 2, 0.6264, '2025-11-09 12:01:06', '2025-11-09 12:01:06'),
(387, 65, 3, 0.0000, '2025-11-09 12:01:06', '2025-11-09 12:01:06'),
(388, 65, 4, 0.0000, '2025-11-09 12:01:06', '2025-11-09 12:01:06'),
(389, 65, 5, 0.4393, '2025-11-09 12:01:06', '2025-11-09 12:01:06'),
(390, 65, 6, 0.0000, '2025-11-09 12:01:06', '2025-11-09 12:01:06'),
(391, 66, 1, 0.1722, '2025-11-09 12:01:11', '2025-11-09 12:01:11'),
(392, 66, 2, 0.0000, '2025-11-09 12:01:11', '2025-11-09 12:01:11'),
(393, 66, 3, 0.0000, '2025-11-09 12:01:11', '2025-11-09 12:01:11'),
(394, 66, 4, 0.0000, '2025-11-09 12:01:11', '2025-11-09 12:01:11'),
(395, 66, 5, 0.4393, '2025-11-09 12:01:11', '2025-11-09 12:01:11'),
(396, 66, 6, 0.0000, '2025-11-09 12:01:11', '2025-11-09 12:01:11'),
(397, 67, 1, 0.0000, '2025-11-09 12:01:16', '2025-11-09 12:01:16'),
(398, 67, 2, 0.6264, '2025-11-09 12:01:16', '2025-11-09 12:01:16'),
(399, 67, 3, 0.0000, '2025-11-09 12:01:16', '2025-11-09 12:01:16'),
(400, 67, 4, 0.0000, '2025-11-09 12:01:16', '2025-11-09 12:01:16'),
(401, 67, 5, 0.4393, '2025-11-09 12:01:16', '2025-11-09 12:01:16'),
(402, 67, 6, 0.0000, '2025-11-09 12:01:16', '2025-11-09 12:01:16'),
(403, 68, 1, 0.0000, '2025-11-09 12:01:20', '2025-11-09 12:01:20'),
(404, 68, 2, 0.0000, '2025-11-09 12:01:20', '2025-11-09 12:01:20'),
(405, 68, 3, 1.0414, '2025-11-09 12:01:20', '2025-11-09 12:01:20'),
(406, 68, 4, 0.0000, '2025-11-09 12:01:20', '2025-11-09 12:01:20'),
(407, 68, 5, 0.0000, '2025-11-09 12:01:20', '2025-11-09 12:01:20'),
(408, 68, 6, 0.2780, '2025-11-09 12:01:20', '2025-11-09 12:01:20');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tf_kategori`
--

CREATE TABLE `tf_kategori` (
  `id` bigint UNSIGNED NOT NULL,
  `tf_id` bigint UNSIGNED NOT NULL,
  `kategori_id` bigint UNSIGNED NOT NULL,
  `value` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `tf_kategori`
--

INSERT INTO `tf_kategori` (`id`, `tf_id`, `kategori_id`, `value`, `created_at`, `updated_at`) VALUES
(13, 4, 1, 1, '2025-11-06 02:30:18', '2025-11-06 02:30:18'),
(14, 4, 2, 0, '2025-11-06 02:30:18', '2025-11-06 02:30:18'),
(15, 4, 3, 0, '2025-11-06 02:30:18', '2025-11-06 02:30:18'),
(16, 4, 6, 0, '2025-11-06 02:30:18', '2025-11-06 02:30:18'),
(17, 4, 5, 0, '2025-11-06 02:30:18', '2025-11-06 02:30:18'),
(18, 4, 4, 1, '2025-11-06 02:30:18', '2025-11-06 02:30:18'),
(19, 5, 1, 1, '2025-11-06 02:33:05', '2025-11-06 02:33:05'),
(20, 5, 2, 0, '2025-11-06 02:33:05', '2025-11-06 02:33:05'),
(21, 5, 3, 0, '2025-11-06 02:33:05', '2025-11-06 02:33:05'),
(22, 5, 6, 0, '2025-11-06 02:33:05', '2025-11-06 02:33:05'),
(23, 5, 5, 1, '2025-11-06 02:33:05', '2025-11-06 02:33:05'),
(24, 5, 4, 0, '2025-11-06 02:33:05', '2025-11-06 02:33:05'),
(25, 6, 1, 1, '2025-11-06 02:35:49', '2025-11-06 02:35:49'),
(26, 6, 2, 0, '2025-11-06 02:35:49', '2025-11-06 02:35:49'),
(27, 6, 3, 0, '2025-11-06 02:35:49', '2025-11-06 02:35:49'),
(28, 6, 6, 0, '2025-11-06 02:35:49', '2025-11-06 02:35:49'),
(29, 6, 5, 0, '2025-11-06 02:35:49', '2025-11-06 02:35:49'),
(30, 6, 4, 1, '2025-11-06 02:35:49', '2025-11-06 02:35:49'),
(31, 7, 1, 1, '2025-11-06 02:38:27', '2025-11-06 02:38:27'),
(32, 7, 2, 0, '2025-11-06 02:38:27', '2025-11-06 02:38:27'),
(33, 7, 3, 0, '2025-11-06 02:38:27', '2025-11-06 02:38:27'),
(34, 7, 6, 1, '2025-11-06 02:38:27', '2025-11-06 02:38:27'),
(35, 7, 5, 0, '2025-11-06 02:38:27', '2025-11-06 02:38:27'),
(36, 7, 4, 0, '2025-11-06 02:38:27', '2025-11-06 02:38:27'),
(37, 8, 1, 1, '2025-11-06 02:41:11', '2025-11-06 02:41:11'),
(38, 8, 2, 0, '2025-11-06 02:41:11', '2025-11-06 02:41:11'),
(39, 8, 3, 0, '2025-11-06 02:41:11', '2025-11-06 02:41:11'),
(40, 8, 6, 1, '2025-11-06 02:41:11', '2025-11-06 02:41:11'),
(41, 8, 5, 0, '2025-11-06 02:41:11', '2025-11-06 02:41:11'),
(42, 8, 4, 0, '2025-11-06 02:41:11', '2025-11-06 02:41:11'),
(43, 9, 1, 1, '2025-11-06 02:44:22', '2025-11-06 02:44:22'),
(44, 9, 2, 0, '2025-11-06 02:44:22', '2025-11-06 02:44:22'),
(45, 9, 3, 0, '2025-11-06 02:44:22', '2025-11-06 02:44:22'),
(46, 9, 6, 0, '2025-11-06 02:44:22', '2025-11-06 02:44:22'),
(47, 9, 5, 1, '2025-11-06 02:44:22', '2025-11-06 02:44:22'),
(48, 9, 4, 0, '2025-11-06 02:44:22', '2025-11-06 02:44:22'),
(49, 10, 1, 1, '2025-11-06 02:46:39', '2025-11-06 02:46:39'),
(50, 10, 2, 0, '2025-11-06 02:46:39', '2025-11-06 02:46:39'),
(51, 10, 3, 0, '2025-11-06 02:46:39', '2025-11-06 02:46:39'),
(52, 10, 6, 0, '2025-11-06 02:46:39', '2025-11-06 02:46:39'),
(53, 10, 5, 1, '2025-11-06 02:46:39', '2025-11-06 02:46:39'),
(54, 10, 4, 0, '2025-11-06 02:46:39', '2025-11-06 02:46:39'),
(55, 11, 1, 1, '2025-11-06 02:49:22', '2025-11-06 02:49:22'),
(56, 11, 2, 0, '2025-11-06 02:49:22', '2025-11-06 02:49:22'),
(57, 11, 3, 0, '2025-11-06 02:49:22', '2025-11-06 02:49:22'),
(58, 11, 6, 0, '2025-11-06 02:49:22', '2025-11-06 02:49:22'),
(59, 11, 5, 1, '2025-11-06 02:49:22', '2025-11-06 02:49:22'),
(60, 11, 4, 0, '2025-11-06 02:49:22', '2025-11-06 02:49:22'),
(61, 16, 1, 1, '2025-11-06 02:54:41', '2025-11-06 02:54:41'),
(62, 16, 2, 0, '2025-11-06 02:54:41', '2025-11-06 02:54:41'),
(63, 16, 3, 0, '2025-11-06 02:54:41', '2025-11-06 02:54:41'),
(64, 16, 6, 1, '2025-11-06 02:54:41', '2025-11-06 02:54:41'),
(65, 16, 5, 0, '2025-11-06 02:54:41', '2025-11-06 02:54:41'),
(66, 16, 4, 0, '2025-11-06 02:54:41', '2025-11-06 02:54:41'),
(67, 17, 1, 1, '2025-11-06 02:59:30', '2025-11-06 02:59:30'),
(68, 17, 2, 0, '2025-11-06 02:59:30', '2025-11-06 02:59:30'),
(69, 17, 3, 0, '2025-11-06 02:59:30', '2025-11-06 02:59:30'),
(70, 17, 6, 1, '2025-11-06 02:59:30', '2025-11-06 02:59:30'),
(71, 17, 5, 0, '2025-11-06 02:59:30', '2025-11-06 02:59:30'),
(72, 17, 4, 0, '2025-11-06 02:59:30', '2025-11-06 02:59:30'),
(73, 18, 1, 1, '2025-11-06 03:02:28', '2025-11-06 03:02:28'),
(74, 18, 2, 0, '2025-11-06 03:02:28', '2025-11-06 03:02:28'),
(75, 18, 3, 0, '2025-11-06 03:02:28', '2025-11-06 03:02:28'),
(76, 18, 6, 1, '2025-11-06 03:02:28', '2025-11-06 03:02:28'),
(77, 18, 5, 0, '2025-11-06 03:02:28', '2025-11-06 03:02:28'),
(78, 18, 4, 0, '2025-11-06 03:02:28', '2025-11-06 03:02:28'),
(79, 19, 1, 1, '2025-11-06 03:05:04', '2025-11-06 03:05:04'),
(80, 19, 2, 0, '2025-11-06 03:05:04', '2025-11-06 03:05:04'),
(81, 19, 3, 0, '2025-11-06 03:05:04', '2025-11-06 03:05:04'),
(82, 19, 6, 1, '2025-11-06 03:05:04', '2025-11-06 03:05:04'),
(83, 19, 5, 0, '2025-11-06 03:05:04', '2025-11-06 03:05:04'),
(84, 19, 4, 0, '2025-11-06 03:05:04', '2025-11-06 03:05:04'),
(85, 20, 1, 1, '2025-11-06 03:07:13', '2025-11-06 03:07:13'),
(86, 20, 2, 0, '2025-11-06 03:07:13', '2025-11-06 03:07:13'),
(87, 20, 3, 0, '2025-11-06 03:07:13', '2025-11-06 03:07:13'),
(88, 20, 6, 1, '2025-11-06 03:07:13', '2025-11-06 03:07:13'),
(89, 20, 5, 0, '2025-11-06 03:07:13', '2025-11-06 03:07:13'),
(90, 20, 4, 0, '2025-11-06 03:07:13', '2025-11-06 03:07:13'),
(91, 21, 1, 1, '2025-11-06 03:09:07', '2025-11-06 03:09:07'),
(92, 21, 2, 0, '2025-11-06 03:09:07', '2025-11-06 03:09:07'),
(93, 21, 3, 0, '2025-11-06 03:09:07', '2025-11-06 03:09:07'),
(94, 21, 6, 1, '2025-11-06 03:09:07', '2025-11-06 03:09:07'),
(95, 21, 5, 0, '2025-11-06 03:09:07', '2025-11-06 03:09:07'),
(96, 21, 4, 0, '2025-11-06 03:09:07', '2025-11-06 03:09:07'),
(97, 22, 1, 1, '2025-11-06 03:11:47', '2025-11-06 03:11:47'),
(98, 22, 2, 0, '2025-11-06 03:11:47', '2025-11-06 03:11:47'),
(99, 22, 3, 0, '2025-11-06 03:11:47', '2025-11-06 03:11:47'),
(100, 22, 6, 1, '2025-11-06 03:11:47', '2025-11-06 03:11:47'),
(101, 22, 5, 0, '2025-11-06 03:11:47', '2025-11-06 03:11:47'),
(102, 22, 4, 0, '2025-11-06 03:11:47', '2025-11-06 03:11:47'),
(103, 23, 1, 1, '2025-11-08 01:51:16', '2025-11-08 01:51:16'),
(104, 23, 2, 0, '2025-11-08 01:51:16', '2025-11-08 01:51:16'),
(105, 23, 3, 0, '2025-11-08 01:51:16', '2025-11-08 01:51:16'),
(106, 23, 6, 0, '2025-11-08 01:51:16', '2025-11-08 01:51:16'),
(107, 23, 5, 1, '2025-11-08 01:51:16', '2025-11-08 01:51:16'),
(108, 23, 4, 0, '2025-11-08 01:51:16', '2025-11-08 01:51:16'),
(109, 24, 1, 1, '2025-11-08 01:55:47', '2025-11-08 01:55:47'),
(110, 24, 2, 0, '2025-11-08 01:55:47', '2025-11-08 01:55:47'),
(111, 24, 3, 0, '2025-11-08 01:55:47', '2025-11-08 01:55:47'),
(112, 24, 6, 1, '2025-11-08 01:55:47', '2025-11-08 01:55:47'),
(113, 24, 5, 0, '2025-11-08 01:55:47', '2025-11-08 01:55:47'),
(114, 24, 4, 0, '2025-11-08 01:55:47', '2025-11-08 01:55:47'),
(115, 25, 1, 0, '2025-11-08 01:58:01', '2025-11-08 01:58:01'),
(116, 25, 2, 0, '2025-11-08 01:58:01', '2025-11-08 01:58:01'),
(117, 25, 3, 1, '2025-11-08 01:58:01', '2025-11-08 01:58:01'),
(118, 25, 6, 1, '2025-11-08 01:58:01', '2025-11-08 01:58:01'),
(119, 25, 5, 0, '2025-11-08 01:58:01', '2025-11-08 01:58:01'),
(120, 25, 4, 0, '2025-11-08 01:58:01', '2025-11-08 01:58:01'),
(121, 26, 1, 1, '2025-11-08 02:59:06', '2025-11-08 02:59:06'),
(122, 26, 2, 0, '2025-11-08 02:59:06', '2025-11-08 02:59:06'),
(123, 26, 3, 0, '2025-11-08 02:59:06', '2025-11-08 02:59:06'),
(124, 26, 6, 0, '2025-11-08 02:59:06', '2025-11-08 02:59:06'),
(125, 26, 5, 1, '2025-11-08 02:59:06', '2025-11-08 02:59:06'),
(126, 26, 4, 0, '2025-11-08 02:59:06', '2025-11-08 02:59:06'),
(127, 27, 1, 1, '2025-11-08 03:04:49', '2025-11-08 03:04:49'),
(128, 27, 2, 0, '2025-11-08 03:04:49', '2025-11-08 03:04:49'),
(129, 27, 3, 0, '2025-11-08 03:04:49', '2025-11-08 03:04:49'),
(130, 27, 6, 1, '2025-11-08 03:04:49', '2025-11-08 03:04:49'),
(131, 27, 5, 0, '2025-11-08 03:04:49', '2025-11-08 03:04:49'),
(132, 27, 4, 0, '2025-11-08 03:04:49', '2025-11-08 03:04:49'),
(133, 28, 1, 1, '2025-11-09 09:38:20', '2025-11-09 09:38:20'),
(134, 28, 2, 0, '2025-11-09 09:38:20', '2025-11-09 09:38:20'),
(135, 28, 3, 0, '2025-11-09 09:38:20', '2025-11-09 09:38:20'),
(136, 28, 6, 1, '2025-11-09 09:38:20', '2025-11-09 09:38:20'),
(137, 28, 5, 0, '2025-11-09 09:38:20', '2025-11-09 09:38:20'),
(138, 28, 4, 0, '2025-11-09 09:38:20', '2025-11-09 09:38:20'),
(139, 29, 1, 1, '2025-11-09 09:40:30', '2025-11-09 09:40:30'),
(140, 29, 2, 0, '2025-11-09 09:40:30', '2025-11-09 09:40:30'),
(141, 29, 3, 0, '2025-11-09 09:40:30', '2025-11-09 09:40:30'),
(142, 29, 6, 1, '2025-11-09 09:40:30', '2025-11-09 09:40:30'),
(143, 29, 5, 0, '2025-11-09 09:40:30', '2025-11-09 09:40:30'),
(144, 29, 4, 0, '2025-11-09 09:40:30', '2025-11-09 09:40:30'),
(145, 30, 1, 0, '2025-11-09 09:47:52', '2025-11-09 09:47:52'),
(146, 30, 2, 1, '2025-11-09 09:47:52', '2025-11-09 09:47:52'),
(147, 30, 3, 0, '2025-11-09 09:47:52', '2025-11-09 09:47:52'),
(148, 30, 6, 0, '2025-11-09 09:47:52', '2025-11-09 09:47:52'),
(149, 30, 5, 1, '2025-11-09 09:47:52', '2025-11-09 09:47:52'),
(150, 30, 4, 0, '2025-11-09 09:47:52', '2025-11-09 09:47:52'),
(151, 31, 1, 0, '2025-11-09 09:50:46', '2025-11-09 09:50:46'),
(152, 31, 2, 1, '2025-11-09 09:50:46', '2025-11-09 09:50:46'),
(153, 31, 3, 0, '2025-11-09 09:50:46', '2025-11-09 09:50:46'),
(154, 31, 6, 0, '2025-11-09 09:50:46', '2025-11-09 09:50:46'),
(155, 31, 5, 1, '2025-11-09 09:50:46', '2025-11-09 09:50:46'),
(156, 31, 4, 0, '2025-11-09 09:50:46', '2025-11-09 09:50:46'),
(157, 32, 1, 0, '2025-11-09 09:53:17', '2025-11-09 09:53:17'),
(158, 32, 2, 1, '2025-11-09 09:53:17', '2025-11-09 09:53:17'),
(159, 32, 3, 0, '2025-11-09 09:53:17', '2025-11-09 09:53:17'),
(160, 32, 6, 0, '2025-11-09 09:53:17', '2025-11-09 09:53:17'),
(161, 32, 5, 0, '2025-11-09 09:53:17', '2025-11-09 09:53:17'),
(162, 32, 4, 1, '2025-11-09 09:53:17', '2025-11-09 09:53:17'),
(163, 33, 1, 0, '2025-11-09 09:55:57', '2025-11-09 09:55:57'),
(164, 33, 2, 1, '2025-11-09 09:55:57', '2025-11-09 09:55:57'),
(165, 33, 3, 0, '2025-11-09 09:55:57', '2025-11-09 09:55:57'),
(166, 33, 6, 0, '2025-11-09 09:55:57', '2025-11-09 09:55:57'),
(167, 33, 5, 1, '2025-11-09 09:55:57', '2025-11-09 09:55:57'),
(168, 33, 4, 0, '2025-11-09 09:55:57', '2025-11-09 09:55:57'),
(169, 34, 1, 0, '2025-11-09 09:58:52', '2025-11-09 09:58:52'),
(170, 34, 2, 1, '2025-11-09 09:58:52', '2025-11-09 09:58:52'),
(171, 34, 3, 0, '2025-11-09 09:58:52', '2025-11-09 09:58:52'),
(172, 34, 6, 0, '2025-11-09 09:58:52', '2025-11-09 09:58:52'),
(173, 34, 5, 1, '2025-11-09 09:58:52', '2025-11-09 09:58:52'),
(174, 34, 4, 0, '2025-11-09 09:58:52', '2025-11-09 09:58:52'),
(175, 35, 1, 0, '2025-11-09 10:01:47', '2025-11-09 10:01:47'),
(176, 35, 2, 1, '2025-11-09 10:01:47', '2025-11-09 10:01:47'),
(177, 35, 3, 0, '2025-11-09 10:01:47', '2025-11-09 10:01:47'),
(178, 35, 6, 0, '2025-11-09 10:01:47', '2025-11-09 10:01:47'),
(179, 35, 5, 1, '2025-11-09 10:01:47', '2025-11-09 10:01:47'),
(180, 35, 4, 0, '2025-11-09 10:01:47', '2025-11-09 10:01:47'),
(181, 36, 1, 0, '2025-11-09 10:04:44', '2025-11-09 10:04:44'),
(182, 36, 2, 1, '2025-11-09 10:04:44', '2025-11-09 10:04:44'),
(183, 36, 3, 0, '2025-11-09 10:04:44', '2025-11-09 10:04:44'),
(184, 36, 6, 0, '2025-11-09 10:04:44', '2025-11-09 10:04:44'),
(185, 36, 5, 1, '2025-11-09 10:04:44', '2025-11-09 10:04:44'),
(186, 36, 4, 0, '2025-11-09 10:04:44', '2025-11-09 10:04:44'),
(187, 37, 1, 0, '2025-11-09 10:06:59', '2025-11-09 10:06:59'),
(188, 37, 2, 1, '2025-11-09 10:06:59', '2025-11-09 10:06:59'),
(189, 37, 3, 0, '2025-11-09 10:06:59', '2025-11-09 10:06:59'),
(190, 37, 6, 0, '2025-11-09 10:06:59', '2025-11-09 10:06:59'),
(191, 37, 5, 1, '2025-11-09 10:06:59', '2025-11-09 10:06:59'),
(192, 37, 4, 0, '2025-11-09 10:06:59', '2025-11-09 10:06:59'),
(193, 38, 1, 1, '2025-11-09 10:09:53', '2025-11-09 10:09:53'),
(194, 38, 2, 0, '2025-11-09 10:09:53', '2025-11-09 10:09:53'),
(195, 38, 3, 0, '2025-11-09 10:09:53', '2025-11-09 10:09:53'),
(196, 38, 6, 0, '2025-11-09 10:09:53', '2025-11-09 10:09:53'),
(197, 38, 5, 0, '2025-11-09 10:09:53', '2025-11-09 10:09:53'),
(198, 38, 4, 1, '2025-11-09 10:09:53', '2025-11-09 10:09:53'),
(199, 39, 1, 1, '2025-11-09 10:14:59', '2025-11-09 10:14:59'),
(200, 39, 2, 0, '2025-11-09 10:14:59', '2025-11-09 10:14:59'),
(201, 39, 3, 0, '2025-11-09 10:14:59', '2025-11-09 10:14:59'),
(202, 39, 6, 1, '2025-11-09 10:14:59', '2025-11-09 10:14:59'),
(203, 39, 5, 0, '2025-11-09 10:14:59', '2025-11-09 10:14:59'),
(204, 39, 4, 0, '2025-11-09 10:14:59', '2025-11-09 10:14:59'),
(205, 40, 1, 1, '2025-11-09 10:17:01', '2025-11-09 10:17:01'),
(206, 40, 2, 0, '2025-11-09 10:17:01', '2025-11-09 10:17:01'),
(207, 40, 3, 0, '2025-11-09 10:17:01', '2025-11-09 10:17:01'),
(208, 40, 6, 0, '2025-11-09 10:17:01', '2025-11-09 10:17:01'),
(209, 40, 5, 0, '2025-11-09 10:17:01', '2025-11-09 10:17:01'),
(210, 40, 4, 1, '2025-11-09 10:17:01', '2025-11-09 10:17:01'),
(211, 41, 1, 1, '2025-11-09 10:19:58', '2025-11-09 10:19:58'),
(212, 41, 2, 0, '2025-11-09 10:19:58', '2025-11-09 10:19:58'),
(213, 41, 3, 0, '2025-11-09 10:19:58', '2025-11-09 10:19:58'),
(214, 41, 6, 1, '2025-11-09 10:19:58', '2025-11-09 10:19:58'),
(215, 41, 5, 0, '2025-11-09 10:19:58', '2025-11-09 10:19:58'),
(216, 41, 4, 0, '2025-11-09 10:19:58', '2025-11-09 10:19:58'),
(217, 42, 1, 1, '2025-11-09 10:23:01', '2025-11-09 10:23:01'),
(218, 42, 2, 0, '2025-11-09 10:23:01', '2025-11-09 10:23:01'),
(219, 42, 3, 0, '2025-11-09 10:23:01', '2025-11-09 10:23:01'),
(220, 42, 6, 1, '2025-11-09 10:23:01', '2025-11-09 10:23:01'),
(221, 42, 5, 0, '2025-11-09 10:23:01', '2025-11-09 10:23:01'),
(222, 42, 4, 0, '2025-11-09 10:23:01', '2025-11-09 10:23:01'),
(223, 43, 1, 1, '2025-11-09 10:26:39', '2025-11-09 10:26:39'),
(224, 43, 2, 0, '2025-11-09 10:26:39', '2025-11-09 10:26:39'),
(225, 43, 3, 0, '2025-11-09 10:26:39', '2025-11-09 10:26:39'),
(226, 43, 6, 1, '2025-11-09 10:26:39', '2025-11-09 10:26:39'),
(227, 43, 5, 0, '2025-11-09 10:26:39', '2025-11-09 10:26:39'),
(228, 43, 4, 0, '2025-11-09 10:26:39', '2025-11-09 10:26:39'),
(229, 44, 1, 0, '2025-11-09 10:29:51', '2025-11-09 10:29:51'),
(230, 44, 2, 0, '2025-11-09 10:29:51', '2025-11-09 10:29:51'),
(231, 44, 3, 1, '2025-11-09 10:29:51', '2025-11-09 10:29:51'),
(232, 44, 6, 1, '2025-11-09 10:29:51', '2025-11-09 10:29:51'),
(233, 44, 5, 0, '2025-11-09 10:29:51', '2025-11-09 10:29:51'),
(234, 44, 4, 0, '2025-11-09 10:29:51', '2025-11-09 10:29:51'),
(235, 45, 1, 1, '2025-11-09 10:33:11', '2025-11-09 10:33:11'),
(236, 45, 2, 0, '2025-11-09 10:33:11', '2025-11-09 10:33:11'),
(237, 45, 3, 0, '2025-11-09 10:33:11', '2025-11-09 10:33:11'),
(238, 45, 6, 0, '2025-11-09 10:33:11', '2025-11-09 10:33:11'),
(239, 45, 5, 1, '2025-11-09 10:33:11', '2025-11-09 10:33:11'),
(240, 45, 4, 0, '2025-11-09 10:33:11', '2025-11-09 10:33:11'),
(241, 46, 1, 1, '2025-11-09 10:34:45', '2025-11-09 10:34:45'),
(242, 46, 2, 0, '2025-11-09 10:34:45', '2025-11-09 10:34:45'),
(243, 46, 3, 0, '2025-11-09 10:34:45', '2025-11-09 10:34:45'),
(244, 46, 6, 1, '2025-11-09 10:34:45', '2025-11-09 10:34:45'),
(245, 46, 5, 0, '2025-11-09 10:34:45', '2025-11-09 10:34:45'),
(246, 46, 4, 0, '2025-11-09 10:34:45', '2025-11-09 10:34:45'),
(247, 47, 1, 0, '2025-11-09 10:37:00', '2025-11-09 10:37:00'),
(248, 47, 2, 0, '2025-11-09 10:37:00', '2025-11-09 10:37:00'),
(249, 47, 3, 1, '2025-11-09 10:37:00', '2025-11-09 10:37:00'),
(250, 47, 6, 1, '2025-11-09 10:37:00', '2025-11-09 10:37:00'),
(251, 47, 5, 0, '2025-11-09 10:37:00', '2025-11-09 10:37:00'),
(252, 47, 4, 0, '2025-11-09 10:37:00', '2025-11-09 10:37:00'),
(253, 48, 1, 0, '2025-11-09 10:39:28', '2025-11-09 10:39:28'),
(254, 48, 2, 1, '2025-11-09 10:39:28', '2025-11-09 10:39:28'),
(255, 48, 3, 0, '2025-11-09 10:39:28', '2025-11-09 10:39:28'),
(256, 48, 6, 0, '2025-11-09 10:39:28', '2025-11-09 10:39:28'),
(257, 48, 5, 1, '2025-11-09 10:39:28', '2025-11-09 10:39:28'),
(258, 48, 4, 0, '2025-11-09 10:39:28', '2025-11-09 10:39:28'),
(259, 49, 1, 1, '2025-11-09 10:42:28', '2025-11-09 10:42:28'),
(260, 49, 2, 0, '2025-11-09 10:42:28', '2025-11-09 10:42:28'),
(261, 49, 3, 0, '2025-11-09 10:42:28', '2025-11-09 10:42:28'),
(262, 49, 6, 1, '2025-11-09 10:42:28', '2025-11-09 10:42:28'),
(263, 49, 5, 0, '2025-11-09 10:42:28', '2025-11-09 10:42:28'),
(264, 49, 4, 0, '2025-11-09 10:42:28', '2025-11-09 10:42:28'),
(265, 50, 1, 1, '2025-11-09 10:47:36', '2025-11-09 10:47:36'),
(266, 50, 2, 0, '2025-11-09 10:47:36', '2025-11-09 10:47:36'),
(267, 50, 3, 0, '2025-11-09 10:47:36', '2025-11-09 10:47:36'),
(268, 50, 6, 1, '2025-11-09 10:47:36', '2025-11-09 10:47:36'),
(269, 50, 5, 0, '2025-11-09 10:47:36', '2025-11-09 10:47:36'),
(270, 50, 4, 0, '2025-11-09 10:47:36', '2025-11-09 10:47:36'),
(271, 51, 1, 0, '2025-11-09 10:51:02', '2025-11-09 10:51:02'),
(272, 51, 2, 0, '2025-11-09 10:51:02', '2025-11-09 10:51:02'),
(273, 51, 3, 1, '2025-11-09 10:51:02', '2025-11-09 10:51:02'),
(274, 51, 6, 1, '2025-11-09 10:51:02', '2025-11-09 10:51:02'),
(275, 51, 5, 0, '2025-11-09 10:51:02', '2025-11-09 10:51:02'),
(276, 51, 4, 0, '2025-11-09 10:51:02', '2025-11-09 10:51:02'),
(277, 52, 1, 0, '2025-11-09 10:53:27', '2025-11-09 10:53:27'),
(278, 52, 2, 1, '2025-11-09 10:53:27', '2025-11-09 10:53:27'),
(279, 52, 3, 0, '2025-11-09 10:53:27', '2025-11-09 10:53:27'),
(280, 52, 6, 0, '2025-11-09 10:53:27', '2025-11-09 10:53:27'),
(281, 52, 5, 0, '2025-11-09 10:53:27', '2025-11-09 10:53:27'),
(282, 52, 4, 1, '2025-11-09 10:53:27', '2025-11-09 10:53:27'),
(283, 53, 1, 1, '2025-11-09 10:57:07', '2025-11-09 10:57:07'),
(284, 53, 2, 0, '2025-11-09 10:57:07', '2025-11-09 10:57:07'),
(285, 53, 3, 0, '2025-11-09 10:57:07', '2025-11-09 10:57:07'),
(286, 53, 6, 1, '2025-11-09 10:57:07', '2025-11-09 10:57:07'),
(287, 53, 5, 0, '2025-11-09 10:57:07', '2025-11-09 10:57:07'),
(288, 53, 4, 0, '2025-11-09 10:57:07', '2025-11-09 10:57:07'),
(289, 54, 1, 1, '2025-11-09 11:00:02', '2025-11-09 11:00:02'),
(290, 54, 2, 0, '2025-11-09 11:00:02', '2025-11-09 11:00:02'),
(291, 54, 3, 0, '2025-11-09 11:00:02', '2025-11-09 11:00:02'),
(292, 54, 6, 0, '2025-11-09 11:00:02', '2025-11-09 11:00:02'),
(293, 54, 5, 1, '2025-11-09 11:00:02', '2025-11-09 11:00:02'),
(294, 54, 4, 0, '2025-11-09 11:00:02', '2025-11-09 11:00:02'),
(295, 55, 1, 1, '2025-11-09 11:04:33', '2025-11-09 11:04:33'),
(296, 55, 2, 0, '2025-11-09 11:04:33', '2025-11-09 11:04:33'),
(297, 55, 3, 0, '2025-11-09 11:04:33', '2025-11-09 11:04:33'),
(298, 55, 6, 1, '2025-11-09 11:04:33', '2025-11-09 11:04:33'),
(299, 55, 5, 0, '2025-11-09 11:04:33', '2025-11-09 11:04:33'),
(300, 55, 4, 0, '2025-11-09 11:04:33', '2025-11-09 11:04:33'),
(301, 56, 1, 0, '2025-11-09 11:08:05', '2025-11-09 11:08:05'),
(302, 56, 2, 1, '2025-11-09 11:08:05', '2025-11-09 11:08:05'),
(303, 56, 3, 0, '2025-11-09 11:08:05', '2025-11-09 11:08:05'),
(304, 56, 6, 0, '2025-11-09 11:08:05', '2025-11-09 11:08:05'),
(305, 56, 5, 1, '2025-11-09 11:08:05', '2025-11-09 11:08:05'),
(306, 56, 4, 0, '2025-11-09 11:08:05', '2025-11-09 11:08:05'),
(307, 57, 1, 1, '2025-11-09 11:10:07', '2025-11-09 11:10:07'),
(308, 57, 2, 0, '2025-11-09 11:10:07', '2025-11-09 11:10:07'),
(309, 57, 3, 0, '2025-11-09 11:10:07', '2025-11-09 11:10:07'),
(310, 57, 6, 1, '2025-11-09 11:10:07', '2025-11-09 11:10:07'),
(311, 57, 5, 0, '2025-11-09 11:10:07', '2025-11-09 11:10:07'),
(312, 57, 4, 0, '2025-11-09 11:10:07', '2025-11-09 11:10:07'),
(313, 58, 1, 1, '2025-11-09 11:11:41', '2025-11-09 11:11:41'),
(314, 58, 2, 0, '2025-11-09 11:11:41', '2025-11-09 11:11:41'),
(315, 58, 3, 0, '2025-11-09 11:11:41', '2025-11-09 11:11:41'),
(316, 58, 6, 1, '2025-11-09 11:11:41', '2025-11-09 11:11:41'),
(317, 58, 5, 0, '2025-11-09 11:11:41', '2025-11-09 11:11:41'),
(318, 58, 4, 0, '2025-11-09 11:11:41', '2025-11-09 11:11:41'),
(319, 59, 1, 0, '2025-11-09 11:15:04', '2025-11-09 11:15:04'),
(320, 59, 2, 1, '2025-11-09 11:15:04', '2025-11-09 11:15:04'),
(321, 59, 3, 0, '2025-11-09 11:15:04', '2025-11-09 11:15:04'),
(322, 59, 6, 0, '2025-11-09 11:15:04', '2025-11-09 11:15:04'),
(323, 59, 5, 1, '2025-11-09 11:15:04', '2025-11-09 11:15:04'),
(324, 59, 4, 0, '2025-11-09 11:15:04', '2025-11-09 11:15:04'),
(325, 60, 1, 1, '2025-11-09 11:17:41', '2025-11-09 11:17:41'),
(326, 60, 2, 0, '2025-11-09 11:17:41', '2025-11-09 11:17:41'),
(327, 60, 3, 0, '2025-11-09 11:17:41', '2025-11-09 11:17:41'),
(328, 60, 6, 0, '2025-11-09 11:17:41', '2025-11-09 11:17:41'),
(329, 60, 5, 1, '2025-11-09 11:17:41', '2025-11-09 11:17:41'),
(330, 60, 4, 0, '2025-11-09 11:17:41', '2025-11-09 11:17:41'),
(331, 61, 1, 0, '2025-11-09 11:20:20', '2025-11-09 11:20:20'),
(332, 61, 2, 1, '2025-11-09 11:20:20', '2025-11-09 11:20:20'),
(333, 61, 3, 0, '2025-11-09 11:20:20', '2025-11-09 11:20:20'),
(334, 61, 6, 0, '2025-11-09 11:20:20', '2025-11-09 11:20:20'),
(335, 61, 5, 1, '2025-11-09 11:20:20', '2025-11-09 11:20:20'),
(336, 61, 4, 0, '2025-11-09 11:20:20', '2025-11-09 11:20:20'),
(337, 62, 1, 0, '2025-11-09 11:22:12', '2025-11-09 11:22:12'),
(338, 62, 2, 0, '2025-11-09 11:22:12', '2025-11-09 11:22:12'),
(339, 62, 3, 1, '2025-11-09 11:22:12', '2025-11-09 11:22:12'),
(340, 62, 6, 1, '2025-11-09 11:22:12', '2025-11-09 11:22:12'),
(341, 62, 5, 0, '2025-11-09 11:22:12', '2025-11-09 11:22:12'),
(342, 62, 4, 0, '2025-11-09 11:22:12', '2025-11-09 11:22:12');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `role`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin User', 'admin@gmail.com', '2025-10-16 00:42:09', '$2y$12$Z2sNsDZLwcu8WIMKtXvMmOZINH8zWCev17bRkDdeSJRBQBeCk9.Dq', 'admin', 'GxPCCAR4SafA2aKBbC3fECVb7tpv75yItWYlQd69EvQERPiRWx5fxA7Gb4e0', '2025-10-16 00:42:09', '2025-10-16 00:42:09'),
(6, 'firman', 'firman@gmail.com', NULL, '$2y$12$8NvOQaTK0yKxok8.tVw/wO8gldTF5Ukje2b4ZNlwfDdrDahN/76/q', 'user', NULL, '2025-11-03 22:22:46', '2025-11-03 22:22:46');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indeks untuk tabel `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `fasilitas`
--
ALTER TABLE `fasilitas`
  ADD PRIMARY KEY (`id_fasilitas`),
  ADD UNIQUE KEY `fasilitas_nama_fasilitas_unique` (`nama_fasilitas`);

--
-- Indeks untuk tabel `idf`
--
ALTER TABLE `idf`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idf_kategori_id_foreign` (`kategori_id`),
  ADD KEY `idf_fasilitas_id_foreign` (`fasilitas_id`);

--
-- Indeks untuk tabel `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indeks untuk tabel `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `kategoris`
--
ALTER TABLE `kategoris`
  ADD PRIMARY KEY (`id_kategori`),
  ADD UNIQUE KEY `kategoris_nama_kategori_unique` (`nama_kategori`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indeks untuk tabel `penginapans`
--
ALTER TABLE `penginapans`
  ADD PRIMARY KEY (`id_penginapan`),
  ADD KEY `penginapans_id_kategori_foreign` (`id_kategori`);

--
-- Indeks untuk tabel `penginapan_fasilitas`
--
ALTER TABLE `penginapan_fasilitas`
  ADD PRIMARY KEY (`id_penginapan`,`id_fasilitas`),
  ADD KEY `penginapan_fasilitas_id_fasilitas_foreign` (`id_fasilitas`);

--
-- Indeks untuk tabel `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indeks untuk tabel `tf`
--
ALTER TABLE `tf`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tf_penginapan_id_foreign` (`penginapan_id`);

--
-- Indeks untuk tabel `tf_fasilitas`
--
ALTER TABLE `tf_fasilitas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tf_fasilitas_tf_id_foreign` (`tf_id`),
  ADD KEY `tf_fasilitas_fasilitas_id_foreign` (`fasilitas_id`);

--
-- Indeks untuk tabel `tf_idf`
--
ALTER TABLE `tf_idf`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tf_idf_penginapan_id_foreign` (`penginapan_id`),
  ADD KEY `tf_idf_tf_id_foreign` (`tf_id`);

--
-- Indeks untuk tabel `tf_idf_fasilitas`
--
ALTER TABLE `tf_idf_fasilitas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tf_idf_fasilitas_tf_idf_id_foreign` (`tf_idf_id`),
  ADD KEY `tf_idf_fasilitas_fasilitas_id_foreign` (`fasilitas_id`);

--
-- Indeks untuk tabel `tf_idf_kategori`
--
ALTER TABLE `tf_idf_kategori`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tf_idf_kategori_tf_idf_id_foreign` (`tf_idf_id`),
  ADD KEY `tf_idf_kategori_kategori_id_foreign` (`kategori_id`);

--
-- Indeks untuk tabel `tf_kategori`
--
ALTER TABLE `tf_kategori`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tf_kategori_tf_id_foreign` (`tf_id`),
  ADD KEY `tf_kategori_kategori_id_foreign` (`kategori_id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `fasilitas`
--
ALTER TABLE `fasilitas`
  MODIFY `id_fasilitas` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `idf`
--
ALTER TABLE `idf`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `kategoris`
--
ALTER TABLE `kategoris`
  MODIFY `id_kategori` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `penginapans`
--
ALTER TABLE `penginapans`
  MODIFY `id_penginapan` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=171;

--
-- AUTO_INCREMENT untuk tabel `tf`
--
ALTER TABLE `tf`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT untuk tabel `tf_fasilitas`
--
ALTER TABLE `tf_fasilitas`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=514;

--
-- AUTO_INCREMENT untuk tabel `tf_idf`
--
ALTER TABLE `tf_idf`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT untuk tabel `tf_idf_fasilitas`
--
ALTER TABLE `tf_idf_fasilitas`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=613;

--
-- AUTO_INCREMENT untuk tabel `tf_idf_kategori`
--
ALTER TABLE `tf_idf_kategori`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=409;

--
-- AUTO_INCREMENT untuk tabel `tf_kategori`
--
ALTER TABLE `tf_kategori`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=343;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `idf`
--
ALTER TABLE `idf`
  ADD CONSTRAINT `idf_fasilitas_id_foreign` FOREIGN KEY (`fasilitas_id`) REFERENCES `fasilitas` (`id_fasilitas`) ON DELETE SET NULL,
  ADD CONSTRAINT `idf_kategori_id_foreign` FOREIGN KEY (`kategori_id`) REFERENCES `kategoris` (`id_kategori`) ON DELETE SET NULL;

--
-- Ketidakleluasaan untuk tabel `penginapans`
--
ALTER TABLE `penginapans`
  ADD CONSTRAINT `penginapans_id_kategori_foreign` FOREIGN KEY (`id_kategori`) REFERENCES `kategoris` (`id_kategori`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `penginapan_fasilitas`
--
ALTER TABLE `penginapan_fasilitas`
  ADD CONSTRAINT `penginapan_fasilitas_id_fasilitas_foreign` FOREIGN KEY (`id_fasilitas`) REFERENCES `fasilitas` (`id_fasilitas`) ON DELETE CASCADE,
  ADD CONSTRAINT `penginapan_fasilitas_id_penginapan_foreign` FOREIGN KEY (`id_penginapan`) REFERENCES `penginapans` (`id_penginapan`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tf`
--
ALTER TABLE `tf`
  ADD CONSTRAINT `tf_penginapan_id_foreign` FOREIGN KEY (`penginapan_id`) REFERENCES `penginapans` (`id_penginapan`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tf_fasilitas`
--
ALTER TABLE `tf_fasilitas`
  ADD CONSTRAINT `tf_fasilitas_fasilitas_id_foreign` FOREIGN KEY (`fasilitas_id`) REFERENCES `fasilitas` (`id_fasilitas`) ON DELETE CASCADE,
  ADD CONSTRAINT `tf_fasilitas_tf_id_foreign` FOREIGN KEY (`tf_id`) REFERENCES `tf` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tf_idf`
--
ALTER TABLE `tf_idf`
  ADD CONSTRAINT `tf_idf_penginapan_id_foreign` FOREIGN KEY (`penginapan_id`) REFERENCES `penginapans` (`id_penginapan`) ON DELETE CASCADE,
  ADD CONSTRAINT `tf_idf_tf_id_foreign` FOREIGN KEY (`tf_id`) REFERENCES `tf` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tf_idf_fasilitas`
--
ALTER TABLE `tf_idf_fasilitas`
  ADD CONSTRAINT `tf_idf_fasilitas_fasilitas_id_foreign` FOREIGN KEY (`fasilitas_id`) REFERENCES `fasilitas` (`id_fasilitas`) ON DELETE CASCADE,
  ADD CONSTRAINT `tf_idf_fasilitas_tf_idf_id_foreign` FOREIGN KEY (`tf_idf_id`) REFERENCES `tf_idf` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tf_idf_kategori`
--
ALTER TABLE `tf_idf_kategori`
  ADD CONSTRAINT `tf_idf_kategori_kategori_id_foreign` FOREIGN KEY (`kategori_id`) REFERENCES `kategoris` (`id_kategori`) ON DELETE CASCADE,
  ADD CONSTRAINT `tf_idf_kategori_tf_idf_id_foreign` FOREIGN KEY (`tf_idf_id`) REFERENCES `tf_idf` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tf_kategori`
--
ALTER TABLE `tf_kategori`
  ADD CONSTRAINT `tf_kategori_kategori_id_foreign` FOREIGN KEY (`kategori_id`) REFERENCES `kategoris` (`id_kategori`) ON DELETE CASCADE,
  ADD CONSTRAINT `tf_kategori_tf_id_foreign` FOREIGN KEY (`tf_id`) REFERENCES `tf` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
