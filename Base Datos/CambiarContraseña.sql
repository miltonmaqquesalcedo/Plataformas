use BDVentas
go

if OBJECT_ID('spCambioContraseñaCliente') is not null
	drop proc spCambioContraseñaCliente
go
create proc spCambioContraseñaCliente
@usuario varchar(50), @contrasena varchar(50), @nueva varchar (50)
as
begin
	-- Validar que el usuario y  contraseña existan
	Declare @Desencri varchar(50)
	set @Desencri = DecryptByPassPhrase('password',(select Contrasena from TCliente where usuario=@usuario))
	if exists(select @Usuario from TCliente where usuario=@usuario and @Desencri=@contrasena)
	begin
		--  Si es correcto entonces debe devolver apellidos, nombres y CodCliente		
		begin tran TransCambio
				begin try
					update TCliente
					set   Contrasena= ENCRYPTBYPASSPHRASE('password',@nueva)
					where usuario=@usuario
					commit tran TransCambio 
					select CodError=0, Mensaje='Contraseña modifica'
				end try
				begin catch
					rollback tran TransCambio
					select CodError = 1, Mensaje = 'Error: No se ejecuto la transsaccion'
				end catch
	end
	else
		select codError = 1, Mensaje ='Contraseña no valida'
end
go

if OBJECT_ID('spCambioContraseñaVendedor') is not null
	drop proc spCambioContraseñaVendedor
go
create proc spCambioContraseñaVendedor
@usuario varchar(50), @contrasena varchar(50), @nueva varchar (50)
as
begin

	if exists(select @Usuario from TVendedor where usuario=@usuario and contrasena=@Contrasena)
	begin	
		begin tran TransCambio
				begin try
					update TVendedor
					set   Contrasena= @nueva
					where usuario=@usuario
					commit tran TransCambio 
					select CodError=0, Mensaje='Contraseña modificada'
				end try
				begin catch
					rollback tran TransCambio
					select CodError = 1, Mensaje = 'Error: No se ejecuto la transsaccion'
				end catch
	end
	else
		select codError = 1, Mensaje ='Contraseña no valida'
end
go

exec spCambioContraseñaCliente 'miranda@gmail.com','123','123'

select * from TCliente

select * from TVendedor