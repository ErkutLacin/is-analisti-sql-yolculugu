-- =========================================================
-- 08 — JOIN & SELECT FİNAL ALIŞTIRMASI (GÖREV DOSYASI)
-- Bu dosyada çözümler yoktur. Her bölümde TODO görevleri vardır.
-- Çözümler için: cozumler.sql
-- =========================================================

-- =========================
-- 0) HAZIRLIK / VERİ SETİ
-- =========================

-- (İsteğe bağlı) Temizlik
-- DROP TABLE islemler;
-- DROP TABLE urunler;
-- DROP TABLE musteriler;

CREATE TABLE musteriler (
  tckn CHAR(11) PRIMARY KEY,
  ad VARCHAR2(50) NOT NULL,
  sehir VARCHAR2(30) NOT NULL,
  yas NUMBER(2) NOT NULL
);

CREATE TABLE urunler (
  urun_id NUMBER PRIMARY KEY,
  kategori VARCHAR2(30) NOT NULL,
  fiyat NUMBER(10,2) NOT NULL
);

CREATE TABLE islemler (
  islem_id NUMBER PRIMARY KEY,
  tckn CHAR(11) NOT NULL,
  urun_id NUMBER NOT NULL,
  islem_turu VARCHAR2(30) NOT NULL,
  tutar NUMBER(10,2) NOT NULL,
  islem_tarihi DATE NOT NULL
);

-- Musteriler (15)
INSERT INTO musteriler VALUES ('11111111111','Ahmet','Istanbul',28);
INSERT INTO musteriler VALUES ('22222222222','Ayse','Ankara',34);
INSERT INTO musteriler VALUES ('33333333333','Mehmet','Izmir',45);
INSERT INTO musteriler VALUES ('44444444444','Zeynep','Bursa',22);
INSERT INTO musteriler VALUES ('55555555555','Ali','Istanbul',31);
INSERT INTO musteriler VALUES ('66666666666','Fatma','Antalya',29);
INSERT INTO musteriler VALUES ('77777777777','Can','Adana',38);
INSERT INTO musteriler VALUES ('88888888888','Elif','Trabzon',27);
INSERT INTO musteriler VALUES ('99999999999','Burak','Kayseri',41);
INSERT INTO musteriler VALUES ('10101010101','Selin','Eskisehir',36);
INSERT INTO musteriler VALUES ('12121212121','Deniz','Istanbul',30);
INSERT INTO musteriler VALUES ('13131313131','Emre','Ankara',26);
INSERT INTO musteriler VALUES ('14141414141','Merve','Izmir',33);
INSERT INTO musteriler VALUES ('15151515151','Onur','Bursa',37);
INSERT INTO musteriler VALUES ('16161616161','Ece','Antalya',24);

-- Urunler (15)
INSERT INTO urunler VALUES (1,'Elektronik',5000);
INSERT INTO urunler VALUES (2,'Giyim',750);
INSERT INTO urunler VALUES (3,'Gida',200);
INSERT INTO urunler VALUES (4,'Kozmetik',350);
INSERT INTO urunler VALUES (5,'Kitap',120);
INSERT INTO urunler VALUES (6,'Mobilya',4200);
INSERT INTO urunler VALUES (7,'Oyuncak',180);
INSERT INTO urunler VALUES (8,'Spor',950);
INSERT INTO urunler VALUES (9,'Teknoloji',6200);
INSERT INTO urunler VALUES (10,'Ev Aletleri',3000);
INSERT INTO urunler VALUES (11,'Aksesuar',90);
INSERT INTO urunler VALUES (12,'Bahce',800);
INSERT INTO urunler VALUES (13,'Saglik',1500);
INSERT INTO urunler VALUES (14,'Petshop',400);
INSERT INTO urunler VALUES (15,'Kirtasiye',60);

-- Islemler (20)
INSERT INTO islemler VALUES (1,'11111111111',9,'Para Yatirma',1500, DATE '2024-01-15');
INSERT INTO islemler VALUES (2,'22222222222',2,'Para Cekme',500, DATE '2024-01-16');
INSERT INTO islemler VALUES (3,'11111111111',5,'Fatura Odeme',300, DATE '2024-01-17');
INSERT INTO islemler VALUES (4,'33333333333',8,'Para Cekme',700, DATE '2024-01-18');
INSERT INTO islemler VALUES (5,'11111111111',1,'Para Yatirma',2000, DATE '2024-01-19');
INSERT INTO islemler VALUES (6,'44444444444',4,'Fatura Odeme',450, DATE '2024-01-20');
INSERT INTO islemler VALUES (7,'55555555555',10,'Para Yatirma',3200, DATE '2024-01-21');
INSERT INTO islemler VALUES (8,'66666666666',3,'Para Cekme',800, DATE '2024-01-22');
INSERT INTO islemler VALUES (9,'77777777777',12,'Fatura Odeme',600, DATE '2024-01-23');
INSERT INTO islemler VALUES (10,'88888888888',2,'Para Yatirma',900, DATE '2024-01-24');
INSERT INTO islemler VALUES (11,'99999999999',6,'Para Cekme',1100, DATE '2024-01-25');
INSERT INTO islemler VALUES (12,'10101010101',11,'Fatura Odeme',250, DATE '2024-01-26');
INSERT INTO islemler VALUES (13,'12121212121',13,'Para Yatirma',1750, DATE '2024-01-27');
INSERT INTO islemler VALUES (14,'13131313131',7,'Para Cekme',400, DATE '2024-01-28');
INSERT INTO islemler VALUES (15,'14141414141',14,'Fatura Odeme',980, DATE '2024-01-29');
INSERT INTO islemler VALUES (16,'15151515151',9,'Para Yatirma',2200, DATE '2024-01-30');
INSERT INTO islemler VALUES (17,'16161616161',15,'Para Cekme',650, DATE '2024-01-31');
INSERT INTO islemler VALUES (18,'12121212121',3,'Fatura Odeme',300, DATE '2024-02-01');
INSERT INTO islemler VALUES (19,'13131313131',12,'Para Yatirma',1450, DATE '2024-02-02');
INSERT INTO islemler VALUES (20,'15151515151',1,'Para Cekme',500, DATE '2024-02-03');

