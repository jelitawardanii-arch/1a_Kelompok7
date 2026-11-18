SELECT VERSION();
SELECT @@version_comment;
SHOW DATABASES;
SHOW ENGINES;
SHOW VARIABLES LIKE 'character_set_server';
SHOW VARIABLES LIKE 'collation_server';
SHOW VARIABLES LIKE 'autocommit';
SHOW VARIABLES LIKE 'transaction_isolation';

SELECT
    JSON_VALID('{"nama":"Budi"}') AS json_valid,
    JSON_EXTRACT('{"nama":"Budi"}', '$.nama') AS nama;

SELECT NOW();

DROP DATABASE IF EXISTS praktikum_modul11;
CREATE DATABASE praktikum_modul11 CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE praktikum_modul11;

SELECT DATABASE();
