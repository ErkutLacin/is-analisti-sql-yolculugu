-- =========================================================
-- 04 — DML Komutları Alıştırması
-- Konu: INSERT, UPDATE, DELETE ve SELECT
-- Amaç: Tablolara veri eklemek, güncellemek ve silmek
-- =========================================================


-- 1️⃣ TABLO OLUŞTURMA
-- Bu tabloda basit bir müşteri sistemi simüle ediyoruz.

CREATE TABLE musteriler (
  tckn CHAR(11) PRIMARY KEY,
  ad VARCHAR2(50) NOT NULL,
  soyad VARCHAR2(50) NOT NULL,
  email VARCHAR2(100) UNIQUE,
  dogum_tarihi DATE,
  bakiye NUMBER(10,2)
);


-- =========================================================
-- 2️⃣ INSERT — Veri Ekleme
-- =========================================================

INSERT INTO musteriler (tckn, ad, soyad, email, dogum_tarihi, bakiye)
VALUES ('12345678901', 'Ahmet', 'Yilmaz', 'ahmet@example.com', DATE '1998-04-12', 1250.50);

INSERT INTO musteriler (tckn, ad, soyad, email, dogum_tarihi, bakiye)
VALUES ('23456789012', 'Ayse', 'Demir', NULL, DATE '2000-11-03', 0);

INSERT INTO musteriler (tckn, ad, soyad, email, dogum_tarihi, bakiye)
VALUES ('34567890123', 'Can', 'Tekin', 'can@example.com', DATE '1995-07-25', 25000.99);


-- Eklenen verileri kontrol edelim
SELECT * FROM musteriler;


-- =========================================================
-- 3️⃣ UPDATE — Veri Güncelleme
-- =========================================================

-- Ahmet'in email adresini güncelle
UPDATE musteriler
SET email = 'ahmet.yilmaz@example.com'
WHERE tckn = '12345678901';

-- Ayşe'nin bakiyesini güncelle
UPDATE musteriler
SET bakiye = 500.00
WHERE tckn = '23456789012';

-- Güncellenmiş verileri kontrol edelim
SELECT * FROM musteriler;


-- =========================================================
-- 4️⃣ DELETE — Veri Silme
-- =========================================================

-- Can Tekin kaydını sil
DELETE FROM musteriler
WHERE tckn = '34567890123';

-- Silme işleminden sonra tabloyu kontrol edelim
SELECT * FROM musteriler;


-- =========================================================
-- 5️⃣ CHALLENGE (İSTEĞE BAĞLI)
-- Aşağıdaki görevleri kendin yapmayı dene:
--
-- 1) Yeni bir müşteri ekle
-- 2) Bir müşterinin bakiyesini artır
-- 3) Email’i NULL olan müşterileri listele
-- =========================================================


-- =========================================================
-- 6️⃣ TEMİZLİK (İsteğe bağlı)
-- DROP TABLE musteriler;
-- =========================================================
