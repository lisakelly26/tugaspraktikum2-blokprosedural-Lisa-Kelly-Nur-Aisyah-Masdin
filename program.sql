-- =========================
-- HAPUS JIKA SUDAH ADA
-- =========================
DROP TABLE IF EXISTS akademik;
DROP TABLE IF EXISTS mahasiswa;

-- =========================
-- TABEL MAHASISWA
-- =========================
CREATE TABLE mahasiswa (
    nim VARCHAR(20) PRIMARY KEY,
    nama VARCHAR(50),
    semester INT,
    prodi VARCHAR(50)
);

INSERT INTO mahasiswa VALUES
('IK2411010','Lisa Kelly',4,'Informatika'),
('IK2411014','Nur Aisya Masdin',4,'Informatika');

-- =========================
-- TABEL AKADEMIK
-- =========================
CREATE TABLE akademik (
    nim VARCHAR(20),
    sks INT,
    ipk DECIMAL(3,2),
    status_pembayaran VARCHAR(10)
);

INSERT INTO akademik VALUES
('IK2411010',15,3.25,'LUNAS'),
('IK2411014',20,3.60,'LUNAS');

-- =========================
-- PROCEDURE A (IDENTITAS)
-- =========================
DELIMITER //

DROP PROCEDURE IF EXISTS identitas_mahasiswa //
CREATE PROCEDURE identitas_mahasiswa()
BEGIN
    DECLARE kampus VARCHAR(100) DEFAULT 'Universitas Mega Buana Palopo';

    SELECT CONCAT(
        'Mahasiswa ', nama, ' (', nim, ') dari Program Studi ', prodi,
        ' terdaftar di ', kampus, ' pada semester ', semester, '.'
    ) AS identitas
    FROM mahasiswa;
END //

-- =========================
-- PROCEDURE B (VALIDASI)
-- =========================
DROP PROCEDURE IF EXISTS bagianB_validasi //
CREATE PROCEDURE bagianB_validasi()
BEGIN
    SELECT 
        CONCAT('Status data: ',
            CASE 
                WHEN a.status_pembayaran = 'LUNAS' 
                     AND m.semester > 0 
                     AND a.sks > 0 
                THEN 'Valid'
                ELSE 'Tidak Valid'
            END
        ) AS status_data,

        CONCAT('Beban studi: ',
            CASE 
                WHEN a.sks BETWEEN 1 AND 12 THEN 'Ringan'
                WHEN a.sks BETWEEN 13 AND 18 THEN 'Sedang'
                ELSE 'Padat'
            END
        ) AS beban_studi,

        CONCAT('Performa akademik: ',
            CASE 
                WHEN a.ipk >= 3.50 THEN 'Sangat Baik'
                WHEN a.ipk >= 3.00 THEN 'Baik'
                WHEN a.ipk >= 2.50 THEN 'Cukup'
                ELSE 'Perlu Pembinaan'
            END
        ) AS performa

    FROM mahasiswa m
    JOIN akademik a ON m.nim = a.nim;
END //

-- =========================
-- PROCEDURE C (KRS)
-- =========================
DROP PROCEDURE IF EXISTS bagianC_krs //
CREATE PROCEDURE bagianC_krs()
BEGIN
    SELECT CONCAT(
        'Mahasiswa ', m.nama, ' dengan NIM ', m.nim,
        ' dinyatakan ',
        CASE 
            WHEN a.status_pembayaran = 'LUNAS' 
                 AND m.semester > 0 
                 AND a.sks > 0 
            THEN 'layak mengambil KRS'
            ELSE 'tidak layak mengambil KRS'
        END,
        '. Beban studi ',
        CASE 
            WHEN a.sks BETWEEN 1 AND 12 THEN 'Ringan'
            WHEN a.sks BETWEEN 13 AND 18 THEN 'Sedang'
            ELSE 'Padat'
        END,
        ' dengan performa ',
        CASE 
            WHEN a.ipk >= 3.50 THEN 'Sangat Baik'
            WHEN a.ipk >= 3.00 THEN 'Baik'
            WHEN a.ipk >= 2.50 THEN 'Cukup'
            ELSE 'Perlu Pembinaan'
        END,
        '.'
    ) AS hasil
    FROM mahasiswa m
    JOIN akademik a ON m.nim = a.nim;
END //

-- =========================
-- PROCEDURE D (PERBANDINGAN)
-- =========================
DROP PROCEDURE IF EXISTS bagianD_perbandingan //
CREATE PROCEDURE bagianD_perbandingan()
BEGIN
    SELECT 
    CASE 
        WHEN a1.ipk > a2.ipk THEN 
            CONCAT(m1.nama, ' lebih baik dari ', m2.nama)
        WHEN a2.ipk > a1.ipk THEN 
            CONCAT(m2.nama, ' lebih baik dari ', m1.nama)
        ELSE
            CASE 
                WHEN a1.sks > a2.sks THEN 
                    CONCAT(m1.nama, ' lebih baik (SKS lebih tinggi)')
                WHEN a2.sks > a1.sks THEN 
                    CONCAT(m2.nama, ' lebih baik (SKS lebih tinggi)')
                ELSE 
                    'Keduanya sama'
            END
    END AS kesimpulan

    FROM mahasiswa m1
    JOIN akademik a1 ON m1.nim = a1.nim,
         mahasiswa m2
    JOIN akademik a2 ON m2.nim = a2.nim
    WHERE m1.nim = 'IK2411010'
      AND m2.nim = 'IK2411014';
END //

DELIMITER ;