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



