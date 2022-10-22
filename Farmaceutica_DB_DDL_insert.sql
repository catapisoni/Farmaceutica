CREATE DATABASE FARMACEUTICA

USE FARMACEUTICA

create table tipos_productos
(
	id_tipo_producto int identity (1,1),
	descripcion varchar(50) not null
	constraint pk_tipos_producto primary key (id_tipo_producto)
)

create table tipos_especialidad
(
	id_tipo_especialidad int identity(1,1),
	especialidad varchar(30) not null
	constraint pk_tipos_especialidad primary key (id_tipo_especialidad)
)

create table provincias
(
	id_provincia int identity(1,1),
	nom_provincia varchar(30) not null
	constraint pk_provincias primary key (id_provincia)
)

create table localidades
(
	id_localidad int identity(1,1),
	nom_localidad varchar(30) not null,
	id_provincia int not null
	constraint pk_localidades primary key (id_localidad),
	constraint fk_provincias foreign key (id_provincia)
	references PROVINCIAS (id_provincia)
)

CREATE TABLE BARRIOS
(
	id_barrio int identity (1,1),
	nom_barrio varchar (50) not null,
	id_localidad int,
	constraint pk_barrio primary key(id_barrio),
	constraint fk_barrio_localidades foreign key(id_localidad)
	references localidades(id_localidad)
)

CREATE TABLE TIPOS_DOC
(
	id_tipo_documento int identity (1,1),
	descripcion varchar (40) not null,
	constraint pk_tipos_doc primary key (id_tipo_documento)
)

CREATE TABLE FORMAS_PAGO
(
	id_forma_pago int identity(1,1),
	descripcion varchar (50) not null,
	constraint pk_forma_pago primary key (id_forma_pago)
)

CREATE TABLE CONDICIONES_IVA
(
	id_cond_iva int identity(1,1),
	cond_iva varchar (50) not null,
	constraint pk_condicion_iva primary key (id_cond_iva)
)

CREATE TABLE OBRAS_SOCIALES
(
	cuit_obra_social int identity(1,1),
	nom_obra_social varchar (50) not null,
	direccion varchar (60),
	altura int,
	id_barrio int
	constraint pk_obra_social primary key (cuit_obra_social),
	constraint fk_obra_social_barrio foreign key (id_barrio)
		references BARRIOS (id_barrio)
)

CREATE TABLE PRODUCTOS
(
	id_producto int identity (1,1),
	vta_receta bit,
	descripcion varchar(150) not null,
	nombre_comercial varchar(100) not null,
	cod_barras int not null,
	precio decimal not null,
	vencimiento date not null,
	id_tipo_producto int,
	constraint pk_id_producto primary key (id_producto),
	constraint fk_id_tipo_producto foreign key (id_tipo_producto) 
		references TIPOS_PRODUCTOS  (id_tipo_producto)
)

CREATE TABLE SUCURSALES
(
	Id_Sucursal int identity(1,1),
	nom_sucursaL varchar(100) not null,
	direccion varchar (150) not null,
	altura int,
	id_barrio int,
	constraint pk_Id_Sucursal primary key (Id_Sucursal),
	constraint fk_Id_barrio foreign key (Id_barrio) 
		references BARRIOS  (Id_barrio)
)

CREATE TABLE PERSONAS
(
	id_persona int identity(1,1),
	nombre varchar(50) not null,
	apellido varchar(50) not null,
	id_tipo_documento int,
	numero_documento int,
	fecha_nac date,
	mail varchar(50),
	telefono varchar(50),
	Direccion varchar (150) not null,
	altura int,
	id_barrio int
	constraint pk_id_persona primary key (id_persona),
	constraint fk_id_barrio2 foreign key (id_barrio) 
		references BARRIOS (id_barrio),
	constraint fk_id_tipo_documento foreign key (id_tipo_documento) 
		references TIPOS_DOC  (id_tipo_documento)
)

CREATE TABLE MEDICOS 
(
	matricula_medico int not null,
	id_persona int,
	id_especialidad int
	constraint pk_matricula_medico PRIMARY KEY (matricula_medico),
	constraint fk_id_persona FOREIGN KEY (id_persona)
		REFERENCES PERSONAS (id_persona),
	constraint fk_id_especialidad FOREIGN KEY (id_especialidad)
		REFERENCES TIPOS_ESPECIALIDAD(id_tipo_especialidad)
)

CREATE TABLE RECETAS
(
	id_receta int identity(1,1),
	descripcion varchar(150) not null,
	matricula_medico int,
	constraint pk_id_receta primary key (id_receta),
	constraint fk_matricula_medico foreign key (matricula_medico)
		References MEDICOS (matricula_medico)
)

CREATE TABLE VALIDACIONES_COBERTURA
(
	id_validacion int identity(1,1),
	nro_afiliado int not null,
	id_receta int,
	cuit_obra_social int,
	fecha_validacion date,
	constraint pk_id_validacion primary key (id_validacion),
	constraint fk_id_receta foreign key (id_receta) 
		references  RECETAS (id_receta),
	constraint fk_cuit_obra_social foreign key (cuit_obra_social)  
		references OBRAS_SOCIALES (cuit_obra_social)
)

CREATE TABLE EMPLEADOS
(
	id_empleado int identity (1,1) not null, --o legajo,
	id_persona int not null,
	observacion varchar (100)
	constraint pk_id_empleado PRIMARY KEY (id_empleado),
	constraint fk_id_persona3 FOREIGN KEY (id_persona)
		REFERENCES PERSONAS (id_persona)
)

CREATE TABLE CLIENTES
(
	id_cliente int identity (1,1),
	id_persona int,
	cuit_Obra_social int,
	id_condicion_iva int
	constraint pk_id_cliente PRIMARY KEY (id_cliente),
	constraint fk_id_persona4 FOREIGN KEY (id_persona)
		REFERENCES PERSONAS (id_persona),
	constraint fk_cuit_Obra_social2 FOREIGN KEY (cuit_Obra_social)
		REFERENCES OBRAS_SOCIALES (cuit_Obra_social),
	constraint fk_id_condicion_iva FOREIGN KEY (id_condicion_iva)
		REFERENCES CONDICIONES_IVA (id_cond_iva)
)

CREATE TABLE DESCUENTOS_OS_VIGENTES
(
	id_descuento_os int identity (1,1),
	descuento_obra_social decimal (8,2),
	id_producto int,
	cuit_obra_social int,
	id_sucursal int,
	fecha_descuento date
	constraint pk_id_descuento PRIMARY KEY (id_descuento_os),
	constraint fk_id_producto FOREIGN KEY (id_producto)
		REFERENCES PRODUCTOS (id_producto),
	constraint fk_obra_social FOREIGN KEY (cuit_obra_social)
		REFERENCES Obras_Sociales (cuit_obra_social),
	constraint fk_sucursal FOREIGN KEY (id_sucursal)
		REFERENCES Sucursales (id_sucursal)
)

CREATE TABLE EMPRESAS_LOGISTICA
(
	cuit_empresa_logistica int identity (1,1),
	nom_empresa_logistica varchar (70),
	id_barrio int,
	id_condicion_iva int,
	responsable_entrega varchar (70),
	direccion varchar (70),
	altura int,
	constraint pk_empresas_logistica primary key (cuit_empresa_logistica),
	constraint fk_empresa_barrio foreign key (id_barrio)
		references barrios (id_barrio),
	constraint fk_empresa_iva foreign key (id_condicion_iva)
		references condiciones_iva (id_cond_iva)
)

CREATE TABLE ORDENES_DE_COMPRA
(
	id_orden_compra int identity (1,1),
	condicion_entrega varchar (100),
	fecha_oc date,
	id_forma_pago int,
	cuit_empresa_logistica int,
	id_empleado int,
	id_sucursal int
	constraint pk_orden_compra primary key (id_orden_compra),
	constraint fk_orden_compra_forma_pago foreign key (id_forma_pago)
		references formas_pago (id_forma_pago),
	constraint fk_orden_compra_empresa foreign key (cuit_empresa_logistica)
		references empresas_logistica (cuit_empresa_logistica),
	constraint fk_orden_compra_empleado foreign key (id_empleado)
		references empleados (id_empleado),
	constraint fk_orden_compra_sucursal foreign key (id_sucursal)
		references sucursales (id_sucursal)
)
	
CREATE TABLE FACTURAS
(	
	id_factura int identity (1,1),
	fecha_factura date,
	id_empleado int,
	id_forma_pago int,
	id_cliente int,
	id_sucursal int,
	cuit_obra_social int,
	observaciones varchar (150)
	constraint pk_factura primary key (id_factura),
	constraint fk_factura_empleado foreign key (id_empleado)
		references empleados (id_empleado),
	constraint fk_factura_forma_pago foreign key (id_forma_pago)
		references formas_pago (id_forma_pago),
	constraint fk_factura_cliente foreign key (id_cliente)
		references clientes (id_cliente),
	constraint fk_facturas_sucursal foreign key (id_sucursal)
		references sucursales (id_sucursal),
	constraint fk_facturas_cuit_obra_social foreign key (cuit_obra_social)
		references obras_sociales (cuit_obra_social)
)

CREATE TABLE DETALLE_OC
(
	id_detalle_oc int identity (1,1),
	id_orden_compra int,
	id_producto int,
	cantidad int,
	precio_compra decimal (12,2)
	constraint pk_detalle_oc primary key (id_detalle_oc),
	constraint fk_detalle_oc_compra foreign key (id_orden_compra)
		references ordenes_de_compra (id_orden_compra),
	constraint fk_detalle_oc_producto foreign key (id_producto)
		references productos (id_producto)
)

CREATE TABLE DETALLES_FACTURA
(
	id_detalle_factura int identity (1,1),
	id_factura int,
	id_producto int,
	cantidad int,
	precio_venta decimal (10,2),
	id_validacion int,
	id_descuento_os int,
	descuento_sucursal decimal(10,2)
	constraint pk_id_detalle primary key (id_detalle_factura),
	constraint fk_detalle_factura foreign key (id_factura)
		references facturas (id_factura),
	constraint fk_detalle_factura_producto foreign key (id_producto)
		references productos (id_producto),
	constraint fk_detalle_factura_validacion foreign key (id_validacion)
		references validaciones_cobertura(id_validacion),
	constraint fk_detalle_factura_descuento foreign key (id_descuento_os)
		references descuentos_os_vigentes (id_descuento_os)
)

create table reembolsos_os
(
	id_reembolso int identity(1,1),
	id_detalle_factura int,
	reembolsado bit
	constraint pk_reembolsos_os primary key (id_reembolso),
	constraint fk_reembolso_detalle_factura foreign key (id_detalle_factura)
		references detalles_factura (id_detalle_factura)
)

CREATE TABLE STOCKS 
(
	id_stock int identity (1,1),
	cantidad int,
	id_producto int,
	id_orden_compra int,
	id_sucursal int,
	stock_minimo int,
	stock_maximo int,
	lote int,
	vencimiento datetime
	constraint pk_id_stock primary key (id_stock),
	constraint fk_stock_id_producto FOREIGN KEY (id_producto)
		REFERENCES PRODUCTOS (id_producto),
	constraint fk_stock_id_orden_compra FOREIGN KEY (id_orden_compra)
		REFERENCES ORDENES_DE_COMPRA (id_orden_compra),
	constraint fk_id_sucursal foreign key (Id_Sucursal)
		REFERENCES sucursales (Id_Sucursal)
)




set dateformat dmy

--–TABLA N°1
----TIPOS PRODUCTOS

INSERT INTO tipos_productos(descripcion) VALUES('PRODUCTOS NATURALES')
INSERT INTO tipos_productos(descripcion) VALUES('MEDICAMENTOS VITALES')
INSERT INTO tipos_productos(descripcion) VALUES('MEDICAMENTO DE ALTO COSTO')
INSERT INTO tipos_productos(descripcion) VALUES('MEDICAMENTO GENERICO')
INSERT INTO tipos_productos(descripcion) VALUES('FOTOSENSIBLES')
INSERT INTO tipos_productos(descripcion) VALUES('ORTOPEDIA')
INSERT INTO tipos_productos(descripcion) VALUES('ESTETICA')
INSERT INTO tipos_productos(descripcion) VALUES('PERFUMERIA')
INSERT INTO tipos_productos(descripcion) VALUES('HIERBAS MEDICINALES')
INSERT INTO tipos_productos(descripcion) VALUES('LIMPIEZA')
INSERT INTO tipos_productos(descripcion) VALUES('HIGIENE PERSONAL')


--Tabla N°2
--–TIPOS_ESPECIALIDAD


INSERT INTO tipos_especialidad ( especialidad) VALUES('Pediatría');
INSERT INTO tipos_especialidad ( especialidad)  VALUES('Psiquiatría');
INSERT INTO tipos_especialidad  ( especialidad)  VALUES('Gerontología');
INSERT INTO tipos_especialidad ( especialidad)  VALUES('Ginecología');
INSERT INTO tipos_especialidad  ( especialidad)  VALUES('Traumatología');
INSERT INTO tipos_especialidad  ( especialidad)  VALUES('Clínica Médica');
INSERT INTO tipos_especialidad (especialidad) VALUES('Cardiología');
INSERT INTO tipos_especialidad ( especialidad) VALUES('Nefrología');
INSERT INTO tipos_especialidad ( especialidad) VALUES('Urología');
INSERT INTO tipos_especialidad ( especialidad) VALUES('Endocrinología');
INSERT INTO tipos_especialidad ( especialidad) VALUES('Oncología');

