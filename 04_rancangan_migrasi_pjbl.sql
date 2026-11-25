DROP DATABASE IF EXISTS si_laundry_crdb CASCADE;
CREATE DATABASE si_laundry_crdb;
USE si_laundry_crdb;

CREATE TABLE admin (
    id_admin UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    nama_admin VARCHAR(100) NOT NULL,
    username VARCHAR(50) NOT NULL UNIQUE,
    kata_sandi VARCHAR(255) NOT NULL
);

CREATE TABLE pesanan (
    id_pesanan UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    kode_nota VARCHAR(20) NOT NULL UNIQUE,
    nama_pesanan VARCHAR(150) NOT NULL,
    tanggal_pesanan DATE NOT NULL,
    status_cucian VARCHAR(20) NOT NULL DEFAULT 'Dicuci'
        CHECK (status_cucian IN ('Diterima', 'Dicuci', 'Disetrika', 'Siap Diambil', 'Selesai')),
    foto_cucian VARCHAR(500) NOT NULL,
    id_admin UUID NOT NULL REFERENCES admin(id_admin) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE rincian_layanan (
    id_rincian UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    id_pesanan UUID NOT NULL UNIQUE REFERENCES pesanan(id_pesanan) ON DELETE CASCADE ON UPDATE CASCADE,
    berat_kg DECIMAL(6,2) NOT NULL,
    jumlah_potong INT NOT NULL,
    durasi_jam INT NOT NULL,
    total_biaya DECIMAL(12,2) NOT NULL
);

CREATE TABLE bahan_pencuci (
    id_bahan UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    nama_bahan VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE bahan_sensitif (
    id_sensitif UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    nama_sensitif VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE pesanan_bahan (
    id_pesanan UUID NOT NULL REFERENCES pesanan(id_pesanan) ON DELETE CASCADE ON UPDATE CASCADE,
    id_bahan UUID NOT NULL REFERENCES bahan_pencuci(id_bahan) ON DELETE RESTRICT ON UPDATE CASCADE,
    takaran_ml DECIMAL(8,2) NOT NULL,
    PRIMARY KEY (id_pesanan, id_bahan)
);

CREATE TABLE kandungan_bahan_sensitif (
    id_bahan UUID NOT NULL REFERENCES bahan_pencuci(id_bahan) ON DELETE CASCADE ON UPDATE CASCADE,
    id_sensitif UUID NOT NULL REFERENCES bahan_sensitif(id_sensitif) ON DELETE RESTRICT ON UPDATE CASCADE,
    PRIMARY KEY (id_bahan, id_sensitif)
);

CREATE INDEX idx_pesanan_status_tanggal
    ON pesanan (status_cucian, tanggal_pesanan)
    STORING (kode_nota, nama_pesanan);

INSERT INTO admin (nama_admin, username, kata_sandi) VALUES
    ('Khansa Qais Fernanda', 'admin_khansa', 'HASH_PASSWORD_PLACEHOLDER'),
    ('Jelita Palupi Kusuma W.', 'admin_jelita', 'HASH_PASSWORD_PLACEHOLDER'),
    ('Zahro Choirun Latifah', 'admin_zahro', 'HASH_PASSWORD_PLACEHOLDER');

INSERT INTO bahan_pencuci (nama_bahan) VALUES
    ('Deterjen Cair Ultra Clean'),
    ('Deterjen Hipoalergenik Baby & Sensitive'),
    ('Pelembut Pakaian Floral Softener'),
    ('Parfum Laundry Sakura Luxury');

INSERT INTO bahan_sensitif (nama_sensitif) VALUES
    ('Surfaktan SLS (Sodium Lauryl Sulfate)'),
    ('Pewangi Sintetis (Fragrance Mix)'),
    ('Pencerah Optik (Optical Brightener)');

INSERT INTO kandungan_bahan_sensitif (id_bahan, id_sensitif)
SELECT bp.id_bahan, bs.id_sensitif
FROM bahan_pencuci bp
JOIN bahan_sensitif bs ON (
    (bp.nama_bahan = 'Deterjen Cair Ultra Clean' AND bs.nama_sensitif IN ('Surfaktan SLS (Sodium Lauryl Sulfate)', 'Pencerah Optik (Optical Brightener)'))
    OR (bp.nama_bahan = 'Pelembut Pakaian Floral Softener' AND bs.nama_sensitif = 'Pewangi Sintetis (Fragrance Mix)')
    OR (bp.nama_bahan = 'Parfum Laundry Sakura Luxury' AND bs.nama_sensitif = 'Pewangi Sintetis (Fragrance Mix)')
);

INSERT INTO pesanan (kode_nota, nama_pesanan, tanggal_pesanan, status_cucian, foto_cucian, id_admin)
SELECT 'LND-001', 'Paket Cuci Komplit Reguler (Budi Santoso)', '2026-11-09', 'Siap Diambil', 'https://cdn.silaundry.local/lnd001.jpg', id_admin FROM admin WHERE username = 'admin_khansa'
UNION ALL
SELECT 'LND-002', 'Cuci Ekspres Pakaian Bayi (Siti Aminah)', '2026-11-10', 'Disetrika', 'https://cdn.silaundry.local/lnd002.jpg', id_admin FROM admin WHERE username = 'admin_khansa'
UNION ALL
SELECT 'LND-003', 'Cuci Bedcover & Sprei King (Rizky Pratama)', '2026-11-11', 'Dicuci', 'https://cdn.silaundry.local/lnd003.jpg', id_admin FROM admin WHERE username = 'admin_jelita'
UNION ALL
SELECT 'LND-004', 'Cuci Kemeja Kerja & Jas (Dewi Lestari)', '2026-11-12', 'Dicuci', 'https://cdn.silaundry.local/lnd004.jpg', id_admin FROM admin WHERE username = 'admin_jelita';

INSERT INTO rincian_layanan (id_pesanan, berat_kg, jumlah_potong, durasi_jam, total_biaya)
SELECT id_pesanan, 5.50, 24, 24, 38500.00 FROM pesanan WHERE kode_nota = 'LND-001'
UNION ALL
SELECT id_pesanan, 3.20, 18, 6, 32000.00 FROM pesanan WHERE kode_nota = 'LND-002'
UNION ALL
SELECT id_pesanan, 7.00, 6, 48, 65000.00 FROM pesanan WHERE kode_nota = 'LND-003'
UNION ALL
SELECT id_pesanan, 4.00, 12, 12, 48000.00 FROM pesanan WHERE kode_nota = 'LND-004';

INSERT INTO pesanan_bahan (id_pesanan, id_bahan, takaran_ml)
SELECT p.id_pesanan, b.id_bahan, 90.00 FROM pesanan p, bahan_pencuci b WHERE p.kode_nota = 'LND-003' AND b.nama_bahan = 'Deterjen Cair Ultra Clean'
UNION ALL
SELECT p.id_pesanan, b.id_bahan, 60.00 FROM pesanan p, bahan_pencuci b WHERE p.kode_nota = 'LND-003' AND b.nama_bahan = 'Pelembut Pakaian Floral Softener'
UNION ALL
SELECT p.id_pesanan, b.id_bahan, 45.00 FROM pesanan p, bahan_pencuci b WHERE p.kode_nota = 'LND-004' AND b.nama_bahan = 'Deterjen Hipoalergenik Baby & Sensitive'
UNION ALL
SELECT p.id_pesanan, b.id_bahan, 20.00 FROM pesanan p, bahan_pencuci b WHERE p.kode_nota = 'LND-004' AND b.nama_bahan = 'Parfum Laundry Sakura Luxury';

SELECT
    p.kode_nota,
    p.nama_pesanan,
    p.tanggal_pesanan,
    r.berat_kg,
    r.total_biaya,
    b.nama_bahan,
    pb.takaran_ml
FROM pesanan AS p
JOIN rincian_layanan AS r
    ON r.id_pesanan = p.id_pesanan
JOIN pesanan_bahan AS pb
    ON pb.id_pesanan = p.id_pesanan
JOIN bahan_pencuci AS b
    ON b.id_bahan = pb.id_bahan
WHERE p.status_cucian = 'Dicuci'
  AND p.tanggal_pesanan >= '2026-11-10'
ORDER BY p.kode_nota, b.nama_bahan;

EXPLAIN
SELECT
    p.kode_nota,
    p.nama_pesanan,
    p.tanggal_pesanan,
    r.berat_kg,
    r.total_biaya,
    b.nama_bahan,
    pb.takaran_ml
FROM pesanan AS p
JOIN rincian_layanan AS r
    ON r.id_pesanan = p.id_pesanan
JOIN pesanan_bahan AS pb
    ON pb.id_pesanan = p.id_pesanan
JOIN bahan_pencuci AS b
    ON b.id_bahan = pb.id_bahan
WHERE p.status_cucian = 'Dicuci'
  AND p.tanggal_pesanan >= '2026-11-10';

DROP USER IF EXISTS pelanggan_public;
DROP USER IF EXISTS kasir_laundry;

CREATE USER pelanggan_public WITH PASSWORD 'GantiDenganPasswordPublik!';
CREATE USER kasir_laundry WITH PASSWORD 'GantiDenganPasswordKasir!';

GRANT CONNECT ON DATABASE si_laundry_crdb TO pelanggan_public, kasir_laundry;
GRANT USAGE ON SCHEMA public TO pelanggan_public, kasir_laundry;

GRANT SELECT ON TABLE
    pesanan, rincian_layanan, bahan_pencuci, bahan_sensitif, pesanan_bahan, kandungan_bahan_sensitif
    TO pelanggan_public;

GRANT SELECT, INSERT, UPDATE ON TABLE
    pesanan, rincian_layanan, pesanan_bahan
    TO kasir_laundry;

GRANT SELECT ON TABLE
    bahan_pencuci, bahan_sensitif, kandungan_bahan_sensitif
    TO kasir_laundry;

SHOW GRANTS FOR pelanggan_public;
SHOW GRANTS FOR kasir_laundry;
