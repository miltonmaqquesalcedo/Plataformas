------------------------------------------------------------------------------------------------------------
-- CREACION DE LA BASE DE DATOS BDVentas
------------------------------------------------------------------------------------------------------------
use master
go
------------------------------------------------------------------------------------------------------------
if exists(select name from sysdatabases where name in('BDVentas'))
	drop database BDVentas
go
------------------------------------------------------------------------------------------------------------
create database BDVentas
go
------------------------------------------------------------------------------------------------------------
use BDVentas
go
------------------------------------------------------------------------------------------------------------
-- CREACI�N DE TABLAS DE LA BASE DE DATOS
------------------------------------------------------------------------------------------------------------
create table TCliente(
 CodCliente			varchar(4) not null primary key,
 Apellidos			varchar(30)not null,
 Nombres 			varchar(30)not null,
 Direccion			varchar(50)not null,
 Usuario 			varchar(50)not null,
 Contrasena			varbinary(200)not null
)
go

------------------------------------------------------------------------------------------------------------
create table TVendedor(
 CodVendedor		varchar(4) not null primary key,
 Apellidos			varchar(30) not null,
 Nombres			varchar(30)not null,
 Usuario 			varchar(50)not null,
 Contrasena			varbinary(200)not null
)
go
------------------------------------------------------------------------------------------------------------
create table TCategoria(
 CodCategoria		varchar(4) not null primary key,
 Nombre 			varchar(50) not null,
 CategoriaPadre		varchar(4),
 Foreign Key		(CategoriaPadre) References TCategoria
 )
go
------------------------------------------------------------------------------------------------------------
create table TProducto(
 CodProducto		varchar(4) not null primary key,
 Nombre 			varchar(50) not null,
 UnidadMedida 		varchar(30) not null,
 Precio 			real not null check (Precio > 0),
 Stock				int default 1 check (Stock >=0 ),
 CodCategoria		varchar(4) not null,
 Foreign Key		(CodCategoria) References TCategoria
)
go
------------------------------------------------------------------------------------------------------------
create table TBoleta(
 NroBoleta			varchar(6) not null primary key,
 Fecha 				datetime not null,
 CodCliente 		varchar(4) not null,
 CodVendedor		varchar(4) not null,
 Anulado 			bit not null default 0,
 foreign key 		(CodCliente) references TCliente,
 foreign key 		(CodVendedor) references TVendedor
)
go
------------------------------------------------------------------------------------------------------------
create table TDetalle(
 NroBoleta			varchar(6) not null,
 CodProducto 			varchar(4) not null,
 Cantidad  			real not null check (Cantidad > 0),
 PrecioUnitario		real not null check (PrecioUnitario > 0),
 primary key 		(NroBoleta,CodProducto),
 foreign key 		(NroBoleta) references TBoleta,
 foreign key 		(CodProducto) references TProducto
)
go

------------------------------------------------------------------------------------------------------------
-- INSERCI�N DE DATOS DE EJEMPLO
------------------------------------------------------------------------------------------------------------
 
