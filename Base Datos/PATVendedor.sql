use BDVentas
go

if OBJECT_ID('spAgregarVendedor') is not null
	drop proc spAgregarVendedor
go

create proc spAgregarVendedor
@CodVendedor varchar(4), @Apellidos varchar(30),
@Nombres varchar(30), @Usuario varchar(50),
@Contrasena varchar(50)
as
begin
	-- Verificar que CodVendedor no debe existir
	if not exists(select CodVendedor from TVendedor where CodVendedor=@CodVendedor) 
		-- Usuario no existe
		if not exists(select Usuario from TVendedor where Usuario=@Usuario)
			begin
				insert into TVendedor values(@CodVendedor, @Apellidos, @Nombres,
				@Usuario, @Contrasena)
				select CodError = 0, Mensaje = 'Vendedor insertado correctamente'
			end
		else select CodError = 1, Mensaje = 'Error: Usuario ya existe'
	else select CodError = 1, Mensaje = 'Error: CodVendedor ya existe'
end
go

exec spAgregarVendedor 'V005','AGUIRRE AGUIRRE','CRISTIAN','bozz@gmail.com','123'
go

------------------------------------------------------------------------------------

if OBJECT_ID('spEliminarVendedor') is not null
	drop proc spEliminarVendedor
go

create proc spEliminarVendedor
@CodVendedor varchar(4)
as
begin
	--Validar el CodVendedor exista
	if exists(select CodVendedor from TVendedor where CodVendedor = @CodVendedor)
	begin
		declare @Usuario varchar(50)
		set @Usuario = (select Usuario from TVendedor where CodVendedor = @CodVendedor)
		begin
			begin tran TransEliminar
			begin try
				delete from TVendedor where CodVendedor = @CodVendedor				
				commit tran TransEliminar --Confirmamos transaccion
				select CodError = 0, Mensaje = 'Vendedor eliminado correctamente'
			end try
			begin catch
				rollback tran TransEliminar
				select CodError = 1, Mensaje = 'Error: problemas en la transaccion'
			end catch
		end
	end
	else select CodError = 1, Mensaje = 'Error: Codigo de Vendedor no existe'
end
go

exec spEliminarVendedor 'V005'
go
-----------------------------------------------------------------------------------------

if OBJECT_ID('spBuscarVendedor') is not null
	drop proc spBuscarVendedor
go
create proc spBuscarVendedor
@Texto varchar(50), @Criterio varchar(10)
as
begin
    if (@Criterio = 'CodVen') --Busqueda concreta
		select * from TVendedor where CodVendedor like @Texto 
	else if (@Criterio = 'Nombres') --Busqueda sensitiva
		select * from TVendedor where Nombres like '%'+ @Texto + '%'
	else if (@Criterio = 'Apellidos') --Busqueda sensitiva
		select * from TVendedor where Apellidos like '%'+ @Texto + '%'
end
go

exec spBuscarVendedor 'V001','CodVen'
go



select * from TVendedor where CodVendedor like 'V001'
go

---------------------------------------------------------------------------------

if OBJECT_ID('spLoginVendedor')is not null
	drop proc spLoginVendedor
go
create proc spLoginVendedor
@Usuario varchar(50), @Contrasena varchar(50)
as
begin
	if exists (select Usuario from TVendedor where Usuario=@Usuario)
	if exists (select Contrasena from TVendedor where Contrasena = @Contrasena)
	begin
		declare @DatosVendedor varchar(50)
		set @DatosVendedor = (select Apellidos + ' ' + Nombres from TVendedor where Usuario = @Usuario)
		if exists (select Usuario from TVendedor where Usuario = @Usuario
		and Contrasena = @Contrasena)
		select CodError = 0, Mensaje = @DatosVendedor 
		else select CodError = 1, Mensaje = 'Error: Contraseña no encriptada'
	end
		else select CodError =1, Mensaje='Error: Usuario y/o Contraseña incorrecta'	
	else select CodError =1, Mensaje='Error: Usuario no existe en la base de datos'
end
go

exec spLoginVendedor 'zanabria@gmail.com','123'
go

exec spListarVendedor
go
----------------------------------------------------------------------------------------------------------

if OBJECT_ID('spActualizarVendedor') is not null
	drop proc spActualizarVendedor
go

Create proc spActualizarVendedor
@CodVendedor varchar(4),
@Apellidos varchar (30),
@Nombres varchar(30),
@Usuario varchar(50),
@Contrasena varchar(50)
as
begin
	if exists (select CodVendedor from TVendedor where CodVendedor=@CodVendedor)
			begin
				begin tran TransActualizar
				begin try
					update TVendedor
					set   Apellidos=@Apellidos, Nombres=@Nombres, Usuario = @Usuario, Contrasena= @Contrasena where CodVendedor = @CodVendedor
					commit tran TransActualizar 
					select CodError=0, Mensaje='Vendedor modificado correctamente'
				end try
				begin catch
					rollback tran TransActualizar
					select CodError = 1, Mensaje = 'Error: No se ejecuto la transsaccion'
				end catch
			end
	else select CodError = 1, Mensaje = 'Error: Codigo de Vendedor no existe'
end
go

exec spActualizarVendedor 'V005','AGUIRRE GUTIERREZ','MISHO','boz@gmail.com','123'
go

----------------------------------------------------------------------------------------

if OBJECT_ID('spListarVendedor') is not null 
	drop proc spListarVendedor
go

create proc spListarVendedor
as
begin
	select CodVendedor, Apellidos + ' ' + Nombres as Datos, Usuario, Contrasena from TVendedor
end
go

exec spListarVendedor
go