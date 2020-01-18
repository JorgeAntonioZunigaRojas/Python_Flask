create database bd_miportafolio;
use bd_miportafolio;


create table portafolio_datos(
datos_codigo int primary key auto_increment,
datos_nombre varchar(150),
datos_descripcion text,
datos_foto varchar(60),
datos_correo varchar(120),
datos_twitter varchar(120),
datos_facebook varchar(120),
datos_github varchar(120),
datos_instagram varchar(120));

create table portafolio_proyectos(
proyectos_codigo int primary key auto_increment,
proyectos_titulo varchar(100),
proyectos_subtitulo varchar(50),
proyectos_fecha date,
proyectos_direccion_web varchar(80),
proyectos_descripcion text,
proyectos_foto varchar(60));

create table portafolio_experiencia(
experiencia_codigo int primary key auto_increment,
experiencia_titulo varchar(100),
experiencia_descripcion text,
experiencia_foto varchar(60),
experiencia_direccion_web varchar(80));


create table portafolio_informacion(
informacion_codigo int primary key auto_increment,
datos_codigo int,
proyectos_codigo int,
experiencia_codigo int,
foreign key (datos_codigo) 
references portafolio_datos(datos_codigo), 
foreign key (proyectos_codigo) 
references portafolio_proyectos(proyectos_codigo), 
foreign key (experiencia_codigo) 
references portafolio_experiencia(experiencia_codigo)); 


Alter Table portafolio_datos add estado char(1) ;

ALTER TABLE portafolio_datos
ADD CONSTRAINT chk_estados CHECK(estado in(1,0));

ALTER TABLE portafolio_datos
	add datos_direccion varchar(250);
ALTER TABLE portafolio_datos
	drop column datos_direccion;
select*from portafolio_datos;


select * from portafolio_datos;
select * from portafolio_proyectos;
select * from portafolio_experiencia;
select * from portafolio_informacion;

insert into portafolio_proyectos
(proyectos_titulo,
 proyectos_subtitulo,
 proyectos_fecha,
 proyectos_direccion_web,
 proyectos_descripcion,
 proyectos_foto)
values
('Portafolio en Flask',
  'Integracion con Mysql',
  '2020/01/16',
  'http://www.armando.com/portafolio',
  'Lorem Ipsum es simplemente el texto de relleno 
  de las imprentas y archivos de texto. Lorem Ipsum h
  a sido el texto de relleno estándar de las 
  industrias desde el año 1500, cuando un impresor 
  N. del T. persona que se dedica a la imprenta',
  'img/portafolio.png');
  
insert into portafolio_proyectos
(proyectos_titulo,
 proyectos_subtitulo,
 proyectos_fecha,
 proyectos_direccion_web,
 proyectos_descripcion,
 proyectos_foto)
values
('Portafolio en Django',
  'Integracion con MongoDB',
  '2020/01/20',
  'http://www.armando.com/portafoliomongo',
  'Lorem Ipsum es simplemente el texto de relleno 
  de las imprentas y archivos de texto. Lorem Ipsum h
  a sido el texto de relleno estándar de las 
  industrias desde el año 1500, cuando un impresor 
  N. del T. persona que se dedica a la imprenta',
  'img/portafoliomongo.png');  
  
insert into portafolio_proyectos
(proyectos_titulo,
 proyectos_subtitulo,
 proyectos_fecha,
 proyectos_direccion_web,
 proyectos_descripcion,
 proyectos_foto)
values
('Ecommerce DJANGO',
  'Integracion con POSTGRESS',
  '2020/01/22',
  'http://www.armando.com/ecommerce',
  'Lorem Ipsum es simplemente el texto de relleno 
  de las imprentas y archivos de texto. Lorem Ipsum h
  a sido el texto de relleno estándar de las 
  industrias desde el año 1500, cuando un impresor 
  N. del T. persona que se dedica a la imprenta',
  'img/ecommerce.png');  

insert into portafolio_proyectos
(proyectos_titulo,
 proyectos_subtitulo,
 proyectos_fecha,
 proyectos_direccion_web,
 proyectos_descripcion,
 proyectos_foto)
values
('BIG DATA',
  'Integracion con SQL',
  '2020/02/22',
  'http://www.armando.com/bigdata',
  'Lorem Ipsum es simplemente el texto de relleno 
  de las imprentas y archivos de texto. Lorem Ipsum h
  a sido el texto de relleno estándar de las 
  industrias desde el año 1500, cuando un impresor 
  N. del T. persona que se dedica a la imprenta',
  'img/BDATA.png');  

  
