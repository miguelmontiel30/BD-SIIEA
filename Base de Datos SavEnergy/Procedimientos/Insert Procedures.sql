use SavEnergy;

								/* PROCEDIMIENTOS INSERT */

		/* Tarifas */

DELIMITER $$

CREATE PROCEDURE insert_tarifa(
in Tarifa varchar(5)) 
BEGIN
INSERT INTO tarifas(tarifa) 
values (Tarifa);
END$$

CALL insert_tarifa("1A")$$

		/* nivel Consumo */
        
DELIMITER $$

CREATE PROCEDURE insert_nivel_consumo(
in Nivel varchar(17)) 
BEGIN
INSERT INTO nivel_consumo(nivel_consumo) 
values (Nivel);
END$$

CALL insert_nivel_consumo("Básico")$$

		/* tipo Consumo */
        
DELIMITER $$

CREATE PROCEDURE insert_tipo_consumo(
in Tipo varchar(17)) 
BEGIN
INSERT INTO tipo_consumo(tipo_consumo) 
values (Tipo);
END$$

CALL insert_tipo_consumo("Sustentable")$$


		/* Cuotas */
        
DELIMITER $$

CREATE PROCEDURE insert_cuotas(
in Cuotas varchar(17)) 
BEGIN
INSERT INTO cuotas(cuota) 
values (Cuotas);
END$$

CALL insert_cuotas("Verano")$$

		/* Rangos de consumo */
        
DELIMITER $$

CREATE PROCEDURE insert_rangos(
in RANGO_IN INT(4),
RANGO_TER INT(4),
Precio FLOAT(3),
N_Consumo INT(2),
Cuota INT(2),
Tarifa INT(2))
BEGIN
INSERT INTO rangos_consumo(rango_minimo,rango_maximo,precio,id_nivel_consumo,id_cuotas,id_tarifa) 
values (Rango_IN,RANGO_TER,Precio,N_Consumo,Cuota,Tarifa);
END$$                


CALL insert_rangos(0,100,0.85,1,1,1)$$

		/*Registro de productos*/
DELIMITER $$
CREATE PROCEDURE insert_producto(
clave_p VARCHAR(20),
estado VARCHAR(10),
descripcion VARCHAR(50))
BEGIN
INSERT INTO productos(id_clave_producto,estado,descripcion) 
values (clave_p,estado,descripcion);
END$$                


CALL insert_producto("holamundo123","Activo","Producto SavEnergy")$$

		/*Registro de usuarios*/
        
DELIMITER $$

CREATE PROCEDURE insert_user(
in contra varchar(15), 
correo varchar(25),
id_t INT(2),
id_c INT(2),
id_clave varchar(15))
BEGIN
INSERT INTO usuarios(contrasenia,email,nombre,id_tarifa,id_cuotas,id_clave_producto,tipo_usuario) 
values (contra,correo,"Nuevo Usuario",id_t,id_c,id_clave,"Cliente");
END$$

CALL insert_user("123","luis.luis@gmail.com",01,01,"holamundo123")$$
