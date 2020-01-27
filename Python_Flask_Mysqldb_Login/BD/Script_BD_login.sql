CREATE DATABASE flaskdb;
use flaskdb;


CREATE TABLE users (
id smallint unsigned not null auto_increment, 
name varchar(35) not null, 
email varchar(35) not null, 
password varchar(100) not null, 
primary key (id));
