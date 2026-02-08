-- =========================================================
-- 06 — Aggregate Fonksiyonlar Alıştırması
-- Konu: COUNT, SUM, AVG, MIN, MAX
-- Amaç: Verileri özetleyerek analiz etmek
-- Bu alıştırma Medium’daki
-- “Oracle SQL'de Verileri Anlamlandırmak — COUNT, SUM, AVG, MIN ve MAX”
-- yazısına bağlıdır
-- =========================================================


-- 1️⃣ TOPLAM KAÇ İŞLEM VAR?

SELECT COUNT(*) AS toplam_islem_sayisi
FROM musteri_islemleri;


-- 2️⃣ TÜM İŞLEMLERİN TOPLAM TUTARI

SELECT SUM(tutar) AS toplam_islem_tutari
FROM musteri_islemleri;


-- 3️⃣ ORTALAMA İŞLEM TUTARI

SELECT AVG(tutar) AS ortalama_islem_tutari
FROM musteri_islemleri;


-- 4️⃣ EN YÜKSEK VE EN DÜŞÜK İŞLEM TUTARI

SELECT MAX(tutar) AS en_yuksek_tutar,
       MIN(tutar) AS en_dusuk_tutar
FROM musteri_islemleri;


-- 5️⃣ BELİRLİ BİR KOŞULA GÖRE ÖZETLEME
-- Sadece İstanbul’daki işlemlerin toplam tutarı

SELECT SUM(tutar) AS istanbul_toplam_tutar
FROM musteri_islemleri
WHERE sehir = 'Istanbul';


-- 6️⃣ BELİRLİ YAŞ ÜZERİNDEKİ MÜŞTERİLERİN ORTALAMA İŞLEM TUTARI

SELECT AVG(tutar) AS ortalama_tutar_30_yas_ustu
FROM musteri_islemleri
WHERE yas > 30;


-- =========================================================
-- 7️⃣ CHALLENGE (Kendi başına dene)
--
-- 1) Ankara’daki işlemlerin ortalama tutarını hesapla
-- 2) "Para Yatirma" işlemlerinin toplam tutarını bul
-- 3) 2024 yılı Ocak ayındaki işlemlerin en yüksek tutarını bul
-- =========================================================
