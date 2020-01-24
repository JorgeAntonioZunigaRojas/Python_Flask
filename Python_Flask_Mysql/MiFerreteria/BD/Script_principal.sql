drop schema FERRETERIA;

create schema FERRETERIA;
USE FERRETERIA;

CREATE TABLE EMPRESA(
id_empresa		char(11) not null primary key,
nombre			varchar(60),
banner_fondo	varchar(250),
banner_texto	varchar(250),
pie_pagina 		varchar(250));

CREATE TABLE PRODUCTO(
id_producto	int not null primary key,
nombre		varchar(500),
moneda		varchar(5),
precio		decimal(12,2),
imagen		varchar(500),
estado		char(1));

CREATE TABLE PRODUCTO_CARACTERISTICA(
id_caracteristica int not null primary key,
id_producto	int,
atributo varchar(60),
detalle varchar(500));

DELIMITER $$
CREATE PROCEDURE SP_PRODUCTO_Q01()
BEGIN
	SELECT	E.id_empresa AS empresa_id_empresa, 
			E.nombre as empresa_nombre, 
			E.banner_texto as empresa_banner_texto, 
			E.banner_fondo as empresa_banner_fondo, 
			E.pie_pagina as empresa_pie_pagina, 
			P.id_producto as producto_id_producto, 
			P.nombre as producto_nombre, 
			P.moneda as producto_moneda, 
			P.precio as producto_precio, 
			P.imagen as producto_imagen
	FROM	EMPRESA E,
			PRODUCTO P
	WHERE	P.estado='A'
    ORDER BY P.nombre;
END;$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE SP_PRODUCTO_Q02(IN codigo int)
BEGIN
	SELECT	P.id_producto as id_producto,
			P.nombre as nombre,
			P.moneda as moneda,
			P.precio as precio,
			P.imagen as imagen,
			P.estado as estado,
			C.atributo AS atributo, 
			C.detalle AS detalle
	FROM	PRODUCTO P INNER JOIN
			PRODUCTO_CARACTERISTICA C ON P.id_producto=C.id_producto
	WHERE	P.id_producto=codigo
    ORDER BY C.atributo;
END;$$
DELIMITER ;

insert into EMPRESA(id_empresa, nombre, banner_texto, banner_fondo, pie_pagina)
values('10438098971', 'Ferreteria Z&R Soluciones S.A.C.', 'QUEREMOS SER EL PRINCIPAL ALIADO EN LOS PROYECTOS DE CONSTRUCIÓN DEL PERÚ', 'fondo.jpg', '[ Servicio al Cliente: (01) 419 2000 ] - [ Venta Telefónica: (01) 615 6002 ] - [ Gracias por tu preferencia... ]');

INSERT INTO PRODUCTO(id_producto, nombre, moneda, precio, imagen, estado)
SELECT 1, 'Ladrillo Techo 8 Huecos Rayado Pirámide', 'S/', 2.10, 'ladrillo_18_huecos.png', 'A' UNION
SELECT 2, 'Cemento Sol T1 Sol', 'S/', 22.20, 'cemento_sol.png', 'A' UNION
SELECT 3, 'Barras de Acero 3/4 Aceros Arequipa', 'S/', 15.25, 'Barras_Acero.png', 'A' UNION
SELECT 4, 'Estribos 6 mm x 18 x 18 cm Aceros Arequipa', 'S/', 21.90, 'estribo_6.png', 'A' UNION
SELECT 5, 'Malla Alambre Galvanizado Hexagonal 3/4 Hyde Tools', 'S/', 2.93, 'Malla_Alambre_Galvanizado.png', 'A' UNION
SELECT 6, 'Escalera Tijera Madera 8 Pasos I Forest', 'S/', 109.90, 'escalera.png', 'A' UNION
SELECT 7, 'Ocre Rojo x 1 kg Topex', 'S/', 13.90, 'ocre.png', 'A' UNION
SELECT 8, 'Arena Gruesa x 2 kg Martell', 'S/', 3, 'arena_gruesa.png', 'A' UNION
SELECT 9, 'Arena Gruesa m3 Topex', 'S/', 57, 'arena_gruesa_m3.png', 'A';
/*
*/
INSERT INTO PRODUCTO_CARACTERISTICA(id_caracteristica, id_producto, atributo, detalle)
SELECT 1,3, 'Características', 'Barra de construcción ASTM A615 Grado 60. Barras de acero rectas de sección circular, con resaltes Hi-bond de alta adherencia con el concreto. Norma NTP 341.031 Grado 60' UNION
SELECT 2,3, 'Marca', 'Aceros Arequipa' UNION
SELECT 3,3, 'Medidas', '9 m' UNION
SELECT 4,3, 'Diámetro Barra', '3/4"' UNION
SELECT 5,3, 'Peso', '2.235 kg/m' UNION
SELECT 6,3, 'Uso', 'Ideal en la construcción de edificaciones de concreto armado de todo tipo: en viviendas, edificios, puentes, obras industriales, etc.' UNION
SELECT 7,3, 'Recomendaciones', 'Guardar el fierro colocándolo sobre palos de madera y cubriéndolo con plástico para protegerlo de la lluvia y evitar que se oxide. Si se oxida, es necesario limpiar la escama con una escobilla de acero. Debe limpiarse de suciedades, ya sea pintura, grasa o aceite.' UNION
SELECT 8,3, 'Tipo', 'Fierro' UNION
SELECT 9,3, 'Categoria', 'Construccion de Muros y Columna';

