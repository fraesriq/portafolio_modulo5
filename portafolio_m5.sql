--Crear un modelo de base de datos y ejecutar operaciones en la misma que simulen los procesos de compra del frontend y el registro/creacion de usuarios del mismo. Se debe guardar
--la informacion de compra de cada usuario.
-- Del enunciado del ejercicio debe entregar un script en un archivo con extension sql con las siquientes consultas:
-- Como un entregable, nos piden que diseñemos un diagrama entidad relacion o modelo relacional de PgAdmin
-- A partir del diagrama, debemos construir un script que cree tablas de acuerdo con las entidades e ingrese datos.
-- Se debe poblar las tablas con lenguaje de consultas DML(insert), al menos con 5 datos por tablas.
DROP TABLE IF EXISTS product,sale,sale_detail,users,address;

/*---------Tabla Usuario------------*/
CREATE TABLE users
(
    rut character varying (20) ,
	pass character varying(20),
	name_user character varying(50),
	lastname_user character varying(50),
	email character varying(50),
    PRIMARY KEY (rut)
);

/*---------Tabla Dirección Usuario------------*/
CREATE TABLE address
(
    id serial NOT NULL,
    user_id character varying(20),
    address character varying(100),
    add_comune character varying(50),
    add_city character varying(50),
    add_state character varying(50),
    PRIMARY KEY(id),
    FOREIGN KEY(user_id) REFERENCES users(rut)
);

/*--------Tabla Productos--------*/
CREATE TABLE product
(
    id integer NOT NULL,
    name character varying(100),
    description character varying(200),
    det1 character varying(100),
    det2 character varying(100),
    det3 character varying(100),
    value_product integer,
    discount integer,
    stock integer,
    img character varying(100),
    PRIMARY KEY (id)
);

/*--------Tabla Compra--------*/
CREATE TABLE sale
(
    id serial NOT NULL,
    user_id character varying(20),
    date_sale date,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users(rut)
);