--–TABLA N°3
--PROVINCIAS



insert into provincias(nom_provincia) values('BUENOS AIRES')
insert into provincias(nom_provincia) values('CORDOBA')
insert into provincias(nom_provincia) values('SANTA FE')
insert into provincias(nom_provincia) values('CORRIENTES')
insert into provincias(nom_provincia) values('ENTRE RIOS')
insert into provincias(nom_provincia) values('MISIONES')
insert into provincias(nom_provincia) values('FORMOSA')
insert into provincias(nom_provincia) values('CHACO')
insert into provincias(nom_provincia) values('SANTIAGO DEL ESTERO')
insert into provincias(nom_provincia) values('TUCUMAN')
insert into provincias(nom_provincia) values('SALTA')
insert into provincias(nom_provincia) values('JUJUY')
insert into provincias(nom_provincia) values('LA RIOJA')
insert into provincias(nom_provincia) values('SAN JUAN')
insert into provincias(nom_provincia) values('MENDOZA')
insert into provincias(nom_provincia) values('LA PAMPA')
insert into provincias(nom_provincia) values('SAN LUIS')
insert into provincias(nom_provincia) values('CATAMARCA')
insert into provincias(nom_provincia) values('RIO NEGRO')
insert into provincias(nom_provincia) values('NEUQUEN')
insert into provincias(nom_provincia) values('SANTA CRUZ')
insert into provincias(nom_provincia) values('TIERRA DEL FUEGO')

--–TABLA N°4
--LOCALIDADES
--CORDOBA 

INSERT INTO LOCALIDADES( nom_localidad,id_provincia) VALUES ('Aguas de Oro', 2)
INSERT INTO LOCALIDADES(nom_localidad,id_provincia) VALUES ('Almafuerte', 2)
INSERT INTO LOCALIDADES(nom_localidad,id_provincia) VALUES ('Alta Gracia', 2)
INSERT INTO LOCALIDADES(nom_localidad,id_provincia) VALUES ('Anisacate',2)
INSERT INTO LOCALIDADES(nom_localidad,id_provincia) VALUES ('Arroyito', 2)
INSERT INTO LOCALIDADES(nom_localidad,id_provincia) VALUES ('Ascochinga', 2)
INSERT INTO LOCALIDADES(nom_localidad,id_provincia) VALUES ('Bell Ville', 2)
INSERT INTO LOCALIDADES(nom_localidad,id_provincia) VALUES ('Bialet Masse', 2)
INSERT INTO LOCALIDADES(nom_localidad,id_provincia) VALUES ('Cabalango', 2)
INSERT INTO LOCALIDADES(nom_localidad,id_provincia) VALUES ('Capilla del Monte', 2)
INSERT INTO LOCALIDADES(nom_localidad,id_provincia) VALUES ('Cordoba Capital', 2)
INSERT INTO LOCALIDADES(nom_localidad,id_provincia) VALUES ('Cosquin', 2)
INSERT INTO LOCALIDADES(nom_localidad,id_provincia) VALUES ('Cruz del Eje', 2)
INSERT INTO LOCALIDADES(nom_localidad,id_provincia) VALUES ('Jesus Maria', 2)
INSERT INTO LOCALIDADES(nom_localidad,id_provincia) VALUES ('La Calera', 2)
INSERT INTO LOCALIDADES(nom_localidad,id_provincia) VALUES ('La Cumbre', 2)
INSERT INTO LOCALIDADES(nom_localidad,id_provincia) VALUES ('La Falda', 2)
INSERT INTO LOCALIDADES(nom_localidad,id_provincia) VALUES ('Mendiolaza', 2)
INSERT INTO LOCALIDADES(nom_localidad,id_provincia) VALUES ('Rio Ceballos', 2)
INSERT INTO LOCALIDADES(nom_localidad,id_provincia) VALUES ('Saldan', 2)
INSERT INTO LOCALIDADES(nom_localidad,id_provincia) VALUES ('Salsipuedes', 2)
INSERT INTO LOCALIDADES(nom_localidad,id_provincia) VALUES ('Tanti', 2)
INSERT INTO LOCALIDADES(nom_localidad,id_provincia) VALUES ('Unquillo', 2)
INSERT INTO LOCALIDADES(nom_localidad,id_provincia) VALUES ('Villa Allende', 2)
INSERT INTO LOCALIDADES(nom_localidad,id_provincia) VALUES ('Villa Carlos Paz', 2)

--SANTA FE
INSERT INTO localidades(nom_localidad,id_provincia)VALUES('ROSARIO',3)
INSERT INTO localidades(nom_localidad,id_provincia)VALUES('SANTA FE',3)
INSERT INTO localidades(nom_localidad,id_provincia)VALUES('GENERAL LOPEZ',3)
INSERT INTO localidades(nom_localidad,id_provincia)VALUES('GENERAL OBLIGADO',3)
INSERT INTO localidades(nom_localidad,id_provincia)VALUES('CASTELLANOS',3)
INSERT INTO localidades(nom_localidad,id_provincia)VALUES('SAN LORENZO',3)
INSERT INTO localidades(nom_localidad,id_provincia)VALUES('LAS COLONIAS',3)
INSERT INTO localidades(nom_localidad,id_provincia)VALUES('CONSTITUCION',3)
INSERT INTO localidades(nom_localidad,id_provincia)VALUES('CASEROS',3)
INSERT INTO localidades(nom_localidad,id_provincia)VALUES('SAN JERONIMO',3)
INSERT INTO localidades(nom_localidad,id_provincia)VALUES('SAN CRISTOBAL',3)
INSERT INTO localidades(nom_localidad,id_provincia)VALUES('IRIONDO',3)
INSERT INTO localidades(nom_localidad,id_provincia)VALUES('SAN MARTIN',3)

--MENDOZA
INSERT INTO localidades(nom_localidad,id_provincia)VALUES('GUAYMALLEN',15)
INSERT INTO localidades(nom_localidad,id_provincia)VALUES('GODOY CRUZ',15)
INSERT INTO localidades(nom_localidad,id_provincia)VALUES('SAN RAFAEL',15)
INSERT INTO localidades(nom_localidad,id_provincia)VALUES('LAS HERAS',15)
INSERT INTO localidades(nom_localidad,id_provincia)VALUES('MAIPU',15)
INSERT INTO localidades(nom_localidad,id_provincia)VALUES('LUJAN DE CUYO',15)
INSERT INTO localidades(nom_localidad,id_provincia)VALUES('SAN MARTIN',15)
INSERT INTO localidades(nom_localidad,id_provincia)VALUES('RIVADAVIA',15)
INSERT INTO localidades(nom_localidad,id_provincia)VALUES('TUNUYAN',15)
INSERT INTO localidades(nom_localidad,id_provincia)VALUES('USPALLATA',15)

--BUENOS AIRES
INSERT INTO localidades(nom_localidad,id_provincia)VALUES('LA MATANZA',1)
INSERT INTO localidades(nom_localidad,id_provincia)VALUES('LA PLATA',1)
INSERT INTO localidades(nom_localidad,id_provincia)VALUES('GENERAL PUEYRREDON',1)
INSERT INTO localidades(nom_localidad,id_provincia)VALUES('LOMAS DE ZAMORA',1)
INSERT INTO localidades(nom_localidad,id_provincia)VALUES('QUILMES',1)
INSERT INTO localidades(nom_localidad,id_provincia)VALUES('ALMIRANTE BROWN',1)
INSERT INTO localidades(nom_localidad,id_provincia)VALUES('MERLO',1)
INSERT INTO localidades(nom_localidad,id_provincia)VALUES('LANUS',1)
INSERT INTO localidades(nom_localidad,id_provincia)VALUES('MORENO',1)
INSERT INTO localidades(nom_localidad,id_provincia)VALUES('FLORENCIO VARELA',1)
INSERT INTO localidades(nom_localidad,id_provincia)VALUES('GENERAL SAN MARTIN',1)
INSERT INTO localidades(nom_localidad,id_provincia)VALUES('TIGRE',1)
INSERT INTO localidades(nom_localidad,id_provincia)VALUES('AVELLANEDA',1)
INSERT INTO localidades(nom_localidad,id_provincia)VALUES('BERAZATEGUI',1)

--–TABLA N°5
--BARRIOS

INSERT INTO BARRIOS(nom_barrio,id_localidad)VALUES('CENTRO',34)
INSERT INTO BARRIOS(NOM_BARRIO,id_localidad)VALUES('PUEYRREDON',34)
INSERT INTO BARRIOS(NOM_BARRIO,id_localidad)VALUES('GENERAL PAZ',34)
INSERT INTO BARRIOS(NOM_BARRIO,id_localidad)VALUES('ALTA CORDOBA',34)
INSERT INTO BARRIOS(NOM_BARRIO,id_localidad)VALUES('COFICO',34)
INSERT INTO BARRIOS(NOM_BARRIO,id_localidad)VALUES('TALLERES',34)
INSERT INTO BARRIOS(NOM_BARRIO,id_localidad)VALUES('ALBERDI',34)
INSERT INTO BARRIOS(NOM_BARRIO,id_localidad)VALUES('ALTO ALBERDI',34)
INSERT INTO BARRIOS(NOM_BARRIO,id_localidad)VALUES('CERRO DE LAS ROSAS',34)
INSERT INTO BARRIOS(NOM_BARRIO,id_localidad)VALUES('URCA',34)
INSERT INTO BARRIOS(NOM_BARRIO,id_localidad)VALUES('PATRICIOS',34)
INSERT INTO BARRIOS(NOM_BARRIO,id_localidad)VALUES('YOFRE',34)
INSERT INTO BARRIOS(NOM_BARRIO,id_localidad)VALUES('IPONA',34)
INSERT INTO BARRIOS(NOM_BARRIO,id_localidad)VALUES('NUEVA CORDOBA',34)
INSERT INTO BARRIOS(NOM_BARRIO,id_localidad)VALUES('LOS NARANJOS',34)
INSERT INTO BARRIOS(NOM_BARRIO,id_localidad)VALUES('LAS VIOLETAS',34)
INSERT INTO BARRIOS(NOM_BARRIO,id_localidad)VALUES('COMERCIAL',34)

--VILLA CARLOS PAZ
INSERT INTO BARRIOS(nom_barrio,id_localidad)VALUES('LA CUESTA',48)
INSERT INTO BARRIOS(nom_barrio,id_localidad)VALUES('SANTA RITA',48)
INSERT INTO BARRIOS(nom_barrio,id_localidad)VALUES('LA QUINTA',48)
INSERT INTO BARRIOS(nom_barrio,id_localidad)VALUES('LOS CAROLINOS',48)
INSERT INTO BARRIOS(nom_barrio,id_localidad)VALUES('COLINAS',48)
INSERT INTO BARRIOS(nom_barrio,id_localidad)VALUES('SAN PEDRO',48)
INSERT INTO BARRIOS(nom_barrio,id_localidad)VALUES('PLAYAS DE ORO',48)
INSERT INTO BARRIOS(nom_barrio,id_localidad)VALUES('MIGUEL MUÑOZ',48)
INSERT INTO BARRIOS(nom_barrio,id_localidad)VALUES('CENTRO',48)

--VILLA ALLENDE
INSERT INTO BARRIOS(nom_barrio,id_localidad)VALUES('CONDOR BAJO',47)
INSERT INTO BARRIOS(nom_barrio,id_localidad)VALUES('CONDOR ALTO',47)
INSERT INTO BARRIOS(nom_barrio,id_localidad)VALUES('ESPAÑOL',47)
INSERT INTO BARRIOS(nom_barrio,id_localidad)VALUES('INDUSTRIAL',47)
INSERT INTO BARRIOS(nom_barrio,id_localidad)VALUES('LAS ROSAS',47)
INSERT INTO BARRIOS(nom_barrio,id_localidad)VALUES('CORDOBA GOLF',47)
INSERT INTO BARRIOS(nom_barrio,id_localidad)VALUES('LAS POLINESIAS',47)
INSERT INTO BARRIOS(nom_barrio,id_localidad)VALUES('CENTRO',47)
INSERT INTO BARRIOS(nom_barrio,id_localidad)VALUES('LA AMELIA',47)


--–TABLA N°6
--–TIPOS_DOC

INSERT INTO TIPOS_DOC(DESCRIPCION) VALUES('DNI TARJETA')
INSERT INTO TIPOS_DOC(DESCRIPCION) VALUES('DNI LIBRETA CELESTE')
INSERT INTO TIPOS_DOC(DESCRIPCION) VALUES('DNI LIBRETA VERDE')
INSERT INTO TIPOS_DOC(DESCRIPCION) VALUES('LIBRETA DE ENROLAMIENTO')
INSERT INTO TIPOS_DOC(DESCRIPCION) VALUES('LIBRETA CIVICA')
INSERT INTO TIPOS_DOC(DESCRIPCION) VALUES('PASAPORTE')



