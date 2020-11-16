--Seguridad e aplicaciones
--Pavel Arizabal
--19/10/2020

use BDVentas
go

if OBJECT_ID('spLoginCliente') is not null
	drop proc spLoginCliente
go
create proc spLoginCliente
@Usuario varchar(50),@contrasena varchar(50)
as
begin
	if exists(select Usuario from TCliente where Usuario=@Usuario)
		if exists(select Contrasena from TCliente where Contrasena=@contrasena)
			begin
				declare @DatosCliente varchar(50)
				set @DatosCliente =(select Apellidos+' '+Nombres from TCliente where Usuario=@Usuario
				and Contrasena=@contrasena)
				if exists(select  Usuario from TCliente where Usuario=@Usuario
				and Contrasena=@contrasena)
				select CodError=0, Mensaje=@DatosCliente
			end
		else select CodError=1, Mensaje='Error: Usuario y/o Contrasenas incorrectas'
	else select CodError=1,Mensaje='Error: Usuario no existe en la base de datos'
end
go

exec spLoginCliente 'jimenez@gmail.com','123'
go