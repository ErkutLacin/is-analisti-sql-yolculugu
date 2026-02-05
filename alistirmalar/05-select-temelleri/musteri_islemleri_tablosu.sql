-- =========================================================
-- SELECT PRATİK VERİ SETİ
-- Amaç: SELECT, WHERE, DISTINCT, ORDER BY, GROUP BY gibi
-- komutları bol veri üzerinden öğrenmek
-- =========================================================


-- 1️⃣ TABLO OLUŞTURMA

CREATE TABLE musteri_islemleri (
  islem_id NUMBER PRIMARY KEY,
  tckn CHAR(11),
  musteri_adi VARCHAR2(50),
  sehir VARCHAR2(30),
  cinsiyet CHAR(1),
  yas NUMBER(2),
  islem_tarihi DATE,
  islem_turu VARCHAR2(30),
  tutar NUMBER(10,2)
);


-- 2️⃣ ÖRNEK VERİLER (Bol çeşitlilik var)

INSERT INTO musteri_islemleri VALUES (1, '11111111111', 'Ahmet', 'Istanbul', 'E', 28, DATE '2024-01-15', 'Para Yatirma', 1500);
INSERT INTO musteri_islemleri VALUES (2, '22222222222', 'Ayse', 'Ankara', 'K', 34, DATE '2024-01-16', 'Para Cekme', 500);
INSERT INTO musteri_islemleri VALUES (3, '33333333333', 'Mehmet', 'Izmir', 'E', 45, DATE '2024-01-17', 'Fatura Odeme', 300);
INSERT INTO musteri_islemleri VALUES (4, '11111111111', 'Ahmet', 'Istanbul', 'E', 28, DATE '2024-01-18', 'Para Cekme', 700);
INSERT INTO musteri_islemleri VALUES (5, '44444444444', 'Zeynep', 'Bursa', 'K', 22, DATE '2024-01-18', 'Para Yatirma', 2000);
INSERT INTO musteri_islemleri VALUES (6, '55555555555', 'Ali', 'Istanbul', 'E', 31, DATE '2024-01-19', 'Fatura Odeme', 450);
INSERT INTO musteri_islemleri VALUES (7, '66666666666', 'Fatma', 'Ankara', 'K', 29, DATE '2024-01-20', 'Para Yatirma', 3200);
INSERT INTO musteri_islemleri VALUES (8, '33333333333', 'Mehmet', 'Izmir', 'E', 45, DATE '2024-01-21', 'Para Cekme', 800);
INSERT INTO musteri_islemleri VALUES (9, '77777777777', 'Can', 'Antalya', 'E', 38, DATE '2024-01-22', 'Fatura Odeme', 600);
INSERT INTO musteri_islemleri VALUES (10, '88888888888', 'Elif', 'Istanbul', 'K', 27, DATE '2024-01-22', 'Para Yatirma', 900);
INSERT INTO musteri_islemleri VALUES (11, '99999999999', 'Burak', 'Bursa', 'E', 41, DATE '2024-01-23', 'Para Cekme', 1100);
INSERT INTO musteri_islemleri VALUES (12, '10101010101', 'Selin', 'Ankara', 'K', 36, DATE '2024-01-24', 'Fatura Odeme', 250);
INSERT INTO musteri_islemleri VALUES (13, '12121212121', 'Deniz', 'Izmir', 'K', 30, DATE '2024-01-25', 'Para Yatirma', 1750);
INSERT INTO musteri_islemleri VALUES (14, '13131313131', 'Emre', 'Istanbul', 'E', 26, DATE '2024-01-26', 'Para Cekme', 400);
INSERT INTO musteri_islemleri VALUES (15, '14141414141', 'Merve', 'Antalya', 'K', 33, DATE '2024-01-27', 'Fatura Odeme', 980);


-- 3️⃣ KONTROL
SELECT * FROM musteri_islemleri;
