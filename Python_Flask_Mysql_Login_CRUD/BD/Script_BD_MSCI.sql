drop SCHEMA MSCI;
CREATE SCHEMA MSCI;
USE MSCI;

use flaskdb
select*from u


CREATE TABLE tguser(
id_user int not null auto_increment primary key,
name varchar(35) not null,
email varchar(35) not null,
password varchar(100) not null,
foto varchar(60) not null,
status char(1) not null);

/*
CREATE TABLE users (
id smallint unsigned not null auto_increment, 
name varchar(35) not null, 
email varchar(35) not null, 
password varchar(100) not null, 
primary key (id));
*/


create table tgclient(
id_client int not null primary key,
name varchar(60),
ruc  varchar(15),
address varchar(120),
email varchar(60),
phone varchar(60));

delimiter $$
CREATE PROCEDURE sp_tguser_i01(
in ar_name varchar(20), 
in ar_email varchar(60), 
in ar_password varchar(20), 
in ar_foto varchar(60)
)
BEGIN
	INSERT INTO tguser(name, email, password, foto, status)
    VALUES(ar_name, ar_email, ar_password, ar_foto, 'A');
END; $$
delimiter $$




