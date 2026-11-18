USE praktikum_modul11;

CREATE TABLE kategori_layanan (
    id_kategori INT AUTO_INCREMENT PRIMARY KEY,
    nama_kategori VARCHAR(100) NOT NULL UNIQUE
) ENGINE=InnoDB;

CREATE TABLE layanan (
    id_layanan INT AUTO_INCREMENT PRIMARY KEY,
    id_kategori INT NOT NULL,
    nama_layanan VARCHAR(150) NOT NULL,
    harga DECIMAL(12,2) NOT NULL,
    spesifikasi JSON NOT NULL,
    CONSTRAINT fk_layanan_kategori
        FOREIGN KEY (id_kategori)
        REFERENCES kategori_layanan(id_kategori)
        ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE layanan_objek (
    id_layanan INT AUTO_INCREMENT PRIMARY KEY,
    nama_layanan VARCHAR(150) NOT NULL,
    jenis_layanan VARCHAR(50) NOT NULL,
    harga DECIMAL(12,2) NOT NULL,
    spesifikasi JSON
) ENGINE=InnoDB;
