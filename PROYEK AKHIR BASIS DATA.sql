----------------------------- REPORT UNTUK SETIAP ENTITAS -----------------------------------------------
------------------------------------- TABEL USER -----------------------------------
CREATE TABLE uuser(
	User_ID INT PRIMARY KEY,
	Email Varchar(20) NOT NULL,
	Name VarChar(256) NOT NULL,
	Password Varchar(20) NOT NULL,
	Tanggal_Bergabung Date
);

INSERT INTO uuser
Values
(207, 'alfareza@gmail.com', 'Reza', 'reza23', '2024-08-21'),
(234, 'akmddany@gmail.com', 'Dany', 'danydakar231', '2024-08-21'),
(094, 'tyo@gmail.com', 'Tio', 'tio19', '2024-11-15'),
(465, 'kemal@gmail.com', 'Kemal', 'kemal21', '2024-11-20'),
(587, 'omar@gmail.com', 'Omar', 'omar22', '2024-11-21'),
(965, 'kevin@gmail.com', 'Kevin', 'kevin24', '2024-11-21'),
(543, 'fira@gmail.com', 'Fira', 'fira23', '2024-11-22'),
(875, 'kemas@gmail.com', 'Kemas', 'kemas25', '2024-11-25'),
(087, 'nadila@gmail.com', 'Nadila', 'nadila28', '2024-11-28'),
(050, 'zafira@gmail.com', 'Zafira', 'zafira01', '2024-12-01'),
(200, 'andreas@gmail.com', 'Andreas', 'iyas24', '2024-10-21'),
(064, 'raihan@gmail.com', 'Raihan', 'raihan02', '2024-11-02'),
(108, 'rakan@gmail.com', 'Rakan', 'rakan14', '2024-11-14'),
(109, 'mamad@gmail.com', 'Mamad', 'mamad15', '2024-11-15'),
(201, 'hizkia@gmail.com', 'Hizkia', 'hizkia17', '2024-11-17'),
(204, 'aqsa@gmail.com', 'Aqsa', 'aqsa20', '2024-11-20'),
(210, 'faiz@gmail.com', 'Faiz', 'faiz21', '2024-11-21'),
(212, 'zaky@gmail.com', 'Zaky', 'zaky21', '2024-11-21'),
(214, 'rizki@gmail.com', 'Rizki', 'rizki22', '2024-11-22'),
(215, 'putri@gmail.com', 'Putri', 'putri22', '2024-11-22'),
(218, 'dewi@gmail.com', 'Dewi', 'dewi23', '2024-11-23'),
(221, 'rafi@gmail.com', 'Rafi', 'rafi24','2024-11-24');

SELECT * FROM uuser ; 

----------------------------------------- TABEL LANGGANAN ----------------------------------------------
CREATE TABLE langganan(
	jenis_paket VARCHAR(20),
	tanggal_langganan Date,
	harga_perbulan INT,
	deskripsi_paket VARCHAR(200)
);

INSERT INTO langganan
Values
('Paket A','2024-08-21','300','Akses dengan durasi 1 Bulan',207),
('Paket B','2024-08-21','500','Akses dengan durasi 3 Bulan',234),
('Paket C','2024-11-15','800','Akses dengan durasi 6 Bulan',094),
('Paket B','2024-11-20','500','Akses dengan durasi 3 Bulan',465),
('Paket B','2024-11-21','500','Akses dengan durasi 3 Bulan',587),
('Paket C','2024-11-21','800','Akses dengan durasi 6 Bulan',965),
('Paket A','2024-11-22','300','Akses dengan durasi 1 Bulan',543),
('Paket C','2024-11-25','800','Akses dengan durasi 6 Bulan',875),
('Paket A','2024-11-28','300','Akses dengan durasi 1 Bulan',087),
('Paket B','2024-12-01','500','Akses dengan durasi 3 Bulan',050);

ALTER TABLE langganan
ADD User_ID INT REFERENCES uuser (User_ID);

ALTER TABLE langganan
ADD id_langganan INT REFERENCES DetailLangganan(id_langganan);

ALTER TABLE langganan
ADD id_pembayaran INT REFERENCES pembayaran(id_pembayaran);

UPDATE langganan
SET id_langganan = l.id_langganan
FROM DetailLangganan l
WHERE Langganan.user_id = l.user_id;

UPDATE langganan
SET id_pembayaran = l.id_pembayaran
FROM pembayaran l
WHERE Langganan.user_id = l.user_id;

