-- =========================================================
-- 07 — WHERE, GROUP BY ve HAVING Alıştırması
-- Konu: Filtreleme ve Gruplama
-- Amaç: Verileri kategorilere ayırarak analiz etmek
-- Bu alıştırma Medium’daki
-- “Oracle SQL’de Filtreleme ve Gruplama — WHERE Operatörleri, GROUP BY ve HAVING”
-- yazısına bağlıdır
-- =========================================================


-- 1️⃣ BELİRLİ BİR KOŞULA GÖRE FİLTRELEME (WHERE)

-- Tutarı 1000’den büyük işlemler
SELECT *
FROM musteri_islemleri
WHERE tutar > 1000;


-- İstanbul ve Ankara’daki işlemler
SELECT *
FROM musteri_islemleri
WHERE sehir IN ('Istanbul', 'Ankara');


-- Yaşı 30 ile 40 arasında olan müşterilerin işlemleri
SELECT *
FROM musteri_islemleri
WHERE yas BETWEEN 30 AND 40;


-- Adı A harfi ile başlayan müşteriler
SELECT *
FROM musteri_islemleri
WHERE musteri_adi LIKE 'A%';


-- 2️⃣ GROUP BY — Şehre Göre İşlem Sayısı

SELECT sehir, COUNT(*) AS islem_sayisi
FROM musteri_islemleri
GROUP BY sehir
ORDER BY islem_sayisi DESC;


-- 3️⃣ GROUP BY — İşlem Türüne Göre Toplam Tutar

SELECT islem_turu, SUM(tutar) AS toplam_tutar
FROM musteri_islemleri
GROUP BY islem_turu
ORDER BY toplam_tutar DESC;


-- 4️⃣ GROUP BY — Şehre Göre Ortalama İşlem Tutarı

SELECT sehir, AVG(tutar) AS ortalama_tutar
FROM musteri_islemleri
GROUP BY sehir
ORDER BY ortalama_tutar DESC;


-- 5️⃣ HAVING — Toplam Tutarı 3000’den Büyük Olan Şehirler

SELECT sehir, SUM(tutar) AS toplam_tutar
FROM musteri_islemleri
GROUP BY sehir
HAVING SUM(tutar) > 3000;


-- 6️⃣ WHERE + GROUP BY + HAVING BİRLİKTE

-- Yaşı 25’ten büyük müşterilerin işlemlerinde,
-- şehir bazında ortalama tutarı 1000’den büyük olan şehirler

SELECT sehir, AVG(tutar) AS ortalama_tutar
FROM musteri_islemleri
WHERE yas > 25
GROUP BY sehir
HAVING AVG(tutar) > 1000;


-- =========================================================
-- 7️⃣ CHALLENGE (Kendi başına dene)
--
-- 1) Sadece "Para Yatirma" işlemlerini al, şehir bazında toplam tutarlarını hesapla
-- 2) Ortalama işlem tutarı 800’den büyük olan işlem türlerini listele
-- 3) 30 yaş altındaki müşterilerin yaptığı işlemleri şehir bazında grupla
-- =========================================================
