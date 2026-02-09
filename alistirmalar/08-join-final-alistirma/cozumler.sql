-- =========================================================
-- 08 — JOIN & SELECT FİNAL ALIŞTIRMASI (ÇÖZÜMLER)
-- Bu dosya join_select_final_alistirma.sql içindeki TODO’ların çözümleridir.
-- =========================================================

-- =========================
-- 1) SELECT TEMELLERİ — ÇÖZÜMLER
-- =========================

-- 1.1
SELECT *
FROM musteriler;

-- 1.2
SELECT ad, sehir
FROM musteriler;

-- 1.3
SELECT *
FROM islemler
ORDER BY tutar DESC;


-- =========================
-- 2) DISTINCT — ÇÖZÜMLER
-- =========================

-- 2.1
SELECT DISTINCT sehir
FROM musteriler;

-- 2.2
SELECT DISTINCT islem_turu
FROM islemler;


-- =========================
-- 3) WHERE OPERATÖRLERİ — ÇÖZÜMLER
-- =========================

-- 3.1
SELECT *
FROM musteriler
WHERE sehir = 'Istanbul';

-- 3.2
SELECT *
FROM musteriler
WHERE sehir <> 'Ankara';

-- 3.3
SELECT *
FROM musteriler
WHERE yas >= 30;

-- 3.4
SELECT *
FROM musteriler
WHERE yas BETWEEN 25 AND 35;

-- 3.5
SELECT *
FROM musteriler
WHERE sehir IN ('Istanbul','Izmir','Ankara');

-- 3.6
SELECT *
FROM musteriler
WHERE ad LIKE 'A%';

-- 3.7
SELECT *
FROM islemler
WHERE tutar > 1000;

-- 3.8
SELECT *
FROM islemler
WHERE islem_tarihi BETWEEN DATE '2024-01-01' AND DATE '2024-01-31';


-- =========================
-- 4) AGGREGATE FONKSİYONLAR — ÇÖZÜMLER
-- =========================

-- 4.1
SELECT COUNT(*) AS musteri_sayisi
FROM musteriler;

-- 4.2
SELECT COUNT(*) AS islem_sayisi
FROM islemler;

-- 4.3
SELECT SUM(tutar) AS toplam_tutar
FROM islemler;

-- 4.4
SELECT AVG(tutar) AS ortalama_tutar
FROM islemler;

-- 4.5
SELECT MIN(tutar) AS min_tutar,
       MAX(tutar) AS max_tutar
FROM islemler;


-- =========================
-- 5) GROUP BY — ÇÖZÜMLER
-- =========================

-- 5.1
SELECT islem_turu, COUNT(*) AS islem_sayisi
FROM islemler
GROUP BY islem_turu
ORDER BY islem_sayisi DESC;

-- 5.2
SELECT islem_turu, SUM(tutar) AS toplam_tutar
FROM islemler
GROUP BY islem_turu
ORDER BY toplam_tutar DESC;

-- 5.3
SELECT u.kategori, AVG(i.tutar) AS ortalama_tutar
FROM islemler i
JOIN urunler u ON i.urun_id = u.urun_id
GROUP BY u.kategori
ORDER BY ortalama_tutar DESC;


-- =========================
-- 6) HAVING — ÇÖZÜMLER
-- =========================

-- 6.1
SELECT islem_turu, SUM(tutar) AS toplam_tutar
FROM islemler
GROUP BY islem_turu
HAVING SUM(tutar) > 3000;

-- 6.2
SELECT u.kategori, AVG(i.tutar) AS ortalama_tutar
FROM islemler i
JOIN urunler u ON i.urun_id = u.urun_id
GROUP BY u.kategori
HAVING AVG(i.tutar) > 1000;


-- =========================
-- 7) JOIN TEMELLERİ — ÇÖZÜMLER
-- =========================

-- 7.1 INNER JOIN
SELECT m.ad, m.sehir, i.islem_turu, i.tutar, i.islem_tarihi
FROM musteriler m
JOIN islemler i ON m.tckn = i.tckn
ORDER BY i.islem_tarihi;