SELECT * FROM langganan; 
DROP TABLE langganan;



--------------------------------------- TABEL DETAIL LANGGANAN ----------------------------------------
CREATE TABLE DetailLangganan(
	ID_langganan INT PRIMARY KEY,
	Tanggal_Mulai DATE,
	Tanggal_Berakhir DATE,
	Status_Langganan Varchar(200)
);

INSERT INTO DetailLangganan
Values
(10001, '2024-08-21', '2024-09-21', 'Lama',207),
(10002, '2024-08-21', '2024-10-21', 'Lama',234),
(10003, '2024-11-15', '2025-02-15', 'Baru',94),
(10004, '2024-11-20', '2025-01-20', 'Baru',465),
(10005, '2024-11-21', '2025-01-21', 'Baru',587),
(10006, '2024-11-21', '2025-02-21', 'Baru',965),
(10007, '2024-11-22', '2024-12-22', 'Baru',543),
(10008, '2024-11-25', '2025-02-25', 'Baru',875),
(10009, '2024-11-28', '2024-12-28', 'Baru',87),
(10010, '2024-12-01','2025-02-01', 'Baru',50);

ALTER TABLE DetailLangganan
ADD User_ID INT REFERENCES uuser (User_ID);

SELECT * FROM DetailLangganan ; 


------------------------------------------------ TABEL PEMBELIAN -------------------------------------
CREATE TABLE Pembelian(
	Nama_buku Varchar(200),
	Tanggal_pembelian Date,
	Harga_ebook INT
);

INSERT INTO Pembelian
Values
('Malin Kundang', '2024-09-15', '30', 200),
('Timun Mas', '2024-09-15', '30', 64),
('Transformers', '2024-10-17', '100', 108),
('Doraemon', '2024-10-21', '45', 109),
('Naruto', '2024-11-02', '45', 201),
('Dasar SQL', '2024-11-14', '100', 204),
('Roro Jongrang', '2024-11-15', '30', 210),
('Dasar C++', '2024-11-17', '100', 212),
('Dilan 1990', '2024-11-20', '90', 214),
('Milea 1992', '2024-11-21', '90', 215),
('Danur', '2024-11-21', '90', 218),
('Dasar Java', '2024-11-22','100',221);

DROP TABLE Pembelian;

ALTER TABLE pembelian
ADD User_ID INT REFERENCES uuser (User_ID);

ALTER TABLE pembelian
ADD ID_Pembelian INT REFERENCES DetailPembelian (ID_Pembelian);

UPDATE Pembelian
SET ID_Pembelian = l.ID_Pembelian
FROM DetailPembelian l
WHERE Pembelian.user_id = l.user_id;

SELECT * FROM Pembelian ;

----------------------------------------------- TABEL DETAIL PEMBELIAN -------------------------------
CREATE TABLE DetailPembelian(
	Daftar_Buku_yang_dibeli VarChar(256),
	Tanggal_Pembelian_Ebook Date,
	Harga_Ebook Varchar(200),
	ID_Pembelian INT PRIMARY KEY,
	user_id INT REFERENCES uuser(user_id),
	kategori_buku Varchar(200),
	kategori_pembeli Varchar(200)
);

INSERT INTO DetailPembelian
Values
('Malin Kundang', '2024-09-15', '30', 20001, 200, 'Cerita Rakyat', 'Lama'),
('Timun Mas', '2024-09-15', '30', 20002, 064, 'Cerita Rakyat', 'Lama'),
('Transformers', '2024-10-17', '100', 20003, 108, 'Fiksi', 'Lama'),
('Doraemon', '2024-10-21', '45', 20004, 109, 'Komik', 'Lama'),
('Naruto', '2024-11-02', '45', 20005, 201, 'Komik', 'Baru'),
('Dasar SQL', '2024-11-14', '100', 20006, 204, 'Pengetahuan', 'Baru'),
('Roro Jongrang', '2024-11-15', '30', 20007, 210, 'Cerita Rakyat', 'Baru'),
('Dasar C++', '2024-11-17', '100', 20008, 212, 'Pengetahuan', 'Baru'),
('Dilan 1990', '2024-11-20', '90', 20009, 214, 'Novel', 'Baru'),
('Milea 1992', '2024-11-21', '90', 20010, 215, 'Novel', 'Baru'),
('Danur', '2024-11-21', '90', 20011, 218, 'Novel', 'Baru'),
('Dasar Java', '2024-11-22', '100', 20012, 221, 'Pengetahuan', 'Baru');

