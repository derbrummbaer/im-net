-- Loading UDFs in MySQL, at the mysql prompt call:
DROP FUNCTION IF EXISTS epglv;
DROP FUNCTION IF EXISTS epglvr;
CREATE FUNCTION epglv RETURNS INT SONAME 'mysqlepglv.so';
CREATE FUNCTION epglvr RETURNS INT SONAME 'mysqlepglv.so';
-- IF NOT EXISTS (SELECT SCHEMA_NAME FROM INFORMATION_SCHEMA.SCHEMATA WHERE SCHEMA_NAME = N'epgd_db')
-- BEGIN    
CREATE DATABASE epgd_db charset utf8;
CREATE USER 'epgd_user'@'%' IDENTIFIED BY 'epgd_pw';
GRANT ALL PRIVILEGES ON epgd_db.* TO 'epgd_user'@'%';
GRANT ALL PRIVILEGES ON epgd_db.* TO 'epgd_user'@'localhost' IDENTIFIED BY 'epgd_pw';
FLUSH PRIVILEGES;
-- END
