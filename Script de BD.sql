drop database SavEnergy;
create database SavEnergy;
use SavEnergy;

CREATE TABLE tarifas(
id_tarifa INT(2) ZEROFILL AUTO_INCREMENT NOT NULL PRIMARY KEY,
tarifa VARCHAR(5) NOT NULL);

CREATE TABLE nivel_consumo(
id_nivel_consumo INT(2) ZEROFILL AUTO_INCREMENT NOT NULL PRIMARY KEY,
nivel_consumo VARCHAR(17) NOT NULL);

CREATE TABLE tipo_consumo(
id_tipo_consumo INT(2) ZEROFILL AUTO_INCREMENT NOT NULL PRIMARY KEY,
tipo_consumo VARCHAR(14) NOT NULL);

CREATE TABLE cuotas(
id_cuotas INT(2) ZEROFILL AUTO_INCREMENT NOT NULL PRIMARY KEY,
cuota VARCHAR(10) NOT NULL);

CREATE TABLE rangos_consumo(
id_rango INT(4) ZEROFILL AUTO_INCREMENT NOT NULL,
rango INT(4) NOT NULL,
precio FLOAT(4,4) NOT NULL,
id_nivel_consumo INT(2) ZEROFILL NOT NULL,
id_cuotas INT(2) ZEROFILL NOT NULL,
id_tarifa INT(2) ZEROFILL NOT NULL,
primary key (id_rango,id_nivel_consumo,id_cuotas,id_tarifa),
foreign key (id_nivel_consumo) references nivel_consumo(id_nivel_consumo),
foreign key (id_cuotas) references cuotas(id_cuotas),
foreign key (id_tarifa) references tarifas(id_tarifa));

CREATE TABLE usuarios(
id_usuario INT(8) ZEROFILL AUTO_INCREMENT NOT NULL PRIMARY KEY,
foto MEDIUMBLOB NULL,
contrasenia varchar(15) not null,
email varchar(25) NOT NULL,
nombre VARCHAR(25) NULL,
fecha_de_corte date NULL,
id_tarifa INT(2) ZEROFILL NULL,
id_cuotas INT(2) ZEROFILL NULL,
tipo_usuario varchar(10) NOT NULL,
foreign key (id_cuotas) references cuotas(id_cuotas),
foreign key (id_tarifa) references tarifas(id_tarifa));

CREATE TABLE productos(
id_producto INT(8) ZEROFILL AUTO_INCREMENT NOT NULL PRIMARY KEY,
id_usuario INT(8) ZEROFILL NULL,
clave_producto VARCHAR(20) NOT NULL,
estado VARCHAR(10) NULL,
descripcion VARCHAR(50) NULL,
id_tarifa INT(2) ZEROFILL NULL,
id_cuotas INT(2) ZEROFILL NULL,
foreign key (id_cuotas) references cuotas(id_cuotas),
foreign key (id_tarifa) references tarifas(id_tarifa),
foreign key (id_usuario) references usuarios(id_usuario));

CREATE TABLE periodos_corte(
id_periodo INT(8) ZEROFILL AUTO_INCREMENT NOT NULL PRIMARY KEY,
id_tipo_consumo INT(2) ZEROFILL NULL,
fecha_corte_inicio DATE NOT NULL,
fecha_corte_final DATE NOT NULL,
foreign key (id_tipo_consumo) references tipo_consumo(id_tipo_consumo));

CREATE TABLE consumos(
id_usuario INT(8) ZEROFILL NOT NULL,
fecha DATE NOT NULL,
volts FLOAT(4,4) NOT NULL,
id_tipo_consumo INT(2) ZEROFILL NOT NULL,
id_periodo INT(8) ZEROFILL NOT NULL,
id_rango INT(4) ZEROFILL NOT NULL,
FOREIGN KEY (id_usuario) references usuarios(id_usuario),
FOREIGN KEY (id_tipo_consumo) references tipo_consumo(id_tipo_consumo),
FOREIGN KEY (id_periodo) references periodos_corte(id_periodo),
FOREIGN KEY (id_rango) references rangos_consumo(id_rango));