insert into portafolio_experiencia (
experiencia_titulo,
experiencia_descripcion,
experiencia_foto,
experiencia_direccion_web)
values(
'Programador Backend Jr TATA',
'Lorem Ipsum es simplemente el texto de relleno 
  de las imprentas y archivos de texto. Lorem Ipsum h
  a sido el texto de relleno estándar de las 
  industrias desde el año 1500, cuando un impresor 
  N. del T. persona que se dedica a la imprenta',
'img/tata.png',
'http://www.armando.com/tata');

insert into portafolio_experiencia (
experiencia_titulo,
experiencia_descripcion,
experiencia_foto,
experiencia_direccion_web)
values(
'Programador Fronted Inter GMD',
'Lorem Ipsum es simplemente el texto de relleno 
  de las imprentas y archivos de texto. Lorem Ipsum h
  a sido el texto de relleno estándar de las 
  industrias desde el año 1500, cuando un impresor 
  N. del T. persona que se dedica a la imprenta',
'img/gmf.png',
'http://www.armando.com/gmd');

insert into portafolio_experiencia (
experiencia_titulo,
experiencia_descripcion,
experiencia_foto,
experiencia_direccion_web)
values(
'Programador Back SR Optica',
'Lorem Ipsum es simplemente el texto de relleno 
  de las imprentas y archivos de texto. Lorem Ipsum h
  a sido el texto de relleno estándar de las 
  industrias desde el año 1500, cuando un impresor 
  N. del T. persona que se dedica a la imprenta',
'img/optica.png',
'http://www.armando.com/optica');

insert into portafolio_experiencia (
experiencia_titulo,
experiencia_descripcion,
experiencia_foto,
experiencia_direccion_web)
values(
'Programador Full Stack en tecsup',
'Lorem Ipsum es simplemente el texto de relleno 
  de las imprentas y archivos de texto. Lorem Ipsum h
  a sido el texto de relleno estándar de las 
  industrias desde el año 1500, cuando un impresor 
  N. del T. persona que se dedica a la imprenta',
'img/tecsup.png',
'http://www.armando.com/tecsup');


SELECT*FROM portafolio_datos;
SELECT*FROM portafolio_experiencia;
SELECT*FROM portafolio_proyectos;


INSERT INTO portafolio_datos(datos_nombre,datos_descripcion,datos_foto,datos_correo,datos_twitter,datos_facebook,datos_github,datos_instagram)
SELECT 'TOÑO', 'Administrador de Sistemas','f8.JPG', 'toño@gmail.com', 'toño@twitter', 'toño@facebook', 'toño@github', 'toño@instagram'
union
SELECT 'GUILLE', 'Ingeniero Mecanico','f8.JPG', 'guille@gmail.com', 'guille@twitter', 'guille@facebook', 'guille@github', 'guille@instagram'
union
SELECT 'HELEN', 'Tecnico Computacion Informatica','f8.JPG', 'helen@gmail.com', 'helen@twitter', 'helen@facebook', 'helen@github', 'helen@instagram'
union
SELECT 'TATY', 'Administradora','f8.JPG', 'taty@gmail.com', 'taty@twitter', 'taty@facebook', 'taty@github', 'taty@instagram'
union
SELECT 'MIGUEL', 'Economica','f8.JPG', 'miguel@gmail.com', 'miguel@twitter', 'miguel@facebook', 'miguel@github', 'miguel@instagram'


insert into portafolio_informacion(
datos_codigo,
proyectos_codigo,
experiencia_codigo)
values(3,1,1);

insert into portafolio_informacion(
datos_codigo,
proyectos_codigo,
experiencia_codigo)
values(3,2,2);

insert into portafolio_informacion(
datos_codigo,
proyectos_codigo,
experiencia_codigo)
values(4,3,3);

insert into portafolio_informacion(
datos_codigo,
proyectos_codigo,
experiencia_codigo)
values(5,4,4);

update	portafolio_datos
set		estado='1'
where	datos_codigo in (1,2,3,4,5);


SELECT per.datos_nombre,pro.proyectos_titulo,exp.experiencia_titulo
from portafolio_datos per inner join portafolio_informacion inf 
on per.datos_codigo=inf.datos_codigo
inner join portafolio_proyectos pro 
on  pro.proyectos_codigo=inf.proyectos_codigo
inner join portafolio_experiencia exp 
on  exp.experiencia_codigo=inf.experiencia_codigo
where per.estado=1;

select * from portafolio_datos;
update portafolio_datos set estado=0 where datos_codigo=3



select * from portafolio_datos where datos_codigo=1
select * from portafolio_datos where datos_codigo=2

update	portafolio_datos
set		datos_foto='foto_toño.jpeg'
where datos_codigo=1;
update	portafolio_datos
set		datos_foto='foto_guille.jpg'
where datos_codigo=2;


