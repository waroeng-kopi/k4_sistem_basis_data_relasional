CREATE DATABASE IF NOT EXISTS mahasiswa;
USE mahasiswa;

CREATE TABLE IF NOT EXISTS mhs (
    npm VARCHAR(255) PRIMARY KEY,
    nama VARCHAR(255),
    jenis_kelamin VARCHAR(255),
    alamat VARCHAR(255),
    no_telp VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS dosen (
    nip VARCHAR(255) PRIMARY KEY, 
    nama VARCHAR(255),
    prodi VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS matkul (
    kode_mk VARCHAR(255) PRIMARY KEY,
    nama_mk VARCHAR(255),
    sks INT(8),
    semester VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS kuliah (
    kode_kuliah VARCHAR(255) PRIMARY KEY,
    kode_mk VARCHAR(255),
    nama_mk VARCHAR(255),
    sks INT(8),
    semester VARCHAR(255),
    nama_dosen_pengampu VARCHAR(255),
    FOREIGN KEY (kode_mk) REFERENCES matkul(kode_mk)
);

INSERT INTO mhs (npm, nama, jenis_kelamin, alamat, no_telp)
VALUES
    ('1234567890', 'Agus Setiawan', 'Laki-laki', 'Jl. Merdeka No. 10', '081234567890'),
    ('2345678901', 'Rina Sari', 'Perempuan', 'Jl. Raya Mawar No. 5', '082345678901'),
    ('3456789012', 'Budi Santoso', 'Laki-laki', 'Jl. Anggrek No. 8', '083456789012'),
    ('4567890123', 'Lia Dewi', 'Perempuan', 'Jl. Diponegoro No. 15', '084567890123'),
    ('5678901234', 'Dodi Pratama', 'Laki-laki', 'Jl. Surya No. 20', '085678901234'),
    ('6789012345', 'Siti Rahayu', 'Perempuan', 'Jl. Slamet No. 25', '086789012345'),
    ('7890123456', 'Hadi Kusuma', 'Laki-laki', 'Jl. Merah No. 30', '087890123456'),
    ('8901234567', 'Maya Indriani', 'Perempuan', 'Jl. Hijau No. 35', '088901234567'),
    ('9012345678', 'Rudi Gunawan', 'Laki-laki', 'Jl. Kuning No. 40', '089012345678'),
    ('0123456789', 'Lina Wijayanti', 'Perempuan', 'Jl. Coklat No. 45', '090123456789');

INSERT INTO dosen (nip, nama, prodi)
VALUES
    ('12345678', 'Dr. I Made Santoso', 'Teknik Informatika'),
    ('23456789', 'Dr. Ni Luh Ayu Wulan', 'Sistem Informasi'),
    ('34567890', 'Prof. Dr. Wayan Sudarsana', 'Teknik Elektro'),
    ('45678901', 'Dr. Ni Wayan Ratih', 'Teknik Kimia'),
    ('56789012', 'Prof. Dr. I Ketut Sudira', 'Teknik Sipil'),
    ('67890123', 'Dr. Made Putra', 'Akuntansi'),
    ('78901234', 'Prof. Dr. Ida Bagus Rai', 'Manajemen'),
    ('89012345', 'Dr. Ayu Made Ratna', 'Psikologi'),
    ('90123456', 'Prof. Dr. I Nyoman Surya', 'Hukum'),
    ('01234567', 'Dr. Ni Kadek Ratna', 'Bisnis Internasional');

INSERT INTO matkul (kode_mk, nama_mk, sks, semester)
VALUES
    ('IF101', 'Pemrograman Dasar', 3, 'Semester 1'),
    ('IF102', 'Algoritma dan Struktur Data', 4, 'Semester 2'),
    ('IF201', 'Pemrograman Lanjut', 3, 'Semester 3'),
    ('IF202', 'Basis Data', 4, 'Semester 4'),
    ('SI101', 'Sistem Informasi Manajemen', 3, 'Semester 1'),
    ('SI201', 'Analisis dan Desain Sistem Informasi', 4, 'Semester 3'),
    ('TE101', 'Listrik dan Elektronika Dasar', 3, 'Semester 1'),
    ('TE201', 'Elektronika Digital', 4, 'Semester 3'),
    ('TK101', 'Kimia Dasar', 3, 'Semester 1'),
    ('TK201', 'Kimia Organik', 4, 'Semester 3');

INSERT INTO kuliah (kode_kuliah, kode_mk, nama_mk, sks, semester, nama_dosen_pengampu)
VALUES
    ('KUL001', 'IF101', 'Pemrograman Dasar', 3, 'Semester 1', 'Dr. I Made Santoso'),
    ('KUL002', 'IF102', 'Algoritma dan Struktur Data', 4, 'Semester 2', 'Dr. Ni Luh Ayu Wulan'),
    ('KUL003', 'IF201', 'Pemrograman Lanjut', 3, 'Semester 3', 'Prof. Dr. Wayan Sudarsana'),
    ('KUL004', 'IF202', 'Basis Data', 4, 'Semester 4', 'Dr. Ni Wayan Ratih'),
    ('KUL005', 'SI101', 'Sistem Informasi Manajemen', 3, 'Semester 1', 'Prof. Dr. I Ketut Sudira'),
    ('KUL006', 'SI201', 'Analisis dan Desain Sistem Informasi', 4, 'Semester 3', 'Dr. Made Putra'),
    ('KUL007', 'TE101', 'Listrik dan Elektronika Dasar', 3, 'Semester 1', 'Prof. Dr. Ida Bagus Rai'),
    ('KUL008', 'TE201', 'Elektronika Digital', 4, 'Semester 3', 'Dr. Ayu Made Ratna'),
    ('KUL009', 'TK101', 'Kimia Dasar', 3, 'Semester 1', 'Prof. Dr. I Nyoman Surya'),
    ('KUL010', 'TK201', 'Kimia Organik', 4, 'Semester 3', 'Dr. Ni Kadek Ratna');
