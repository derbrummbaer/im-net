-- IF NOT EXISTS (SELECT SCHEMA_NAME FROM INFORMATION_SCHEMA.SCHEMATA WHERE SCHEMA_NAME = N'nextcloud_db')
-- BEGIN    
CREATE DATABASE nextcloud_db charset utf8;
CREATE USER 'nextcloud_user'@'%' IDENTIFIED BY 'nextcloud_pw';
GRANT ALL PRIVILEGES ON nextcloud_db.* TO 'nextcloud_user'@'%';
GRANT ALL PRIVILEGES ON nextcloud_db.* TO 'nextcloud_user'@'localhost' IDENTIFIED BY 'nextcloud_pw';
FLUSH PRIVILEGES;
-- END
