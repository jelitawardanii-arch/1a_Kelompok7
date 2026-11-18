SELECT VERSION();
SELECT @@version_comment;
SHOW DATABASES;
SHOW ENGINES;
SHOW VARIABLES LIKE 'character_set_server';
SHOW VARIABLES LIKE 'collation_server';
SHOW VARIABLES LIKE 'autocommit';
SHOW VARIABLES LIKE 'transaction_isolation';

SELECT
    JSON_VALID('{"nama":"Budi"}') AS json_valid,
    JSON_EXTRACT('{"nama":"Budi"}', '$.nama') AS nama;

SELECT NOW();

DROP DATABASE IF EXISTS praktikum_modul11;
CREATE DATABASE praktikum_modul11 CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE praktikum_modul11;

SELECT DATABASE();

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

USE praktikum_modul11;

INSERT INTO kategori_layanan (nama_kategori)
VALUES
    ('Cuci Kiloan'),
    ('Cuci Satuan'),
    ('Dry Cleaning'),
    ('Cuci Sepatu');

INSERT INTO layanan (id_kategori, nama_layanan, harga, spesifikasi)
VALUES
(
    1,
    'Cuci Komplit Reguler',
    7000,
    '{
        "berat_min_kg": 3,
        "durasi_jam": 48,
        "proses": ["Cuci", "Kering", "Setrika", "Lipat"],
        "bahan": {
            "deterjen": "Deterjen Cair Ultra Clean",
            "pewangi": "Parfum Laundry Sakura Luxury"
        },
        "bahan_sensitif": ["Surfaktan SLS (Sodium Lauryl Sulfate)", "Pewangi Sintetis (Fragrance Mix)"]
    }'
),
(
    1,
    'Cuci Ekspres Baby & Sensitive',
    10000,
    '{
        "berat_min_kg": 2,
        "durasi_jam": 6,
        "proses": ["Cuci", "Kering", "Lipat"],
        "bahan": {
            "deterjen": "Deterjen Hipolergenik Baby & Sensitive"
        },
        "bahan_sensitif": []
    }'
),
(
    2,
    'Cuci Bedcover King',
    35000,
    '{
        "jenis_item": "Bedcover",
        "ukuran": "King",
        "durasi_jam": 48,
        "perlakuan": "Cuci Basah"
    }'
),
(
    3,
    'Dry Clean Jas',
    45000,
    '{
        "jenis_item": "Jas",
        "bahan_kain": "Wol",
        "pelarut": "Hidrokarbon",
        "durasi_jam": 72
    }'
),
(
    4,
    'Deep Clean Sepatu Kanvas',
    40000,
    '{
        "material": "Kanvas",
        "jenis_cuci": "Deep Clean",
        "durasi_jam": 48,
        "bebas_pemutih": true
    }'
);

INSERT INTO layanan_objek (nama_layanan, jenis_layanan, harga, spesifikasi)
VALUES
(
    'Cuci Komplit Reguler',
    'Kiloan',
    7000,
    '{"berat_min_kg": 3, "durasi_jam": 48, "proses": ["Cuci", "Kering", "Setrika", "Lipat"]}'
),
(
    'Cuci Bedcover King',
    'Satuan',
    35000,
    '{"jenis_item": "Bedcover", "ukuran": "King", "durasi_jam": 48}'
),
(
    'Dry Clean Jas',
    'DryClean',
    45000,
    '{"jenis_item": "Jas", "bahan_kain": "Wol", "pelarut": "Hidrokarbon"}'
),
(
    'Deep Clean Sepatu Kanvas',
    'Sepatu',
    40000,
    '{"material": "Kanvas", "jenis_cuci": "Deep Clean"}'
);

SELECT * FROM kategori_layanan;
SELECT * FROM layanan;
SELECT * FROM layanan_objek;

USE praktikum_modul11;

SELECT
    nama_layanan,
    JSON_EXTRACT(spesifikasi, '$.durasi_jam') AS durasi_jam