--–TABLA N°7
--TIPOS FORMAS DE PAGO

INSERT INTO FORMAS_PAGO(descripcion)VALUES('EFECTIVO')
INSERT INTO FORMAS_PAGO(descripcion)VALUES('TARJETA DEBITO')
INSERT INTO FORMAS_PAGO(descripcion)VALUES('TARJETA DE CREDITO')
INSERT INTO FORMAS_PAGO(descripcion)VALUES('TRANSFERENCIA')
INSERT INTO FORMAS_PAGO(descripcion)VALUES('MERCADO PAGO')
INSERT INTO FORMAS_PAGO(descripcion)VALUES('CHEQUE')
INSERT INTO FORMAS_PAGO(descripcion)VALUES('E_CHECK')
INSERT INTO FORMAS_PAGO(descripcion)VALUES('DEBIN')
INSERT INTO FORMAS_PAGO(descripcion)VALUES('TARJETA PREPAGA')

--–TABLA N°8
--CONDICIONES IVA

INSERT INTO CONDICIONES_IVA(cond_iva)VALUES('RESPONSABLE INSCRIPTO')
INSERT INTO CONDICIONES_IVA(cond_iva)VALUES('MONOTRIBUTISTA')
INSERT INTO CONDICIONES_IVA(cond_iva)VALUES('CONSUMIDOR FINAL')
INSERT INTO CONDICIONES_IVA(cond_iva)VALUES('AUTONOMO')
INSERT INTO CONDICIONES_IVA(cond_iva)VALUES('EXENTO')
INSERT INTO CONDICIONES_IVA(cond_iva)VALUES('NO ALCANZADO')

--–TABLA N°9
--–OBRAS SOCIALES

INSERT INTO OBRAS_SOCIALES( nom_obra_social, direccion, altura, id_barrio) 
				VALUES ( 'Apross', 'Av. Marcelo T de alvear', 1458, 1)
INSERT INTO OBRAS_SOCIALES( nom_obra_social, direccion, altura, id_barrio) 
				VALUES ( 'Ospil', 'San Jose de Calasanz', 578, 2)
INSERT INTO OBRAS_SOCIALES( nom_obra_social, direccion, altura, id_barrio) 
				VALUES ( 'Osecac', 'Bv Illia', 233, 1)
INSERT INTO OBRAS_SOCIALES( nom_obra_social, direccion, altura, id_barrio) 
				VALUES ( 'PAMI', 'Av. Córdoba', 5434, 34)
INSERT INTO OBRAS_SOCIALES( nom_obra_social, direccion, altura, id_barrio) 
				VALUES ( 'OSDE', 'Av. Corrientes', 1458, 34)
INSERT INTO OBRAS_SOCIALES( nom_obra_social, direccion, altura, id_barrio) 
				VALUES ( 'PROFE', 'Poeta Lugones', 789, 34)
INSERT INTO OBRAS_SOCIALES( nom_obra_social, direccion, altura, id_barrio) 
				VALUES ( 'Medifé', 'Av. del Trabajo', 1842, 34)
INSERT INTO OBRAS_SOCIALES( nom_obra_social, direccion, altura, id_barrio) 
				VALUES ( 'Swiss Medical', '9 de Julio', 1896, 34)





--–TABLA N°10
--PRODUCTOS 

insert into Productos (vta_receta, descripcion, nombre_comercial, cod_barras, precio, vencimiento, id_tipo_producto)
values ('true', 'Clonacepam', 'alplax', 9292292, 300, '12-12-2023', 1)

insert into Productos (vta_receta, descripcion, nombre_comercial, cod_barras, precio, vencimiento, id_tipo_producto)
values ('true', 'Clonacepam', 'Rivotril', 333392, 350, '11-12-2024', 2)

insert into Productos (vta_receta, descripcion, nombre_comercial, cod_barras, precio, vencimiento, id_tipo_producto)
values ('false', 'Ibuprofeno', 'Ibupirac 600', 1212123, 350, '09-01-2024', 4)

insert into Productos (vta_receta, descripcion, nombre_comercial, cod_barras, precio, vencimiento, id_tipo_producto)
values ('false', 'Ibuprofeno', 'Ibupirac 400', 112392, 250, '09-10-2024', 4)

insert into Productos (vta_receta, descripcion, nombre_comercial, cod_barras, precio, vencimiento, id_tipo_producto)
values ('false', 'Diclofenac', 'Diclo Premium', 6712392, 650, '12-10-2024', 4)

insert into Productos (vta_receta, descripcion, nombre_comercial, cod_barras, precio, vencimiento, id_tipo_producto)
values ('true', 'Quimio 1200', 'Kim  Premium', 656562, 55750, '12-10-2023', 3)

insert into Productos (vta_receta, descripcion, nombre_comercial, cod_barras, precio, vencimiento, id_tipo_producto)
values ('true', 'Quimio 1201', 'SuopQuimium', 100222, 49750, '12-11-2023', 3)

insert into Productos (vta_receta, descripcion, nombre_comercial, cod_barras, precio, vencimiento, id_tipo_producto)
values ('true', 'Quimio 3200', 'SuopQuimium', 10012223, 79750, '12-12-2023', 3)

insert into Productos (vta_receta, descripcion, nombre_comercial, cod_barras, precio, vencimiento, id_tipo_producto)
values ('true', 'Simvastatina' , 'Simvastatina' , 1001292, 750, '12-12-2025', 2)

insert into Productos (vta_receta, descripcion, nombre_comercial, cod_barras, precio, vencimiento, id_tipo_producto)
values ('false', 'Aspirina'  , 'Aspirina  ', 1001211, 750,' 12-12-2025', 2)

insert into Productos (vta_receta, descripcion, nombre_comercial, cod_barras, precio, vencimiento, id_tipo_producto)
values ('false', 'Preservativos'  , 'Max  ', 1001211, 2750,' 12-12-2025',11)

insert into Productos (vta_receta, descripcion, nombre_comercial, cod_barras, precio, vencimiento, id_tipo_producto)
values ('false', 'Preservativos'  , 'Prime 12  ', 1001211, 2550,' 12-12-2025',11)

insert into Productos (vta_receta, descripcion, nombre_comercial, cod_barras, precio, vencimiento, id_tipo_producto)
values ('false', 'Mamadera'  , 'Mamadera  ', 151211, 5750,' 12-12-2025',8)

insert into Productos (vta_receta, descripcion, nombre_comercial, cod_barras, precio, vencimiento, id_tipo_producto)
values ('false', 'Para la acidez de estómago ' ,' Omeprazol' , 222211392, 1380, '16-01-2025',4)

insert into Productos (vta_receta, descripcion, nombre_comercial, cod_barras, precio, vencimiento, id_tipo_producto)
values ('true', 'Para reemplazar la tiroxina  ',' Lexotiroxina sódica',233211392, 720,' 16-02-2025', 2)


insert into Productos (vta_receta, descripcion, nombre_comercial, cod_barras, precio, vencimiento, id_tipo_producto)
values ('true', 'Para reemplazar la tiroxina'  , 'Ramipril'  , 4441392, 3220, '16-03-2025',2)

insert into Productos (vta_receta, descripcion, nombre_comercial, cod_barras, precio, vencimiento, id_tipo_producto)
values ('true', 'Para la hipertensión y la angina ',' Amlodipina ',14441392, 3220,' 23-04-2025', 4)

insert into Productos (vta_receta, descripcion, nombre_comercial, cod_barras, precio, vencimiento, id_tipo_producto)
values ('false', 'cuello ortopedico' , 'cuello ortopedico'   , 1392,8270,' 23-04-2023', 6)

insert into Productos (vta_receta, descripcion, nombre_comercial, cod_barras, precio, vencimiento, id_tipo_producto)
values ('false', 'muletas' , 'muletas  ' , 1344342, 4970, ' 23-11-2022', 6)

insert into Productos (vta_receta, descripcion, nombre_comercial, cod_barras, precio, vencimiento, id_tipo_producto)
values ('false', 'cabestrillo' , 'cabestrillo'   , 1344392,2970, ' 23-11-2022', 6)

insert into Productos (vta_receta, descripcion, nombre_comercial, cod_barras, precio, vencimiento, id_tipo_producto)
values ('false', 'colirio',' irix  ' ,1994392, 270, '10-02-2023', 6)

insert into Productos (vta_receta, descripcion, nombre_comercial, cod_barras, precio, vencimiento, id_tipo_producto)
values ('false', 'ciprofloxacina' ,' ciprofloxacina'   , 45344392, 670,' 12-2-2024', 5)

insert into Productos (vta_receta, descripcion, nombre_comercial, cod_barras, precio, vencimiento, id_tipo_producto)
values ('false', 'manzanilla' , 'manzanilla '  , 344392, 123, '14-2-2024', 9)

insert into Productos (vta_receta, descripcion, nombre_comercial, cod_barras, precio, vencimiento, id_tipo_producto)
values ('false', 'cola de caballo' , 'cola de caballo' , 114392, 556, '15-2-2024', 9)

insert into Productos (vta_receta, descripcion, nombre_comercial, cod_barras, precio, vencimiento, id_tipo_producto)
values ('false', 'para ir de cuerpo' , 'cascara sagrada'   , 7711439, 156, '30-6-2026', 1)

insert into Productos (vta_receta, descripcion, nombre_comercial, cod_barras, precio, vencimiento, id_tipo_producto)
values ('false',' tranquilizante' , 'Tranky - pasiflora' , 70114392, 256, '30-7-2026',1)

insert into Productos (vta_receta, descripcion, nombre_comercial, cod_barras, precio, vencimiento, id_tipo_producto)
values ('false', 'Crema anti age' , 'Vichy-Saracatunga'   , 90002392, 8256, '30-1-2026', 7)

insert into Productos (vta_receta, descripcion, nombre_comercial, cod_barras, precio, vencimiento, id_tipo_producto)
values ('false', 'Crema humectante ',' Dermaglos magica '  ,65402392, 3256, '30-1-2024',7)

insert into Productos (vta_receta, descripcion, nombre_comercial, cod_barras, precio, vencimiento, id_tipo_producto)
values ('false', 'Crema hidratante' , 'LA Roche Posay -Hidro algo'  , 88872392, 3256, '3-10-2024', 7)

insert into Productos (vta_receta, descripcion, nombre_comercial, cod_barras, precio, vencimiento, id_tipo_producto)
values ('false', 'Factor Solar ',' Rayito de Sol 30 ' , 22872392,1256, '30-10-2024',7)

insert into Productos (vta_receta, descripcion, nombre_comercial, cod_barras, precio, vencimiento, id_tipo_producto)
values ('false', 'Pantalla solar', 'Dermaglos 50 crema' ,71111392, 5256, '30-12-2024', 7)

insert into Productos (vta_receta, descripcion, nombre_comercial, cod_barras, precio, vencimiento, id_tipo_producto)
values ('false', 'Quitaesmalte', 'Quitaesmalte Cutex magico ',74545392, 216, '31-12-2024', 8)

insert into Productos (vta_receta, descripcion, nombre_comercial, cod_barras, precio, vencimiento, id_tipo_producto)
values ('false', 'mascarilla facial', 'mascarilla facial magica' ,2374545, 316,' 30-11-2023', 8)

insert into Productos (vta_receta, descripcion, nombre_comercial, cod_barras, precio, vencimiento, id_tipo_producto)
values ('false', 'crema reductora',' Dunda super fit' ,12334492,1316, '23-12-2023', 7)

insert into Productos (vta_receta, descripcion, nombre_comercial, cod_barras, precio, vencimiento, id_tipo_producto)
values ('false', 'espuma de limpieza facial',' espuma de limpieza facial Gaciar' ,999902492,446, '23-12-2024',10)

insert into Productos (vta_receta, descripcion, nombre_comercial, cod_barras, precio, vencimiento, id_tipo_producto)
values ('false', 'desodorante',' Rexona Odorone' ,649902492, 246,' 23-8-2024',8)

insert into Productos (vta_receta, descripcion, nombre_comercial, cod_barras, precio, vencimiento, id_tipo_producto)
values ('false', 'espuma de limpieza ', 'Chica limpia' ,9101010, 246, '17-9-2024', 10)

insert into Productos (vta_receta, descripcion, nombre_comercial, cod_barras, precio, vencimiento, id_tipo_producto)
values ('false', 'espuma de limpieza' , 'Chico limpio ',91041024, 246, '17-9-2024', 10)

insert into Productos (vta_receta, descripcion, nombre_comercial, cod_barras, precio, vencimiento, id_tipo_producto)
values ('false', 'Shampoo ', 'Pantene ',33302492, 646, '18-9-2024',10)

insert into Productos (vta_receta, descripcion, nombre_comercial, cod_barras, precio, vencimiento, id_tipo_producto)
values ('false', 'Shampoo' , 'Capilatis ',32302492, 746, '18-9-2024', 10)

insert into Productos (vta_receta, descripcion, nombre_comercial, cod_barras, precio, vencimiento, id_tipo_producto)
values ('false', 'Jabon' ,' Rexona Jabon ',377724, 146, '18-7-2024', 10)