/*insert into TCliente values('C001', 'JIMENEZ AGUILAR', 'JORGE', 'AV SOL 234','jimenez@gmail.com','123')
insert into TCliente values('C002', 'PERALTA ARAOZ', 'MIRIAM', 'URB VISTA ALEGRE J-34','peralta@gmail.com','123')
insert into TCliente values('C003', 'MIRANDA DIAZ', 'PEDRO', 'CALLE INCA 438','miranda@gmail.com','123')
insert into TCliente values('C004', 'SUAREZ GAVANCHO', 'MONICA', 'AV. LA CULTURA S/N','suarez,@gmail.com','123')
insert into TCliente values('C005', 'PERALTA DUE�AS', 'MARIO', 'AV. EL SOL 435','peralta@gmail.com','123')
insert into TCliente values('C006', 'JIMENEZ MARCA', 'JOSE', 'URB. SAN JUDAS 533','marca@gmail.com','123')
insert into TCliente values('C007', 'PALERMO MIRANDA', 'JUAN', 'CALLE BELEN 322','palermo@gmail.com','123')
insert into TCliente values('C008', 'ZAPATA VALENZUELA', 'DARIO', 'CALLE GARCILASO 232','zapata@gmail.com','123')
insert into TCliente values('C009', 'DIAZ GONZALES', 'MARITZA', 'PLAZA SANTIAGO 493','diaz@gmail.com','123')
insert into TCliente values('C010', 'RODIEGUEZ LEON', 'DIANA', 'AV. LA CULTURA 1234','rodriguez@gmail.com','123')
go

------------------------------------------------------------------------------------------------------------
 
insert into TVendedor values('V001', 'ZANABRIA PERALTA', 'MANUEL','zanabria@gmail.com','123')
insert into TVendedor values('V002', 'CABRERA PEREZ', 'DIANA','cabrera@gmail.com','123')
insert into TVendedor values('V003', 'VERA CAMPANA', 'MONICA','vera@gmail.com','123')
go

------------------------------------------------------------------------------------------------------------

insert into TCategoria values ('C001', 'ALIMENTO DE PRIMERA NECESIDAD', NULL)
insert into TCategoria values ('C002', 'BEBIDAS', NULL)
insert into TCategoria values ('C003', 'ALCOHOLICAS', 'C002')
insert into TCategoria values ('C004', 'MATERIAL ESCRITORIO', NULL)
insert into TCategoria values ('C005', 'MATERILES DE COSTURA', NULL)
go

------------------------------------------------------------------------------------------------------------

insert into TProducto values ('P001', 'LECHE','LITRO', 3, 3.5, 'C001')
insert into TProducto values ('P002', 'FIDEO','KILO', 8, 4.0, 'C001')
insert into TProducto values ('P003', 'ARROZ','KILO',4, 5.0, 'C001')
insert into TProducto values ('P004', 'PAPA','KG', 3.5, 254, 'C001')
insert into TProducto values ('P005', 'CERVEZA','650 mml', 5, 3.0, 'C003')
insert into TProducto values ('P006', 'LAPICERO','CAJA 10 UNIDADES', 0.5, 100.0, 'C004')
insert into TProducto values ('P007', 'CUADERNO CUADRICULADO','UNIDAD X 100 HOJAS', 2, 135.0, 'C004')
insert into TProducto values ('P008', 'CINTA AISLANTE','3 METROS', 5, 43.0, 'C004')
insert into TProducto values ('P009', 'PLUMON ACRILICO','UNIDAD', 3.5, 72.0, 'C004')
insert into TProducto values ('P010', 'TIJERAS','CAJA X 10 UNIDADES', 7.3, 23.0, 'C005')
insert into TProducto values ('P011', 'PAPEL A4','1/2 MILLAR', 14.5, 323.0, 'C004')
insert into TProducto values ('P012', 'VINO TINTO','LITRO', 56.0, 29.0, 'C003')
insert into TProducto values ('P013', 'AZUCAR BLANCA','KILO', 2.2, 423.0, 'C001')
insert into TProducto values ('P014', 'MAIZ','KILO', 12.2, 43.0, 'C001')
insert into TProducto values ('P015', 'AGUA MINERAL','LITRO', 1.2, 100.0, 'C002')
insert into TProducto values ('P016', 'LAPIZ','UNIDAD', 1.5, 50.0, 'C004')
insert into TProducto values ('P017', 'HILO','OVILLO 10 m.', 0.2, 140, 'C005')
insert into TProducto values ('P018', 'ANIS','LITRO', 98.0, 10.0, 'C003')
go

SET DATEFORMAT DMY
------------------------------------------------------------------------------------------------------------
insert into TBoleta values ('B001', '12/08/2008', 'C001', 'V002', 0)
insert into TBoleta values ('B002', '15/08/2008', 'C003', 'V002', 1)
insert into TBoleta values ('B003', '19/08/2008', 'C010', 'V002', 0)
insert into TBoleta values ('B004', '19/08/2008', 'C004', 'V002', 0)
insert into TBoleta values ('B005', '23/08/2008', 'C007', 'V003', 0)
insert into TBoleta values ('B006', '26/08/2008', 'C007', 'V001', 0)
insert into TBoleta values ('B007', '01/09/2008', 'C002', 'V002', 0)
insert into TBoleta values ('B008', '05/09/2008', 'C009', 'V001', 0)
insert into TBoleta values ('B009', '10/09/2008', 'C008', 'V001', 0)
insert into TBoleta values ('B010', '13/09/2008', 'C008', 'V001', 0)
insert into TBoleta values ('B011', '14/09/2008', 'C003', 'V002', 0)
insert into TBoleta values ('B012', '14/09/2008', 'C003', 'V002', 0)
insert into TBoleta values ('B013', '02/10/2008', 'C003', 'V001', 0)
insert into TBoleta values ('B014', '02/10/2008', 'C002', 'V001', 1)
insert into TBoleta values ('B015', '09/10/2008', 'C002', 'V002', 0)
insert into TBoleta values ('B016', '24/10/2008', 'C002', 'V003', 0)
insert into TBoleta values ('B017', '12/11/2008', 'C009', 'V002', 0)
insert into TBoleta values ('B018', '16/12/2008', 'C004', 'V001', 0)
insert into TBoleta values ('B019', '25/12/2008', 'C009', 'V002', 0)
insert into TBoleta values ('B020', '25/12/2008', 'C005', 'V001', 0)
insert into TBoleta values ('B021', '28/12/2008', 'C007', 'V001', 0)
insert into TBoleta values ('B022', '28/12/2008', 'C006', 'V001', 0)
insert into TBoleta values ('B023', '02/01/2009', 'C008', 'V002', 0)
insert into TBoleta values ('B024', '04/01/2009', 'C006', 'V001', 0)
insert into TBoleta values ('B025', '04/02/2009', 'C008', 'V003', 1)
insert into TBoleta values ('B026', '09/02/2009', 'C008', 'V003', 0)
insert into TBoleta values ('B027', '23/02/2009', 'C002', 'V002', 0)
insert into TBoleta values ('B028', '23/02/2009', 'C001', 'V001', 0)
insert into TBoleta values ('B029', '11/03/2009', 'C010', 'V002', 0)
insert into TBoleta values ('B030', '11/03/2009', 'C001', 'V002', 0)
insert into TBoleta values ('B031', '16/04/2009', 'C004', 'V001', 0)
insert into TBoleta values ('B032', '16/04/2009', 'C007', 'V002', 0)
insert into TBoleta values ('B033', '29/04/2009', 'C003', 'V002', 1)
insert into TBoleta values ('B034', '04/05/2009', 'C004', 'V003', 0)
go

------------------------------------------------------------------------------------------------------------
insert into TDetalle values ('B001', 'P001', 20, 3)
insert into TDetalle values ('B001', 'P002', 16, 8)

insert into TDetalle values ('B003', 'P001', 18, 3)
insert into TDetalle values ('B003', 'P002', 10, 8)
insert into TDetalle values ('B003', 'P003', 15, 4)
insert into TDetalle values ('B003', 'P004', 19, 3.5)

insert into TDetalle values ('B004', 'P003', 14, 4)
insert into TDetalle values ('B004', 'P007', 9, 2)

insert into TDetalle values ('B005', 'P010', 3, 7.3)
insert into TDetalle values ('B005', 'P009', 11, 3.5)
insert into TDetalle values ('B005', 'P001', 17, 3)
insert into TDetalle values ('B005', 'P003', 14, 4)

insert into TDetalle values ('B006', 'P002', 5, 8)

insert into TDetalle values ('B007', 'P005', 6, 5)

insert into TDetalle values ('B008', 'P002', 7, 8)
insert into TDetalle values ('B008', 'P003', 13, 4)
insert into TDetalle values ('B008', 'P004', 17, 3.5)
insert into TDetalle values ('B008', 'P005', 11, 5)

insert into TDetalle values ('B009', 'P002', 19, 8)
insert into TDetalle values ('B009', 'P004', 14, 3.5)

insert into TDetalle values ('B010', 'P002', 8, 8)
insert into TDetalle values ('B010', 'P005', 18, 5)
insert into TDetalle values ('B010', 'P008', 15, 5)
insert into TDetalle values ('B010', 'P009', 5, 3.5)

insert into TDetalle values ('B011', 'P001', 17, 3)
insert into TDetalle values ('B011', 'P002', 11, 8)
insert into TDetalle values ('B011', 'P009', 8, 3.5)

insert into TDetalle values ('B012', 'P004', 15, 3.5)
insert into TDetalle values ('B012', 'P005', 3, 5)
insert into TDetalle values ('B012', 'P007', 4, 2)
insert into TDetalle values ('B012', 'P002', 3, 8)
insert into TDetalle values ('B012', 'P009', 14, 3.5)
insert into TDetalle values ('B012', 'P010', 9, 7.3)

insert into TDetalle values ('B013', 'P005', 5, 5)
insert into TDetalle values ('B013', 'P004', 18, 3.5)
insert into TDetalle values ('B013', 'P006', 16, 0.5)
insert into TDetalle values ('B013', 'P002', 4, 8)
insert into TDetalle values ('B013', 'P001', 17, 3)
insert into TDetalle values ('B013', 'P007', 19, 2)
insert into TDetalle values ('B013', 'P009', 18, 3.5)
insert into TDetalle values ('B013', 'P008', 19, 5)
insert into TDetalle values ('B013', 'P003', 14, 4)

insert into TDetalle values ('B015', 'P009', 18, 3.5)

insert into TDetalle values ('B016', 'P009', 14, 3.5)

insert into TDetalle values ('B017', 'P004', 7, 3.5)

insert into TDetalle values ('B018', 'P009', 10, 3.5)
insert into TDetalle values ('B018', 'P001', 11, 3)

insert into TDetalle values ('B019', 'P001', 4, 3)
insert into TDetalle values ('B019', 'P002', 2, 8)
insert into TDetalle values ('B019', 'P004', 15, 3.5)

insert into TDetalle values ('B020', 'P004', 8, 3.5)
insert into TDetalle values ('B020', 'P008', 8, 5)
insert into TDetalle values ('B020', 'P003', 17, 4)
insert into TDetalle values ('B020', 'P006', 14, 0.5)

insert into TDetalle values ('B021', 'P010', 13, 7.3)
insert into TDetalle values ('B021', 'P009', 18, 3.5)
insert into TDetalle values ('B021', 'P001', 17, 3)

insert into TDetalle values ('B022', 'P004', 17, 3.5)
insert into TDetalle values ('B022', 'P001', 11, 3)

insert into TDetalle values ('B023', 'P006', 7, 0.5)
insert into TDetalle values ('B023', 'P004', 2, 3.5)
insert into TDetalle values ('B023', 'P008', 8, 5)

insert into TDetalle values ('B024', 'P008', 1, 5)
insert into TDetalle values ('B024', 'P004', 20, 3.5)

insert into TDetalle values ('B026', 'P002', 18, 8)
insert into TDetalle values ('B026', 'P008', 20, 5)
insert into TDetalle values ('B026', 'P010', 3, 7.3)
insert into TDetalle values ('B026', 'P004', 18, 3.5)

insert into TDetalle values ('B027', 'P007', 13, 2)
insert into TDetalle values ('B027', 'P005', 19, 5)
insert into TDetalle values ('B027', 'P009', 1, 3.5)

insert into TDetalle values ('B028', 'P001', 1, 3)
insert into TDetalle values ('B028', 'P004', 5, 3.5)
insert into TDetalle values ('B028', 'P005', 12, 5)

insert into TDetalle values ('B029', 'P010', 6, 7.3)
insert into TDetalle values ('B029', 'P009', 7, 3.5)
insert into TDetalle values ('B029', 'P002', 8, 8)

insert into TDetalle values ('B030', 'P002', 18, 8)
insert into TDetalle values ('B030', 'P003', 12, 4)
insert into TDetalle values ('B030', 'P008', 14, 5)
insert into TDetalle values ('B030', 'P005', 1, 5)
insert into TDetalle values ('B030', 'P007', 13, 2)
insert into TDetalle values ('B030', 'P006', 11, 0.5)
insert into TDetalle values ('B030', 'P004', 14, 3.5)
insert into TDetalle values ('B030', 'P009', 13, 3.5)

insert into TDetalle values ('B031', 'P001', 6, 3)
insert into TDetalle values ('B031', 'P009', 1, 3.5)

insert into TDetalle values ('B032', 'P003', 15, 4)
insert into TDetalle values ('B032', 'P005', 7, 5)

insert into TDetalle values ('B034', 'P007', 19, 2)
go*/

select * from TCliente
go
select * from TVendedor
go