FROM layanan;

SELECT
    nama_layanan,
    JSON_UNQUOTE(JSON_EXTRACT(spesifikasi, '$.bahan.deterjen')) AS deterjen
FROM layanan;

SELECT
    nama_layanan,
    spesifikasi->>'$.jenis_item' AS jenis_item,
    spesifikasi->>'$.material' AS material
FROM layanan;

UPDATE layanan
SET spesifikasi = JSON_SET(spesifikasi, '$.durasi_jam', 4)
WHERE nama_layanan = 'Cuci Ekspres Baby & Sensitive';

SELECT
    nama_layanan,
    JSON_EXTRACT(spesifikasi, '$.durasi_jam') AS durasi_jam
FROM layanan
WHERE nama_layanan = 'Cuci Ekspres Baby & Sensitive';

UPDATE layanan
SET spesifikasi = JSON_SET(spesifikasi, '$.antar_jemput', true)
WHERE nama_layanan = 'Cuci Komplit Reguler';

SELECT
    nama_layanan,
    spesifikasi
FROM layanan
WHERE nama_layanan = 'Cuci Komplit Reguler';

UPDATE layanan
SET spesifikasi = JSON_REMOVE(spesifikasi, '$.antar_jemput')
WHERE nama_layanan = 'Cuci Komplit Reguler';

SELECT
    nama_layanan,
    spesifikasi
FROM layanan;

SELECT
    nama_layanan,
    harga,
    spesifikasi->>'$.durasi_jam' AS durasi_jam
FROM layanan
WHERE CAST(JSON_EXTRACT(spesifikasi, '$.durasi_jam') AS UNSIGNED) <= 24;

SELECT
    nama_layanan,
    harga
FROM layanan
WHERE JSON_CONTAINS(spesifikasi->'$.proses', '"Setrika"');

SELECT
    nama_layanan,
    harga
FROM layanan
WHERE JSON_UNQUOTE(JSON_EXTRACT(spesifikasi, '$.bahan_kain')) = 'Wol';

SELECT
    nama_layanan,
    harga
FROM layanan
WHERE JSON_CONTAINS(spesifikasi->'$.bahan_sensitif', '"Pewangi Sintetis (Fragrance Mix)"') = 0
   OR JSON_EXTRACT(spesifikasi, '$.bahan_sensitif') IS NULL;

SELECT JSON_OBJECT(
    'nama', 'Siti Aminah',
    'email', 'siti.aminah@email.com',
    'alergi', JSON_ARRAY('SLS', 'Pewangi Sintetis')
) AS data_pelanggan;

SELECT JSON_ARRAY('MySQL', 'PostgreSQL', 'MongoDB') AS daftar_dbms;

SELECT JSON_VALID('{"nama":"Budi","umur":21}') AS json_valid;

SELECT JSON_VALID('{nama:Budi}') AS json_tidak_valid;

SELECT
    nama_layanan,
    JSON_LENGTH(spesifikasi) AS jumlah_atribut
FROM layanan;

SELECT
    id_layanan,
    nama_layanan,
    harga,
    spesifikasi
FROM layanan_objek
WHERE jenis_layanan = 'Kiloan';

SELECT
    id_layanan,
    nama_layanan,
    harga,
    spesifikasi
FROM layanan_objek
WHERE jenis_layanan = 'DryClean';

SELECT
    l.id_layanan,
    l.nama_layanan,
    k.nama_kategori,
    l.harga,
    JSON_EXTRACT(l.spesifikasi, '$.durasi_jam') AS durasi_jam
FROM layanan l
JOIN kategori_layanan k
    ON l.id_kategori = k.id_kategori;

START TRANSACTION;
UPDATE layanan SET harga = harga * 2 WHERE id_kategori = 1;
SELECT nama_layanan, harga FROM layanan WHERE id_kategori = 1;
ROLLBACK;
SELECT nama_layanan, harga FROM layanan WHERE id_kategori = 1;
