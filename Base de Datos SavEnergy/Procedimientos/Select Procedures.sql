use SavEnergy;


										/*PROCEDIMIENTO BUSQUEDA DE USUARIOS*/
                            
DELIMITER $$
CREATE PROCEDURE validacion(user varchar(20), pass varchar(25))
BEGIN
SELECT id_usuario FROM usuarios where email = user and contrasenia = pass;
END $$

											/* PROCEDIMIENTOS SELECT */

				/*Tabla Consumos*/

DELIMITER $$ CREATE PROCEDURE select_consumo(user varchar(25),FECHA_C DATE, TIPO INT(2))
BEGIN
SELECT * FROM consumos WHERE id_usuario = user and fecha = FECHA_C AND id_tipo_consumo = TIPO;
END$$

				/*Seleccion de Tarifas y Coutas*/
DELIMITER $$
CREATE PROCEDURE select_tarifas(ID_T VARCHAR(12), ID_C VARCHAR(12))
BEGIN
SELECT * FROM rangos_de_consumo where Tarifa = ID_T AND Cuota = ID_C;
END$$

CALL select_tarifas("1A","Normal")$$

				
                /*Validacion de producto*/

DELIMITER $$
CREATE PROCEDURE validacion_producto(CLAVE VARCHAR(25))
BEGIN
SELECT estado FROM productos where clave_producto = CLAVE;
END$$

SELECT estado FROM productos where clave_producto = "holamundo1235"$$

CALL validacion_producto("holamundo123")$$


                /*Validacion de correo*/

DELIMITER $$
CREATE PROCEDURE validacion_correo(correo VARCHAR(25))
BEGIN
select email from usuarios where email = correo;
END$$

CALL validacion_correo("luis.luis@gmail.com")$$


			/* Selección de periodos del usuario */
			
DELIMITER $$
CREATE PROCEDURE select_periodos(IN ID_USER INT(8))
BEGIN
SELECT recibo.fecha_inicio, recibo.fecha_corte FROM recibo WHERE id_usuario = ID_USER;
END$$



