-- =========================================================
-- 02 — Veri Tipleri Alıştırması (Oracle SQL)
-- Amaç: Temel veri tiplerini pratik etmek ve iş analizi
-- bakış açısıyla veri alanlarını anlamak.
-- =========================================================


-- 1️⃣ TABLO OLUŞTURMA
-- Bu tabloda bir müşteri listesini temsil ediyoruz.
-- Her sütun, iş kurallarının veri tabanındaki karşılığıdır.

CREATE TABLE ba_musteriler (

  -- Müşteri kimliği (benzersiz olması beklenir)
  -- NUMBER(6) → En fazla 6 basamaklı sayı saklanabilir
  musteri_id NUMBER(6),

  -- Müşterinin adı
  -- VARCHAR2(30) → Maksimum 30 karakter, değişken uzunluk
  ad VARCHAR2(30),

  -- Müşterinin soyadı
  soyad VARCHAR2(30),

  -- Ülke kodu
  -- CHAR(2) → Sabit uzunluk, her zaman 2 karakter (TR, US gibi)
  ulke_kodu CHAR(2),

  -- Doğum tarihi
  -- DATE → Oracle'da tarih + saat bilgisi içerir
  dogum_tarihi DATE,

  -- Hesap bakiyesi
  -- NUMBER(10,2) → Toplam 10 basamak, 2’si ondalık
  -- Finansal verilerde ondalık hassasiyet önemlidir
  bakiye NUMBER(10,2)
);


-- =========================================================
-- 2️⃣ VERİ EKLEME (INSERT)
-- Örnek müşteri kayıtları ekliyoruz
-- =========================================================

INSERT INTO ba_musteriler VALUES (
  101,                -- musteri_id
  'Ahmet',            -- ad
  'Yilmaz',           -- soyad
  'TR',               -- ulke_kodu (CHAR olduğu için 2 karakter)
  DATE '1998-04-12',  -- dogum_tarihi (ISO formatta yazıldı)
  1250.50             -- bakiye
);

INSERT INTO ba_musteriler VALUES (
  102,
  'Ayse',
  'Demir',
  'TR',
  DATE '2000-11-03',
  0                   -- Bakiye 0 olabilir (iş kuralı kontrolü için önemli)
);

INSERT INTO ba_musteriler VALUES (
  103,
  'Can',
  'Tekin',
  'TR',
  DATE '1995-07-25',
  25000.99
);


-- =========================================================
-- 3️⃣ TEMEL SORGULAR (SELECT)
-- Bu sorgular veri tiplerinin kullanımını pekiştirir
-- =========================================================


-- 3.1 Tüm müşterileri listele
-- * tüm sütunları getirir
SELECT * FROM ba_musteriler;


-- 3.2 Bakiyesi 1000’den büyük olan müşterileri getir
-- NUMBER veri tipinde karşılaştırma yapıyoruz
SELECT *
FROM ba_musteriler
WHERE bakiye > 1000;


-- 3.3 Müşterileri bakiyeye göre büyükten küçüğe sırala
-- Sayısal sıralama örneği
SELECT *
FROM ba_musteriler
ORDER BY bakiye DESC;