SELECT * FROM DetailPembelian ;
DROP TABLE DetailPembelian CASCADE;



--------------------------------- RELASI PEMBELIAN TO PEMBAYARAN ---------------------------
CREATE TABLE Membuat(
	user_id INT REFERENCES uuser(user_id),
	id_pembelian INT REFERENCES detailpembelian(id_pembelian),
	id_pembayaran INT REFERENCES PEMBAYARAN(id_pembayaran)
);

INSERT INTO Membuat (user_id)
Values
(200),
(64),
(108),
(109),
(201),
(204),
(210),
(212),
(214),
(215),
(218),
(221);

UPDATE membuat
SET id_pembelian = l.id_pembelian
FROM detailpembelian l
WHERE membuat.user_id = l.user_id;

UPDATE membuat
SET id_pembayaran = l.id_pembayaran
FROM pembayaran l
WHERE membuat.user_id = l.user_id;

SELECT * FROM Membuat;

ALTER TABLE membuat
DROP COLUMN user_id;


----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
---------------------------------------- TABEL PEMBAYARAN -------------------------------------------
CREATE TABLE PEMBAYARAN(
	ID_pembayaran INT PRIMARY KEY,
	Jenis_Transaksi VarChar(200),
	Metode_Pembayaran VarChar (200),
	Total_Harga INT,
	Tanggal_Pembayaran Date
);

INSERT INTO PEMBAYARAN
Values
(10301, 'Langganan', 'Transfer Bank', 300, '2024-10-26',207),
(10302, 'Langganan', 'Transfer Bank', 500, '2024-10-31',234),
(10303, 'Langganan', 'Transfer Bank', 800, '2024-11-21',94),
(10304, 'Langganan', 'Pulsa', 500, '2024-11-20',465),
(10305, 'Langganan', 'Pulsa', 500, '2024-11-21',587),
(10306, 'Langganan', 'E-Wallet', 800, '2024-11-21',965),
(10307, 'Langganan', 'E-Wallet', 300, '2024-11-22',543),
(10308, 'Langganan', 'Transfer Bank', 800, '2024-11-25',875),
(10309, 'Langganan', 'Pulsa', 300, '2024-11-28',87),
(10310, 'Langganan', 'Transfer Bank', 500, '2024-12-01',50),
(23001, 'Pembelian', 'E-Wallet', 30, '2024-09-15',200),
(23002, 'Pembelian', 'Pulsa', 30, '2024-09-15',64),
(23003, 'Pembelian', 'Transfer Bank', 100, '2024-10-17',108),
(23004, 'Pembelian', 'Transfer Bank', 45, '2024-10-21',109),
(23005, 'Pembelian', 'Pulsa', 45, '2024-11-02',201),
(23006, 'Pembelian', 'Pulsa', 100, '2024-11-14',204),
(23007, 'Pembelian', 'E-Wallet', 30, '2024-11-15',210),
(23008, 'Pembelian', 'Pulsa', 100, '2024-11-17',212),
(23009, 'Pembelian', 'Pulsa', 90, '2024-11-20',214),
(23010, 'Pembelian', 'Transfer Bank', 90, '2024-11-21',215),
(23011, 'Pembelian', 'E-Wallet', 90, '2024-11-21',218),
(23012, 'Pembelian', 'Transfer Bank', 100, '2024-11-22',221);

ALTER TABLE pembayaran
ADD User_ID INT REFERENCES uuser (User_ID);

SELECT * FROM PEMBAYARAN ;

ALTER TABLE pembayaran
DROP COLUMN user_id;

=========================================================================================================
----------------------------------- RELASI mendapatkan buku LANGGANAN ---------------------------------------------
CREATE TABLE mendapatkan1(
	id_pembayaran INT REFERENCES pembayaran(id_pembayaran),
	id_ebooklangganan INT REFERENCES ebooklangganan(id_ebooklangganan)
);

INSERT INTO mendapatkan1
VALUES
(10301,1501),
(10302,1502),
(10303,1503),
(10304,1504),
(10305,1505),
(10306,1506),
(10307,1507),
(10308,1508),
(10309,1509),
(10310,1510);

SELECT * FROM mendapatkan1;

------------------------------------------ ENTITAS EBOOK LANGGANAN -----------------------------------------------
CREATE TABLE ebooklangganan (
	id_ebooklangganan INT PRIMARY KEY,
	jumlah_buku_di_dapat INT,
	durasi_akses Varchar(200)
);

