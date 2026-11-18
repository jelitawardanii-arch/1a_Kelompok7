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
