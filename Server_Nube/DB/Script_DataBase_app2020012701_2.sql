drop schema comercio;
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
cod int primary key,
categoria int,
nombre varchar(20),
descripcion text,
precio decimal(6,2),
stock int,
foto varchar(100));

insert into productos(cod,categoria,nombre,descripcion,precio,stock,foto)
values(1,1,'Manzana Verde','Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. ',2.50,87,'img/mverde.png');

insert into productos(cod,categoria,nombre,descripcion,precio,stock,foto)
values(2,2,'Fresa','Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. ',2.50,87,'img/fresa.png');

insert into productos(cod,categoria,nombre,descripcion,precio,stock,foto)
values(3,3,'Naranja Wando','Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. ',2.50,87,'img/naranja_wando.png');

insert into productos(cod,categoria,nombre,descripcion,precio,stock,foto)
values(4,4,'Papaya','Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. ',2.50,87,'img/papaya.png');

update productos set foto='fresa.jpg' where cod=2;
update productos set foto='mverde.png' where cod=1;
update productos set foto='naranja.jpg' where cod=3;
update productos set foto='papaya.jpg' where cod=4;

delimiter $$
create procedure sp_producto_q01()
begin
	select	ifnull(max(cod),0)+1 as nuevo_codigo
    from	productos;
end; $$

delimiter $$
create procedure sp_producto_i01(
ar_codigo int,
ar_categoria int, 
ar_nombre varchar(20), 
ar_descripcion text, 
ar_precio decimal(6,2), 
ar_stock int(11), 
art_foto varchar(100))
begin
	insert into productos(cod, categoria, nombre, descripcion, precio, stock, foto)
    values(ar_codigo, ar_categoria, ar_nombre, ar_descripcion, ar_precio, ar_stock, art_foto);
end; $$
delimiter $$

delimiter $$
create procedure sp_producto_q02()
begin
	select	cod, categoria, nombre, descripcion, precio, stock, foto 
    from	productos;
end; $$

delimiter $$
create procedure sp_producto_q03(in codigo int)
begin
	select	cod, categoria, nombre, descripcion, precio, stock, foto 
    from	productos
    where	cod=codigo;
end; $$


create table categoria(
id_categoria int not null primary key auto_increment,
nombre varchar(100),
estado char(1) default 'A');

drop procedure sp_categoria_q01

delimiter $$
create procedure sp_categoria_q01()
begin
	Select id_categoria, nombre, estado from categoria;
end; $$

drop procedure sp_categoria_i01
delimiter $$
create procedure sp_categoria_i01(
in nombre varchar(100))
begin
	insert into categoria(nombre)
    values(nombre);
end; $$

delimiter $$
create procedure sp_categoria_u01(
in par_codigo int,
in par_nombre varchar(100),
in par_estado char(1))
begin
	Update	categoria
    Set		nombre=par_nombre,
			estado=par_estado
    Where	id_categoria=par_codigo;
end; $$

delimiter $$
create procedure sp_categoria_d01(
in par_codigo int)
begin
	delete
    from	categoria
    Where	id_categoria=par_codigo;
end; $$

call sp_categoria_i01('BEBIDAS');
call sp_categoria_i01('FRUTAS');
call sp_categoria_i01('VERDURAS');

call sp_categoria_q01()