INSERT INTO ebooklangganan
VALUES
(1501, 1000, 'Akses dengan durasi 1 Bulan'),
(1502, 1000, 'Akses dengan durasi 3 Bulan'),
(1503, 1000, 'Akses dengan durasi 6 Bulan'),
(1504, 1000, 'Akses dengan durasi 3 Bulan'),
(1505, 1000, 'Akses dengan durasi 3 Bulan'),
(1506, 1000, 'Akses dengan durasi 6 Bulan'),
(1507, 1000, 'Akses dengan durasi 1 Bulan'),
(1508, 1000, 'Akses dengan durasi 6 Bulan'),
(1509, 1000, 'Akses dengan durasi 1 Bulan'),
(1510, 1000,'Akses dengan durasi 3 Bulan');

SELECT * FROM ebooklangganan;
drop table ebooklangganan;

=========================================================================================================
------------------------------------ RELASI MENDAPATKAN BUKU Pembelian ------------------------------
CREATE TABLE mendapatkan2(
	id_pembayaran INT REFERENCES pembayaran(id_pembayaran),
	id_ebooklangganan INT REFERENCES ebookpembelian(id_ebookpembelian)
)

INSERT INTO mendapatkan2
Values
(23001,2311),
(23002,3541),
(23003,7451),
(23004,1571),
(23005,8521),
(23006,1751),
(23007,9991),
(23008,1251),
(23009,6311),
(23010,8331),
(23011,1111),
(23012,2781);

SELECT * FROM mendapatkan2;

-----------------------------------------ENTITAS EBOOK PEMBELIAN ---------------------------------------------
CREATE TABLE ebookpembelian(
	id_ebookpembelian INT PRIMARY KEY,
	judul_buku VARCHAR(200),
	penulis VARCHAR(200),
	ISBN VARCHAR(50),
	tanggal_terbit DATE,
	harga_beli VARCHAR(200),
	kategori VARCHAR(200),
	deskripsi VARCHAR(200)
);

INSERT INTO ebookpembelian
Values
(2311,'Malin Kundang', 'dany', 'ISBN-001', '2024-09-15', '30', 'Cerita Rakyat','Cerita rakyat tentang anak durhaka'),
(3541,'Timun Mas', 'febri', 'ISBN-002', '2024-09-15', '30', 'Cerita Rakyat', 'Cerita rakyat tentang keberanian melawan raksasa'),
(7451,'Transformers', 'folio jirl', 'ISBN-003', '2024-10-17', '100', 'Fiksi', 'Kisah tentang robot yang bisa berubah bentuk'),
(1571,'Doraemon', 'Fujiko F. Fujio', 'ISBN-004', '2024-10-21', '45', 'Komik', 'Komik tentang kucing robot dari masa depan'),
(8521,'Naruto', 'Masashi Kishimoto', 'ISBN-005', '2024-11-02', '45', 'Komik', 'Komik tentang petualangan ninja'),
(1751,'Dasar SQL', 'reza', 'ISBN-006', '2024-11-14', '100', 'Pengetahuan', 'Panduan dasar penggunaan SQL'),
(9991,'Roro Jongrang', 'rafi', 'ISBN-007', '2024-11-15', '30', 'Cerita Rakyat', 'Legenda tentang candi dan patung Roro Jonggrang'),
(1251,'Dasar C++', 'firly', 'ISBN-008', '2024-11-17', '100', 'Pengetahuan', 'Panduan dasar penggunaan bahasa C++'),
(6311,'Dilan 1990', 'Pidi Baiq', 'ISBN-009', '2024-11-20', '90', 'Novel', 'Kisah cinta remaja di tahun 1990'),
(8331,'Milea 1992', 'Pidi Baiq', 'ISBN-010', '2024-11-21', '90', 'Novel', 'Kisah lanjutan cinta Dilan dan Milea'),
(1111,'Danur', 'Risa Saraswati', 'ISBN-011', '2024-11-21', '90', 'Novel', 'Cerita horor tentang persahabatan dengan makhluk gaib'),
(2781,'Dasar Java', 'erma', 'ISBN-012', '2024-11-22', '100', 'Pengetahuan', 'Panduan dasar pemrograman Java');

SELECT * FROM ebookpembelian
SELECT * from pembelian

drop table ebookpembelian cascade;


-------------------------------------- ENTITAS REVIEW -----------------------------------------
CREATE TABLE REVIEW(
	ID_Review INT PRIMARY KEY,
	Judul_Buku VarChar(200),
	Rating VarChar (20),
	Komentar VarChar (256),
	Tanggal_Review Date
);