--–TABLA N°11
--SUCURSALES 

INSERT INTO sucursales ( nom_sucursal, direccion, altura, id_barrio) VALUES ( 'Sucursal Vacalardo', 'vacalardo', 3219, 3)
INSERT INTO sucursales ( nom_sucursal, direccion, altura, id_barrio) VALUES ( 'Sucursal Gral. Paz', 'Gral. Paz', 211, 5)
INSERT INTO sucursales ( nom_sucursal, direccion, altura, id_barrio) VALUES ( 'Sucursal Oncativo', 'Octavio Pinto', 4210, 1)
INSERT INTO sucursales ( nom_sucursal, direccion, altura, id_barrio) VALUES ( 'Sucursal Sunchales', 'Gral. Samora', 551, 2)
INSERT INTO sucursales ( nom_sucursal, direccion, altura, id_barrio) VALUES ( 'Sucursal Granja Grande', 'Cólón', 871, 9)
INSERT INTO sucursales ( nom_sucursal, direccion, altura, id_barrio) VALUES ( 'Sucursal Paisanita', 'Dean Funes', 336, 7)



----Tabla N°12 
--–PERSONAS


INSERT INTO PERSONAS (nombre, apellido, id_tipo_documento, numero_documento, fecha_nac, mail, telefono, Direccion, altura, id_barrio)
VALUES ('Lucrecia', 'Alvarez', 1, 39852698, '18/12/2000', 'lucre@mailto.com', '4938452', 'Rivera Indarte', 1825, 4)
INSERT INTO PERSONAS ( nombre, apellido, id_tipo_documento, numero_documento, fecha_nac, mail, telefono, Direccion, altura, id_barrio)
VALUES ( 'Lautaro', 'Sosa', 1, 40587698, '18/12/2002', 'lauti@mailto.com', null, 'Colon', 4000, 6)
INSERT INTO PERSONAS ( nombre, apellido, id_tipo_documento, numero_documento, fecha_nac, mail, telefono, Direccion, altura, id_barrio)
VALUES ( 'Pedro', 'Robles', 1, 36874857, '10/05/1993', 'pedro@mailto.com', '758964', 'Illia', 1234, 2)
INSERT INTO PERSONAS ( nombre, apellido, id_tipo_documento, numero_documento, fecha_nac, mail, telefono, Direccion, altura, id_barrio)
VALUES ( 'Lorenzo', 'Acosta', 1, 40857485, '20/09/2000', 'loren@mailto.com', null, 'M.Bas', 320, 30)
INSERT INTO PERSONAS ( nombre, apellido, id_tipo_documento, numero_documento, fecha_nac, mail, telefono, Direccion, altura, id_barrio)
VALUES ( 'Florencia', 'Perez', 2, 35874589, '07/12/1992', 'florperez@mailto.com', '748589', 'Gral Paz', 1825, 2)
INSERT INTO PERSONAS ( nombre, apellido, id_tipo_documento, numero_documento, fecha_nac, mail, telefono, Direccion, altura, id_barrio)
VALUES ( 'Santiago', 'Britos', 2, 34758963, '11/01/1989', 'santib@mailto.com', '478542', 'Rivadeo', 2458, 15)
INSERT INTO PERSONAS ( nombre, apellido, id_tipo_documento, numero_documento, fecha_nac, mail, telefono, Direccion, altura, id_barrio)
VALUES ( 'Irma', 'Lovato', 1, 09854789, '07/07/1935', 'irmalov@mailto.com', '478589', 'Obispo Castellano', 2587, 10)
INSERT INTO PERSONAS ( nombre, apellido, id_tipo_documento, numero_documento, fecha_nac, mail, telefono, Direccion, altura, id_barrio)
VALUES ( 'Ramiro', 'Puchetta', 2, 39874859, '04/08/2000', 'ramipuch@mailto.com', null, 'Lisandro de la Torre', null, null)
INSERT INTO PERSONAS ( nombre, apellido, id_tipo_documento, numero_documento, fecha_nac, mail, telefono, Direccion, altura, id_barrio)
VALUES ( 'Agustin', 'Morales', 2, 38745961, '05/11/2000', 'agusm@mailto.com', null, 'Campillo', 2345, 6)
INSERT INTO PERSONAS ( nombre, apellido, id_tipo_documento, numero_documento, fecha_nac, mail, telefono, Direccion, altura, id_barrio)
VALUES ( 'Agustin', 'Robledo', 2, 40587965, '05/08/1997', 'agusrob@mailto.com', null, 'Jeronimo', 123, 16)
INSERT INTO PERSONAS ( nombre, apellido, id_tipo_documento, numero_documento, fecha_nac, mail, telefono, Direccion, altura, id_barrio)
VALUES ( 'Federico', 'Alvarez', 1, 34258741, '18/02/1990', 'fede@mailto.com', null, 'san martin', 1825, 4)
INSERT INTO PERSONAS ( nombre, apellido, id_tipo_documento, numero_documento, fecha_nac, mail, telefono, Direccion, altura, id_barrio)
VALUES ( 'Rodrigo', 'Sosa', 1, 352147896, '01/12/1990', 'rodrisosa@mailto.com', '478587', 'Colon', 4578, 6)
INSERT INTO PERSONAS ( nombre, apellido, id_tipo_documento, numero_documento, fecha_nac, mail, telefono, Direccion, altura, id_barrio)
VALUES ( 'Fernando', 'Dagustino', 1, 36983777, '15/05/1993', 'ferchux@mailto.com', '777858', 'Illia', 4524, 2)
INSERT INTO PERSONAS ( nombre, apellido, id_tipo_documento, numero_documento, fecha_nac, mail, telefono, Direccion, altura, id_barrio)
VALUES ( 'Lorenzo', 'Ramirez', 1, 40888485, '20/02/2000', 'lorenRAmi@mailto.com', null, 'M.Bas', 470, 20)
INSERT INTO PERSONAS ( nombre, apellido, id_tipo_documento, numero_documento, fecha_nac, mail, telefono, Direccion, altura, id_barrio)
VALUES ( 'Franchesca', 'Perez', 2, 34785111, '07/12/1992', 'franchu@mailto.com', null, 'Gral Paz', 2000, 2)
INSERT INTO PERSONAS ( nombre, apellido, id_tipo_documento, numero_documento, fecha_nac, mail, telefono, Direccion, altura, id_barrio)
VALUES ( 'Santiago', 'Pascualini', 2, 40857877, '11/01/2000', 'santilosada@mailto.com', null, 'Paraguay', 2458, 15)
INSERT INTO PERSONAS ( nombre, apellido, id_tipo_documento, numero_documento, fecha_nac, mail, telefono, Direccion, altura, id_barrio)
VALUES ( 'Olga', 'Adragna', 1, 05854789, '07/10/1934', 'oadrag@mailto.com', '4557376', 'Lopez y Planes', 1748, 25)
INSERT INTO PERSONAS ( nombre, apellido, id_tipo_documento, numero_documento, fecha_nac, mail, telefono, Direccion, altura, id_barrio)
VALUES ( 'Ramiro', 'Alvarez', 2, 39874444, '03/05/2000', 'langostininirama@mailto.com', null, 'Tomas de Archondo', null, null)
INSERT INTO PERSONAS ( nombre, apellido, id_tipo_documento, numero_documento, fecha_nac, mail, telefono, Direccion, altura, id_barrio)
VALUES ( 'Agustin', 'Caceres', 2, 40588999, '14/01/2000', 'agusacanceres@mailto.com', null, 'allende', 888, 6)
INSERT INTO PERSONAS ( nombre, apellido, id_tipo_documento, numero_documento, fecha_nac, mail, telefono, Direccion, altura, id_barrio)
VALUES ( 'Agustina', 'Estabanich', 2, 40000666, '15/08/1997', 'agusest@mailto.com', null, 'Jeronimo', 888, 16)
INSERT INTO PERSONAS ( nombre, apellido, id_tipo_documento, numero_documento, fecha_nac, mail, telefono, Direccion, altura, id_barrio)
VALUES ( 'Bruno', 'Fuseneco', 1, 35000414, '16/02/1990', 'bruniz@mailto.com', null, 'san martin', 555, 4)
INSERT INTO PERSONAS ( nombre, apellido, id_tipo_documento, numero_documento, fecha_nac, mail, telefono, Direccion, altura, id_barrio)
VALUES ( 'Carla', 'Gutierrez', 1, 35214000, '21/12/1990', 'carlix@mailto.com', '478587', 'Colon', 555, 6)
INSERT INTO PERSONAS ( nombre, apellido, id_tipo_documento, numero_documento, fecha_nac, mail, telefono, Direccion, altura, id_barrio)
VALUES ( 'Estela', 'Herrera', 1, 36000874, '25/05/1993', 'estelix@mailto.com', '777858', 'Illia', 444, 2)
INSERT INTO PERSONAS ( nombre, apellido, id_tipo_documento, numero_documento, fecha_nac, mail, telefono, Direccion, altura, id_barrio)
VALUES ( 'Adriana', 'Iacono', 1, 40000555, '20/02/2000', 'adrianiz@mailto.com', null, 'M.Bas', 444, 20)
INSERT INTO PERSONAS ( nombre, apellido, id_tipo_documento, numero_documento, fecha_nac, mail, telefono, Direccion, altura, id_barrio)
VALUES ( 'Paulina', 'Jama', 2, 34000574, '17/12/1992', 'pailix@mailto.com', null, 'Gral Paz', 444, 2)
INSERT INTO PERSONAS ( nombre, apellido, id_tipo_documento, numero_documento, fecha_nac, mail, telefono, Direccion, altura, id_barrio)
VALUES ( 'Roberto', 'Martinez', 2, 40111444, '31/01/2000', 'robertinho@mailto.com', null, 'Paraguay', 2545, 15)
INSERT INTO PERSONAS ( nombre, apellido, id_tipo_documento, numero_documento, fecha_nac, mail, telefono, Direccion, altura, id_barrio)
VALUES ( 'Luis', 'Nicolasio', 1, 05888789, '27/10/1934', 'luigi@mailto.com', '4557376', 'Lopez y Planes', 2542, 25)
INSERT INTO PERSONAS ( nombre, apellido, id_tipo_documento, numero_documento, fecha_nac, mail, telefono, Direccion, altura, id_barrio)
VALUES ( 'Daniel', 'Oviedo', 2, 39700700, '13/05/2000', 'danieloviedo@mailto.com', null, 'Belgrano', null, null)
INSERT INTO PERSONAS ( nombre, apellido, id_tipo_documento, numero_documento, fecha_nac, mail, telefono, Direccion, altura, id_barrio)
VALUES ( 'Oscar', 'Sanchez', 2, 38008008, '04/01/2000', 'oscarsanchez@mailto.com', null, 'allende', 5474, 6)
INSERT INTO PERSONAS ( nombre, apellido, id_tipo_documento, numero_documento, fecha_nac, mail, telefono, Direccion, altura, id_barrio)
VALUES ( 'Gino', 'Sanchez', 2, 40002001, '04/01/2000', 'ginosanchez@mailto.com', null, 'allende', 7777, 6)


----TABLA N°13 
--–MEDICOS
INSERT INTO MEDICOS (matricula_medico, id_persona, id_especialidad) VALUES (1414, 6, 2)
INSERT INTO MEDICOS (matricula_medico, id_persona, id_especialidad) VALUES (1415, 7, 6)
INSERT INTO MEDICOS (matricula_medico, id_persona, id_especialidad) VALUES (1420, 8, 11)
INSERT INTO MEDICOS (matricula_medico, id_persona, id_especialidad) VALUES (1145, 9, 4)
INSERT INTO MEDICOS (matricula_medico, id_persona, id_especialidad) VALUES (1114, 10,11)
INSERT INTO MEDICOS (matricula_medico, id_persona, id_especialidad) VALUES (1011, 11, 1)
INSERT INTO MEDICOS (matricula_medico, id_persona, id_especialidad) VALUES (1111, 12, 7)
INSERT INTO MEDICOS (matricula_medico, id_persona, id_especialidad) VALUES (1244, 13, 3)
INSERT INTO MEDICOS (matricula_medico, id_persona, id_especialidad) VALUES (1365, 14, 9)
INSERT INTO MEDICOS (matricula_medico, id_persona, id_especialidad) VALUES (1487, 15, 10)





--Tabla N°14 
--–RECETAS


