create schema comercio;
use comercio;


CREATE TABLE usuarios (
  codigo int(11) NOT NULL AUTO_INCREMENT,
  usuario varchar(50) NOT NULL,
  password varchar(255) NOT NULL,
  email varchar(100) NOT NULL,
  foto varchar(45) DEFAULT NULL,
  PRIMARY KEY (codigo));

INSERT INTO usuarios VALUES (1,'aruiz','admin','armando@codigo.pe','img/foto.png');

delimiter $$
create procedure insertar_usuario(
nom varchar(200),
pass varchar(200),
corr varchar(200),
imagen varchar(100))
begin
	INSERT INTO usuarios 
	(usuario,password,email,foto) 
	values 
	(nom, pass, corr,imagen);
end;$$
delimiter ;

delimiter $$
create procedure login(us varchar(50),pass varchar(255))
begin
	select codigo,usuario,email from usuarios
	where usuario=us and password=pass;
end;$$
delimiter ;

delimiter $$
create procedure usuario_codigo(cod int)
begin
	select codigo,usuario,password,email,foto from usuarios
	where codigo=cod;
end; $$
delimiter ;

delimiter $$
create procedure usuario_user(user varchar(200))
begin
	select codigo,usuario,email from usuarios
	where usuario=user;
end;$$
Delimiter ;


create table productos(
cod int primary key auto_increment,
categoria int,
nombre varchar(20),
descripcion text,
precio decimal(6,2),
stock int,
foto varchar(100));

insert into productos(categoria,nombre,descripcion,precio,stock,foto)
values(1,'Manzana Verde','Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. ',2.50,87,'img/mverde.png');

insert into productos(categoria,nombre,descripcion,precio,stock,foto)
values(2,'Fresa','Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. ',2.50,87,'img/fresa.png');

insert into productos(categoria,nombre,descripcion,precio,stock,foto)
values(3,'Naranja Wando','Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. ',2.50,87,'img/naranja_wando.png');

insert into productos(categoria,nombre,descripcion,precio,stock,foto)
values(4,'Papaya','Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. ',2.50,87,'img/papaya.png');

update productos set foto='fresa.jpg' where cod=2;
update productos set foto='mverde.png' where cod=1;
update productos set foto='naranja.jpg' where cod=3;
update productos set foto='papaya.jpg' where cod=4;

select cod, categoria, nombre, descripcion, precio, stock, foto from productos;