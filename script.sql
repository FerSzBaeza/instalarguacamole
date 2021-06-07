create database guacamole_db;
create user 'guacamole_user'@'%' identified by 'guacadmin';
GRANT SELECT,INSERT,UPDATE,DELETE ON guacamole_db.* TO 'guacamole_user'@'%';
flush privileges;