-- 7.2 3 tablo JOIN
SELECT m.ad,
       m.sehir,
       i.islem_turu,
       i.tutar,
       u.kategori,
       u.fiyat
FROM musteriler m
JOIN islemler i ON m.tckn = i.tckn
JOIN urunler u ON i.urun_id = u.urun_id
ORDER BY m.ad;

-- 7.3 LEFT JOIN
SELECT m.tckn, m.ad, i.islem_id, i.tutar
FROM musteriler m
LEFT JOIN islemler i ON m.tckn = i.tckn
ORDER BY m.ad, i.islem_id;

-- 7.4 İşlem yapmamış müşteriler
SELECT m.ad
FROM musteriler m
LEFT JOIN islemler i ON m.tckn = i.tckn
WHERE i.islem_id IS NULL
ORDER BY m.ad;


-- =========================
-- 8) GERÇEK BA RAPORLARI — ÇÖZÜMLER
-- =========================

-- 8.1 Şehre göre toplam tutar
SELECT m.sehir, SUM(i.tutar) AS toplam_tutar
FROM musteriler m
JOIN islemler i ON m.tckn = i.tckn
GROUP BY m.sehir
ORDER BY toplam_tutar DESC;

-- 8.2 Şehre göre işlem sayısı
SELECT m.sehir, COUNT(*) AS islem_sayisi
FROM musteriler m
JOIN islemler i ON m.tckn = i.tckn
GROUP BY m.sehir
ORDER BY islem_sayisi DESC;

-- 8.3 30 yaş üstü toplam tutar
SELECT SUM(i.tutar) AS toplam_tutar_30_ustu
FROM musteriler m
JOIN islemler i ON m.tckn = i.tckn
WHERE m.yas > 30;

-- 8.4 En çok işlem yapan ilk 3 müşteri
SELECT m.ad, COUNT(i.islem_id) AS islem_sayisi
FROM musteriler m
JOIN islemler i ON m.tckn = i.tckn
GROUP BY m.ad
ORDER BY islem_sayisi DESC
FETCH FIRST 3 ROWS ONLY;

-- 8.5 En yüksek toplam tutara sahip müşteri
SELECT m.ad, SUM(i.tutar) AS toplam_tutar
FROM musteriler m
JOIN islemler i ON m.tckn = i.tckn
GROUP BY m.ad
ORDER BY toplam_tutar DESC
FETCH FIRST 1 ROW ONLY;

-- 8.6 Şehir + işlem türü kırılımı
SELECT m.sehir, i.islem_turu, SUM(i.tutar) AS toplam_tutar
FROM musteriler m
JOIN islemler i ON m.tckn = i.tckn
GROUP BY m.sehir, i.islem_turu
ORDER BY m.sehir, toplam_tutar DESC;

-- 8.7 Kategoriye göre toplam işlem tutarı
SELECT u.kategori, SUM(i.tutar) AS toplam_tutar
FROM islemler i
JOIN urunler u ON i.urun_id = u.urun_id
GROUP BY u.kategori
ORDER BY toplam_tutar DESC;

-- 8.8 Ortalama tutarı 1000’den büyük şehirler
SELECT m.sehir, AVG(i.tutar) AS ortalama_tutar
FROM musteriler m
JOIN islemler i ON m.tckn = i.tckn
GROUP BY m.sehir
HAVING AVG(i.tutar) > 1000
ORDER BY ortalama_tutar DESC;

-- 8.9 Ocak işlemlerinin şehir bazında toplamı
SELECT m.sehir, SUM(i.tutar) AS toplam_tutar
FROM musteriler m
JOIN islemler i ON m.tckn = i.tckn
WHERE i.islem_tarihi BETWEEN DATE '2024-01-01' AND DATE '2024-01-31'
GROUP BY m.sehir
ORDER BY toplam_tutar DESC;
