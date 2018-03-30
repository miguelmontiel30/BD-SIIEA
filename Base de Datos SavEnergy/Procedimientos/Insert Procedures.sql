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
in Rango int(4), 
Precio FLOAT(4,4),
N_Consumo INT(2),
Cuota INT(2),
Tarifa INT(2))
BEGIN
INSERT INTO rangos_consumo(rango,precio,id_nivel_consumo,id_cuotas,id_tarifa) 
values (Rango,Precio,N_Consumo,Cuota,Tarifa);
END$$                


CALL insert_rangos(100,0.85,1,1,1)$$



		/*Registro de usuarios*/
        
DELIMITER $$

CREATE PROCEDURE insert_user(
in contra varchar(15), 
correo varchar(25),
usuario varchar(25),
f_c date,
id_t INT(2),
id_c INT(2),
T_USER varchar(15))
BEGIN
INSERT INTO usuarios(contrasenia,email,nombre,fecha_de_corte,id_tarifa,id_cuotas,tipo_usuario) 
values (contra,correo,usuario,f_C,id_t,id_c,T_user);
END$$                


CALL insert_user("holaas","luis.luis@gmail.com","Nuevo Usuario",'2018-04-25',1,1,"Cliente")$$


/*Registro de productos*/
        
DELIMITER $$

CREATE PROCEDURE insert_producto(
clave_p VARCHAR(20),
estado VARCHAR(10),
descripcion VARCHAR(50))
BEGIN
INSERT INTO productos(clave_producto,estado,descripcion) 
values (clave_p,estado,descripcion);
END$$                


CALL insert_producto("holamundo123","Inactivo","Producto SavEnergy")$$