INSERT INTO REVIEW
Values
(207, 'Malin Kundang', '5 Bintang', 'Bagus Banget', '2024-09-30'),
(234, 'Timun Mas', '3 Bintang', 'Lumayan Bagus', '2024-10-10'),
(94, 'Transformers', '4 Bintang', 'Seru dan Menarik', '2024-10-17'),
(465, 'Doraemon', '5 Bintang', 'Anak-anak pasti suka', '2024-10-21'),
(587, 'Naruto', '4 Bintang', 'Seru dan Menegangkan', '2024-11-02'),
(204, 'Dasar SQL', '5 Bintang', 'Sangat membantu untuk belajar SQL', '2024-11-14'),
(210, 'Roro Jongrang', '3 Bintang', 'Ceritanya menarik', '2024-11-15'),
(212, 'Dasar C++', '5 Bintang', 'Sangat informatif', '2024-11-17'),
(214, 'Dilan 1990', '4 Bintang', 'Romantis dan Mengharukan', '2024-11-20'),
(215, 'Milea 1992', '4 Bintang', 'Melanjutkan cerita yang menyentuh hati', '2024-11-21'),
(218, 'Danur', '3 Bintang', 'Menegangkan namun sedikit membingungkan', '2024-11-21'),
(221, 'Dasar Java', '5 Bintang', 'Bagus untuk pemula', '2024-11-22');

SELECT * FROM REVIEW ;

DROP TABLE REVIEW;


----------------------------------------------------------------------------------------------
================================ REPORT PERUSAHAN LANGGANAN ==================================
CREATE TABLE Perusahaan(
	User_Id INT PRIMARY KEY,
	Nama VarChar(255),
	Jenis_Transaksi VarChar(255),
	ID_Transaksi INT,
	Tanggal_Transaksi DATE,
	Jenis_Paket VarChar(255),
	Tanggal_Berakhir DATE,
	Durasi_Langganan VarChar (255),
	Pendapatan INT,
	Metode_Pembayaran VarChar(255),
	Kategori_Pengguna VarChar(255)
);

-- Menambahkan Nilai Pada Tabel Perusahaan
INSERT INTO Perusahaan (user_id)
Values
(207),
(234),
(94),
(465),
(587),
(965),
(543),
(875),
(87),
(50);

--nama
UPDATE perusahaan
SET nama = l.name
FROM uuser l
WHERE perusahaan.user_id = l.user_id;

--jenis paket
UPDATE perusahaan
SET jenis_paket = l.jenis_paket
FROM langganan l
WHERE perusahaan.user_id = l.user_id;

--ketegori pengguna
UPDATE perusahaan
SET kategori_pengguna = l.status_langganan
FROM detaillangganan l
WHERE perusahaan.user_id = l.user_id;

--tanggal transaksi
SET tanggal_transaksi = l.tanggal_mulai
FROM detaillangganan l
WHERE perusahaan.user_id = l.user_id;

--tanggal berakhir
UPDATE perusahaan
SET tanggal_berakhir = l.tanggal_berakhir
FROM detaillangganan l
WHERE perusahaan.user_id = l.user_id;

--id transaksi
UPDATE perusahaan
SET id_transaksi = l.id_pembayaran
FROM langganan l
WHERE perusahaan.user_id = l.user_id;

--jenis transaksi
UPDATE perusahaan
SET jenis_transaksi = l.jenis_transaksi
FROM pembayaran l
WHERE perusahaan.id_transaksi = l.id_pembayaran;

--metode pembayaran
UPDATE perusahaan
SET metode_pembayaran = l.metode_pembayaran
FROM pembayaran l
WHERE perusahaan.id_transaksi = l.id_pembayaran;

--pendapatan
UPDATE perusahaan
SET pendapatan = l.total_harga
FROM pembayaran l
WHERE perusahaan.id_transaksi = l.id_pembayaran;

SELECT * FROM Perusahaan ; 
SELECT * FROM langganan;
SELECT * FROM pembayaran;

INSERT INTO perusahaan (user_id)
SELECT user_id::INTEGER
FROM langganan;

ALTER TABLE Perusahaan
DROP COLUMN durasi_langganan;