INSERT INTO PRODUCTO_CARACTERISTICA(id_caracteristica, id_producto, atributo, detalle)
SELECT 10,2, 'Características', 'Moderada resistencia a los sulfatos. Resistencia al agua de mar. De moderado calor de hidratación.' UNION
SELECT 11,2, 'Marca', 'Pacasmayo' UNION
SELECT 12,2, 'Peso de cemento', '42.5 Kg' UNION
SELECT 13,2, 'Color', 'Gris' UNION
SELECT 14,2, 'Uso y Aplicaciones', 'Concreto con exposición moderada a los sulfatos. Estructuras en contacto con ambientes y suelos húmedos-salitrosos. Estructuras en ambiente marino. Obras portuarias. Concreto en clima cálido. Estructuras de concreto masivo. Concreto compactado con rodillo. Obra con presencia de agregados reactivos. Pavimentos y losas' UNION
SELECT 15,2, 'Recomendaciones', 'Es importante utilizar agregados de buena calidad. Siempre realizar el curado con agua a fin de lograr un buen desarrollo de resistencia y acabado final. Almacenar las bolsas bajo techo, separadas de paredes o pisos y protegidas al aire húmedo. Evitar almacenar en pilas de más de 10 bolsas para evitar compactación.' UNION
SELECT 16,2, 'Tipo', 'Antisalitre' UNION
SELECT 17,2, 'Zonas	Cemento disponible en:', 'Chimbote, Trujillo, Chiclayo, Piura, Sullana y Cajamarca' UNION
SELECT 18,2, 'Ficha Técnica', 'Ficha Técnica' UNION
SELECT 19,2, 'Categoría', 'Cementos';

INSERT INTO PRODUCTO_CARACTERISTICA(id_caracteristica, id_producto, atributo, detalle)
SELECT 20,1,'Características','Ladrillo rayado de alta calidad, resistente y de larga duración. De 8 huecos.' UNION
SELECT 21,1,'Marca','Pirámide' UNION
SELECT 22,1,'Tipo de uso','Construcción' UNION
SELECT 23,1,'Dimensiones','15 x 15 x 24 cm' UNION
SELECT 24,1,'Color','Anaranjado' UNION
SELECT 25,1,'Usos y aplicaciones','Para las construcciones en general' UNION
SELECT 26,1,'Recomendaciones','Evitar almacenar en pilas de más de 10 bolsas para evitar' UNION
SELECT 27,4,'Manual de Producto','Manual de Producto' UNION
SELECT 28,4,'Características','Listos para instalar, ahorro de tiempo y estricto control de calidad.' UNION
SELECT 29,4,'Marca','Aceros Arequipa' UNION
SELECT 30,4,'Medidas','18 x 18 cm' UNION
SELECT 31,4,'Diámetro Estribo','6 mm' UNION
SELECT 32,4,'Peso','0.220 kg/m' UNION
SELECT 33,4,'Uso','Ideal para columnas y vigas.' UNION
SELECT 34,4,'Recomendaciones','Guardar el fierro colocándolo sobre palos de madera y cubriéndolo con plástico para protegerlo de la lluvia y evitar que se oxide. Si se oxida, es necesario limpiar la escama con una escobilla de acero. Debe limpiarse de suciedades, ya sea pintura, grasa o aceite.' UNION
SELECT 35,4,'Tipo','Estribos';


call SP_PRODUCTO_Q02(1)