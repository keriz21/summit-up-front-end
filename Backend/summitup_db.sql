-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 18 Jul 2024 pada 15.17
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `summitup_db`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `banners`
--

CREATE TABLE `banners` (
  `id` int(11) NOT NULL,
  `image_name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `banners`
--

INSERT INTO `banners` (`id`, `image_name`, `created_at`, `updated_at`) VALUES
(1, 'https://picsum.photos/2000', '2024-06-15 05:47:15', '2024-06-15 05:47:15'),
(2, 'https://picsum.photos/2001', '2024-06-15 05:47:15', '2024-06-15 05:47:15'),
(3, 'https://picsum.photos/2002', '2024-06-15 05:47:15', '2024-06-15 05:47:15');

-- --------------------------------------------------------

--
-- Struktur dari tabel `bookings`
--

CREATE TABLE `bookings` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `trip_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `expired_at` timestamp NULL DEFAULT NULL,
  `booking_status` enum('pending','confirmed','cancelled') DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `bookings`
--

INSERT INTO `bookings` (`id`, `user_id`, `trip_id`, `created_at`, `expired_at`, `booking_status`) VALUES
(16, 27, 1, '2024-07-12 08:06:08', '2024-07-12 09:06:04', 'pending'),
(17, 27, 1, '2024-07-12 08:07:11', '2024-07-12 09:07:07', 'pending'),
(18, 27, 1, '2024-07-12 08:12:46', '2024-07-12 09:12:40', 'pending'),
(19, 27, 1, '2024-07-12 08:31:02', '2024-07-12 09:30:54', 'pending'),
(20, 27, 5, '2024-07-12 08:35:00', '2024-07-12 09:34:56', 'pending'),
(21, 1, 1, '2024-07-15 06:15:53', '2024-07-15 07:15:51', 'pending'),
(22, 1, 5, '2024-07-15 06:27:39', '2024-07-15 07:27:38', 'pending'),
(23, 1, 5, '2024-07-15 06:32:21', '2024-07-15 07:32:20', 'pending'),
(24, 1, 1, '2024-07-15 06:37:37', '2024-07-15 07:37:36', 'pending'),
(25, 1, 5, '2024-07-15 06:55:16', '2024-07-15 07:55:15', 'pending'),
(26, 1, 5, '2024-07-15 07:02:47', '2024-07-15 08:02:45', 'pending'),
(27, 1, 6, '2024-07-15 07:09:19', '2024-07-15 08:09:18', 'pending'),
(28, 1, 5, '2024-07-15 07:09:44', '2024-07-15 08:09:43', 'pending'),
(29, 1, 5, '2024-07-15 07:19:02', '2024-07-15 08:19:01', 'pending'),
(30, 1, 1, '2024-07-15 07:21:44', '2024-07-15 08:21:43', 'pending'),
(31, 1, 1, '2024-07-15 07:27:37', '2024-07-15 08:27:35', 'pending'),
(32, 1, 1, '2024-07-15 07:28:47', '2024-07-15 08:28:45', 'pending'),
(33, 1, 1, '2024-07-15 07:35:14', '2024-07-15 08:35:13', 'pending'),
(34, 1, 1, '2024-07-15 07:55:30', '2024-07-15 08:55:28', 'pending'),
(35, 1, 1, '2024-07-15 07:58:51', '2024-07-15 08:58:49', 'pending'),
(36, 1, 5, '2024-07-15 08:02:13', '2024-07-15 09:02:12', 'pending');

-- --------------------------------------------------------

--
-- Struktur dari tabel `booking_transactions`
--

CREATE TABLE `booking_transactions` (
  `id` bigint(50) NOT NULL,
  `midtrans_id` varchar(256) DEFAULT NULL,
  `booking_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `payment_method` varchar(120) DEFAULT NULL,
  `transaction_status` enum('pending','completed','cancelled') DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `expired_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `booking_transactions`
--

INSERT INTO `booking_transactions` (`id`, `midtrans_id`, `booking_id`, `user_id`, `amount`, `payment_method`, `transaction_status`, `created_at`, `expired_at`) VALUES
(1720772490657, '1', 18, 27, 200000.00, 'bank_transfer', 'completed', '2024-07-12 08:21:35', NULL),
(1720773061398, 'c703a1e5-d9e6-4039-8b22-4b73f2c521ef', 19, 27, 200000.00, 'bank_transfer', 'completed', '2024-07-12 08:31:05', NULL),
(1720773299411, 'a01c60da-ce2c-4a5f-8da8-5f38e2be3246', 20, 27, 328000.00, 'bank_transfer', 'completed', '2024-07-12 08:35:08', '2024-07-13 08:35:18'),
(1721024157056, '836ccc77-bd42-42c7-85eb-08c186a00807', 21, 1, 200000.00, 'bank_transfer', 'completed', '2024-07-15 06:15:58', '2024-07-16 06:16:26'),
(1721024859884, '2ac44145-9db6-4b2f-b2da-1163c19659c9', 22, 1, 328000.00, 'bank_transfer', 'completed', '2024-07-15 06:27:41', '2024-07-16 06:27:54'),
(1721025144730, '2c68b336-0eb2-41c8-83d6-788297f299dd', 23, 1, 328000.00, 'bank_transfer', 'completed', '2024-07-15 06:32:26', '2024-07-16 06:32:35'),
(1721025459362, '9e875a44-de87-494a-ab3f-60b0b04d2388', 24, 1, 200000.00, 'bank_transfer', 'completed', '2024-07-15 06:37:40', '2024-07-16 06:37:50'),
(1721026516820, '19bab578-92b5-4d9c-a049-6e35697e703a', 25, 1, 328000.00, 'bank_transfer', 'completed', '2024-07-15 06:55:18', '2024-07-16 06:55:29'),
(1721026967579, 'abf49118-dc13-4f1c-8489-85869c6d1356', 26, 1, 328000.00, 'bank_transfer', 'completed', '2024-07-15 07:02:48', '2024-07-16 07:02:59'),
(1721027942901, '58116fcc-b273-4f99-8b32-bfcce0690dc0', 29, 1, 328000.00, 'bank_transfer', 'completed', '2024-07-15 07:19:04', '2024-07-16 07:19:15'),
(1721028104966, '8faf4e57-7453-4e15-9bfb-8462fbb0d4ed', 30, 1, 200000.00, 'bank_transfer', 'completed', '2024-07-15 07:21:46', '2024-07-16 07:21:54'),
(1721028529000, '42fa25f4-4c62-43c7-8f7f-4434b8024362', 32, 1, 200000.00, 'bank_transfer', 'completed', '2024-07-15 07:28:50', '2024-07-16 07:28:58'),
(1721028914191, '0c1d4690-32c1-4a85-be2b-72224141f08b', 33, 1, 200000.00, 'bank_transfer', 'completed', '2024-07-15 07:35:15', '2024-07-16 07:35:22'),
(1721030130414, '042769a6-011a-47ef-b053-46883f8336bb', 34, 1, 200000.00, 'bank_transfer', 'completed', '2024-07-15 07:55:31', '2024-07-16 07:55:41'),
(1721030331678, '635f5a8f-3036-4257-897c-6ac5fc6bb543', 35, 1, 200000.00, 'bank_transfer', 'completed', '2024-07-15 07:58:53', '2024-07-16 07:59:03'),
(1721030534427, 'caf50611-d7de-4ef9-917e-bf683b66fb33', 36, 1, 328000.00, 'bank_transfer', 'completed', '2024-07-15 08:02:15', '2024-07-16 08:02:22');

-- --------------------------------------------------------

--
-- Struktur dari tabel `equipment_categories`
--

CREATE TABLE `equipment_categories` (
  `id` int(11) NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `equipment_categories`
--

INSERT INTO `equipment_categories` (`id`, `category_name`, `description`) VALUES
(1, 'Alat Masak', 'Peralatan masak seperti kompor, gas, panci, dll.'),
(2, 'Tenda', 'Berbagai jenis tenda untuk camping.'),
(3, 'Pakaian', 'Pakaian khusus untuk mendaki gunung.'),
(4, 'Sepatu', 'Sepatu khusus untuk pendakian dan trekking.'),
(5, 'Alat Navigasi', 'Peralatan untuk navigasi seperti kompas dan GPS.');

-- --------------------------------------------------------

--
-- Struktur dari tabel `event_trips`
--

CREATE TABLE `event_trips` (
  `id` int(11) NOT NULL,
  `trip_name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `average_rating` float DEFAULT 0,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `mountain_id` int(11) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT 0.00,
  `image_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `event_trips`
--

INSERT INTO `event_trips` (`id`, `trip_name`, `description`, `location`, `average_rating`, `start_date`, `end_date`, `created_at`, `updated_at`, `mountain_id`, `price`, `image_url`) VALUES
(1, 'Ekspedisi Malam', 'Acara tahunan yang menyenangkan dengan berbagai aktivitas seru dan mendebarkan di gunung. Termasuk pendakian, jelajah alam, dan camping di puncak gunung dengan pemandangan yang menakjubkan.', 'Lokasi B', 1.98, '2024-06-28', '2024-07-02', '2024-06-11 04:25:32', '2024-06-11 04:37:21', 1, 579000.00, 'https://picsum.photos/300/200'),
(2, 'Jelajah Alam', 'Pendakian bersama dengan pemandu profesional, di mana peserta akan diajak untuk menikmati keindahan alam serta belajar tentang flora dan fauna setempat. Termasuk sesi fotografi di spot-spot terbaik.', 'Lokasi C', 3.93, '2024-06-21', '2024-06-28', '2024-06-11 04:25:32', '2024-06-11 04:37:21', 3, 591000.00, 'https://picsum.photos/301/200'),
(3, 'Ekspedisi Malam', 'Ekspedisi malam di pegunungan yang menawarkan pengalaman unik menjelajahi hutan dan lereng gunung di bawah sinar bulan dan bintang. Termasuk kegiatan berkemah dan cerita di sekitar api unggun.', 'Lokasi D', 1.88, '2024-06-11', '2024-06-16', '2024-06-11 04:25:32', '2024-06-11 04:37:21', 2, 564000.00, 'https://picsum.photos/302/200'),
(4, 'Pendakian Musim Semi', 'Safari seru di alam terbuka dengan rute yang telah disiapkan khusus untuk memberikan pengalaman terbaik bagi para peserta. Termasuk kegiatan observasi satwa liar dan pemandangan alam yang menakjubkan.', 'Lokasi A', 1.34, '2024-06-30', '2024-07-05', '2024-06-11 04:25:32', '2024-06-11 04:37:21', 3, 274000.00, 'https://picsum.photos/303/200'),
(5, 'Acara Komunitas', 'Camping bersama komunitas pendaki di lokasi strategis yang memberikan akses mudah ke berbagai jalur pendakian. Termasuk sesi sharing pengalaman dan tips pendakian dari para pendaki berpengalaman.', 'Lokasi D', 3.33, '2024-06-29', '2024-07-06', '2024-06-11 04:25:32', '2024-06-11 04:37:21', 5, 346000.00, 'https://picsum.photos/304/200'),
(6, 'Rally Pendaki', 'Acara komunitas pendaki yang diadakan untuk mempererat tali persaudaraan dan berbagi pengalaman. Termasuk kegiatan bakti sosial dan penanaman pohon untuk konservasi lingkungan.', 'Lokasi B', 3.6, '2024-07-09', '2024-07-15', '2024-06-11 04:25:32', '2024-06-11 04:37:21', 5, 577000.00, 'https://picsum.photos/305/200'),
(7, 'Festival Gunung', 'Rally pendaki gunung, sebuah kompetisi seru yang menguji ketahanan fisik dan mental para peserta. Termasuk tantangan navigasi dan orienteering di medan pegunungan yang menantang.', 'Lokasi E', 3.25, '2024-06-14', '2024-06-18', '2024-06-11 04:25:32', '2024-06-11 04:37:21', 1, 544000.00, 'https://picsum.photos/306/200'),
(8, 'Safari Gunung', 'Pesta alam yang meriah dengan berbagai acara hiburan, musik, dan permainan tradisional. Termasuk lomba memasak di alam terbuka dan sesi mengenal budaya lokal.', 'Lokasi B', 2.28, '2024-06-27', '2024-07-04', '2024-06-11 04:25:32', '2024-06-11 04:37:21', 5, 650000.00, 'https://picsum.photos/307/200'),
(9, 'Safari Gunung', 'Jelajah alam terbuka yang mengajak peserta untuk mengeksplorasi keindahan alam pegunungan. Termasuk kegiatan tracking dan hiking di jalur-jalur yang menantang namun aman.', 'Lokasi D', 4.99, '2024-07-04', '2024-07-10', '2024-06-11 04:25:32', '2024-06-11 04:37:21', 2, 372000.00, 'https://picsum.photos/308/200'),
(10, 'Festival Gunung', 'Event kebersamaan di alam yang mengutamakan kekompakan dan kerjasama tim. Termasuk kegiatan outbond dan team building yang dirancang khusus untuk meningkatkan sinergi dan kebersamaan.', 'Lokasi A', 4.69, '2024-06-21', '2024-06-25', '2024-06-11 04:25:32', '2024-06-11 04:37:21', 1, 565000.00, 'https://picsum.photos/309/200');

-- --------------------------------------------------------

--
-- Struktur dari tabel `event_trip_facilities`
--

CREATE TABLE `event_trip_facilities` (
  `event_trip_id` int(11) NOT NULL,
  `facility_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `facilities`
--

CREATE TABLE `facilities` (
  `id` int(11) NOT NULL,
  `facility_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `facilities`
--

INSERT INTO `facilities` (`id`, `facility_name`) VALUES
(1, '3x makan dan minum'),
(2, 'Peralatan mendaki gunung'),
(3, '1 Kamar tidur'),
(4, 'Transportasi antar dan jemput');

-- --------------------------------------------------------

--
-- Struktur dari tabel `islands`
--

CREATE TABLE `islands` (
  `id` int(11) NOT NULL,
  `island_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `islands`
--

INSERT INTO `islands` (`id`, `island_name`) VALUES
(1, 'Pulau Jawa'),
(2, 'Pulau Lombok'),
(3, 'Pulau Sumatera'),
(4, 'Pulau Bali'),
(5, 'Pulau Sumbawa'),
(6, 'Selat Sunda');

-- --------------------------------------------------------

--
-- Struktur dari tabel `items`
--

CREATE TABLE `items` (
  `id` int(11) NOT NULL,
  `itemId` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `img_name` varchar(255) DEFAULT NULL,
  `stock` int(11) NOT NULL,
  `price` float NOT NULL,
  `shop_name` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `items`
--

INSERT INTO `items` (`id`, `itemId`, `name`, `description`, `img_name`, `stock`, `price`, `shop_name`, `createdAt`, `updatedAt`) VALUES
(1, 'ith927', 'itemtestC', 'describtest', NULL, 11, 21, '', '2024-07-15 11:29:26', '2024-07-15 11:29:39');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mountains`
--

CREATE TABLE `mountains` (
  `id` int(11) NOT NULL,
  `mountain_name` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `elevation` int(11) NOT NULL,
  `island_id` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `mountains`
--

INSERT INTO `mountains` (`id`, `mountain_name`, `location`, `elevation`, `island_id`, `description`, `image_url`) VALUES
(1, 'Gunung Bromo', 'Jawa Timur, Indonesia', 2329, 1, 'Gunung Bromo, terletak di Jawa Timur, Indonesia, adalah gunung berapi aktif dan bagian dari massif Tengger. Gunung ini merupakan salah satu atraksi wisata paling dikunjungi di Indonesia, terkenal dengan pemandangan matahari terbit yang memukau dan Lautan Pasirnya.', 'https://picsum.photos/2000'),
(2, 'Gunung Rinjani', 'Lombok, Indonesia', 3726, 2, 'Gunung Rinjani, terletak di pulau Lombok, Indonesia, adalah gunung berapi tertinggi kedua di Indonesia. Gunung ini memiliki danau kawah besar yang dikenal sebagai Segara Anak, yang dikelilingi oleh mata air panas alami dan pemandangan yang indah.', 'https://picsum.photos/2000'),
(3, 'Gunung Semeru', 'Jawa Timur, Indonesia', 3676, 1, 'Gunung Semeru adalah gunung berapi tertinggi di Jawa dan salah satu gunung berapi paling aktif di Indonesia. Gunung ini dikenal dengan letusannya yang sering dan lanskap yang menakjubkan, menarik pendaki dan pencari petualangan dari seluruh dunia.', 'https://picsum.photos/2000'),
(4, 'Gunung Kerinci', 'Sumatra, Indonesia', 3805, 3, 'Gunung Kerinci, terletak di Sumatra, Indonesia, adalah gunung berapi tertinggi di Indonesia dan puncak tertinggi di pulau Sumatra. Gunung ini dikelilingi oleh hutan hujan yang rimbun dan merupakan bagian dari Taman Nasional Kerinci Seblat.', 'https://picsum.photos/2000'),
(5, 'Gunung Agung', 'Bali, Indonesia', 3142, 4, 'Gunung Agung adalah titik tertinggi di pulau Bali, Indonesia. Gunung stratovolcano ini memiliki makna spiritual yang besar bagi masyarakat Bali dan menawarkan pemandangan yang menakjubkan dari puncaknya.', 'https://picsum.photos/2000'),
(6, 'Gunung Merapi', 'Jawa Tengah, Indonesia', 2174, 1, 'Gunung Merapi adalah gunung berapi paling aktif di Indonesia, terkenal dengan erupsinya yang dahsyat dan seringkali menakjubkan para pendaki dengan pemandangan yang luar biasa dari puncaknya.', 'https://picsum.photos/2000'),
(7, 'Gunung Semeru', 'Jawa Timur, Indonesia', 2955, 1, 'Gunung Semeru, puncak tertinggi di Pulau Jawa, menawarkan pemandangan yang spektakuler, termasuk Danau Ranu Kumbolo yang mempesona dan puncak Mahameru yang legendaris.', 'https://picsum.photos/2001'),
(8, 'Gunung Kerinci', 'Sumatera Barat, Indonesia', 3786, 3, 'Gunung Kerinci adalah gunung berapi tertinggi di Indonesia dan rumah bagi berbagai spesies flora dan fauna unik, menjadikannya tujuan populer bagi para pendaki dan peneliti.', 'https://picsum.photos/2002'),
(9, 'Gunung Lawu', 'Jawa Tengah, Indonesia', 2462, 1, 'Gunung Lawu memiliki sejarah dan mitologi yang kaya, dengan banyak candi dan situs bersejarah di sekitarnya, serta pemandangan alam yang memukau.', 'https://picsum.photos/2003'),
(10, 'Gunung Agung', 'Bali, Indonesia', 1518, 4, 'Gunung Agung adalah gunung berapi suci di Bali, dihormati oleh penduduk lokal dan menarik banyak pendaki yang ingin mencapai puncaknya dan menikmati pemandangan pulau yang menakjubkan.', 'https://picsum.photos/2004'),
(11, 'Gunung Sinabung', 'Sumatera Utara, Indonesia', 3220, 3, 'Gunung Sinabung adalah salah satu gunung berapi aktif di Sumatera, dengan erupsi yang seringkali menciptakan lanskap yang dramatis dan menantang para pendaki.', 'https://picsum.photos/2005'),
(12, 'Gunung Tambora', 'Nusa Tenggara Barat, Indonesia', 1870, 5, 'Gunung Tambora terkenal dengan erupsi dahsyatnya pada tahun 1815, yang merupakan salah satu erupsi terbesar dalam sejarah, dan kini menawarkan trekking yang menantang dengan pemandangan yang luar biasa.', 'https://picsum.photos/2006'),
(13, 'Gunung Krakatau', 'Selat Sunda, Indonesia', 3060, 6, 'Gunung Krakatau terkenal dengan letusan besar pada tahun 1883 yang menciptakan tsunami dahsyat, dan saat ini masih menjadi gunung berapi aktif yang menarik banyak ilmuwan dan pendaki.', 'https://picsum.photos/2007'),
(14, 'Gunung Rinjani', 'Lombok, Indonesia', 3856, 2, 'Gunung Rinjani, terletak di Pulau Lombok, menawarkan pendakian yang menantang dengan pemandangan yang luar biasa, termasuk Danau Segara Anak dan kawah aktifnya.', 'https://picsum.photos/2008'),
(15, 'Gunung Bromo', 'Jawa Timur, Indonesia', 3054, 1, 'Gunung Bromo, bagian dari massif Tengger, terkenal dengan pemandangan matahari terbit yang memukau dan Lautan Pasirnya yang unik, menarik banyak wisatawan dan pendaki setiap tahun.', 'https://picsum.photos/2009');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mountain_favorites`
--

CREATE TABLE `mountain_favorites` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `mountain_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `mountain_favorites`
--

INSERT INTO `mountain_favorites` (`id`, `user_id`, `mountain_id`, `created_at`) VALUES
(1, 1, 1, '2024-05-28 10:44:42'),
(2, 1, 3, '2024-05-28 10:44:42'),
(3, 1, 4, '2024-05-28 10:44:42'),
(4, 2, 1, '2024-05-28 10:44:42'),
(5, 3, 2, '2024-05-28 10:44:42');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rental_equipment`
--

CREATE TABLE `rental_equipment` (
  `id` int(11) NOT NULL,
  `equipment_name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `price_per_day` decimal(10,2) NOT NULL,
  `image_url` varchar(500) DEFAULT NULL,
  `mountain_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `rental_equipment`
--

INSERT INTO `rental_equipment` (`id`, `equipment_name`, `description`, `price_per_day`, `image_url`, `mountain_id`, `category_id`) VALUES
(1, 'Kompor Portable', 'Kompor gas kecil untuk memasak di alam terbuka.', 75078.00, 'https://picsum.photos/2300', 2, 1),
(2, 'Tenda Dome', 'Tenda dome untuk 2 orang.', 49138.00, 'https://picsum.photos/2300', 5, 2),
(3, 'Jaket Gunung', 'Jaket khusus untuk menjaga kehangatan saat mendaki.', 67203.00, 'https://picsum.photos/2300', 5, 2),
(4, 'Sepatu Hiking', 'Sepatu hiking untuk melindungi kaki saat mendaki.', 52174.00, 'https://picsum.photos/2300', 3, 5),
(5, 'Kompas', 'Kompas untuk membantu navigasi.', 43196.00, 'https://picsum.photos/2300', 4, 1),
(6, 'Panci Masak', 'Panci masak untuk keperluan memasak di alam terbuka.', 45021.00, 'https://picsum.photos/2300', 2, 2),
(7, 'Sleeping Bag', 'Sleeping bag untuk kenyamanan tidur di alam terbuka.', 50900.00, 'https://picsum.photos/2300', 4, 1),
(8, 'Lampu Camping', 'Lampu camping untuk penerangan di malam hari.', 98889.00, 'https://picsum.photos/2300', 5, 2),
(9, 'GPS Tracker', 'GPS tracker untuk memantau lokasi saat mendaki.', 67242.00, 'https://picsum.photos/2300', 5, 5),
(10, 'Mata Pisau Lipat', 'Mata pisau lipat multifungsi untuk berbagai keperluan.', 25785.00, 'https://picsum.photos/2300', 3, 5),
(11, 'Tas Gunung', 'Tas gunung dengan kapasitas besar.', 83436.00, 'https://picsum.photos/2300', 1, 2),
(12, 'Sarung Tangan', 'Sarung tangan untuk melindungi tangan saat mendaki.', 25913.00, 'https://picsum.photos/2300', 2, 2),
(13, 'Topi Lapangan', 'Topi lapangan untuk melindungi kepala dari sinar matahari.', 90158.00, 'https://picsum.photos/2300', 4, 2),
(14, 'Botol Air', 'Botol air untuk menjaga hidrasi saat mendaki.', 54612.00, 'https://picsum.photos/2300', 4, 2),
(15, 'Gas Portable', 'Gas portable untuk digunakan bersama kompor portable.', 59940.00, 'https://picsum.photos/2300', 2, 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `rental_transactions`
--

CREATE TABLE `rental_transactions` (
  `id` int(11) NOT NULL,
  `rental_equipment_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `rental_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `return_date` timestamp NULL DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `transaction_status` enum('pending','completed','cancelled') DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `reviews`
--

CREATE TABLE `reviews` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `trip_id` int(11) NOT NULL,
  `rating` float DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `review_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `reviews`
--

INSERT INTO `reviews` (`id`, `user_id`, `trip_id`, `rating`, `comment`, `review_date`) VALUES
(1, 1, 1, 4, 'Pemandangan dari puncaknya sangat indah. Sangat disarankan untuk menikmati sunrise di sini.', '2024-05-28 10:31:10'),
(2, 1, 3, 5, 'Pendakian yang menantang tetapi sangat memuaskan. Pemandangan dan suasana di sekitar gunung semeru sangat luar biasa.', '2024-05-28 10:31:10'),
(3, 1, 4, 4, 'Gunung Kerinci adalah tempat yang menakjubkan untuk berpetualang. Saya sangat menikmati pendakian ke puncak.', '2024-05-28 10:31:10'),
(4, 1, 5, 3, 'Gunung Agung menawarkan pengalaman spiritual yang mendalam. Namun, jalur pendakiannya cukup sulit untuk pemula.', '2024-05-28 10:31:10'),
(5, 1, 2, 5, 'Pendakian ke Gunung Rinjani adalah pengalaman seumur hidup. Pemandangan dan keindahan alamnya sungguh luar biasa.', '2024-05-28 10:31:10'),
(6, 1, 1, 4, 'Perjalanan yang hebat! Sangat direkomendasikan.', '2024-06-15 05:52:59'),
(7, 2, 2, 5, 'Pengalaman yang luar biasa!', '2024-06-15 05:52:59'),
(8, 3, 3, 3, 'Biasa saja, tidak terlalu istimewa.', '2024-06-15 05:52:59'),
(9, 4, 4, 2, 'Tidak terlalu puas dengan perjalanan ini.', '2024-06-15 05:52:59'),
(10, 5, 5, 5, 'Perjalanan terbaik yang pernah ada!', '2024-06-15 05:52:59'),
(11, 6, 6, 4, 'Sangat menikmatinya!', '2024-06-15 05:52:59'),
(12, 1, 1, 3, 'Cukup baik, bisa lebih baik lagi.', '2024-06-15 05:52:59'),
(13, 2, 2, 2, 'Tidak sesuai harapan.', '2024-06-15 05:52:59'),
(14, 3, 3, 4, 'Cukup menyenangkan.', '2024-06-15 05:52:59'),
(15, 4, 4, 5, 'Pengalaman yang fantastis!', '2024-06-15 05:52:59'),
(16, 5, 5, 3, 'Perjalanan yang biasa saja.', '2024-06-15 05:52:59'),
(17, 6, 6, 4, 'Saya menikmati waktu saya di sana.', '2024-06-15 05:52:59'),
(18, 1, 1, 5, 'Sangat menyukainya!', '2024-06-15 05:52:59'),
(19, 2, 2, 3, 'Cukup baik.', '2024-06-15 05:52:59'),
(20, 3, 3, 2, 'Bisa lebih baik lagi.', '2024-06-15 05:52:59'),
(21, 4, 4, 4, 'Cukup bagus.', '2024-06-15 05:52:59'),
(22, 5, 5, 5, 'Perjalanan yang luar biasa!', '2024-06-15 05:52:59'),
(23, 6, 6, 3, 'Perjalanan yang lumayan.', '2024-06-15 05:52:59'),
(24, 1, 1, 2, 'Tidak terlalu bagus.', '2024-06-15 05:52:59'),
(25, 2, 2, 4, 'Pengalaman yang baik secara keseluruhan.', '2024-06-15 05:52:59'),
(26, 3, 3, 5, 'Saya sangat menyukai perjalanan ini!', '2024-06-15 05:52:59'),
(27, 4, 4, 3, 'Cukup baik.', '2024-06-15 05:52:59'),
(28, 5, 5, 2, 'Tidak terlalu menyenangkan.', '2024-06-15 05:52:59'),
(29, 6, 6, 5, 'Sangat fantastis!', '2024-06-15 05:52:59'),
(30, 1, 1, 4, 'Perjalanan yang menyenangkan.', '2024-06-15 05:52:59'),
(31, 2, 2, 5, 'Perjalanan yang sempurna!', '2024-06-15 05:52:59'),
(32, 3, 3, 3, 'Biasa saja.', '2024-06-15 05:52:59'),
(33, 4, 4, 2, 'Tidak puas.', '2024-06-15 05:52:59'),
(34, 5, 5, 4, 'Perjalanan yang cukup bagus.', '2024-06-15 05:52:59'),
(35, 6, 6, 5, 'Pengalaman terbaik yang pernah saya alami!', '2024-06-15 05:52:59'),
(36, 1, 1, 4, 'Perjalanan yang sangat menyenangkan dan memuaskan.', '2024-06-15 05:54:17'),
(37, 2, 2, 5, 'Pengalaman yang benar-benar luar biasa! Sangat direkomendasikan.', '2024-06-15 05:54:17'),
(38, 3, 3, 3, 'Perjalanan ini cukup baik, meskipun ada beberapa kekurangan.', '2024-06-15 05:54:17'),
(39, 4, 4, 2, 'Tidak sesuai dengan harapan saya.', '2024-06-15 05:54:17'),
(40, 5, 5, 5, 'Perjalanan terbaik yang pernah saya alami.', '2024-06-15 05:54:17'),
(41, 6, 6, 4, 'Saya menikmati setiap momennya.', '2024-06-15 05:54:17'),
(42, 1, 1, 3, 'Perjalanan ini cukup memuaskan, tapi bisa lebih baik lagi.', '2024-06-15 05:54:17'),
(43, 2, 2, 2, 'Kurang memuaskan, tidak sesuai ekspektasi.', '2024-06-15 05:54:17'),
(44, 3, 3, 4, 'Perjalanan yang cukup menyenangkan.', '2024-06-15 05:54:17'),
(45, 4, 4, 5, 'Pengalaman yang luar biasa, sangat memuaskan.', '2024-06-15 05:54:17'),
(46, 5, 5, 3, 'Perjalanan ini cukup biasa saja.', '2024-06-15 05:54:17'),
(47, 6, 6, 4, 'Saya sangat menikmati perjalanan ini.', '2024-06-15 05:54:17'),
(48, 1, 1, 5, 'Perjalanan yang fantastis, sangat saya sukai.', '2024-06-15 05:54:17'),
(49, 2, 2, 3, 'Perjalanan yang cukup baik, tidak ada yang istimewa.', '2024-06-15 05:54:17'),
(50, 3, 3, 2, 'Perjalanan ini kurang memuaskan.', '2024-06-15 05:54:17'),
(51, 4, 4, 4, 'Perjalanan yang cukup bagus.', '2024-06-15 05:54:17'),
(52, 5, 5, 5, 'Perjalanan yang luar biasa dan memuaskan.', '2024-06-15 05:54:17'),
(53, 6, 6, 3, 'Perjalanan ini cukup baik, meskipun ada kekurangan.', '2024-06-15 05:54:17'),
(54, 1, 1, 2, 'Saya tidak terlalu menikmati perjalanan ini.', '2024-06-15 05:54:17'),
(55, 2, 2, 4, 'Pengalaman yang baik dan memuaskan.', '2024-06-15 05:54:17'),
(56, 3, 3, 5, 'Perjalanan yang sangat menyenangkan, saya sangat menyukainya.', '2024-06-15 05:54:17'),
(57, 4, 4, 3, 'Perjalanan yang cukup baik, tidak ada yang spesial.', '2024-06-15 05:54:17'),
(58, 5, 5, 2, 'Perjalanan ini tidak memuaskan.', '2024-06-15 05:54:17'),
(59, 6, 6, 5, 'Pengalaman yang sangat fantastis, saya sangat menikmatinya.', '2024-06-15 05:54:17'),
(60, 1, 1, 4, 'Perjalanan yang menyenangkan dan memuaskan.', '2024-06-15 05:54:17'),
(61, 2, 2, 5, 'Perjalanan yang sempurna, sangat direkomendasikan.', '2024-06-15 05:54:17'),
(62, 3, 3, 3, 'Perjalanan yang biasa saja, tidak ada yang istimewa.', '2024-06-15 05:54:17'),
(63, 4, 4, 2, 'Saya tidak puas dengan perjalanan ini.', '2024-06-15 05:54:17'),
(64, 5, 5, 4, 'Perjalanan yang cukup baik dan memuaskan.', '2024-06-15 05:54:17'),
(65, 6, 6, 5, 'Perjalanan yang sangat luar biasa, saya sangat menikmatinya.', '2024-06-15 05:54:17'),
(66, 1, 1, 3, 'Perjalanan yang cukup memuaskan, bisa lebih baik lagi.', '2024-06-15 05:54:17'),
(67, 2, 2, 2, 'Perjalanan ini kurang memuaskan, tidak sesuai harapan.', '2024-06-15 05:54:17'),
(68, 3, 3, 4, 'Pengalaman yang cukup menyenangkan.', '2024-06-15 05:54:17'),
(69, 4, 4, 5, 'Perjalanan yang luar biasa dan memuaskan.', '2024-06-15 05:54:17'),
(70, 5, 5, 3, 'Perjalanan ini cukup biasa saja.', '2024-06-15 05:54:17'),
(71, 6, 6, 4, 'Saya sangat menikmati perjalanan ini.', '2024-06-15 05:54:17'),
(72, 1, 1, 5, 'Perjalanan yang fantastis, sangat saya sukai.', '2024-06-15 05:54:17'),
(73, 2, 2, 3, 'Perjalanan yang cukup baik, tidak ada yang istimewa.', '2024-06-15 05:54:17'),
(74, 3, 3, 2, 'Perjalanan ini kurang memuaskan.', '2024-06-15 05:54:17'),
(75, 1, 1, 4, 'Perjalanan yang sangat menyenangkan dan memuaskan.', '2024-06-15 05:55:17'),
(76, 2, 2, 5, 'Pengalaman yang benar-benar luar biasa! Sangat direkomendasikan.', '2024-06-15 05:55:17'),
(77, 3, 3, 3, 'Perjalanan ini cukup baik, meskipun ada beberapa kekurangan.', '2024-06-15 05:55:17'),
(78, 4, 4, 2, 'Tidak sesuai dengan harapan saya.', '2024-06-15 05:55:17'),
(79, 5, 5, 5, 'Perjalanan terbaik yang pernah saya alami.', '2024-06-15 05:55:17'),
(80, 6, 6, 4, 'Saya menikmati setiap momennya.', '2024-06-15 05:55:17'),
(81, 1, 1, 3, 'Perjalanan ini cukup memuaskan, tapi bisa lebih baik lagi.', '2024-06-15 05:55:17'),
(82, 2, 2, 2, 'Kurang memuaskan, tidak sesuai ekspektasi.', '2024-06-15 05:55:17'),
(83, 3, 3, 4, 'Perjalanan yang cukup menyenangkan.', '2024-06-15 05:55:17'),
(84, 4, 4, 5, 'Pengalaman yang luar biasa, sangat memuaskan.', '2024-06-15 05:55:17'),
(85, 5, 5, 3, 'Perjalanan ini cukup biasa saja.', '2024-06-15 05:55:17'),
(86, 6, 6, 4, 'Saya sangat menikmati perjalanan ini.', '2024-06-15 05:55:17'),
(87, 1, 1, 5, 'Perjalanan yang fantastis, sangat saya sukai.', '2024-06-15 05:55:17'),
(88, 2, 2, 3, 'Perjalanan yang cukup baik, tidak ada yang istimewa.', '2024-06-15 05:55:17'),
(89, 3, 3, 2, 'Perjalanan ini kurang memuaskan.', '2024-06-15 05:55:17'),
(90, 4, 4, 4, 'Perjalanan yang cukup bagus.', '2024-06-15 05:55:17'),
(91, 5, 5, 5, 'Perjalanan yang luar biasa dan memuaskan.', '2024-06-15 05:55:17'),
(92, 6, 6, 3, 'Perjalanan ini cukup baik, meskipun ada kekurangan.', '2024-06-15 05:55:17'),
(93, 1, 1, 2, 'Saya tidak terlalu menikmati perjalanan ini.', '2024-06-15 05:55:17'),
(94, 2, 2, 4, 'Pengalaman yang baik dan memuaskan.', '2024-06-15 05:55:17'),
(95, 3, 3, 5, 'Perjalanan yang sangat menyenangkan, saya sangat menyukainya.', '2024-06-15 05:55:17'),
(96, 4, 4, 3, 'Perjalanan yang cukup baik, tidak ada yang spesial.', '2024-06-15 05:55:17'),
(97, 5, 5, 2, 'Perjalanan ini tidak memuaskan.', '2024-06-15 05:55:17'),
(98, 6, 6, 5, 'Pengalaman yang sangat fantastis, saya sangat menikmatinya.', '2024-06-15 05:55:17'),
(99, 1, 1, 4, 'Perjalanan yang menyenangkan dan memuaskan.', '2024-06-15 05:55:17'),
(100, 2, 2, 5, 'Perjalanan yang sempurna, sangat direkomendasikan.', '2024-06-15 05:55:17'),
(101, 3, 3, 3, 'Perjalanan yang biasa saja, tidak ada yang istimewa.', '2024-06-15 05:55:17'),
(102, 4, 4, 2, 'Saya tidak puas dengan perjalanan ini.', '2024-06-15 05:55:17'),
(103, 5, 5, 4, 'Perjalanan yang cukup baik dan memuaskan.', '2024-06-15 05:55:17'),
(104, 6, 6, 5, 'Perjalanan yang sangat luar biasa, saya sangat menikmatinya.', '2024-06-15 05:55:17'),
(105, 1, 1, 3, 'Perjalanan yang cukup memuaskan, bisa lebih baik lagi.', '2024-06-15 05:55:17'),
(106, 2, 2, 2, 'Perjalanan ini kurang memuaskan, tidak sesuai harapan.', '2024-06-15 05:55:17'),
(107, 3, 3, 4, 'Pengalaman yang cukup menyenangkan.', '2024-06-15 05:55:17'),
(108, 4, 4, 5, 'Perjalanan yang luar biasa dan memuaskan.', '2024-06-15 05:55:17'),
(109, 5, 5, 3, 'Perjalanan ini cukup biasa saja.', '2024-06-15 05:55:17'),
(110, 6, 6, 4, 'Saya sangat menikmati perjalanan ini.', '2024-06-15 05:55:17'),
(111, 1, 1, 5, 'Perjalanan yang fantastis, sangat saya sukai.', '2024-06-15 05:55:17'),
(112, 2, 2, 3, 'Perjalanan yang cukup baik, tidak ada yang istimewa.', '2024-06-15 05:55:17'),
(113, 3, 3, 2, 'Perjalanan ini kurang memuaskan.', '2024-06-15 05:55:17'),
(114, 4, 4, 4, 'Perjalanan yang cukup bagus.', '2024-06-15 05:55:17'),
(115, 5, 5, 5, 'Perjalanan yang luar biasa dan memuaskan.', '2024-06-15 05:55:17'),
(116, 6, 6, 3, 'Perjalanan ini cukup baik, meskipun ada kekurangan.', '2024-06-15 05:55:17'),
(117, 1, 1, 2, 'Saya tidak terlalu menikmati perjalanan ini.', '2024-06-15 05:55:17'),
(118, 2, 2, 4, 'Pengalaman yang baik dan memuaskan.', '2024-06-15 05:55:17'),
(119, 3, 3, 5, 'Perjalanan yang sangat menyenangkan, saya sangat menyukainya.', '2024-06-15 05:55:17'),
(120, 4, 4, 3, 'Perjalanan yang cukup baik, tidak ada yang spesial.', '2024-06-15 05:55:17'),
(121, 5, 5, 2, 'Perjalanan ini tidak memuaskan.', '2024-06-15 05:55:17'),
(122, 6, 6, 5, 'Pengalaman yang sangat fantastis, saya sangat menikmatinya.', '2024-06-15 05:55:17');

--
-- Trigger `reviews`
--
DELIMITER $$
CREATE TRIGGER `update_average_rating_after_delete` AFTER DELETE ON `reviews` FOR EACH ROW BEGIN
  DECLARE new_avg FLOAT;
  SELECT AVG(rating) INTO new_avg FROM reviews WHERE trip_id = OLD.trip_id;
  UPDATE trips SET average_rating = new_avg WHERE id = OLD.trip_id;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_average_rating_after_insert` AFTER INSERT ON `reviews` FOR EACH ROW BEGIN
  DECLARE new_avg FLOAT;
  SELECT AVG(rating) INTO new_avg FROM reviews WHERE trip_id = NEW.trip_id;
  UPDATE trips SET average_rating = new_avg WHERE id = NEW.trip_id;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_average_rating_after_update` AFTER UPDATE ON `reviews` FOR EACH ROW BEGIN
  DECLARE new_avg FLOAT;
  SELECT AVG(rating) INTO new_avg FROM reviews WHERE trip_id = NEW.trip_id;
  UPDATE trips SET average_rating = new_avg WHERE id = NEW.trip_id;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_total_reviews_after_delete` AFTER DELETE ON `reviews` FOR EACH ROW BEGIN
    UPDATE trips
    SET total_reviews = (SELECT COUNT(*) FROM reviews WHERE trip_id = OLD.trip_id)
    WHERE id = OLD.trip_id;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_total_reviews_after_insert` AFTER INSERT ON `reviews` FOR EACH ROW BEGIN
    UPDATE trips
    SET total_reviews = (SELECT COUNT(*) FROM reviews WHERE trip_id = NEW.trip_id)
    WHERE id = NEW.trip_id;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_total_reviews_after_update` AFTER UPDATE ON `reviews` FOR EACH ROW BEGIN
    IF OLD.trip_id <> NEW.trip_id THEN
        -- Update the old trip
        UPDATE trips
        SET total_reviews = (SELECT COUNT(*) FROM reviews WHERE trip_id = OLD.trip_id)
        WHERE id = OLD.trip_id;

        -- Update the new trip
        UPDATE trips
        SET total_reviews = (SELECT COUNT(*) FROM reviews WHERE trip_id = NEW.trip_id)
        WHERE id = NEW.trip_id;
    ELSE
        -- Update the same trip if other fields were changed
        UPDATE trips
        SET total_reviews = (SELECT COUNT(*) FROM reviews WHERE trip_id = NEW.trip_id)
        WHERE id = NEW.trip_id;
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `trips`
--

CREATE TABLE `trips` (
  `id` int(11) NOT NULL,
  `mountain_id` int(11) NOT NULL,
  `trip_name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `discount_price` decimal(10,2) DEFAULT NULL,
  `duration` int(2) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `gathering_point` varchar(512) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `average_rating` float DEFAULT 0,
  `total_reviews` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `trips`
--

INSERT INTO `trips` (`id`, `mountain_id`, `trip_name`, `description`, `price`, `discount_price`, `duration`, `start_date`, `end_date`, `gathering_point`, `image_url`, `average_rating`, `total_reviews`) VALUES
(1, 1, 'Petualangan Matahari Terbit Bromo', 'Rasakan keajaiban matahari terbit di atas Gunung Bromo, sebuah petualangan tak terlupakan yang dimulai dengan perjalanan jeep melalui Lautan Pasir dan berakhir dengan pendakian ke tepi kawah.', 246000.00, 200000.00, 2, '2023-06-01', '2023-06-02', 'Basecamp Bromo 1', 'https://picsum.photos/2000', 3.61905, 21),
(2, 2, 'Ekspedisi Puncak Rinjani', 'Bergabunglah dengan kami dalam pendakian yang menantang namun memuaskan ke puncak Gunung Rinjani. Ekspedisi ini mencakup berkemah di sekitar danau kawah, berendam di mata air panas, dan menyaksikan pemandangan yang menakjubkan.', 535000.00, 490000.00, 5, '2023-07-01', '2023-07-05', 'Basecamp Rinjai 2', 'https://picsum.photos/2000', 3.61905, 21),
(3, 3, 'Pendakian Gunung Semeru', 'Ikuti pendakian mendebarkan ke puncak Gunung Semeru, gunung berapi tertinggi di Jawa. Perjalanan ini mencakup melewati hutan lebat, menyeberangi sungai, dan berkemah di bawah bintang.', 407000.00, NULL, 5, '2023-08-10', '2023-08-14', 'Basecamp Semeru 2', 'https://picsum.photos/2000', 3.47619, 21),
(4, 4, 'Pendakian Kerinci dan Ekspedisi Hutan Hujan', 'Temukan keindahan alam Sumatra dengan mendaki ke puncak Gunung Kerinci. Perjalanan ini menawarkan kombinasi unik antara petualangan dan eksplorasi melalui keanekaragaman hayati yang kaya di Taman Nasional Kerinci Seblat.', 334000.00, 300000.00, 6, '2023-09-15', '2023-09-20', 'Basecamp Kerinci 1', 'https://picsum.photos/2000', 3.45, 20),
(5, 1, 'Trek Matahari Terbit Agung', 'Trek ke puncak Gunung Agung dan saksikan matahari terbit yang spektakuler. Pendakian ini adalah perjalanan spiritual dan tantangan fisik, menawarkan pemandangan panoramik Bali dan pulau-pulau sekitarnya.', 328000.00, NULL, 2, '2023-10-05', '2023-10-06', 'Basecamp Agung 2', 'https://picsum.photos/2000', 3.65, 20),
(6, 1, 'Trip Premium Class', 'Lorem ipsum', 240000.00, NULL, 3, '2024-06-03', '2024-06-06', 'Basecamp mana aja', 'https://picsum.photos/2000', 4.15789, 19);

-- --------------------------------------------------------

--
-- Struktur dari tabel `trip_facilities`
--

CREATE TABLE `trip_facilities` (
  `trip_id` int(11) NOT NULL,
  `facility_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `trip_facilities`
--

INSERT INTO `trip_facilities` (`trip_id`, `facility_id`) VALUES
(1, 1),
(1, 2),
(4, 1),
(4, 4),
(5, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `trip_favorites`
--

CREATE TABLE `trip_favorites` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `trip_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `trip_favorites`
--

INSERT INTO `trip_favorites` (`id`, `user_id`, `trip_id`, `created_at`) VALUES
(1, 1, 1, '2024-05-28 10:44:47'),
(2, 1, 3, '2024-05-28 10:44:47'),
(3, 2, 2, '2024-05-28 10:44:47'),
(4, 2, 4, '2024-05-28 10:44:47'),
(5, 3, 5, '2024-05-28 10:44:47');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `phone_number` varchar(15) NOT NULL,
  `gender` varchar(80) DEFAULT NULL,
  `profile_image_url` varchar(255) DEFAULT NULL,
  `otp` int(6) DEFAULT NULL,
  `is_verified` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password_hash`, `fullname`, `phone_number`, `gender`, `profile_image_url`, `otp`, `is_verified`, `created_at`) VALUES
(1, 'smith', 'smith@gmail.com', '$2a$04$3TH4w2HmJFCfzKgHCBIBN.Q5M6TPIJGunF.2IybLYzMxms7aW9qO.', 'Kahfi Smiths69hhhh', '086172938263', 'Laki-laki', 'https://picsum.photos/500', NULL, 0, '2024-05-28 10:26:47'),
(2, 'budi345', 'budi345@gmail.com', '$2y$10$U4pMNyxVJRgtfuYhhcrcEeuszwejhyHHUcXARwxts0pIctimxM9Sq', 'Budi Santoso', '08516394831', NULL, NULL, NULL, 0, '2024-05-28 10:43:47'),
(3, 'rizki123', 'rizki123@gmail.com', '$2y$10$kbcpTlHGoo.3rV6zIw3xBOJnM9B5X750d1uk.ypaSYUWpL7pcpJDe', 'Rizki Ramadhan', '08516394827', NULL, NULL, NULL, 0, '2024-05-28 10:44:09'),
(4, 'sari456', 'sari456@gmail.com', '$2y$10$rjRba5KwyNGPqz05ULSxgOxw8JEJtxVE/T6HwbKlTxV7yjtCiifXa', 'Sari Wulan', '08516394828', NULL, NULL, NULL, 0, '2024-05-28 10:44:13'),
(5, 'adi789', 'adi789@gmail.com', '$2y$10$TGLwj34p.RrX9gpIgHHJo.pLUp3fqnZU1Z4weau9sGn2Ou6Px1GQq', 'Adi Pratama', '08516394829', NULL, NULL, NULL, 0, '2024-05-28 10:44:17'),
(6, 'dewi012', 'dewi012@gmail.com', '$2y$10$Rz/KnNhs4vvXv05zuHq79eYm8hX19f/AgLhHVmN2JnbUEuynSxike', 'Dewi Ayu', '08516394830', NULL, NULL, NULL, 0, '2024-05-28 10:44:21'),
(25, 'ajazxxx', 'fikrimuzakky24@gmail.com', '$2y$10$8XIsyqeFLPTtF87HF1t.DOX/Jo3bijlVWpioXlnk0p2sglhgxZd06', 'ahmad fikril', '085156023639', NULL, NULL, NULL, 1, '2024-07-10 06:56:06'),
(27, 'adfada', 'daleslast@gmail.com', '$2y$10$jAzUfstPlW7U6Bw7/I1KQ.cOLjU/R//Q1lU8pT3iQW64R48JEmzWG', 'kjaskjas', '11111111', NULL, NULL, NULL, 1, '2024-07-10 07:06:59'),
(31, 'test1', 'test1@mail.msa', '$2b$10$.Wml1ttGQFtUGB54GCMsoOxqLAUVx.ftftaBGS3UubwO/e8NiTV3q', NULL, '0828342984623', NULL, NULL, NULL, 0, '2024-07-17 08:41:59'),
(33, 'test2', 'test2@mail.msa', '$2b$10$VADDB9PjLWG9qavUq9z7supeSg3l6PwAyK.m/LfssuVllazul31qe', 'Budi djisamsoe', '0828342984623', NULL, NULL, NULL, 0, '2024-07-17 08:52:40');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `trip_id` (`trip_id`);

--
-- Indeks untuk tabel `booking_transactions`
--
ALTER TABLE `booking_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `booking_id` (`booking_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `equipment_categories`
--
ALTER TABLE `equipment_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `event_trips`
--
ALTER TABLE `event_trips`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_mountain_id` (`mountain_id`);

--
-- Indeks untuk tabel `event_trip_facilities`
--
ALTER TABLE `event_trip_facilities`
  ADD PRIMARY KEY (`event_trip_id`,`facility_id`),
  ADD KEY `facility_id` (`facility_id`);

--
-- Indeks untuk tabel `facilities`
--
ALTER TABLE `facilities`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `islands`
--
ALTER TABLE `islands`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `itemId` (`itemId`);

--
-- Indeks untuk tabel `mountains`
--
ALTER TABLE `mountains`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_mountains_island_id` (`island_id`);

--
-- Indeks untuk tabel `mountain_favorites`
--
ALTER TABLE `mountain_favorites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `mountain_id` (`mountain_id`);

--
-- Indeks untuk tabel `rental_equipment`
--
ALTER TABLE `rental_equipment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mountain_id` (`mountain_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indeks untuk tabel `rental_transactions`
--
ALTER TABLE `rental_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rental_equipment_id` (`rental_equipment_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `trip_id` (`trip_id`);

--
-- Indeks untuk tabel `trips`
--
ALTER TABLE `trips`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mountain_id` (`mountain_id`);

--
-- Indeks untuk tabel `trip_facilities`
--
ALTER TABLE `trip_facilities`
  ADD PRIMARY KEY (`trip_id`,`facility_id`),
  ADD KEY `facility_id` (`facility_id`);

--
-- Indeks untuk tabel `trip_favorites`
--
ALTER TABLE `trip_favorites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `trip_id` (`trip_id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `banners`
--
ALTER TABLE `banners`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT untuk tabel `booking_transactions`
--
ALTER TABLE `booking_transactions`
  MODIFY `id` bigint(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1721030534428;

--
-- AUTO_INCREMENT untuk tabel `equipment_categories`
--
ALTER TABLE `equipment_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `event_trips`
--
ALTER TABLE `event_trips`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `facilities`
--
ALTER TABLE `facilities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `islands`
--
ALTER TABLE `islands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `items`
--
ALTER TABLE `items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `mountains`
--
ALTER TABLE `mountains`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `mountain_favorites`
--
ALTER TABLE `mountain_favorites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `rental_equipment`
--
ALTER TABLE `rental_equipment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `rental_transactions`
--
ALTER TABLE `rental_transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=123;

--
-- AUTO_INCREMENT untuk tabel `trips`
--
ALTER TABLE `trips`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `trip_favorites`
--
ALTER TABLE `trip_favorites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `bookings_ibfk_2` FOREIGN KEY (`trip_id`) REFERENCES `trips` (`id`);

--
-- Ketidakleluasaan untuk tabel `booking_transactions`
--
ALTER TABLE `booking_transactions`
  ADD CONSTRAINT `booking_transactions_ibfk_1` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`id`),
  ADD CONSTRAINT `booking_transactions_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Ketidakleluasaan untuk tabel `event_trips`
--
ALTER TABLE `event_trips`
  ADD CONSTRAINT `fk_mountain_id` FOREIGN KEY (`mountain_id`) REFERENCES `mountains` (`id`);

--
-- Ketidakleluasaan untuk tabel `event_trip_facilities`
--
ALTER TABLE `event_trip_facilities`
  ADD CONSTRAINT `event_trip_facilities_ibfk_1` FOREIGN KEY (`event_trip_id`) REFERENCES `event_trips` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `event_trip_facilities_ibfk_2` FOREIGN KEY (`facility_id`) REFERENCES `facilities` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `mountains`
--
ALTER TABLE `mountains`
  ADD CONSTRAINT `fk_mountains_island_id` FOREIGN KEY (`island_id`) REFERENCES `islands` (`id`);

--
-- Ketidakleluasaan untuk tabel `mountain_favorites`
--
ALTER TABLE `mountain_favorites`
  ADD CONSTRAINT `mountain_favorites_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `mountain_favorites_ibfk_2` FOREIGN KEY (`mountain_id`) REFERENCES `mountains` (`id`);

--
-- Ketidakleluasaan untuk tabel `rental_equipment`
--
ALTER TABLE `rental_equipment`
  ADD CONSTRAINT `rental_equipment_ibfk_1` FOREIGN KEY (`mountain_id`) REFERENCES `mountains` (`id`),
  ADD CONSTRAINT `rental_equipment_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `equipment_categories` (`id`);

--
-- Ketidakleluasaan untuk tabel `rental_transactions`
--
ALTER TABLE `rental_transactions`
  ADD CONSTRAINT `rental_transactions_ibfk_1` FOREIGN KEY (`rental_equipment_id`) REFERENCES `rental_equipment` (`id`),
  ADD CONSTRAINT `rental_transactions_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Ketidakleluasaan untuk tabel `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`trip_id`) REFERENCES `trips` (`id`);

--
-- Ketidakleluasaan untuk tabel `trips`
--
ALTER TABLE `trips`
  ADD CONSTRAINT `trips_ibfk_1` FOREIGN KEY (`mountain_id`) REFERENCES `mountains` (`id`);

--
-- Ketidakleluasaan untuk tabel `trip_facilities`
--
ALTER TABLE `trip_facilities`
  ADD CONSTRAINT `trip_facilities_ibfk_1` FOREIGN KEY (`trip_id`) REFERENCES `trips` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `trip_facilities_ibfk_2` FOREIGN KEY (`facility_id`) REFERENCES `facilities` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `trip_favorites`
--
ALTER TABLE `trip_favorites`
  ADD CONSTRAINT `trip_favorites_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `trip_favorites_ibfk_2` FOREIGN KEY (`trip_id`) REFERENCES `trips` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