/*--------Tabla Detalle Compra--------*/
CREATE TABLE sale_detail
(
    id serial NOT NULL,
    sale_id integer,
    product_id integer,
    amount integer,
    value_product integer,
    PRIMARY KEY (id),
    FOREIGN KEY (sale_id) REFERENCES sale(id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

/*--------Agregar los productos--------*/
INSERT INTO product VALUES ('1','Parlante Sony','Parlante Bluetooth Sony SRS-XB43 Negro','Conexión Bluetooth: Sí','Potencia: 10W','Conexión USB: Sí','15000','3200','10','prod_1.webp');
INSERT INTO product VALUES ('2','Silla de Camping','Alpinextrem Silla de Camping Plegable Alpinextrem','Modelo: D21','Hecho en: China','Peso: 1,2','22000','1200','8','prod_2.webp');
INSERT INTO product VALUES ('3','Zapatilla','Zapatilla Mujer Skechers','Marca: Skechers','Modelo: 128273-BLK','Hecho en: China','25200','4500','15','prod_3.webp');
INSERT INTO product VALUES ('4','Linterna','Linterna Recargable Fenix E09R','Linterna Recargable','Hasta 600 lumenes','Dura hasta 70 horas.','12500','1500','4','prod_4.webp');
INSERT INTO product VALUES ('5','Estuche','Hori Estuche Nintendo Switch Hori Tough Pouch','Marca: Hori','Modelo: Tough Pouch','Peso: 1.2','15000','3000','3','prod_5.webp');
INSERT INTO product VALUES ('6','Estuche','Hori Estuche Nintendo Switch Hori Aluminio Pikachu','Marca: Hori','Modelo: Aluminio Pikachu','Peso: 1.2','15000','3000','20','prod_6.webp');
SELECT * FROM product;

/*--------Agregar los usuarios--------*/
INSERT INTO users values ('145795036','contraseña1','Francisco','Espindola','fraesri@gmail.com');
INSERT INTO users values ('111111111','contraseña2','Daniel','Aranda','daranda@gmail.com');
INSERT INTO users values ('222222222','contraseña3','Silvio','Espindola','sespindola@gmail.com');
INSERT INTO users values ('333333333','contraseña4','Jasmina','Velozo','jkvelozo@gmail.com');
INSERT INTO users values ('444444444','contraseña5','Javier','Espindola','jesp18@gmail.com');
SELECT * FROM users;

/*--------Agregar las direcciones--------*/
INSERT INTO address VALUES (default,'145795036','av colon 31','peñalolen','santiago','RM');
INSERT INTO address VALUES (default,'111111111','calle el olivo 1221','maipu','santiago','RM');
INSERT INTO address VALUES (default,'222222222','labo albano 18889','maipu','santiago','RM');
INSERT INTO address VALUES (default,'333333333','labo de lugano 16787','maipu','santiago','RM');
INSERT INTO address VALUES (default,'444444444','labo carezza 1234','maipu','santiago','RM');
SELECT * FROM address;

/*-------Agregar compras de cada usuario--------*/
INSERT INTO sale VALUES (default,'145795036','2021-12-12');
INSERT INTO sale VALUES (default,'111111111','2021-12-15');
INSERT INTO sale VALUES (default,'222222222','2021-12-25');
INSERT INTO sale VALUES (default,'333333333','2022-01-01');
INSERT INTO sale VALUES (default,'444444444','2022-01-03');
INSERT INTO sale VALUES (default,'111111111','2022-01-05');
INSERT INTO sale VALUES (default,'145795036','2022-01-15');
INSERT INTO sale VALUES (default,'111111111','2022-01-17');
INSERT INTO sale VALUES (default,'333333333','2022-02-05');
INSERT INTO sale VALUES (default,'145795036','2022-02-08');
INSERT INTO sale VALUES (default,'444444444','2022-12-10');
INSERT INTO sale VALUES (default,'145795036','2022-12-12');
INSERT INTO sale VALUES (default,'444444444','2022-12-21');
SELECT * FROM sale;

/*-------Agrego los detalle de compra ----------*/
INSERT INTO sale_detail VALUES (default,1,1,1,15000);
INSERT INTO sale_detail VALUES (default,1,3,1,25200);
INSERT INTO sale_detail VALUES (default,2,4,2,12500);
INSERT INTO sale_detail VALUES (default,2,5,2,15000);
INSERT INTO sale_detail VALUES (default,3,3,1,25200);
INSERT INTO sale_detail VALUES (default,4,2,2,22000);
INSERT INTO sale_detail VALUES (default,4,3,2,25200);
INSERT INTO sale_detail VALUES (default,5,4,1,12500);
INSERT INTO sale_detail VALUES (default,6,2,1,22000);
INSERT INTO sale_detail VALUES (default,7,1,1,15000);
INSERT INTO sale_detail VALUES (default,7,2,1,22000);
INSERT INTO sale_detail VALUES (default,7,3,1,25200);
INSERT INTO sale_detail VALUES (default,8,1,5,15000);
INSERT INTO sale_detail VALUES (default,9,4,1,12500);
INSERT INTO sale_detail VALUES (default,10,3,1,25200);
INSERT INTO sale_detail VALUES (default,10,6,2,15000);
INSERT INTO sale_detail VALUES (default,11,2,1,22000);
INSERT INTO sale_detail VALUES (default,12,1,1,15000);
INSERT INTO sale_detail VALUES (default,13,3,1,25200);
SELECT * FROM sale_detail;

-- Luego debemos realizar las consultas SQL que indiquen:
-- - Actualizar el precio de todos los productos, -20% por concepto de oferta de verano.

UPDATE product SET value_product=round(value_product*0.8,0);
SELECT * FROM product;

-- - Listar todos los productos con stock critico (Menos o igual a 5 unidades)

SELECT * FROM product WHERE stock<=5 ORDER by stock ASC;

-- - Simular la compra de al menos 3 productos, calcular el subtotal, agregar el IVA y mostrar el total de la compra.

INSERT INTO sale VALUES(default,'145795036','22-12-2022');
INSERT INTO sale_detail VALUES (default,(SELECT MAX(id) FROM sale),1,1,12000);
INSERT INTO sale_detail VALUES (default,(SELECT MAX(id) FROM sale),2,1,17600);
INSERT INTO sale_detail VALUES (default,(SELECT MAX(id) FROM sale),3,1,20160);

/*calcular el subtotal, agregar el IVA y mostrar el total de la compra*/

SELECT sum(sale_detail.value_product*sale_detail.amount) AS subtotal, 
round(sum(sale_detail.value_product*sale_detail.amount)*0.19,0) as iva,
sum(sale_detail.value_product*sale_detail.amount)+round(sum(sale_detail.value_product*sale_detail.amount)*0.19,0) as total
FROM sale_detail
inner join sale
ON sale.id = sale_detail.sale_id
inner join product
ON sale_detail.product_id = product.id
WHERE sale.id = 14;

-- - Mostrar el total de ventas del mes de Diciembre del 2022.

SELECT count(distinct sale_id) as numero_compras, round(sum((sale_detail.value_product*sale_detail.amount*1.19)),0) as Total
FROM sale_detail 
inner join sale 
ON sale.id=sale_detail.sale_id
inner join product
ON product.id=sale_detail.product_id
WHERE (extract(month FROM date_sale)=12) AND (extract(year FROM date_sale)=2022);

-- - Listar el comportamiento de compra del usuario que mas compras realizo durante el 2022.

SELECT rut, concat(name_user,' ',lastname_user) as nombre_completo,sale.date_sale,sale.id, round(sum((sale_detail.value_product*sale_detail.amount*1.19)),0) as Total_compra
FROM users
inner join sale 
ON users.rut=sale.user_id
inner join sale_detail
ON sale.id=sale_detail.sale_id
inner join product
ON product.id=sale_detail.product_id
GROUP BY sale.id,rut,sale.date_sale
HAVING (extract(year FROM sale.date_sale)=2022) 
AND rut=(SELECT user_id AS max_comprador
FROM ( SELECT user_id,count(user_id) AS n_compras
FROM sale
GROUP BY user_id
ORDER BY n_compras desc
limit 1) AS tabla_calculada);