insert into Recetas (descripcion, matricula_medico) values ('Clonacepam', 1011)  
insert into Recetas (descripcion, matricula_medico) values ('Quimio 1201',1114)  
insert into Recetas (descripcion, matricula_medico) values ('Quimio 1200', 1244)   
insert into Recetas (descripcion, matricula_medico) values ('Simvastatina', 1145)  
insert into Recetas (descripcion, matricula_medico) values ('colirio', 1111)       
insert into Recetas (descripcion, matricula_medico) values ('ciprofloxacina', 1111) 
insert into Recetas (descripcion, matricula_medico) values ('Clonacepam', 1011)     
insert into Recetas (descripcion, matricula_medico) values ('Quimio 3200', 1114)    
insert into Recetas (descripcion, matricula_medico) values ('ciprofloxacina', 1414) 
insert into Recetas (descripcion, matricula_medico) values ('Para reemplazar la tiroxina', 1415) 
insert into Recetas (descripcion, matricula_medico) values ('Para la hipertensión y la angina', 1415) 
insert into Recetas (descripcion, matricula_medico) values ('Para la acidez de estómago', 1487) 
insert into Recetas (descripcion, matricula_medico) values ('Para la hipertensión y la angina ', 1415) 
insert into Recetas (descripcion, matricula_medico) values ('Quimio 1201', 1114) 
insert into Recetas (descripcion, matricula_medico) values ('Quimio 1200', 1244) 
insert into Recetas (descripcion, matricula_medico) values ('colirio', 1111) 
insert into Recetas (descripcion, matricula_medico) values ('ciprofloxacina', 1111) 
insert into Recetas (descripcion, matricula_medico) values ('Quimio 3200', 1114) 
insert into Recetas (descripcion, matricula_medico) values ('Para la acidez de estómago', 1487) 
insert into Recetas (descripcion, matricula_medico) values ('Simvastatina', 1420) 
insert into Recetas (descripcion, matricula_medico) values ('Quimio 1200', 1244) 
insert into Recetas (descripcion, matricula_medico) values ('colirio', 1111)    
insert into Recetas (descripcion, matricula_medico) values ('Quimio 1201', 1114) 
insert into Recetas (descripcion, matricula_medico) values ('Para la hipertensión y la angina', 1415) 
insert into Recetas (descripcion, matricula_medico) values ('Quimio 3200', 1114) 
insert into Recetas (descripcion, matricula_medico) values ('ciprofloxacina', 1414) 
insert into Recetas (descripcion, matricula_medico) values ('colirio', 1111) 
insert into Recetas (descripcion, matricula_medico) values ('Para la acidez de estómago', 1487)
insert into Recetas (descripcion, matricula_medico) values ('Para la hipertensión y la angina', 1415)
insert into Recetas (descripcion, matricula_medico) values ('Clonacepam', 1011) 
insert into Recetas (descripcion, matricula_medico) values ('Quimio 3200', 1114)
insert into Recetas (descripcion, matricula_medico) values ('Quimio 1200', 1244)

--–TABLA N°15
--–VALIDACIONES_COBERTURA


insert into VALIDACIONES_COBERTURA (nro_afiliado, id_receta, cuit_obra_social, fecha_validacion)
values (10200, 2, 5,  '08/09/2019')
insert into VALIDACIONES_COBERTURA (nro_afiliado, id_receta, cuit_obra_social, fecha_validacion)
values (10230, 1, 3, '18/09/2019')
insert into VALIDACIONES_COBERTURA (nro_afiliado, id_receta, cuit_obra_social, fecha_validacion)
values (10120, 3, 1, '28/09/2019')
insert into VALIDACIONES_COBERTURA (nro_afiliado, id_receta, cuit_obra_social, fecha_validacion)
values (10200, 2, 5, '14/10/2019')
insert into VALIDACIONES_COBERTURA (nro_afiliado, id_receta, cuit_obra_social, fecha_validacion)
values (10128, 4, 3, '20/10/2019')
insert into VALIDACIONES_COBERTURA (nro_afiliado, id_receta, cuit_obra_social, fecha_validacion)
values (10120, 3, 1, '26/10/2019')
insert into VALIDACIONES_COBERTURA (nro_afiliado, id_receta, cuit_obra_social, fecha_validacion)
values (10200, 2, 5, '20/11/2019')
insert into VALIDACIONES_COBERTURA (nro_afiliado, id_receta, cuit_obra_social, fecha_validacion)
values (10210, 5, 8, '24/11/2019')
insert into VALIDACIONES_COBERTURA (nro_afiliado, id_receta, cuit_obra_social, fecha_validacion)
values (10120, 3, 1, '26/11/2019')
insert into VALIDACIONES_COBERTURA (nro_afiliado, id_receta, cuit_obra_social, fecha_validacion)
values (10200, 14, 5, '10/12/2019')
insert into VALIDACIONES_COBERTURA (nro_afiliado, id_receta, cuit_obra_social, fecha_validacion)
values (10208, 6, 7, '16/12/2019')
insert into VALIDACIONES_COBERTURA (nro_afiliado, id_receta, cuit_obra_social, fecha_validacion)
values (10120, 15, 1, '20/12/2019')
insert into VALIDACIONES_COBERTURA (nro_afiliado, id_receta, cuit_obra_social, fecha_validacion)
values (10200, 14, 5, '16/01/2020')
insert into VALIDACIONES_COBERTURA (nro_afiliado, id_receta, cuit_obra_social, fecha_validacion)
values (10160,7, 4, '20/01/2020')
insert into VALIDACIONES_COBERTURA (nro_afiliado, id_receta, cuit_obra_social, fecha_validacion)
values (10120, 15, 1, '28/01/2020')
insert into VALIDACIONES_COBERTURA (nro_afiliado, id_receta, cuit_obra_social, fecha_validacion)
values (10200, 14, 5, '16/02/2020')
insert into VALIDACIONES_COBERTURA (nro_afiliado, id_receta, cuit_obra_social, fecha_validacion)
values (10210, 8, 5, '22/02/2020')
insert into VALIDACIONES_COBERTURA (nro_afiliado, id_receta, cuit_obra_social, fecha_validacion)
values (10120, 15, 1, '28/02/2020')
insert into VALIDACIONES_COBERTURA (nro_afiliado, id_receta, cuit_obra_social, fecha_validacion)
values (10158, 9, 6, '08/03/2020')
insert into VALIDACIONES_COBERTURA (nro_afiliado, id_receta, cuit_obra_social, fecha_validacion)
values (10200, 23, 5,'14/03/2020')
insert into VALIDACIONES_COBERTURA (nro_afiliado, id_receta, cuit_obra_social, fecha_validacion)
values (10170, 10, 8, '18/03/2020')
insert into VALIDACIONES_COBERTURA (nro_afiliado, id_receta, cuit_obra_social, fecha_validacion)
values (10210, 8, 5, '20/03/2020')
insert into VALIDACIONES_COBERTURA (nro_afiliado, id_receta, cuit_obra_social, fecha_validacion)
values (10120, 21, 1, '28/03/2020')
insert into VALIDACIONES_COBERTURA (nro_afiliado, id_receta, cuit_obra_social, fecha_validacion)
values (10180, 11, 6, '10/04/2020')
insert into VALIDACIONES_COBERTURA (nro_afiliado, id_receta, cuit_obra_social, fecha_validacion)
values (10200, 23, 5,'16/04/2020')
insert into VALIDACIONES_COBERTURA (nro_afiliado, id_receta, cuit_obra_social, fecha_validacion)
values (10210, 8, 5, '22/04/2020')
insert into VALIDACIONES_COBERTURA (nro_afiliado, id_receta, cuit_obra_social, fecha_validacion)
values (10120, 21, 1, '28/04/2020')
insert into VALIDACIONES_COBERTURA (nro_afiliado, id_receta, cuit_obra_social, fecha_validacion)
values (10190, 12, 2, '02/05/2020')
insert into VALIDACIONES_COBERTURA (nro_afiliado, id_receta, cuit_obra_social, fecha_validacion)
values (10198, 13, 7, '10/05/2020')
insert into VALIDACIONES_COBERTURA (nro_afiliado, id_receta, cuit_obra_social, fecha_validacion)
values (10200, 23, 5,'16/05/2020')
insert into VALIDACIONES_COBERTURA (nro_afiliado, id_receta, cuit_obra_social, fecha_validacion)
values (10210, 18, 5, '22/05/2020')
insert into VALIDACIONES_COBERTURA (nro_afiliado, id_receta, cuit_obra_social, fecha_validacion)
values (10120, 21, 1, '28/05/2020')
insert into VALIDACIONES_COBERTURA (nro_afiliado, id_receta, cuit_obra_social, fecha_validacion)
values (10236, 16, 4, '10/06/2020')
insert into VALIDACIONES_COBERTURA (nro_afiliado, id_receta, cuit_obra_social, fecha_validacion)
values (10238, 17, 3, '12/07/2020')
insert into VALIDACIONES_COBERTURA (nro_afiliado, id_receta, cuit_obra_social, fecha_validacion)
values (10210, 18, 5, '22/08/2020')
insert into VALIDACIONES_COBERTURA (nro_afiliado, id_receta, cuit_obra_social, fecha_validacion)
values (10320, 19, 7, '30/09/2020')
insert into VALIDACIONES_COBERTURA (nro_afiliado, id_receta, cuit_obra_social, fecha_validacion)
values (10268, 20, 7, '06/10/2020')
insert into VALIDACIONES_COBERTURA (nro_afiliado, id_receta, cuit_obra_social, fecha_validacion)
values (10210, 18, 5, '22/10/2020')
insert into VALIDACIONES_COBERTURA (nro_afiliado, id_receta, cuit_obra_social, fecha_validacion)
values (10210, 8, 5, '22/10/2020')
insert into VALIDACIONES_COBERTURA (nro_afiliado, id_receta, cuit_obra_social, fecha_validacion)
values (10340, 22, 7, '20/11/2020')
insert into VALIDACIONES_COBERTURA (nro_afiliado, id_receta, cuit_obra_social, fecha_validacion)
values (10350, 24, 3, '16/12/2020')
insert into VALIDACIONES_COBERTURA (nro_afiliado, id_receta, cuit_obra_social, fecha_validacion)
values (10210, 25, 5, '22/12/2020')
insert into VALIDACIONES_COBERTURA (nro_afiliado, id_receta, cuit_obra_social, fecha_validacion)
values (10350, 26, 3, '10/11/2020')
insert into VALIDACIONES_COBERTURA (nro_afiliado, id_receta, cuit_obra_social, fecha_validacion)
values (10210, 25, 5, '22/01/2021')
insert into VALIDACIONES_COBERTURA (nro_afiliado, id_receta, cuit_obra_social, fecha_validacion)
values (10360, 27, 3, '10/02/2021')
insert into VALIDACIONES_COBERTURA (nro_afiliado, id_receta, cuit_obra_social, fecha_validacion)
values (10210, 25, 5, '22/02/2021')
insert into VALIDACIONES_COBERTURA (nro_afiliado, id_receta, cuit_obra_social, fecha_validacion)
values (10370, 28, 8, '10/05/2021')
insert into VALIDACIONES_COBERTURA (nro_afiliado, id_receta, cuit_obra_social, fecha_validacion)
values (10380, 29, 8, '10/05/2021')
insert into VALIDACIONES_COBERTURA (nro_afiliado, id_receta, cuit_obra_social, fecha_validacion)
values (10364, 30, 3, '10/06/2022')
insert into VALIDACIONES_COBERTURA (nro_afiliado, id_receta, cuit_obra_social, fecha_validacion)
values (10210, 31, 5, '22/06/2022')
insert into VALIDACIONES_COBERTURA (nro_afiliado, id_receta, cuit_obra_social, fecha_validacion)
values (10210, 31, 5, '22/07/2022')
insert into VALIDACIONES_COBERTURA (nro_afiliado, id_receta, cuit_obra_social, fecha_validacion)
values (10210, 31, 5, '22/08/2022')
insert into VALIDACIONES_COBERTURA (nro_afiliado, id_receta, cuit_obra_social, fecha_validacion)
values (10120, 32, 1, '28/08/2022')
insert into VALIDACIONES_COBERTURA (nro_afiliado, id_receta, cuit_obra_social, fecha_validacion)
values (10120, 32, 1, '28/09/2022')




--–TABLA N°16
----EMPLEADOS 

INSERT INTO EMPLEADOS (ID_PERSONA, OBSERVACION) VALUES (1, 'EMPLEADO DE MOSTRADOR SUCURSAL SUNCHALES')
INSERT INTO EMPLEADOS (ID_PERSONA, OBSERVACION) VALUES (2, 'EMPLEADO DE VACALARDO')
INSERT INTO EMPLEADOS (ID_PERSONA, OBSERVACION) VALUES (3, 'EMPLEADO DE DEPOSITO GRANJA GRANDE')
INSERT INTO EMPLEADOS (ID_PERSONA, OBSERVACION) VALUES (4, 'EMPLEADO DE MOSTRADOR GRAL. PAZ')
INSERT INTO EMPLEADOS (ID_PERSONA, OBSERVACION) VALUES (5, 'EMPLEADO DE LA PAISANITA')