-- =========================
-- 1) SELECT TEMELLERİ
-- =========================
-- TODO 1.1) musteriler tablosundaki tüm verileri getir.
-- TODO 1.2) musteriler tablosundan sadece ad ve sehir alanlarını getir.
-- TODO 1.3) islemler tablosundaki tüm verileri tutara göre büyükten küçüğe sırala.

-- =========================
-- 2) DISTINCT
-- =========================
-- TODO 2.1) musteriler tablosundaki farklı şehirleri listele.
-- TODO 2.2) islemler tablosundaki farklı işlem türlerini listele.

-- =========================
-- 3) WHERE OPERATÖRLERİ
-- =========================
-- TODO 3.1) Sadece Istanbul’daki müşterileri getir.
-- TODO 3.2) Ankara dışındaki müşterileri getir. (<>)
-- TODO 3.3) Yaşı 30 ve üzeri müşterileri getir. (>=)
-- TODO 3.4) Yaşı 25 ile 35 arasında olan müşterileri getir. (BETWEEN)
-- TODO 3.5) Istanbul, Izmir veya Ankara’da olan müşterileri getir. (IN)
-- TODO 3.6) Adı 'A' ile başlayan müşterileri getir. (LIKE 'A%')
-- TODO 3.7) Tutarı 1000’den büyük işlemleri getir.
-- TODO 3.8) 2024 Ocak ayındaki işlemleri getir. (tarih aralığı)

-- =========================
-- 4) AGGREGATE FONKSİYONLAR
-- =========================
-- TODO 4.1) Toplam müşteri sayısını hesapla. (COUNT)
-- TODO 4.2) Toplam işlem sayısını hesapla. (COUNT)
-- TODO 4.3) Toplam işlem tutarını hesapla. (SUM)
-- TODO 4.4) Ortalama işlem tutarını hesapla. (AVG)
-- TODO 4.5) En düşük ve en yüksek işlem tutarını hesapla. (MIN/MAX)

-- =========================
-- 5) GROUP BY
-- =========================
-- TODO 5.1) İşlem türüne göre işlem sayısını bul. (COUNT + GROUP BY)
-- TODO 5.2) İşlem türüne göre toplam tutarı bul. (SUM + GROUP BY)
-- TODO 5.3) Ürün kategorisine göre ortalama işlem tutarını bul. (JOIN + AVG + GROUP BY)

-- =========================
-- 6) HAVING
-- =========================
-- TODO 6.1) Toplam tutarı 3000’den fazla olan işlem türlerini getir. (HAVING SUM)
-- TODO 6.2) Ortalama tutarı 1000’den büyük olan kategorileri getir. (HAVING AVG)

-- =========================
-- 7) JOIN TEMELLERİ
-- =========================
-- TODO 7.1) INNER JOIN: işlem yapan müşterileri işlemleriyle birlikte listele.
-- TODO 7.2) 3 tablo JOIN: müşteri + işlem + ürün bilgilerini birlikte getir.
-- TODO 7.3) LEFT JOIN: tüm müşterileri işlemleriyle birlikte listele (işlemi yoksa NULL).
-- TODO 7.4) İşlem yapmamış müşterileri bul. (LEFT JOIN + WHERE ... IS NULL)

-- =========================
-- 8) GERÇEK BA RAPORLARI
-- =========================
-- TODO 8.1) Şehre göre toplam işlem tutarını hesapla. (JOIN + SUM + GROUP BY)
-- TODO 8.2) Şehre göre işlem sayısını hesapla ve en çoktan aza sırala. (COUNT + ORDER)
-- TODO 8.3) 30 yaş üstü müşterilerin toplam işlem tutarını hesapla. (WHERE + SUM)
-- TODO 8.4) En çok işlem yapan ilk 3 müşteriyi listele. (COUNT + GROUP BY + ORDER + FETCH FIRST)
-- TODO 8.5) En yüksek toplam tutara sahip müşteriyi bul. (SUM + ORDER + FETCH FIRST 1)
-- TODO 8.6) Şehir + işlem türü kırılımında toplam tutarı hesapla. (GROUP BY 2 kolon)
-- TODO 8.7) Ürün kategorisine göre toplam işlem tutarını hesapla.
-- TODO 8.8) Ortalama işlem tutarı 1000’den büyük şehirleri getir. (HAVING AVG)
-- TODO 8.9) 2024 Ocak ayı işlemlerinin şehir bazında toplamını hesapla. (WHERE tarih + GROUP)

-- Not: Çözümler için cozumler.sql dosyasını aç.
