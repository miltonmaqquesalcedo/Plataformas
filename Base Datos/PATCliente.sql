use BDVentas
go

if OBJECT_ID('spListarCliente') is not null
	drop proc spListarCliente
go

Create proc spListarCliente
as
begin
	select * from TCliente
end
go

exec spListarCliente
go

if OBJECT_ID('spActualizarCliente') is not null
	drop proc spActualizarCliente
go

Create proc spActualizarCliente
@CodCliente varchar(4),
@Apellidos varchar (30),
@Nombres varchar(30),
@Direccion varchar(50),
@Usuario varchar(50),
@Contrasena varchar(50)
as
begin
	if exists (select CodCliente from TCliente where CodCliente=@CodCliente)
		if exists(select Usuario from TCliente where Usuario=@Usuario)
			begin
				begin tran TransActualizar
				begin try
					update TCliente
					set   Apellidos=@Apellidos, Nombres=@Nombres, Direccion=@Direccion,Usuario=@Usuario,Contrasena= ENCRYPTBYPASSPHRASE('password',@Contrasena) where CodCliente=@CodCliente
					commit tran TransActualizar 
					select CodError=0, Mensaje='Cliente modificado correctamente'
				end try
				begin catch
					rollback tran TransActualizar
					select CodError = 1, Mensaje = 'Error: No se ejecuto la transsaccion'
				end catch
			end
		else select CodError = 1, Mensaje = 'Error: Usuario ya existe'
	else select CodError = 1, Mensaje = 'Error: Codigo de Cliente Duplicado'
end
go



exec spActualizarCliente 'C011','xx','xxxx','xxxx','xxxx','123'
go

exec spListarCliente
go

if OBJECT_ID('spAgregarCliente') is not null
	drop proc spAgregarCliente
go

Create proc spAgregarCliente
@CodCliente varchar(4),
@Apellidos varchar (30),
@Nombres varchar(30),
@Direccion varchar(50),
@Usuario varchar(50),
@Contrasena varchar(50)
as
begin
	if not exists (select CodCliente from TCliente where CodCliente=@CodCliente)
		if not exists(select Usuario from TCliente where Usuario=@Usuario)
			begin
				begin tran TransInsertar
				begin try
					insert into TCliente values (@CodCliente,@Apellidos,@Nombres,@Direccion, @Usuario,ENCRYPTBYPASSPHRASE('password',@Contrasena))
					select CodError = 0, Mensaje = 'Cliente insertado correctamente'
				end try
				begin catch
					rollback tran TransInsertar
					select CodError = 1, Mensaje = 'Error: No se ejecuto la transsaccion'
				end catch
			end
		else select CodError = 1, Mensaje = 'Error: Usuario ya existe'
	else select CodError = 1, Mensaje = 'Error: Codigo de Cliente Duplicado'
end
go




if OBJECT_ID('spLoginCliente')is not null
	drop proc spLoginCliente
go
create proc spLoginCliente
@Usuario varchar(50), @Contrasena varchar(50)
as
begin
	if exists (select Usuario from TCliente where Usuario=@Usuario)
	begin
		declare @ContrasenaD varchar(50)			
		set @ContrasenaD = (select CAST(DecryptByPassPhrase('password', Contrasena) As varchar(50)) from TCliente where Usuario = @Usuario)		
		if(@Contrasena=@ContrasenaD)
		begin
			declare @DatosCliente varchar(50)
			set @DatosCliente = (select Apellidos+' '+Nombres from TCliente where Usuario=@Usuario )
			select CodError=0, Mensaje = 'Bienvenido '+ @DatosCliente
		end
		else select CodError =1, Mensaje='Error: Usuario y/o Contraseña incorrecta'
	end
	else select CodError =1, Mensaje='Error: Usuario no existe en la base de datos'
end
go

exec spLoginCliente 'miranda@gmail.com','123'
go

if OBJECT_ID('spEliminarCliente') IS NOT NULL
	drop proc spEliminarCliente
go
create proc spEliminarCliente
@CodCliente varchar(4)
as
begin 
	--Validar si el Curso existe
	if exists(select @CodCliente from TCliente where CodCliente = @CodCliente)
	begin		
			begin tran EliminarCliente
			begin try
					delete from TCliente where CodCliente = @CodCliente
					commit tran EliminarCliente
					select CodError = 0,Mensaje='Cliente eliminado correctamente'
				end try
				begin catch
					rollback tran EliminarCliente
					select CodError = 1,Mensaje='Error: problema en la transaccion'
			end catch
		
	end
	else select CodError=1 ,Mensaje='Error: No existe Codigo del cliente '
end
go

if OBJECT_ID('spBuscarCliente') is not null
	drop proc spBuscarCliente
go
create proc spBuscarCliente
@Texto varchar(50), @Criterio varchar(10)
as
begin
    if (@Criterio = 'CodCliente') --Busqueda sensitiva
		select * from TCliente where CodCliente like @Texto	
	else if (@Criterio = 'Nombres') --Busqueda sensitiva
		select * from TCliente where Nombres like '%'+ @Texto + '%'
	else if (@Criterio = 'Apellidos') --Busqueda sensitiva
		select * from TCliente where Apellidos like '%'+ @Texto + '%'
end
go

exec spBuscarCliente 'C001','CodCliente'
go