--–TABLA N° 17
----CLIENTES 
INSERT INTO CLIENTES (id_persona, cuit_Obra_social, id_condicion_iva)
values (6, 1, 3)
INSERT INTO CLIENTES (id_persona, cuit_Obra_social, id_condicion_iva)
values (8, 2, 3)
INSERT INTO CLIENTES (id_persona, cuit_Obra_social, id_condicion_iva)
values (13, 8, 3)
INSERT INTO CLIENTES (id_persona, cuit_Obra_social, id_condicion_iva)
values (17, 4, 2)
INSERT INTO CLIENTES (id_persona, cuit_Obra_social, id_condicion_iva)
values (11, 2, 3)
INSERT INTO CLIENTES (id_persona, cuit_Obra_social, id_condicion_iva)
values (7, 3, 3)
INSERT INTO CLIENTES (id_persona, cuit_Obra_social, id_condicion_iva)
values (8, 4, 1)
INSERT INTO CLIENTES (id_persona, cuit_Obra_social, id_condicion_iva)
values (5, 4, 3)
INSERT INTO CLIENTES (id_persona, cuit_Obra_social, id_condicion_iva)
values (9, 6, 3)
INSERT INTO CLIENTES (id_persona, cuit_Obra_social, id_condicion_iva)
values (3, 7, 3)
INSERT INTO CLIENTES (id_persona, cuit_Obra_social, id_condicion_iva)
values (1, 7, 4)


--–TABLA N°18
--–DESCUENTOS_VIGENTES
INSERT INTO DESCUENTOS_OS_VIGENTES (descuento_obra_social, id_producto, cuit_obra_social, id_sucursal, fecha_descuento)
VALUES (4975.00, 7, 5, 2, '08/09/2019')
INSERT INTO DESCUENTOS_OS_VIGENTES (descuento_obra_social, id_producto, cuit_obra_social, id_sucursal, fecha_descuento)
VALUES (35.00, 3, 3, 5, '18/09/2019')
INSERT INTO DESCUENTOS_OS_VIGENTES (descuento_obra_social, id_producto, cuit_obra_social, id_sucursal, fecha_descuento)
VALUES (5575.00, 6, 5, 2, '28/09/2019')
INSERT INTO DESCUENTOS_OS_VIGENTES (descuento_obra_social, id_producto, cuit_obra_social, id_sucursal, fecha_descuento)
VALUES (75.00, 9, 3, 3, '20/10/2019')
INSERT INTO DESCUENTOS_OS_VIGENTES (descuento_obra_social, id_producto, cuit_obra_social, id_sucursal, fecha_descuento)
VALUES (1651.20, 17, 1, 1, '08/03/2020')
INSERT INTO DESCUENTOS_OS_VIGENTES (descuento_obra_social, id_producto, cuit_obra_social, id_sucursal, fecha_descuento)
VALUES (72.00, 15, 8, 5, '18/03/2020')
INSERT INTO DESCUENTOS_OS_VIGENTES (descuento_obra_social, id_producto, cuit_obra_social, id_sucursal, fecha_descuento)
VALUES (322.00, 17, 7, 2, '10/05/2020')
INSERT INTO DESCUENTOS_OS_VIGENTES (descuento_obra_social, id_producto, cuit_obra_social, id_sucursal, fecha_descuento)
VALUES (27.00, 16, 4, 3, '10/06/2020')
INSERT INTO DESCUENTOS_OS_VIGENTES (descuento_obra_social, id_producto, cuit_obra_social, id_sucursal, fecha_descuento)
VALUES (325.60, 11, 3, 2, '08/03/2021')
INSERT INTO DESCUENTOS_OS_VIGENTES (descuento_obra_social, id_producto, cuit_obra_social, id_sucursal, fecha_descuento)
VALUES (207.00, 14, 5, 2, '10/05/2021')
INSERT INTO DESCUENTOS_OS_VIGENTES (descuento_obra_social, id_producto, cuit_obra_social, id_sucursal, fecha_descuento)
VALUES (1654.00, 16, 8, 1, '18/09/2021')
INSERT INTO DESCUENTOS_OS_VIGENTES (descuento_obra_social, id_producto, cuit_obra_social, id_sucursal, fecha_descuento)
VALUES (994.00, 17, 5, 2, '20/11/2021')
INSERT INTO DESCUENTOS_OS_VIGENTES (descuento_obra_social, id_producto, cuit_obra_social, id_sucursal, fecha_descuento)
VALUES (488.40, 1, 7, 6, '08/03/2022')
INSERT INTO DESCUENTOS_OS_VIGENTES (descuento_obra_social, id_producto, cuit_obra_social, id_sucursal, fecha_descuento)
VALUES (15950.00, 7, 5, 2, '22/08/2022')
INSERT INTO DESCUENTOS_OS_VIGENTES (descuento_obra_social, id_producto, cuit_obra_social, id_sucursal, fecha_descuento)
VALUES (75.00, 10, 4, 4, '04/09/2022')
INSERT INTO DESCUENTOS_OS_VIGENTES (descuento_obra_social, id_producto, cuit_obra_social, id_sucursal, fecha_descuento)
VALUES (8362.50, 6, 5, 5, '28/09/2022')



--–TABLA N°19
----EMPRESAS_LOGISTICA
INSERT INTO EMPRESAS_LOGISTICA (nom_empresa_logistica, id_barrio, id_condicion_iva, responsable_entrega, direccion, altura)
VALUES ('Ocasa', 2, 1, 'Mariano Larra', 'ob. monte', 234)

INSERT INTO EMPRESAS_LOGISTICA (nom_empresa_logistica, id_barrio, id_condicion_iva, responsable_entrega, direccion, altura)
VALUES ('Echegoyen', 5, 1, 'Colombres Ricardo', 'Sinsacate', 2544)

INSERT INTO EMPRESAS_LOGISTICA (nom_empresa_logistica, id_barrio, id_condicion_iva, responsable_entrega, direccion, altura)
VALUES ('Los Moyes', 8, 2, 'Marina Laguna', 'Portugueses', 556)

INSERT INTO EMPRESAS_LOGISTICA (nom_empresa_logistica, id_barrio, id_condicion_iva, responsable_entrega, direccion, altura)
VALUES ('Los Pacheco',9, 4, 'Pedrera Mauricio', 'Patata', 194)

INSERT INTO EMPRESAS_LOGISTICA (nom_empresa_logistica, id_barrio, id_condicion_iva, responsable_entrega, direccion, altura)
VALUES ('PacMan', 1, 1, 'Romina Suarez', 'Monte Hermoso', 934)

INSERT INTO EMPRESAS_LOGISTICA (nom_empresa_logistica, id_barrio, id_condicion_iva, responsable_entrega, direccion, altura)
VALUES ('RapiRap', 12, 3, 'Costas Emanuel', 'Felardino', 814)

--–TABLA N°20
--–ORDENES_DE_COMPRA
INSERT INTO ORDENES_DE_COMPRA VALUES ('Domicilio', '15/09/22', 1, 1, 1, 1)
INSERT INTO ORDENES_DE_COMPRA VALUES ('Domicilio', '18/01/22', 2, 2, 2, 2)
INSERT INTO ORDENES_DE_COMPRA VALUES ('Retiro', '23/10/21', 3, 3, 3, 3)
INSERT INTO ORDENES_DE_COMPRA VALUES ('Domicilio', '01/06/21', 1, 4, 1, 4)
INSERT INTO ORDENES_DE_COMPRA VALUES ('Retiro', '30/03/21', 6, 5, 3, 3)
INSERT INTO ORDENES_DE_COMPRA VALUES ('Retiro', '19/01/21', 1, 6, 1, 2)
INSERT INTO ORDENES_DE_COMPRA VALUES ('Retiro', '11/11/20', 2, 6, 2, 1)
INSERT INTO ORDENES_DE_COMPRA VALUES ('Retiro', '09/09/20', 3, 1, 2, 2)
INSERT INTO ORDENES_DE_COMPRA VALUES ('Domicilio', '23/06/20', 7, 3, 2, 5)
INSERT INTO ORDENES_DE_COMPRA VALUES ('Domicilio', '29/03/20', 1, 2, 5, 2)
INSERT INTO ORDENES_DE_COMPRA VALUES ('Retiro', '29/12/19', 9, 3, 1, 1)
INSERT INTO ORDENES_DE_COMPRA VALUES ('Domicilio', '01/10/19', 2, 4, 2, 3)
INSERT INTO ORDENES_DE_COMPRA VALUES ('Domicilio', '18/07/19', 4, 5, 2, 2)
INSERT INTO ORDENES_DE_COMPRA VALUES ('Retiro', '06/05/19', 5, 5, 2, 5)
INSERT INTO ORDENES_DE_COMPRA VALUES ('Retiro', '22/03/19', 2, 6, 2, 4)
INSERT INTO ORDENES_DE_COMPRA VALUES ('Retiro', '06/02/19', 2, 1, 4, 3)
INSERT INTO ORDENES_DE_COMPRA VALUES ('Retiro', '01/01/19', 2, 2, 2, 6)

--–TABLA N°21
--–FACTURAS
INSERT INTO FACTURAS VALUES ('17/01/19', 1, 1, 1, 1, 1, 'Primer cliente') --1
INSERT INTO FACTURAS VALUES ('17/01/19', 1, 1, 2, 2, 2, null)
INSERT INTO FACTURAS VALUES ('17/01/19', 2, 1, 3, 3, 3, null)
INSERT INTO FACTURAS VALUES ('17/01/19', 3, 1, 4, 4, 4, null)
INSERT INTO FACTURAS VALUES ('17/01/19', 1, 1, 5, 5, 5, null)
INSERT INTO FACTURAS VALUES ('19/03/19', 2, 2, 6, 5, 6, null)
INSERT INTO FACTURAS VALUES ('21/03/19', 5, 3, 7, 6, 7, null)
INSERT INTO FACTURAS VALUES ('23/04/19', 5, 4, 8, 6, 8, null)
INSERT INTO FACTURAS VALUES ('25/04/19', 2, 2, 9, 5, null, null) --
INSERT INTO FACTURAS VALUES ('28/04/19', 4, 3, 10, 4, 2, 'Faltó entregar segunda caja')
INSERT INTO FACTURAS VALUES ('03/04/19', 1, 1, 11, 3, 3, null)
INSERT INTO FACTURAS VALUES ('05/05/19', 2, 5, 1, 2, 4, null)
INSERT INTO FACTURAS VALUES ('10/06/19', 3, 3, 2, 1, 5, null)
INSERT INTO FACTURAS VALUES ('13/07/19', 4, 6, 2, 2, null, null)
INSERT INTO FACTURAS VALUES ('14/08/19', 5, 7, 2, 3, 7, null)
INSERT INTO FACTURAS VALUES ('17/09/19', 5, 8, 2, 4, 8, null)
INSERT INTO FACTURAS VALUES ('26/10/19', 4, 9, 3, 5, 6, null)
INSERT INTO FACTURAS VALUES ('31/10/19', 3, 2, 3, 6, 4, null)
INSERT INTO FACTURAS VALUES ('02/12/19', 2, 3, 4, 1, 2, null)
INSERT INTO FACTURAS VALUES ('02/01/20', 1, 1, 5, 2, 3, null)
INSERT INTO FACTURAS VALUES ('02/01/20', 1, 4, 6, 3, 5, 'Retira mañana')
INSERT INTO FACTURAS VALUES ('05/03/20', 5, 3, 7, 4, 7, null)
INSERT INTO FACTURAS VALUES ('14/01/20', 3, 4, 8, 5, 1, null)
INSERT INTO FACTURAS VALUES ('14/01/20', 2, 2, 9, 6, 8, null)
INSERT INTO FACTURAS VALUES ('15/02/20', 4, 1, 11, 6, 2, null)
INSERT INTO FACTURAS VALUES ('15/03/20', 4, 1, 10, 6, null, null)
INSERT INTO FACTURAS VALUES ('18/04/20', 2, 1, 3, 4, 3, null)
INSERT INTO FACTURAS VALUES ('31/05/20', 1, 5, 2, 3, 6, null)
INSERT INTO FACTURAS VALUES ('01/06/20', 3, 1, 4, 2, 4, null)  --29
INSERT INTO FACTURAS VALUES ('06/07/20', 5, 2, 5, 1, null, null)
INSERT INTO FACTURAS VALUES ('23/08/20', 3, 2, 6, 1, 2, null)
INSERT INTO FACTURAS VALUES ('23/09/20', 1, 6, 7, 1, null, null)
INSERT INTO FACTURAS VALUES ('24/10/20', 5, 3, 8, 2, 6, null)
INSERT INTO FACTURAS VALUES ('25/11/20', 3, 3, 8, 2, null, null)
INSERT INTO FACTURAS VALUES ('27/12/20', 2, 3, 8, 3, 7, null)
INSERT INTO FACTURAS VALUES ('03/01/21', 4, 7, 8, 3, null, null)    --36
INSERT INTO FACTURAS VALUES ('07/01/21', 2, 3, 9, 4, 3, null)
INSERT INTO FACTURAS VALUES ('07/01/21', 4, 1, 9, 5, null, null)
INSERT INTO FACTURAS VALUES ('08/02/21', 1, 1, 10, 6, 8, 'Retira mañana')
INSERT INTO FACTURAS VALUES ('08/02/21', 3, 8, 11, 1, null, null)
INSERT INTO FACTURAS VALUES ('08/02/21', 3, 9, 3, 2, null, null)
INSERT INTO FACTURAS VALUES ('09/02/21', 2, 3, 4, 3, null, null)
INSERT INTO FACTURAS VALUES ('11/03/21', 5, 2, 5, 3, 6, null)
INSERT INTO FACTURAS VALUES ('13/04/21', 4, 4, 6, 3, null, null)    --44
INSERT INTO FACTURAS VALUES ('25/05/21', 3, 2, 7, 4, 5, null)
INSERT INTO FACTURAS VALUES ('24/05/21', 5, 5, 8, 4, null, null)
INSERT INTO FACTURAS VALUES ('12/06/21', 4, 6, 9, 5, null, null)
INSERT INTO FACTURAS VALUES ('15/06/21', 3, 1, 10, 5, 1, 'Chequear con obra social')
INSERT INTO FACTURAS VALUES ('18/07/21', 2, 1, 11, 5, null, null)
INSERT INTO FACTURAS VALUES ('19/08/21', 1, 1, 1, 6, null, null)    --50
INSERT INTO FACTURAS VALUES ('30/09/21', 1, 1, 1, 6, 3, null)
INSERT INTO FACTURAS VALUES ('26/10/21', 2, 1, 2, 4, null, null)
INSERT INTO FACTURAS VALUES ('11/11/21', 3, 8, 3, 2, null, null)
INSERT INTO FACTURAS VALUES ('13/11/21', 4, 3, 4, 1, null, null)
INSERT INTO FACTURAS VALUES ('19/12/21', 5, 3, 5, 3, null, null)
INSERT INTO FACTURAS VALUES ('25/01/22', 5, 7, 6, 5, null, null)
INSERT INTO FACTURAS VALUES ('27/02/22', 3, 3, 7, 4, null, 'Retira mañana')
INSERT INTO FACTURAS VALUES ('08/03/22', 1, 1, 8, 2, 7, null)
INSERT INTO FACTURAS VALUES ('14/04/22', 2, 5, 9, 1, 3, null)
INSERT INTO FACTURAS VALUES ('17/05/22', 4, 2, 9, 3, 2, null)  --60
INSERT INTO FACTURAS VALUES ('19/06/22', 4, 3, 10, 5, null, null)
INSERT INTO FACTURAS VALUES ('24/07/22', 2, 3, 11, 1, null, null)
INSERT INTO FACTURAS VALUES ('23/08/22', 3, 2, 1, 2, null, null)
INSERT INTO FACTURAS VALUES ('21/09/22', 1, 9, 2, 3, 6, 'Llamar por teléfono')--64

