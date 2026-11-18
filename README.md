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
|-- sql/
|   |-- 01_database.sql                # Identifikasi DBMS & pembuatan database sistem_laundry
|   |-- 02_tabel.sql                   # DDL 8 tabel SIM-LAUNDRY (relasional + kolom JSON)
|   |-- 03_data_awal.sql               # DML data awal kategori, layanan JSON, layanan_objek & transaksi
|   `-- 04_pengujian_json.sql          # Pengujian JSON_EXTRACT, JSON_SET, JSON_REMOVE, JOIN & ROLLBACK
|-- dokumentasi/
|   |-- perbandingan_dbms.pdf          # Laporan perbandingan 3 DBMS (MySQL, PostgreSQL, MongoDB)
|   |-- perbandingan_dbms.docx         # Dokumen Word perbandingan 3 DBMS
|   |-- analisis_objek.pdf             # Laporan analisis basis data berorientasi objek
|   |-- analisis_objek.docx            # Dokumen Word analisis basis data berorientasi objek
|   |-- lingkup_penerapan.pdf          # Laporan analisis lingkup penerapan SIM-LAUNDRY
|   |-- lingkup_penerapan.docx         # Dokumen Word analisis lingkup penerapan SIM-LAUNDRY
|   `-- hasil_pengujian.txt            # Log output eksekusi query MySQL 8.4.3
|-- diagram/
|   `-- pemodelan_objek.png            # UML Class Diagram Entitas ERD & Inheritance Layanan SIM-LAUNDRY
|-- bukti/
|   |-- 01_identifikasi_dbms.png       # Screenshot CLI identifikasi versi, engine, charset & JSON
|   |-- 01_identifikasi_dbms_2.png     # Lanjutan identifikasi database aktif
|   |-- 02_pembuatan_tabel.png         # Screenshot CLI pembuatan tabel relasional & kolom JSON
|   |-- 02_pembuatan_tabel_2.png       # Lanjutan DDL tabel transaksi & DESCRIBE
|   |-- 03_insert_data_json.png        # Screenshot CLI pengisian data awal pengguna & kategori
|   |-- 03_insert_data_json_2.png      # Lanjutan pengisian data awal layanan JSON
|   |-- 03_insert_data_json_3.png      # Lanjutan pengisian layanan_objek & transaksi pesanan
|   |-- 03_insert_data_json_4.png      # Hasil SELECT verifikasi data awal
|   |-- 04_baca_atribut_json.png       # Screenshot CLI JSON_EXTRACT, JSON_UNQUOTE, dan ->>
|   |-- 05_manipulasi_json.png         # Screenshot CLI JSON_SET & JSON_REMOVE
|   |-- 06_pencarian_json.png          # Screenshot CLI pencarian atribut JSON & JSON_CONTAINS
|   |-- 07_fungsi_json_dan_objek.png   # Screenshot CLI JSON_OBJECT, JSON_ARRAY, JSON_VALID, JSON_LENGTH
|   |-- 07_fungsi_json_dan_objek_2.png # Lanjutan query layanan_objek & JOIN relasional
|   |-- 08_transaksi_rollback.png      # Screenshot CLI pengujian START TRANSACTION & ROLLBACK
|   |-- 09_phpmyadmin_struktur_db.png  # Screenshot phpMyAdmin struktur 8 tabel sistem_laundry
|   |-- 10_phpmyadmin_data_json.png    # Screenshot phpMyAdmin data kolom JSON tabel layanan
|   `-- 11_git_repository.png          # Screenshot bukti pengelolaan repository Git
|-- modul11.sql                        # Gabungan seluruh script SQL (01 s.d. 04)
|-- worksheet_modul11.pdf              # Laporan lembar kerja utama praktikum Modul 11 (PDF)
|-- worksheet_modul11.docx             # Dokumen Word lembar kerja utama praktikum Modul 11
`-- README.md                          # Dokumentasi struktur proyek
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