UPDATE	portafolio_informacion
SET		datos_codigo=1
WHERE	datos_codigo IN (3,4)

UPDATE	portafolio_informacion
SET		datos_codigo=2
WHERE	datos_codigo IN (5)


SELECT	proyecto.titulo, p.proyectos_subtitulo, p.proyectos_fecha, p.proyectos_direccion_web, proyectos.proyectos_descripcion, proyectos.proyectos_foto
FROM	portafolio_proyectos p



SELECT p.proyectos_titulo as titulo, p.proyectos_subtitulo as subtitulo, p.proyectos_fecha as fecha, p.proyectos_direccion_web as web, p.proyectos_descripcion descripcion, p.proyectos_foto as foto FROM portafolio_proyectos p inner join portafolio_informacion i on i.proyectos_codigo=p.proyectos_codigo inner join portafolio_datos d on d.datos_codigo=i.datos_codigo where d.datos_codigo=1




SELECT	p.proyectos_titulo as titulo, p.proyectos_subtitulo as subtitulo, p.proyectos_fecha as fecha, p.proyectos_direccion_web as web, p.proyectos_descripcion descripcion, p.proyectos_foto as foto
FROM	portafolio_proyectos p inner join
		portafolio_informacion i on i.proyectos_codigo=p.proyectos_codigo inner join
        portafolio_datos d on d.datos_codigo=i.datos_codigo
where	d.datos_codigo=1


SELECT	*
FROM	portafolio_proyectos

update	portafolio_proyectos
set		proyectos_foto='portafolio_flask.png'
where	proyectos_codigo=1;

update	portafolio_proyectos
set		proyectos_foto='portafolio_django.jpg'
where	proyectos_codigo=2;


update	portafolio_proyectos
set		proyectos_foto='ecommerce_django.jpg'
where	proyectos_codigo=3;


SELECT * FROM portafolio_datos d inner join portafolio_informacion i on i.datos_codigo=d.datos_codigo inner join portafolio_proyectos p on p.proyectos_codigo=i.proyectos_codigo inner join portafolio_experiencia e on e.experiencia_codigo=i.experiencia_codigo WHERE	d.datos_codigo=1;
SELECT * FROM portafolio_datos d inner join portafolio_informacion i on i.datos_codigo=d.datos_codigo inner join portafolio_proyectos p on p.proyectos_codigo=i.proyectos_codigo inner join portafolio_experiencia e on e.experiencia_codigo=i.experiencia_codigo WHERE d.datos_codigo=1;

update	portafolio_datos
set		datos_nombre='Jorge Antonio Zuñiga Rojas',
		datos_descripcion='Ingeniero de Sistemas'
where	datos_codigo=1

select	experiencia_foto
from	portafolio_experiencia


update	portafolio_experiencia
set		experiencia_direccion_web='https://www.tata.com/',
		experiencia_foto='Tata_Group.jpg'
where	experiencia_codigo=1;

update	portafolio_experiencia
set		experiencia_direccion_web='https://www.granaymontero.com.pe/inicio',
		experiencia_foto='gmd.jpg'
where	experiencia_codigo=2;

update	portafolio_experiencia
set		experiencia_direccion_web='https://www.osapublishing.org/',
		experiencia_foto='optica.jpg'
where	experiencia_codigo=3;

update	portafolio_experiencia
set		experiencia_direccion_web='https://www.tecsup.edu.pe/',
		experiencia_foto='tecsup.jpg'
where	experiencia_codigo=4;

SELECT * FROM portafolio_datos d inner join portafolio_informacion i on i.datos_codigo=d.datos_codigo inner join portafolio_proyectos p on p.proyectos_codigo=i.proyectos_codigo inner join portafolio_experiencia e on e.experiencia_codigo=i.experiencia_codigo WHERE d.datos_codigo=2


select	*
from	portafolio_informacion
where	informacion_codigo=6

update	portafolio_informacion
set		datos_codigo=2
where	informacion_codigo=6


select	*
from	portafolio_proyectos
where	proyectos_codigo=4

update portafolio_proyectos
set		proyectos_foto='bigdata.png'
where	proyectos_codigo=4



SELECT	*
from	portafolio_proyectos;
SELECT	*
from	portafolio_experiencia;

SELECT	*
from	portafolio_informacion;


insert into portafolio_informacion(datos_codigo, proyectos_codigo, experiencia_codigo)
select 1, 3, 3
union
select 1, 4, 4


select*
from portafolio_datos
where datos_codigo=1

update portafolio_datos
set		datos_descripcion='Ingeniero de Sistemas'
where datos_codigo=1




delete
from	portafolio_informacion
where	informacion_codigo=9