--–TABLA N°22
--–DETALLES_OC
INSERT INTO DETALLE_OC VALUES (1, 2, 50, 569.25)
INSERT INTO DETALLE_OC VALUES (1, 3, 50, 263.78)
INSERT INTO DETALLE_OC VALUES (2, 1, 150, 1345)
INSERT INTO DETALLE_OC VALUES (2, 4, 115, 112)
INSERT INTO DETALLE_OC VALUES (2, 5, 60, 314.20)
INSERT INTO DETALLE_OC VALUES (2, 1, 40, 987.78)
INSERT INTO DETALLE_OC VALUES (3, 1, 10, 1111.54)
INSERT INTO DETALLE_OC VALUES (3, 3, 45, 250.96)
INSERT INTO DETALLE_OC VALUES (3, 6, 50, 530.25)
INSERT INTO DETALLE_OC VALUES (4, 5, 25, 280.27)
INSERT INTO DETALLE_OC VALUES (4, 3, 125, 245.63)
INSERT INTO DETALLE_OC VALUES (4, 4, 95, 108.95)
INSERT INTO DETALLE_OC VALUES (4, 8, 60, 496.13)
INSERT INTO DETALLE_OC VALUES (5, 1, 12, 941.15)
INSERT INTO DETALLE_OC VALUES (5, 2, 80, 469.65)
INSERT INTO DETALLE_OC VALUES (6, 9, 60, 236.11)
INSERT INTO DETALLE_OC VALUES (6, 1, 10, 940.12)
INSERT INTO DETALLE_OC VALUES (7, 5, 40, 278)
INSERT INTO DETALLE_OC VALUES (7, 7, 80, 465.89)
INSERT INTO DETALLE_OC VALUES (7, 4, 90, 107.62)
INSERT INTO DETALLE_OC VALUES (7, 3, 50, 235.84)
INSERT INTO DETALLE_OC VALUES (8, 3, 10, 235.84)
INSERT INTO DETALLE_OC VALUES (8, 12, 75, 266)
INSERT INTO DETALLE_OC VALUES (9, 1, 75, 888.64)
INSERT INTO DETALLE_OC VALUES (10, 11, 30, 452.82)
INSERT INTO DETALLE_OC VALUES (11, 4, 20, 105.33)
INSERT INTO DETALLE_OC VALUES (11, 15, 15, 351.99)
INSERT INTO DETALLE_OC VALUES (12, 3, 20, 229.41)
INSERT INTO DETALLE_OC VALUES (13, 5, 120, 257.92)
INSERT INTO DETALLE_OC VALUES (14, 1, 95, 866.26)
INSERT INTO DETALLE_OC VALUES (14, 13, 110, 347.99)
INSERT INTO DETALLE_OC VALUES (15, 4, 80, 102.59)
INSERT INTO DETALLE_OC VALUES (16, 17, 40, 251.51)
INSERT INTO DETALLE_OC VALUES (17, 12, 30, 218.54)

--–TABLA N°23
--–DETALLES_FACTURA
INSERT INTO DETALLES_FACTURA VALUES (1,1,1,152.03,1,1,10)
INSERT INTO DETALLES_FACTURA VALUES (2,2,1,231,2,2, null)
INSERT INTO DETALLES_FACTURA VALUES (3,3,2,1150.12,3,3,15)
INSERT INTO DETALLES_FACTURA VALUES (4,4,1,99.14,4,4, null)
INSERT INTO DETALLES_FACTURA VALUES (5,5,1,88.25,5,5, null)
INSERT INTO DETALLES_FACTURA VALUES (6,6,1,178,6,6, null)
INSERT INTO DETALLES_FACTURA VALUES (7,7,1,196.47,7,7,10)
INSERT INTO DETALLES_FACTURA VALUES (8,8,2,421,61,8,8)
INSERT INTO DETALLES_FACTURA VALUES (9,9,1,248.70,9, null, null)
INSERT INTO DETALLES_FACTURA VALUES (10,10,1,369.99,10,10,20)
INSERT INTO DETALLES_FACTURA VALUES (11,11,1,487,11,11,20)
INSERT INTO DETALLES_FACTURA VALUES (12,12,2,154.25,11,12,20)
INSERT INTO DETALLES_FACTURA VALUES (13,13,1,89.10,12,13,20)
INSERT INTO DETALLES_FACTURA VALUES (14,14,1,111.11,12, null, null) --
INSERT INTO DETALLES_FACTURA VALUES (15,15,3,154.23,13,15, null)
INSERT INTO DETALLES_FACTURA VALUES (16,16,1,152.03,14,1,10)
INSERT INTO DETALLES_FACTURA VALUES (17,17,3,162,14,2, null)
INSERT INTO DETALLES_FACTURA VALUES (18,1,1,152.78,15,3,10)
INSERT INTO DETALLES_FACTURA VALUES (19,1,1,589,16,4,10)
INSERT INTO DETALLES_FACTURA VALUES (20,2,1,355.23,17,5, null)
INSERT INTO DETALLES_FACTURA VALUES (21,1,1,462.11,18,6,10)
INSERT INTO DETALLES_FACTURA VALUES (22,2,1,132.23,19,6, null)
INSERT INTO DETALLES_FACTURA VALUES (23,3,1,696.88,20,7,15)
INSERT INTO DETALLES_FACTURA VALUES (24,4,1,144.33,21,7, null)
INSERT INTO DETALLES_FACTURA VALUES (25,5,5,297.36,21,8,10)
INSERT INTO DETALLES_FACTURA VALUES (26,5,1,300,22,8, null)
INSERT INTO DETALLES_FACTURA VALUES (27,6,1,420.51,23,9,10)
INSERT INTO DETALLES_FACTURA VALUES (28,7,1,363.63,24,10, null)
INSERT INTO DETALLES_FACTURA VALUES (29,8,1,215.12,25,1, null)
INSERT INTO DETALLES_FACTURA VALUES (30,9,2,316.20,26, null, null)
INSERT INTO DETALLES_FACTURA VALUES (31,10,1,148.21,27,13,10)
INSERT INTO DETALLES_FACTURA VALUES (32,2,3,153,28, null, null) --
INSERT INTO DETALLES_FACTURA VALUES (33,12,1,213.11,29,14, null)
INSERT INTO DETALLES_FACTURA VALUES (34,13,1,145.63,30, null, null)
INSERT INTO DETALLES_FACTURA VALUES (35,14,1,321.89,31,15, null)
INSERT INTO DETALLES_FACTURA VALUES (36,5,1,258.60,32, null, null)
INSERT INTO DETALLES_FACTURA VALUES (37,15,2,365,32,16, null)
INSERT INTO DETALLES_FACTURA VALUES (38,16,1,749.44,33, null, null)
INSERT INTO DETALLES_FACTURA VALUES (39,17,1,163.20,34,8, null)
INSERT INTO DETALLES_FACTURA VALUES (40,17,1,186.30,35, null, null)
INSERT INTO DETALLES_FACTURA VALUES (41,17,1,176.33,36, null, null)
INSERT INTO DETALLES_FACTURA VALUES (42,17,1,236.22,37, null, null)
INSERT INTO DETALLES_FACTURA VALUES (43,8,2,298.32,38,2, null)
INSERT INTO DETALLES_FACTURA VALUES (44,9,1,52,39, null, null) ---
INSERT INTO DETALLES_FACTURA VALUES (45,10,1,88.48,40,3, null)
INSERT INTO DETALLES_FACTURA VALUES (46,12,1,96.54,41, null, null)
INSERT INTO DETALLES_FACTURA VALUES (47,1,1,103.56,42, null, null)
INSERT INTO DETALLES_FACTURA VALUES (48,12,2,258.58,43,14, null)
INSERT INTO DETALLES_FACTURA VALUES (49,13,3,456.21,44, null, null)
INSERT INTO DETALLES_FACTURA VALUES (50,14,1,62,45, null, null)
INSERT INTO DETALLES_FACTURA VALUES (50,5,1,83.11,46,10, null)
INSERT INTO DETALLES_FACTURA VALUES (53,6,1,96.06,47, null, null)
INSERT INTO DETALLES_FACTURA VALUES (53,7,1,87,48, null, null)
INSERT INTO DETALLES_FACTURA VALUES (54,2,1,803,49, null, null)
INSERT INTO DETALLES_FACTURA VALUES (55,3,1,105,50, null, null)
INSERT INTO DETALLES_FACTURA VALUES (56,4,2,118.18,51, null, null)   --
INSERT INTO DETALLES_FACTURA VALUES (57,9,1,1125.21,52, null, null)
INSERT INTO DETALLES_FACTURA VALUES (58,1,1,136.86,53,3, null)
INSERT INTO DETALLES_FACTURA VALUES (59,4,1,146.91,54,4, null)
INSERT INTO DETALLES_FACTURA VALUES (60,7,1,159.15,53,5, null)
INSERT INTO DETALLES_FACTURA VALUES (61,8,1,174.22,52, null, null)
INSERT INTO DETALLES_FACTURA VALUES (62,12,1,188.65,51, null, null)
INSERT INTO DETALLES_FACTURA VALUES (63,13,2,801.23,50, null, null)
INSERT INTO DETALLES_FACTURA VALUES (64,14,2,202.23,49,9, null)
INSERT INTO DETALLES_FACTURA VALUES (31,16,1,213.23,48,13, null)
INSERT INTO DETALLES_FACTURA VALUES (35,6,1,217.15,47,15, null)
INSERT INTO DETALLES_FACTURA VALUES (41,5,1,237.12,46,10, null)
INSERT INTO DETALLES_FACTURA VALUES (47,1,1,78.78,45,null,15)       ---
INSERT INTO DETALLES_FACTURA VALUES (48,2,1,258.21,44,14, null)
INSERT INTO DETALLES_FACTURA VALUES (59,3,1,269.65,43,4, null)
INSERT INTO DETALLES_FACTURA VALUES (12,4,1,979.54,42,12, null)
INSERT INTO DETALLES_FACTURA VALUES (13,5,2,281.54,41,null,20)
INSERT INTO DETALLES_FACTURA VALUES (50,6,1,301.30,40, null, null)
INSERT INTO DETALLES_FACTURA VALUES (60,7,1,315.62,39,5, null)
INSERT INTO DETALLES_FACTURA VALUES (14,8,2,399,38,7,15)
INSERT INTO DETALLES_FACTURA VALUES (13,9,3,141.51,37, null, null)
INSERT INTO DETALLES_FACTURA VALUES (19,10,1,151.23,36,4, null)
INSERT INTO DETALLES_FACTURA VALUES (20,2,1,793,35,5, null)
INSERT INTO DETALLES_FACTURA VALUES (21,13,1,172.99,34, null, null)
INSERT INTO DETALLES_FACTURA VALUES (23,14,1,188.56,33,8,10)        ---
INSERT INTO DETALLES_FACTURA VALUES (53,15,1,951.20,32, null, null)
INSERT INTO DETALLES_FACTURA VALUES (7,16,1,159.01,31,1,20)


