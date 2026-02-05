-- =========================================================
-- 05 — SELECT Temelleri Alıştırması
-- Konu: SELECT, WHERE, DISTINCT, ORDER BY
-- Amaç: Veriyi görüntüleme ve filtreleme pratikleri
-- Bu alıştırma Medium’daki SELECT Temelleri yazısına bağlıdır
-- =========================================================


-- 1️⃣ TÜM VERİYİ GÖRÜNTÜLEME

-- Tablodaki tüm kayıtları ve tüm sütunları getir
SELECT * FROM musteri_islemleri;


-- 2️⃣ BELİRLİ SÜTUNLARI SEÇME

-- Sadece müşteri adı ve şehir bilgilerini getir
SELECT musteri_adi, sehir
FROM musteri_islemleri;


-- 3️⃣ WHERE İLE FİLTRELEME

-- Tutarı 1000'den büyük olan işlemleri getir
SELECT *
FROM musteri_islemleri
WHERE tutar > 1000;


-- İstanbul'da yapılan işlemleri getir
SELECT *
FROM musteri_islemleri
WHERE sehir = 'Istanbul';


-- 4️⃣ NULL DEĞER KONTROLÜ (örnek senaryo)
-- Eğer bazı alanlar boş olsaydı şöyle kontrol ederdik:
-- SELECT * FROM musteri_islemleri WHERE email IS NULL;


-- 5️⃣ DISTINCT — TEKRARSIZ DEĞERLER

-- Hangi şehirlerden işlem yapılmış?
SELECT DISTINCT sehir
FROM musteri_islemleri;


-- Kaç farklı işlem türü var?
SELECT DISTINCT islem_turu
FROM musteri_islemleri;


-- 6️⃣ ORDER BY — SIRALAMA

-- İşlemleri tutara göre büyükten küçüğe sırala
SELECT *
FROM musteri_islemleri
ORDER BY tutar DESC;


-- İşlemleri tarihe göre eskiden yeniye sırala
SELECT *
FROM musteri_islemleri
ORDER BY islem_tarihi ASC;


-- =========================================================
-- 7️⃣ CHALLENGE (Kendi başına dene)
--
-- 1) Yaşı 30'dan büyük müşterilerin işlemlerini getir
-- 2) Ankara'da yapılan ve tutarı 500'den büyük işlemleri listele
-- 3) En yüksek tutarlı 3 işlemi getir
-- =========================================================
