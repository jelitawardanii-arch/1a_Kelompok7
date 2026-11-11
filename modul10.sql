CREATE Database modul_10 ;

CREATE TABLE `pelanggan` (
  `id_pelanggan` int(11) NOT NULL,
  `nama_pelanggan` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `no_telepon` varchar(15) DEFAULT NULL
) ENGINE=InnoDB;

CREATE TABLE `layanan` (
  `id_layanan` int(11) NOT NULL,
  `nama_layanan` varchar(100) NOT NULL,
  `harga_per_kg` decimal(10,2) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE `pesanan` (
  `id_pesanan` int(11) NOT NULL,
  `id_pelanggan` int(11) NOT NULL,
  `tanggal_pesanan` datetime NOT NULL,
  `tanggal_diambil` datetime NOT NULL,
  `total_berat_kg` decimal(5,2) DEFAULT 0.00,
  `total_biaya` decimal(10,2) DEFAULT 0.00,
  `status_pesanan` enum('baru','diproses','siap_diambil','dalam_pengantaran','selesai','dibatalkan') DEFAULT 'baru'
) ENGINE=InnoDB;

CREATE TABLE `detail_pesanan` (
  `id_detail` int(11) NOT NULL,
  `id_pesanan` int(11) NOT NULL,
  `id_layanan` int(11) NOT NULL,
  `jumlah_kg` decimal(5,2) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL
) ENGINE=InnoDB;


  
