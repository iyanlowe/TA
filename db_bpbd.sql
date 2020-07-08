-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 08 Jul 2020 pada 20.37
-- Versi server: 10.3.16-MariaDB
-- Versi PHP: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_bpbd`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `bencana`
--

CREATE TABLE `bencana` (
  `id_bencana` int(11) NOT NULL,
  `id_jenis_bencana` int(11) NOT NULL,
  `nama_bencana` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `bencana`
--

INSERT INTO `bencana` (`id_bencana`, `id_jenis_bencana`, `nama_bencana`) VALUES
(2, 9, 'Banjir'),
(3, 10, 'Tsunami'),
(5, 10, 'Banjir 1'),
(7, 11, 'Tawuran ');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jenis_bencana`
--

CREATE TABLE `jenis_bencana` (
  `id_jenis_bencana` int(11) NOT NULL,
  `jenis_bencana` varchar(155) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `jenis_bencana`
--

INSERT INTO `jenis_bencana` (`id_jenis_bencana`, `jenis_bencana`) VALUES
(9, 'Bencana Alam'),
(10, 'Bencana Non Alam'),
(11, 'Sosial');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jenis_kerusakan`
--

CREATE TABLE `jenis_kerusakan` (
  `id_jenis_kerusakan` int(11) NOT NULL,
  `jenis_kerusakan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `jenis_kerusakan`
--

INSERT INTO `jenis_kerusakan` (`id_jenis_kerusakan`, `jenis_kerusakan`) VALUES
(2, 'Rumah'),
(3, 'Fasilitas Pendidikan'),
(4, 'Fasilitas Kesehatan'),
(5, 'Fasilitas Ibadah'),
(6, 'Infrastruktur'),
(7, 'Fasilitas Pemerintahan'),
(8, 'Jaringan Listrik, Telekomunikasi, Air Bersih, Gas'),
(9, 'Fasilitas Pelayanan Publik'),
(10, 'Hutan, Lahan, Tanaman, Pertanian, Hewan Ternak'),
(11, 'Sarana Prasarana Kelautan dan Perikanan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kerusakan`
--

CREATE TABLE `kerusakan` (
  `id_kerusakan` int(11) NOT NULL,
  `id_laporan` int(11) NOT NULL,
  `id_jenis_kerusakan` int(11) NOT NULL,
  `rusak_berat` varchar(255) NOT NULL,
  `rusak_ringan` varchar(255) NOT NULL,
  `fungsi` varchar(255) NOT NULL,
  `keterangan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `korban_jiwa`
--

CREATE TABLE `korban_jiwa` (
  `id_korban_jiwa` int(11) NOT NULL,
  `id_laporan` int(11) NOT NULL,
  `hilang` varchar(255) NOT NULL,
  `luka_berat` varchar(255) NOT NULL,
  `luka_ringan` varchar(255) NOT NULL,
  `pengungsi` varchar(255) NOT NULL,
  `meninggal` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `laporan`
--

CREATE TABLE `laporan` (
  `id_laporan` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_bencana` int(11) NOT NULL,
  `id_petugas` int(11) NOT NULL,
  `no_hp` varchar(15) NOT NULL,
  `kecamatan` varchar(155) NOT NULL,
  `desa` varchar(155) NOT NULL,
  `garis_bujur` varchar(255) NOT NULL,
  `garis_lintang` varchar(255) NOT NULL,
  `foto_laporan` varchar(255) NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  `penyebab_bencana` varchar(255) NOT NULL,
  `status_bencana` varchar(255) NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `penanggulangan`
--

CREATE TABLE `penanggulangan` (
  `id_penanggulangan` int(11) NOT NULL,
  `id_laporan` int(11) NOT NULL,
  `id_korban_jiwa` int(11) NOT NULL,
  `id_kerusakan` int(11) NOT NULL,
  `upaya` varchar(255) NOT NULL,
  `kebutuhan_mendesak` varchar(255) NOT NULL,
  `kendala` varchar(255) NOT NULL,
  `pantauan_visual` varchar(255) NOT NULL,
  `kegiatan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `fname` varchar(128) NOT NULL,
  `lname` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL,
  `image` varchar(128) NOT NULL,
  `password` varchar(255) NOT NULL,
  `tempat_lahir` varchar(255) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `jenis_kelamin` varchar(125) NOT NULL,
  `role_id` int(11) NOT NULL,
  `active_id` int(1) NOT NULL,
  `date_created` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id_user`, `fname`, `lname`, `email`, `image`, `password`, `tempat_lahir`, `tanggal_lahir`, `jenis_kelamin`, `role_id`, `active_id`, `date_created`) VALUES
(1, 'Administrator', 'BPBD', 'adminbpbd@gmail.com', 'default.jpg', 'f865b53623b121fd34ee5426c792e5c33af8c227', '', '0000-00-00', '', 1, 1, '0000-00-00'),
(31, 'Muhamad', 'Nopriyansyah', 'iyanlowe28@gmail.com', 'profile.png', '$2y$10$/q9YDFeKHzgmk6nf.mjixOu4pO2.QMNZwdIjs7ACXqHNvRbrrUHIO', '', '0000-00-00', 'L', 1, 1, '0000-00-00'),
(33, 'Fajar', 'Muhamad', 'iyanslalutertawa@gmail.com', 'default.jpg', '$2y$10$RBumzXqS5Y1VOJ9aBoaaAORhC2mgjiJCbf1RaXX1NNmUOQ2TRzkFy', 'Indramayu', '1998-11-11', 'L', 4, 1, '0000-00-00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_role`
--

CREATE TABLE `user_role` (
  `role_id` int(11) NOT NULL,
  `jabatan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user_role`
--

INSERT INTO `user_role` (`role_id`, `jabatan`) VALUES
(1, 'Administrator'),
(2, 'Petugas 1'),
(3, 'Petugas 2'),
(4, 'Petugas 3\r\n');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_token`
--

CREATE TABLE `user_token` (
  `id_token` int(11) NOT NULL,
  `email` varchar(256) NOT NULL,
  `token` varchar(256) NOT NULL,
  `date_created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user_token`
--

INSERT INTO `user_token` (`id_token`, `email`, `token`, `date_created`) VALUES
(10, 'iyanlowe28@gmail.com', 'M8KlJLV0RrA126mRUpnuWwRN7Y/adhyzydMKOaDHW0I=', 1591811314),
(11, 'iyanlowe28@gmail.com', 'hrJPvDY4ryWM2w+nswVJFPFcyictQKb/hoyvm3SroVA=', 1592990720),
(12, 'iyanlowe28@gmail.com', 'eS9CWFzu9H1ADmJtFJ/vyNEL7Wxk9vCOkUAea9EvF3k=', 1592990933),
(13, 'iyanlowe28@gmail.com', 'cVKs8Sb6/5nOjvB8GWrK5SJtmvUkVnkP7361ZXjoh5I=', 1592991729);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `bencana`
--
ALTER TABLE `bencana`
  ADD PRIMARY KEY (`id_bencana`);

--
-- Indeks untuk tabel `jenis_bencana`
--
ALTER TABLE `jenis_bencana`
  ADD PRIMARY KEY (`id_jenis_bencana`);

--
-- Indeks untuk tabel `jenis_kerusakan`
--
ALTER TABLE `jenis_kerusakan`
  ADD PRIMARY KEY (`id_jenis_kerusakan`);

--
-- Indeks untuk tabel `kerusakan`
--
ALTER TABLE `kerusakan`
  ADD PRIMARY KEY (`id_kerusakan`);

--
-- Indeks untuk tabel `korban_jiwa`
--
ALTER TABLE `korban_jiwa`
  ADD PRIMARY KEY (`id_korban_jiwa`);

--
-- Indeks untuk tabel `laporan`
--
ALTER TABLE `laporan`
  ADD PRIMARY KEY (`id_laporan`);

--
-- Indeks untuk tabel `penanggulangan`
--
ALTER TABLE `penanggulangan`
  ADD PRIMARY KEY (`id_penanggulangan`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- Indeks untuk tabel `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`role_id`);

--
-- Indeks untuk tabel `user_token`
--
ALTER TABLE `user_token`
  ADD PRIMARY KEY (`id_token`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `bencana`
--
ALTER TABLE `bencana`
  MODIFY `id_bencana` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `jenis_bencana`
--
ALTER TABLE `jenis_bencana`
  MODIFY `id_jenis_bencana` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT untuk tabel `jenis_kerusakan`
--
ALTER TABLE `jenis_kerusakan`
  MODIFY `id_jenis_kerusakan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `kerusakan`
--
ALTER TABLE `kerusakan`
  MODIFY `id_kerusakan` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `korban_jiwa`
--
ALTER TABLE `korban_jiwa`
  MODIFY `id_korban_jiwa` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `laporan`
--
ALTER TABLE `laporan`
  MODIFY `id_laporan` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `penanggulangan`
--
ALTER TABLE `penanggulangan`
  MODIFY `id_penanggulangan` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT untuk tabel `user_role`
--
ALTER TABLE `user_role`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `user_token`
--
ALTER TABLE `user_token`
  MODIFY `id_token` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