--–TABLA N°24 
--–REEMBOLSOS_OS
INSERT INTO reembolsos_os VALUES (1,1)
INSERT INTO reembolsos_os VALUES (2,1)
INSERT INTO reembolsos_os VALUES (3,1)
INSERT INTO reembolsos_os VALUES (4,1)
INSERT INTO reembolsos_os VALUES (5,1)
INSERT INTO reembolsos_os VALUES (6,1)
INSERT INTO reembolsos_os VALUES (7,1)
INSERT INTO reembolsos_os VALUES (8,1)
INSERT INTO reembolsos_os VALUES (10,1)
INSERT INTO reembolsos_os VALUES (11,1)
INSERT INTO reembolsos_os VALUES (12,0)
INSERT INTO reembolsos_os VALUES (13,1)
INSERT INTO reembolsos_os VALUES (15,1)
INSERT INTO reembolsos_os VALUES (16,1)
INSERT INTO reembolsos_os VALUES (17,1)
INSERT INTO reembolsos_os VALUES (18,1)
INSERT INTO reembolsos_os VALUES (19,1)
INSERT INTO reembolsos_os VALUES (20,1)
INSERT INTO reembolsos_os VALUES (21,1)
INSERT INTO reembolsos_os VALUES (22,0)
INSERT INTO reembolsos_os VALUES (23,1)
INSERT INTO reembolsos_os VALUES (24,1)
INSERT INTO reembolsos_os VALUES (25,1)
INSERT INTO reembolsos_os VALUES (26,1)
INSERT INTO reembolsos_os VALUES (27,1)
INSERT INTO reembolsos_os VALUES (28,1)
INSERT INTO reembolsos_os VALUES (29,1)
INSERT INTO reembolsos_os VALUES (30,1)
INSERT INTO reembolsos_os VALUES (31,0)
INSERT INTO reembolsos_os VALUES (33,1)
INSERT INTO reembolsos_os VALUES (35,1)
INSERT INTO reembolsos_os VALUES (37,1)
INSERT INTO reembolsos_os VALUES (39,1)
INSERT INTO reembolsos_os VALUES (43,1)
INSERT INTO reembolsos_os VALUES (45,1)
INSERT INTO reembolsos_os VALUES (48,1)
INSERT INTO reembolsos_os VALUES (51,1)
INSERT INTO reembolsos_os VALUES (58,0)
INSERT INTO reembolsos_os VALUES (59,1)
INSERT INTO reembolsos_os VALUES (60,1)
INSERT INTO reembolsos_os VALUES (64,1)
INSERT INTO reembolsos_os VALUES (65,1)
INSERT INTO reembolsos_os VALUES (66,1)
INSERT INTO reembolsos_os VALUES (67,0)
INSERT INTO reembolsos_os VALUES (69,1)
INSERT INTO reembolsos_os VALUES (70,1)
INSERT INTO reembolsos_os VALUES (71,0)
INSERT INTO reembolsos_os VALUES (74,1)
INSERT INTO reembolsos_os VALUES (75,0)
INSERT INTO reembolsos_os VALUES (77,0)
INSERT INTO reembolsos_os VALUES (78,0)
INSERT INTO reembolsos_os VALUES (80,0)
INSERT INTO reembolsos_os VALUES (82,0)

--–TABLA N°25
--–STOCKS
select * from STOCKS order by 5
INSERT INTO STOCKS (cantidad, id_producto, id_orden_compra,id_sucursal, stock_minimo, stock_maximo, lote, vencimiento)
VALUES (80, 1, 15,2, 10, 3000, 12502, '12-12-2023')
INSERT INTO STOCKS (cantidad, id_producto, id_orden_compra,id_sucursal, stock_minimo, stock_maximo, lote, vencimiento)
VALUES (80, 2, 15,2, 10, 3000, 13003, '12-11-2024')
INSERT INTO STOCKS (cantidad, id_producto, id_orden_compra,id_sucursal, stock_minimo, stock_maximo, lote, vencimiento)
VALUES (80, 3, 15,2, 10, 3000, 14004, '01-09-2024')
INSERT INTO STOCKS (cantidad, id_producto, id_orden_compra,id_sucursal, stock_minimo, stock_maximo, lote, vencimiento)
VALUES (100, 4, 15,2, 10, 3000, 14506, '10-12-2024')
INSERT INTO STOCKS (cantidad, id_producto, id_orden_compra,id_sucursal, stock_minimo, stock_maximo, lote, vencimiento)
VALUES (80, 5, 15,2, 10, 3000, 14004, '01-09-2024')
INSERT INTO STOCKS (cantidad, id_producto, id_orden_compra,id_sucursal, stock_minimo, stock_maximo, lote, vencimiento)
VALUES (10, 6, 6,2, 10, 3000, 17008, '10-12-2023')
INSERT INTO STOCKS (cantidad, id_producto, id_orden_compra,id_sucursal, stock_minimo, stock_maximo, lote, vencimiento)
VALUES (10, 7, 5,3, 10, 3000, 19001, '11-12-2023')
INSERT INTO STOCKS (cantidad, id_producto, id_orden_compra,id_sucursal, stock_minimo, stock_maximo, lote, vencimiento)
VALUES (10, 8, 5,3, 10, 3000, 19503, '12-12-2024')
INSERT INTO STOCKS (cantidad, id_producto, id_orden_compra,id_sucursal, stock_minimo, stock_maximo, lote, vencimiento)
VALUES (60, 9, 16,3, 10, 3000, 20102, '12-12-2025')
INSERT INTO STOCKS (cantidad, id_producto, id_orden_compra,id_sucursal, stock_minimo, stock_maximo, lote, vencimiento)
VALUES (100, 10, 17,3, 10, 3000, 20204 , '12-12-2025')
INSERT INTO STOCKS (cantidad, id_producto, id_orden_compra,id_sucursal, stock_minimo, stock_maximo, lote, vencimiento)
VALUES (40, 11, 17,3, 10, 3000, 20304, '12-12-2025')
INSERT INTO STOCKS (cantidad, id_producto, id_orden_compra,id_sucursal, stock_minimo, stock_maximo, lote, vencimiento)
VALUES (50, 12, 17,3, 10, 3000, 20406, '12-12-2025')
INSERT INTO STOCKS (cantidad, id_producto, id_orden_compra,id_sucursal, stock_minimo, stock_maximo, lote, vencimiento)
VALUES (20, 13, 17,4, 10, 3000, 20504, '12-12-2025')
INSERT INTO STOCKS (cantidad, id_producto, id_orden_compra,id_sucursal, stock_minimo, stock_maximo, lote, vencimiento)
VALUES (40, 14, 15,4, 10, 3000, 20604, '16-01-2025')
INSERT INTO STOCKS (cantidad, id_producto, id_orden_compra,id_sucursal, stock_minimo, stock_maximo, lote, vencimiento)
VALUES (25, 15, 16,4, 10, 3000, 20554, '16-02-2025')
INSERT INTO STOCKS (cantidad, id_producto, id_orden_compra,id_sucursal, stock_minimo, stock_maximo, lote, vencimiento)
VALUES (50, 16, 16,4, 10, 3000, 20662, '16-03-2025')
INSERT INTO STOCKS (cantidad, id_producto, id_orden_compra,id_sucursal, stock_minimo, stock_maximo, lote, vencimiento)
VALUES (60, 17, 16,4, 10, 3000, 20704, '23-04-2025')
INSERT INTO STOCKS (cantidad, id_producto, id_orden_compra,id_sucursal, stock_minimo, stock_maximo, lote, vencimiento)
VALUES (30, 18, 10,4, 10, 3000, 20784, '23-04-2025')
INSERT INTO STOCKS (cantidad, id_producto, id_orden_compra,id_sucursal, stock_minimo, stock_maximo, lote, vencimiento)
VALUES (20, 19, 10,4, 10, 3000, 20804, '23-04-2025')
INSERT INTO STOCKS (cantidad, id_producto, id_orden_compra,id_sucursal, stock_minimo, stock_maximo, lote, vencimiento)
VALUES (25, 20, 15,4, 10, 3000, 20844, '23-04-2025')
INSERT INTO STOCKS (cantidad, id_producto, id_orden_compra,id_sucursal, stock_minimo, stock_maximo, lote, vencimiento)
VALUES (50, 21, 16,4, 10, 3000, 20906, '30-2-2023')
INSERT INTO STOCKS (cantidad, id_producto, id_orden_compra,id_sucursal, stock_minimo, stock_maximo, lote, vencimiento)
VALUES (60, 22, 16,5, 10, 3000, 20946, '26-2-2024')
INSERT INTO STOCKS (cantidad, id_producto, id_orden_compra,id_sucursal, stock_minimo, stock_maximo, lote, vencimiento)
VALUES (50, 23, 14,5, 10, 3000, 20944,  '26-2-2024')
INSERT INTO STOCKS (cantidad, id_producto, id_orden_compra,id_sucursal, stock_minimo, stock_maximo, lote, vencimiento)
VALUES (50, 24, 14,5, 10, 3000, 20986, '26-2-2024')
INSERT INTO STOCKS (cantidad, id_producto, id_orden_compra,id_sucursal, stock_minimo, stock_maximo, lote, vencimiento)
VALUES (80, 25, 15,5, 10, 3000, 21404, '30-6-2026')
INSERT INTO STOCKS (cantidad, id_producto, id_orden_compra,id_sucursal, stock_minimo, stock_maximo, lote, vencimiento)
VALUES (80, 26, 15, 5,10, 3000, 21504, '30-7-2026')
INSERT INTO STOCKS (cantidad, id_producto, id_orden_compra,id_sucursal, stock_minimo, stock_maximo, lote, vencimiento)
VALUES (60, 27, 14,5, 10, 3000, 21604, '30-1-2026')
INSERT INTO STOCKS (cantidad, id_producto, id_orden_compra,id_sucursal, stock_minimo, stock_maximo, lote, vencimiento)
VALUES (70, 28, 15,5, 10, 3000, 21704, '30-1-2024')
INSERT INTO STOCKS (cantidad, id_producto, id_orden_compra,id_sucursal, stock_minimo, stock_maximo, lote, vencimiento)
VALUES (70, 29, 15,5, 10, 3000, 21804,  '3-10-2024')
INSERT INTO STOCKS (cantidad, id_producto, id_orden_compra,id_sucursal, stock_minimo, stock_maximo, lote, vencimiento)
VALUES (60, 30, 16,5, 10, 3000, 21904, '30-10-2024')

INSERT INTO STOCKS (cantidad, id_producto, id_orden_compra,id_sucursal, stock_minimo, stock_maximo, lote, vencimiento)
VALUES (300, 31, 17,5, 10, 3000, 22004, '30-10-2024')
INSERT INTO STOCKS (cantidad, id_producto, id_orden_compra,id_sucursal, stock_minimo, stock_maximo, lote, vencimiento)
VALUES (150, 32, 17,5, 10, 3000, 22104, '30-10-2024')
INSERT INTO STOCKS (cantidad, id_producto, id_orden_compra,id_sucursal, stock_minimo, stock_maximo, lote, vencimiento)
VALUES (5, 33, 17, 5,10, 3000, 22204, '30-10-2024')
INSERT INTO STOCKS (cantidad, id_producto, id_orden_compra,id_sucursal, stock_minimo, stock_maximo, lote, vencimiento)
VALUES (10, 34, 17, 5,10, 3000, 22304, '30-10-2024')
INSERT INTO STOCKS (cantidad, id_producto, id_orden_compra,id_sucursal, stock_minimo, stock_maximo, lote, vencimiento)
VALUES (74, 35, 17,5, 10, 3000, 22404, '30-10-2024')
INSERT INTO STOCKS (cantidad, id_producto, id_orden_compra,id_sucursal, stock_minimo, stock_maximo, lote, vencimiento)
VALUES (200, 36, 17,2, 10, 3000, 22504, '30-10-2024')
INSERT INTO STOCKS (cantidad, id_producto, id_orden_compra,id_sucursal, stock_minimo, stock_maximo, lote, vencimiento)
VALUES (455, 37, 17, 2,10, 3000, 22604, '30-10-2024')
INSERT INTO STOCKS (cantidad, id_producto, id_orden_compra,id_sucursal, stock_minimo, stock_maximo, lote, vencimiento)
VALUES (600, 38, 17,2, 10, 3000, 22704, '30-10-2024')
INSERT INTO STOCKS (cantidad, id_producto, id_orden_compra,id_sucursal, stock_minimo, stock_maximo, lote, vencimiento)
VALUES (7, 39, 17,2, 10, 3000, 22804, '30-10-2024')
INSERT INTO STOCKS (cantidad, id_producto, id_orden_compra,id_sucursal, stock_minimo, stock_maximo, lote, vencimiento)
VALUES (10, 40, 17,2, 10, 3000, 22904, '30-10-2024')
INSERT INTO STOCKS (cantidad, id_producto, id_orden_compra,id_sucursal, stock_minimo, stock_maximo, lote, vencimiento)
VALUES (2500, 41, 17,2, 10, 3000, 23004, '30-10-2024')







