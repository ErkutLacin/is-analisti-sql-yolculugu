-- =========================================================
-- 06 — SELECT ile Veri Analizi Alıştırması
-- Konu: COUNT, SUM, AVG, GROUP BY, HAVING
-- Amaç: Verileri gruplandırarak analiz etmek
-- Bu alıştırma Medium’daki SELECT Analiz yazısına bağlıdır
-- =========================================================


-- 1️⃣ TOPLAM KAÇ İŞLEM VAR?

SELECT COUNT(*) AS toplam_islem_sayisi
FROM musteri_islemleri;
--AS toplam_islem_sayisi -> ifadesinde; mevcuttaki stunun ismi AS stunun su anda gozukmesini istedigimiz isim, yani mevcuttaki stun basliklarimizin isimlerini tablomuzda degistirmeye olanak saglar

-- 2️⃣ TÜM İŞLEMLERİN TOPLAM TUTARI

SELECT SUM(tutar) AS toplam_islem_tutari
FROM musteri_islemleri;


-- 3️⃣ ORTALAMA İŞLEM TUTARI

SELECT AVG(tutar) AS ortalama_islem_tutari
FROM musteri_islemleri;


-- 4️⃣ ŞEHRE GÖRE KAÇ İŞLEM YAPILMIŞ?

SELECT sehir, COUNT(*) AS islem_sayisi
FROM musteri_islemleri
GROUP BY sehir
ORDER BY islem_sayisi DESC;


-- 5️⃣ ŞEHRE GÖRE TOPLAM İŞLEM TUTARI

SELECT sehir, SUM(tutar) AS toplam_tutar
FROM musteri_islemleri
GROUP BY sehir
ORDER BY toplam_tutar DESC;


-- 6️⃣ ŞEHRE GÖRE ORTALAMA İŞLEM TUTARI

SELECT sehir, AVG(tutar) AS ortalama_tutar
FROM musteri_islemleri
GROUP BY sehir
ORDER BY ortalama_tutar DESC;


-- 7️⃣ SADECE TOPLAM TUTARI 3000'DEN FAZLA OLAN ŞEHİRLER

SELECT sehir, SUM(tutar) AS toplam_tutar
FROM musteri_islemleri
GROUP BY sehir
HAVING SUM(tutar) > 3000;


-- =========================================================
-- 8️⃣ CHALLENGE (Kendi başına dene)
--
-- 1) Her işlem türü için toplam işlem tutarını hesapla
-- 2) Ortalama işlem tutarı 1000’den büyük olan şehirleri listele
-- 3) En fazla işlem yapılan şehri bul
-- =========================================================
