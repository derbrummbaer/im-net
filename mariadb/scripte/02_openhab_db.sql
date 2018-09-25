-- IF NOT EXISTS (SELECT SCHEMA_NAME FROM INFORMATION_SCHEMA.SCHEMATA WHERE SCHEMA_NAME = N'openhab_db')
-- BEGIN    
CREATE DATABASE openhab_db charset utf8;
CREATE USER 'openhab_user'@'%' IDENTIFIED BY 'openhab_pw';
GRANT ALL PRIVILEGES ON openhab_db.* TO 'openhab_user'@'%';
GRANT ALL PRIVILEGES ON openhab_db.* TO 'openhab_user'@'localhost' IDENTIFIED BY 'openhab_pw';
FLUSH PRIVILEGES;
-- END
