CREATE USER report_user;
-- 1. Memberikan hak akses SELECT pada tabel trips
GRANT SELECT ON TABLE transport_db.trips TO report_user;

-- 2. Melihat daftar hak akses yang dimiliki report_user
SHOW GRANTS FOR report_user;

-- 3. Mencabut kembali hak akses SELECT dari report_user
REVOKE SELECT ON TABLE transport_db.trips FROM report_user;
--pengujian 
SELECT * FROM trips;
DELETE FROM trips WHERE trip_id = 'T006';
REVOKE SELECT ON TABLE transport_db.trips FROM report_user;
SHOW GRANTS FOR report_user;
