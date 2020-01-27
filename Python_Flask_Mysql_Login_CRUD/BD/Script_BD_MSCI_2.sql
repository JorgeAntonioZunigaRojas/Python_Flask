DROP SCHEMA MSCI;
CREATE SCHEMA MSCI;
USE MSCI;

CREATE TABLE tguser(
id_user int not null auto_increment primary key,
name varchar(60) not null,
email varchar(60) not null,
password varchar(60) not null,
phone varchar(60) not null,
image varchar(60) not null,
status char(1) not null);

create table tgclient(
id_client int not null primary key,
ruc  varchar(15),
name varchar(60),
address varchar(120),
email varchar(60),
phone varchar(60),
symbol varchar(60));

delimiter $$
CREATE PROCEDURE sp_tguser_i01(
in ar_name varchar(60),
in ar_email varchar(60),
in ar_password varchar(60),
in ar_phone varchar(60),
in ar_image varchar(60))
BEGIN
	INSERT INTO tguser(name,email,password,phone,image,status)
    VALUES(ar_name,ar_email,ar_password,ar_phone,ar_image,'A');
END; $$
delimiter $$


select*from tguser

