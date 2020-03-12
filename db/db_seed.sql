CREATE DATABASE mydb;
USE mydb;
CREATE TABLE mytable( 
    id INT NOT NULL AUTO_INCREMENT,
    message VARCHAR(255) NOT NULL,
    PRIMARY KEY(id)
);
INSERT INTO mytable(message) VALUES 
    ('Hello World!'),
    ('foo'),
    ('bar')
;

CREATE USER 'userdba'@'%' IDENTIFIED BY 's3cur3w0rd4p4$$';

GRANT ALL PRIVILEGES ON mydb.* TO 'appuser'@'%';