--------------------------------------------------------------------------------------------------------
================================== REPORT UNTUK PERUSAHAAN PEMBELIAN ====================================
CREATE TABLE Perusahaan_2(
	User_Id INT Primary Key,
	Nama VarChar(255),
	Jenis_Transaksi VarChar(255),
	ID_Transaksi INT,
	Tanggal_Transaksi DATE,
	Nama_Buku VarChar(255),
	Kategori_Buku VarChar(255),
	Jumlah INT,
	Pendapatan INT,
	Metode_Pembayaran VarChar(255),
	Kategori_Pengguna VarChar(255)
);

-- Menambahkan Nilai Pada Tabel Perusahaan
INSERT INTO Perusahaan_2(user_id)
Values
(200),
(64),
(108),
(109),
(201),
(204),
(210),
(212),
(214),
(215),
(218),
(221);

--nama
UPDATE perusahaan_2
SET nama = l.name
FROM uuser l
WHERE perusahaan_2.user_id = l.user_id;

-- menambahkan id_pembelian sementara
ALTER TABLE perusahaan_2
ADD id_pembelian INT;

UPDATE perusahaan_2
SET id_pembelian = l.id_pembelian
FROM pembelian l
WHERE perusahaan_2.user_id = l.user_id;

ALTER TABLE perusahaan_2
DROP COLUMN id_pembelian;


--jenis transaksi
UPDATE perusahaan_2
SET jenis_transaksi = l.jenis_transaksi
FROM pembayaran l
WHERE perusahaan_2.id_transaksi = l.id_pembayaran;

--id transaksi
UPDATE perusahaan_2
SET id_transaksi = l.id_pembayaran
FROM membuat l
WHERE perusahaan_2.id_pembelian = l.id_pembelian;

--tanggal transaksi
UPDATE perusahaan_2
SET tanggal_transaksi = l.tanggal_pembayaran
FROM pembayaran l
WHERE perusahaan_2.id_transaksi = l.id_pembayaran;

--nama buku
UPDATE perusahaan_2
SET nama_buku = l.nama_buku
FROM pembelian l
WHERE perusahaan_2.user_id = l.user_id;

--kategori buku
UPDATE perusahaan_2
SET kategori_buku = l.kategori_buku
FROM detailpembelian l
WHERE perusahaan_2.user_id = l.user_id;

--pendapatan
UPDATE perusahaan_2
SET pendapatan = l.harga_ebook
FROM pembelian l
WHERE perusahaan_2.user_id = l.user_id;

--metode pembayaran
UPDATE perusahaan_2
SET metode_pembayaran = l.metode_pembayaran
FROM pembayaran l
WHERE perusahaan_2.id_transaksi = l.id_pembayaran;

--kategori pengguna
UPDATE perusahaan_2
SET kategori_pengguna = l.kategori_pembeli
FROM detailpembelian l
WHERE perusahaan_2.user_id = l.user_id;


SELECT * FROM Perusahaan_2 ;

DROP TABLE perusahaan_2 CASCADE;

--#CEKKK
SELECT * FROM uuser;
SELECT * FROM langganan;
SELECT * FROM detaillangganan;
SELECT * FROM pembelian;
SELECT * FROM detailpembelian;
SELECT * FROM Membuat;
SELECT * FROM PEMBAYARAN;
SELECT * FROM Mendapatkan1;
SELECT * FROM Mendapatkan2;
SELECT * FROM ebooklangganan;
SELECT * FROM ebookpembelian;
SELECT * FROM REVIEW;



--------------------------------------------------------------------------------------------------
======================================== INVOICE LANGGANAN =======================================
CREATE TABLE InvoiceLangganan(
	User_Id INT PRIMARY KEY,
	Nama VarChar(255),
	Jenis_Transaksi VarChar(255),
	ID_Transaksi INT,
	Tanggal_Transaksi DATE,
	Jenis_Paket VarChar(255),
	Tanggal_Berakhir DATE,
	Harga INT
);

INSERT INTO InvoiceLangganan (user_id)
Values
(207),
(234),
(94),
(465),
(587),
(965),
(543),
(875),
(87),
(50);

ALTER TABLE invoicelangganan
ADD COLUMN deskripsi_paket Varchar(200);

UPDATE invoicelangganan
SET deskripsi_paket = l.deskripsi_paket
FROM langganan l
WHERE invoicelangganan.user_id = l.user_id;

SELECT * FROM invoicelangganan;

--nama
UPDATE invoicelangganan
SET nama = l.name
FROM uuser l
WHERE invoicelangganan.user_id = l.user_id;

--jenis transaksi
UPDATE invoicelangganan
SET jenis_transaksi = l.jenis_transaksi
FROM pembayaran l
WHERE invoicelangganan.id_transaksi = l.id_pembayaran;

