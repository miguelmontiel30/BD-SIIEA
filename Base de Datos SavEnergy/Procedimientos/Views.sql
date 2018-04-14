use SavEnergy;

CREATE OR REPLACE VIEW Rangos_de_Consumo
AS SELECT rangos_consumo.id_rango AS 'ID Rango', rangos_consumo.rango AS 'Rango',
		  rangos_consumo.precio AS 'Precio', nivel_consumo.nivel_consumo AS 'Nivel Consumo',
          cuotas.cuota AS 'Cuota', tarifas.tarifa AS 'Tarifa'
FROM rangos_consumo
INNER JOIN nivel_consumo ON nivel_consumo.id_nivel_consumo = rangos_consumo.id_nivel_consumo
INNER JOIN cuotas ON cuotas.id_cuotas = rangos_consumo.id_cuotas
INNER JOIN tarifas ON tarifas.id_tarifa = rangos_consumo.id_tarifa;


CREATE OR REPLACE VIEW usuarios_view
AS SELECT usuarios.id_usuario, usuarios.foto,usuarios.contrasenia,usuarios.email, usuarios.nombre,
	  usuarios.proxima_fecha_c,usuarios.tipo_usuario, cuotas.cuota AS 'Cuota', tarifas.tarifa AS 'Tarifa'
FROM usuarios 
INNER JOIN cuotas ON cuotas.id_cuotas = usuarios.id_cuotas 
INNER JOIN tarifas ON tarifas.id_tarifa = usuarios.id_tarifa;
