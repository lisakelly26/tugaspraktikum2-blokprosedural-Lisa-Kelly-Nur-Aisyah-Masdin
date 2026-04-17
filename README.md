TUGAS PRAKTIKUM 2 - PEMROGRAMAN BASIS DATA
---
Anggota: LISA KELLY (IK2411010)
         NUR AISYAH MASDIN (IK2411014)

## 📌 Deskripsi Proyek

Proyek ini merupakan tugas praktikum mata kuliah **Pemrograman Basis Data** yang bertujuan untuk memahami dan mengimplementasikan struktur blok prosedural dalam MySQL. Studi kasus yang digunakan adalah validasi data akademik mahasiswa sebelum proses pengisian KRS.

---

## 🎯 Tujuan

Praktikum ini bertujuan untuk memahami struktur blok prosedural, menyusun program dengan deklarasi dan eksekusi yang benar, serta mengimplementasikan logika sederhana untuk validasi data akademik mahasiswa.

---

## ⚙️ Teknologi yang Digunakan

* MySQL (XAMPP)
* phpMyAdmin
* SQL (Stored Procedure)

---

## 🧩 Fitur Program

Program yang dibuat memiliki beberapa bagian:

* **Bagian A**: Menampilkan identitas mahasiswa
* **Bagian B**: Validasi data akademik
* **Bagian C**: Menentukan kelayakan KRS
* **Bagian D**: Perbandingan dua mahasiswa

---

## 🗂️ Struktur Repository

```
tugaspraktikum2-blokprosedural-namakelompok/
│
├── README.md
├── program.sql
├── laporan.pdf
└── dokumentasi/
    ├── hasil1.png
    ├── hasil2.png
    └── hasil3.png
```

---

## 🧪 Skenario Uji

1. **Data Valid**

   * Semua syarat terpenuhi → Layak KRS

2. **Tidak Valid (Pembayaran)**

   * Status belum lunas → Tidak Layak

3. **Tidak Valid (SKS)**

   * SKS = 0 → Tidak Layak

---

## 📊 Hasil

Program berhasil menampilkan:

* Identitas mahasiswa
* Status validasi data
* Kategori beban studi
* Kategori performa akademik
* Kesimpulan kelayakan KRS

---

## 📝 Kesimpulan

Program berhasil mengimplementasikan blok prosedural dengan baik dalam melakukan validasi data akademik mahasiswa. Logika program berjalan sesuai dengan skenario yang diuji dan menghasilkan output yang sistematis dan informatif.

---

## 📌 Catatan

* Program dijalankan menggunakan MySQL melalui XAMPP
* Tidak menggunakan tabel (atau sesuaikan jika kamu pakai tabel)
* Kode dapat dijalankan tanpa error

