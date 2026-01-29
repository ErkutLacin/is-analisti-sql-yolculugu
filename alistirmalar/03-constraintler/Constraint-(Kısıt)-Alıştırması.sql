-- =========================================================
-- 03 — Constraint (Kısıt) Alıştırması
-- Konu: NOT NULL, PRIMARY KEY ve UNIQUE
-- Amaç: İş kurallarının veri tabanına nasıl yansıtıldığını görmek
-- =========================================================


-- 1️⃣ TABLO OLUŞTURMA
-- Senaryo: Bir müşteri kayıt sistemi tasarlıyoruz.
-- Her müşteri için bazı bilgiler zorunlu, bazıları opsiyonel.

CREATE TABLE musteriler (

  -- TCKN: Her vatandaş için benzersiz ve zorunlu
  -- PRIMARY KEY → Hem boş olamaz hem de tekrarlanamaz
  tckn CHAR(11) PRIMARY KEY,

  -- Müşteri adı: Zorunlu bilgi
  ad VARCHAR2(50) NOT NULL,

  -- Müşteri soyadı: Zorunlu bilgi
  soyad VARCHAR2(50) NOT NULL,

  -- Email: Herkesin email’i olmayabilir ama varsa benzersiz olmalı
  email VARCHAR2(100) UNIQUE,

  -- Doğum tarihi: Opsiyonel olabilir
  dogum_tarihi DATE
);


-- =========================================================
-- 2️⃣ GEÇERLİ VERİ EKLEME (Sorunsuz çalışmalı)
-- =========================================================

INSERT INTO musteriler VALUES (
  '12345678901',
  'Ahmet',
  'Yilmaz',
  'ahmet@example.com',
  DATE '1998-04-12'
);

INSERT INTO musteriler VALUES (
  '23456789012',
  'Ayse',
  'Demir',
  NULL,               -- Email zorunlu değil
  DATE '2000-11-03'
);


-- =========================================================
-- 3️⃣ HATALI SENARYOLAR (Çalıştırınca hata vermesi BEKLENİR)
-- =========================================================

-- ❌ Aynı TCKN ile ikinci kayıt → PRIMARY KEY ihlali
-- INSERT INTO musteriler VALUES (
--   '12345678901',
--   'Mehmet',
--   'Kaya',
--   'mehmet@example.com',
--   DATE '1995-05-10'
-- );

-- ❌ Ad boş → NOT NULL ihlali
-- INSERT INTO musteriler VALUES (
--   '34567890123',
--   NULL,
--   'Kara',
--   'kara@example.com',
--   DATE '1992-02-02'
-- );

-- ❌ Aynı email ikinci kez → UNIQUE ihlali
-- INSERT INTO musteriler VALUES (
--   '45678901234',
--   'Can',
--   'Tekin',
--   'ahmet@example.com',
--   DATE '1995-07-25'
-- );


-- =========================================================
-- 4️⃣ VERİLERİ GÖRÜNTÜLEME
-- =========================================================

SELECT * FROM musteriler;


-- =========================================================
-- 5️⃣ TEMİZLİK (İsteğe bağlı)
-- DROP TABLE musteriler;
-- =========================================================