--id transaksi
UPDATE invoicelangganan
SET id_transaksi = l.id_pembayaran
FROM langganan l
WHERE invoicelangganan.user_id = l.user_id;

--tanggal transaksi
UPDATE invoicelangganan
SET tanggal_transaksi = l.tanggal_mulai
FROM detaillangganan l
WHERE invoicelangganan.user_id = l.user_id;

--jenis paket
UPDATE invoicelangganan
SET jenis_paket = l.jenis_paket
FROM langganan l
WHERE invoicelangganan.user_id = l.user_id;

--tanggal berakhir
UPDATE invoicelangganan
SET tanggal_berakhir = l.tanggal_berakhir
FROM detaillangganan l
WHERE invoicelangganan.user_id = l.user_id;

--Harga
UPDATE invoicelangganan
SET harga = l.total_harga
FROM pembayaran l
WHERE invoicelangganan.id_transaksi = l.id_pembayaran;

-- id_langganan
ALTER TABLE invoicelangganan
ADD COLUMN id_langganan INT;

UPDATE invoicelangganan
SET id_langganan = l.id_langganan
FROM detaillangganan l
WHERE invoicelangganan.user_id = l.user_id;

SELECT * FROM InvoiceLangganan
SELECT * FROM detaillangganan

DROP TABLE Invoicelangganan CASCADE


--------------------------------------------------------------------------------------------------------
====================================== INVOICE PEMBELIAN ===============================================
CREATE TABLE InvoicePembelian(
	User_Id INT Primary Key,
	Nama VarChar(255),
	Jenis_Transaksi VarChar(255),
	ID_Transaksi INT,
	Tanggal_Transaksi DATE,
	Nama_Buku VarChar(255),
	Kategori_Buku VarChar(255),
	Jumlah INT,
	Harga INT,
	Metode_Pembayaran VarChar(255),
	Kategori_Pengguna VarChar(255)
);

-- Menambahkan Nilai Pada Tabel Perusahaan
INSERT INTO InvoicePembelian(user_id)
Values
(200),
(64),
(108),
(109),
(201),
(204),
(210),
(212),
(214),
(215),
(218),
(221);

--nama
UPDATE invoicepembelian
SET nama = l.name
FROM uuser l
WHERE invoicepembelian.user_id = l.user_id;


UPDATE invoicepembelian
SET id_transaksi = l.id_pembelian
FROM pembelian l
WHERE invoicepembelian.user_id = l.user_id;


--jenis transaksi
UPDATE invoicepembelian
SET jenis_transaksi = l.jenis_transaksi
FROM pembayaran l
WHERE invoicepembelian.id_transaksi = l.id_pembayaran;

--id transaksi
UPDATE invoicepembelian
SET id_transaksi = l.id_pembayaran
FROM membuat l
WHERE invoicepembelian.id_transaksi = l.id_pembelian;

--tanggal transaksi
UPDATE invoicepembelian
SET tanggal_transaksi = l.tanggal_pembayaran
FROM pembayaran l
WHERE invoicepembelian.id_transaksi = l.id_pembayaran;

--nama buku
UPDATE invoicepembelian
SET nama_buku = l.nama_buku
FROM pembelian l
WHERE invoicepembelian.user_id = l.user_id;

--kategori buku
UPDATE invoicepembelian
SET kategori_buku = l.kategori_buku
FROM detailpembelian l
WHERE invoicepembelian.user_id = l.user_id;

--pendapatan
UPDATE invoicepembelian
SET harga = l.harga_ebook
FROM pembelian l
WHERE invoicepembelian.user_id = l.user_id;

--metode pembayaran
UPDATE invoicepembelian
SET metode_pembayaran = l.metode_pembayaran
FROM pembayaran l
WHERE invoicepembelian.id_transaksi = l.id_pembayaran;

--kategori pengguna
UPDATE invoicepembelian
SET kategori_pengguna = l.kategori_pembeli
FROM detailpembelian l
WHERE invoicepembelian.user_id = l.user_id;

--id_pembelian
ALTER TABLE invoicepembelian
ADD COLUMN id_pembelian INT;

UPDATE invoicepembelian
SET id_pembelian = l.id_pembelian
FROM detailpembelian l
WHERE invoicepembelian.user_id = l.user_id;

SELECT * FROM invoicepembelian;


