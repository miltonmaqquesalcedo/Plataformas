use BDVentas
go

if OBJECT_ID('spCambioContrase�aCliente') is not null
	drop proc spCambioContrase�aCliente
go
create proc spCambioContrase�aCliente
@usuario varchar(50), @contrasena varchar(50), @nueva varchar (50)
as
begin
	-- Validar que el usuario y  contrase�a existan
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
					select CodError=0, Mensaje='Contrase�a modifica'
				end try
				begin catch
					rollback tran TransCambio
					select CodError = 1, Mensaje = 'Error: No se ejecuto la transsaccion'
				end catch
	end
	else
		select codError = 1, Mensaje ='Contrase�a no valida'
end
go

if OBJECT_ID('spCambioContrase�aVendedor') is not null
	drop proc spCambioContrase�aVendedor
go
create proc spCambioContrase�aVendedor
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
					select CodError=0, Mensaje='Contrase�a modificada'
				end try
				begin catch
					rollback tran TransCambio
					select CodError = 1, Mensaje = 'Error: No se ejecuto la transsaccion'
				end catch
	end
	else
		select codError = 1, Mensaje ='Contrase�a no valida'
end
go

exec spCambioContrase�aCliente 'miranda@gmail.com','123','123'

select * from TCliente

select * from TVendedor