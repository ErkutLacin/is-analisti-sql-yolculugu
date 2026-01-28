-- 02 — Veri Tipleri Alıştırması

CREATE TABLE ba_musteriler (
  musteri_id NUMBER(6),
  ad VARCHAR2(30),
  soyad VARCHAR2(30),
  ulke_kodu CHAR(2),
  dogum_tarihi DATE,
  bakiye NUMBER(10,2)
);

INSERT INTO ba_musteriler VALUES (101, 'Ahmet', 'Yilmaz', 'TR', DATE '1998-04-12', 1250.50);
INSERT INTO ba_musteriler VALUES (102, 'Ayse', 'Demir', 'TR', DATE '2000-11-03', 0);
INSERT INTO ba_musteriler VALUES (103, 'Can', 'Tekin', 'TR', DATE '1995-07-25', 25000.99);

SELECT * FROM ba_musteriler;
SELECT * FROM ba_musteriler WHERE bakiye > 1000;
SELECT * FROM ba_musteriler ORDER BY bakiye DESC;