--# CEK ENTITAS
SELECT * FROM uuser;
SELECT * FROM langganan;
SELECT * FROM detaillangganan;
SELECT * FROM pembelian;
SELECT * FROM detailpembelian;
SELECT * FROM Membuat;
SELECT * FROM PEMBAYARAN;
SELECT * FROM Mendapatkan1;
SELECT * FROM Mendapatkan2;
SELECT * FROM ebooklangganan;
SELECT * FROM ebookpembelian;
SELECT * FROM REVIEW;

--# CEK REPORT PRUSAHAAN
SELECT * FROM perusahaan;      --REPORT LANGGANAN
SELECT * FROM perusahaan_2;    --REPORT PEMBELIAN

--# CEK INVOICE
SELECT * FROM invoicepembelian;
SELECT * FROM invoicelangganan;































-- Membuat View untuk Laporan Harian Transaksional dari Tabel Perusahaan
CREATE VIEW Laporan_Harian_Perusahaan AS
SELECT 
    p.User_Id, 
    p.Nama, 
    p.Jenis_Transaksi, 
    p.ID_Transaksi, 
    p.Tanggal_Transaksi, 
    p.Jenis_Paket, 
    p.Tanggal_Berakhir, 
    p.Pendapatan, 
    p.Metode_Pembayaran, 
    p.Kategori_Pengguna
FROM Perusahaan p
WHERE p.Tanggal_Transaksi = CURRENT_DATE;

-- Membuat Function untuk Menampilkan Laporan Harian dari Tabel Perusahaan
CREATE OR REPLACE FUNCTION Tampilkan_Laporan_Harian_Perusahaan()
RETURNS TABLE(
    User_Id INT, 
    Nama VARCHAR, 
    Jenis_Transaksi VARCHAR, 
    ID_Transaksi INT, 
    Tanggal_Transaksi DATE, 
    Jenis_Paket VARCHAR, 
    Tanggal_Berakhir DATE, 
    Pendapatan INT, 
    Metode_Pembayaran VARCHAR, 
    Kategori_Pengguna VARCHAR
) AS $$
BEGIN
    RETURN QUERY
    SELECT 
        p.User_Id, 
        p.Nama, 
        p.Jenis_Transaksi, 
        p.ID_Transaksi, 
        p.Tanggal_Transaksi, 
        p.Jenis_Paket, 
        p.Tanggal_Berakhir, 
        p.Pendapatan, 
        p.Metode_Pembayaran, 
        p.Kategori_Pengguna
    FROM Perusahaan p
    WHERE p.Tanggal_Transaksi = CURRENT_DATE;
END;
$$ LANGUAGE plpgsql;

-- Membuat View untuk Laporan Harian Transaksional dari Tabel Perusahaan_2
CREATE VIEW Laporan_Harian_Perusahaan_2 AS
SELECT 
    p.User_Id, 
    p.Nama, 
    p.Jenis_Transaksi, 
    p.ID_Transaksi, 
    p.Tanggal_Transaksi, 
    p.Nama_Buku, 
    p.Kategori_Buku, 
    p.Jumlah, 
    p.Pendapatan, 
    p.Metode_Pembayaran, 
    p.Kategori_Pengguna
FROM Perusahaan_2 p
WHERE p.Tanggal_Transaksi = CURRENT_DATE;

-- Membuat Function untuk Menampilkan Laporan Harian dari Tabel Perusahaan_2
CREATE OR REPLACE FUNCTION Tampilkan_Laporan_Harian_Perusahaan_2()
RETURNS TABLE(
    User_Id INT, 
    Nama VARCHAR, 
    Jenis_Transaksi VARCHAR, 
    ID_Transaksi INT, 
    Tanggal_Transaksi DATE, 
    Nama_Buku VARCHAR, 
    Kategori_Buku VARCHAR, 
    Jumlah INT, 
    Pendapatan INT, 
    Metode_Pembayaran VARCHAR, 
    Kategori_Pengguna VARCHAR
) AS $$
BEGIN
    RETURN QUERY
    SELECT 
        p.User_Id, 
        p.Nama, 
        p.Jenis_Transaksi, 
        p.ID_Transaksi, 
        p.Tanggal_Transaksi, 
        p.Nama_Buku, 
        p.Kategori_Buku, 
        p.Jumlah, 
        p.Pendapatan, 
        p.Metode_Pembayaran, 
        p.Kategori_Pengguna
    FROM Perusahaan_2 p
    WHERE p.Tanggal_Transaksi = CURRENT_DATE;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM Tampilkan_Laporan_Harian_Perusahaan_2;