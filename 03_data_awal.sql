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
