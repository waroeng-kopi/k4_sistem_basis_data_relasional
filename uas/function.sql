-- ###################################################################################
-- ########################             PROCEDURE               ######################
-- ###################################################################################
DELIMITER //
CREATE PROCEDURE InsertDataMhs(
    IN input_npm VARCHAR(255),
    IN input_nama VARCHAR(255),
    IN input_jenis_kelamin VARCHAR(255),
    IN input_alamat VARCHAR(255),
    IN input_no_telp VARCHAR(255)
)
BEGIN
    INSERT INTO mhs (npm, nama, jenis_kelamin, alamat, no_telp)
    VALUES (input_npm, input_nama, input_jenis_kelamin, input_alamat, input_no_telp);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE InsertDataDosen(
    IN input_nip VARCHAR(255),
    IN input_nama VARCHAR(255),
    IN input_prodi VARCHAR(255)
)
BEGIN
    INSERT INTO dosen (nip, nama, prodi)
    VALUES (input_nip, input_nama, input_prodi);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE InsertDataMatkul(
    IN input_kode_mk VARCHAR(255),
    IN input_nama_mk VARCHAR(255),
    IN input_sks INT,
    IN input_semester VARCHAR(255)
)
BEGIN
    INSERT INTO matkul (kode_mk, nama_mk, sks, semester)
    VALUES (input_kode_mk, input_nama_mk, input_sks, input_semester);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE InsertDataKuliah(
    IN input_kode_kuliah VARCHAR(255),
    IN input_kode_mk VARCHAR(255),
    IN input_nama_mk VARCHAR(255),
    IN input_sks INT,
    IN input_semester VARCHAR(255),
    IN input_nama_dosen_pengampu VARCHAR(255)
)
BEGIN
    INSERT INTO kuliah (kode_kuliah, kode_mk, nama_mk, sks, semester, nama_dosen_pengampu)
    VALUES (input_kode_kuliah, input_kode_mk, input_nama_mk, input_sks, input_semester, input_nama_dosen_pengampu);
END //
DELIMITER ;

-- CALL PROCEDURE
CALL InsertDataMhs('NPM001', 'John Doe', 'Laki-laki', 'Jakarta', '0812345678');
CALL InsertDataDosen('NIP001', 'Jane Smith', 'Computer Science');
CALL InsertDataMatkul('KMK001', 'Database Management', 3, 'Semester 1');
CALL InsertDataKuliah('KK001', 'KMK001', 'Database Management', 3, 'Semester 1', 'Jane Smith');

-- ###################################################################################
-- ########################              FUNCTION            #########################
-- ###################################################################################

-- Total mahasiswa
SELECT COUNT(npm) FROM mhs;

-- Total Dosen
SELECT COUNT(nip) FROM dosen;

-- ###################################################################################
-- ###########################              TRIGGER              #####################
-- ###################################################################################

-- Create the mhs_log table
CREATE TABLE IF NOT EXISTS mhs_log (
    id INT AUTO_INCREMENT PRIMARY KEY,
    event_type VARCHAR(50),
    event_data VARCHAR(255)
);

-- Trigger BEFORE INSERT
DELIMITER //
CREATE TRIGGER before_insert_trigger
BEFORE INSERT ON mhs
FOR EACH ROW
BEGIN
    IF LENGTH(NEW.npm) <> 10 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Panjang NPM kurang dari 10.';
    END IF;
END //
DELIMITER ;

-- Trigger AFTER INSERT
DELIMITER //
CREATE TRIGGER after_insert_trigger
AFTER INSERT ON mhs
FOR EACH ROW
BEGIN
    INSERT INTO mhs_log (event_type, event_data) VALUES ('INSERT', CONCAT('Inserted data: NPM-', NEW.npm));
END //
DELIMITER ;

-- Trigger BEFORE UPDATE
DELIMITER //
CREATE TRIGGER before_update_trigger
BEFORE UPDATE ON mhs
FOR EACH ROW
BEGIN
    IF LENGTH(NEW.npm) <> 10 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid NPM length. Cannot update.';
    END IF;
END //
DELIMITER ;

-- Trigger AFTER UPDATE
DELIMITER //
CREATE TRIGGER after_update_trigger
AFTER UPDATE ON mhs
FOR EACH ROW
BEGIN
    INSERT INTO mhs_log (event_type, event_data) VALUES ('UPDATE', CONCAT('Updated data: NPM-', NEW.npm));
END //
DELIMITER ;

-- Trigger BEFORE DELETE
DELIMITER //
CREATE TRIGGER before_delete_trigger
BEFORE DELETE ON mhs
FOR EACH ROW
BEGIN
    IF OLD.npm = '1234567890' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Deletion not allowed for this record.';
    END IF;
END //
DELIMITER ;

-- Trigger AFTER DELETE
DELIMITER //
CREATE TRIGGER after_delete_trigger
AFTER DELETE ON mhs
FOR EACH ROW
BEGIN
    INSERT INTO mhs_log (event_type, event_data) VALUES ('DELETE', CONCAT('Deleted data: NPM-', OLD.npm));
END //
DELIMITER ;
