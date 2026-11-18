# Praktikum Modul 11 â€“ Perkembangan DBMS dan Lingkup Penerapan Basis Data

**Mata Kuliah:** Praktik Basis Data (`RPL24108`) Â· **Pertemuan:** 11  
**Sub-CPMK:** `SCPMK0910809` â€“ Mampu mengimplementasikan basis data menggunakan sistem manajemen basis data (DBMS)  
**Studi Kasus PjBL:** Sistem Informasi Manajemen Laundry Berbasis Web UMKM Laundry (**SIM-LAUNDRY**)  
**Database & DBMS:** `sistem_laundry` pada **MySQL Community Server 8.4.3** (Laragon / phpMyAdmin)

---

## Identitas Kelompok (Kelas 1A TRPL)

| No | Nama Mahasiswa | NIM | Kelas |
| :---: | :--- | :---: | :---: |
| 1 | Khansa Qais Fernanda | 264311019 | 1A TRPL |
| 2 | Jelita Paluli Kusuma W | 264311017 | 1A TRPL |
| 3 | Zahro Choirun Latifah | 264311030 | 1A TRPL |

---

## Struktur Folder Proyek

```txt
praktikum_modul11/
â”œâ”€â”€ sql/
â”‚   â”œâ”€â”€ 01_database.sql                # Identifikasi DBMS & pembuatan database sistem_laundry
â”‚   â”œâ”€â”€ 02_tabel.sql                   # DDL 8 tabel SIM-LAUNDRY (relasional + kolom JSON)
â”‚   â”œâ”€â”€ 03_data_awal.sql               # DML data awal kategori, layanan JSON, layanan_objek & transaksi
â”‚   â””â”€â”€ 04_pengujian_json.sql          # Pengujian JSON_EXTRACT, JSON_SET, JSON_REMOVE, JOIN & ROLLBACK
â”œâ”€â”€ dokumentasi/
â”‚   â”œâ”€â”€ perbandingan_dbms.docx         # Kerangka laporan perbandingan 3 DBMS
â”‚   â”œâ”€â”€ analisis_objek.docx            # Kerangka laporan analisis basis data berorientasi objek
â”‚   â”œâ”€â”€ lingkup_penerapan.docx         # Kerangka laporan analisis lingkup penerapan SIM-LAUNDRY
â”‚   â””â”€â”€ hasil_pengujian.txt            # Log output eksekusi query MySQL 8.4.3
â”œâ”€â”€ diagram/
â”‚   â””â”€â”€ pemodelan_objek.png            # UML Class Diagram Layanan SIM-LAUNDRY
â”œâ”€â”€ bukti/
â”‚   â”œâ”€â”€ 01_identifikasi_dbms.png       # Screenshot CLI identifikasi versi, engine, charset & JSON
â”‚   â”œâ”€â”€ 01_identifikasi_dbms_2.png     # Lanjutan identifikasi database aktif
â”‚   â”œâ”€â”€ 02_pembuatan_tabel.png         # Screenshot CLI pembuatan tabel relasional & kolom JSON
â”‚   â”œâ”€â”€ 02_pembuatan_tabel_2.png       # Lanjutan DDL tabel transaksi & DESCRIBE
â”‚   â”œâ”€â”€ 03_insert_data_json.png        # Screenshot CLI pengisian data awal pengguna & kategori
â”‚   â”œâ”€â”€ 03_insert_data_json_2.png      # Lanjutan pengisian data awal layanan JSON
â”‚   â”œâ”€â”€ 03_insert_data_json_3.png      # Lanjutan pengisian layanan_objek & transaksi pesanan
â”‚   â”œâ”€â”€ 03_insert_data_json_4.png      # Hasil SELECT verifikasi data awal
â”‚   â”œâ”€â”€ 04_baca_atribut_json.png       # Screenshot CLI JSON_EXTRACT, JSON_UNQUOTE, dan ->>
â”‚   â”œâ”€â”€ 05_manipulasi_json.png         # Screenshot CLI JSON_SET & JSON_REMOVE
â”‚   â”œâ”€â”€ 06_pencarian_json.png          # Screenshot CLI pencarian atribut JSON & JSON_CONTAINS
â”‚   â”œâ”€â”€ 07_fungsi_json_dan_objek.png   # Screenshot CLI JSON_OBJECT, JSON_ARRAY, JSON_VALID, JSON_LENGTH
â”‚   â”œâ”€â”€ 07_fungsi_json_dan_objek_2.png # Lanjutan query layanan_objek & JOIN relasional
â”‚   â”œâ”€â”€ 08_transaksi_rollback.png      # Screenshot CLI pengujian START TRANSACTION & ROLLBACK
â”‚   â”œâ”€â”€ 09_phpmyadmin_struktur_db.png  # Screenshot phpMyAdmin struktur 8 tabel sistem_laundry
â”‚   â””â”€â”€ 10_phpmyadmin_data_json.png    # Screenshot phpMyAdmin data kolom JSON tabel layanan
â”œâ”€â”€ modul11.sql                        # Gabungan seluruh script SQL (01 s.d. 04)
â”œâ”€â”€ worksheet_modul11.docx             # Kerangka lembar kerja utama praktikum Modul 11
â””â”€â”€ README.md                          # Dokumentasi struktur proyek
```

---

## Cara Menjalankan Script SQL

Pastikan MySQL 8.4 (Laragon) aktif pada port `3306`, lalu jalankan:

```bash
mysql -u root < modul11.sql
```

Atau jalankan secara bertahap:

```bash
mysql -u root < sql/01_database.sql
mysql -u root < sql/02_tabel.sql
mysql -u root < sql/03_data_awal.sql
mysql -u root < sql/04_pengujian_json.sql
```
