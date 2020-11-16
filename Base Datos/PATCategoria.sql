--Procedimientos almacenados para TCategoria
--Pavel Rodrigo Arizbal Caceres
--3/10/2020

use BDVentas
go

--Listar
if OBJECT_ID('spListarCategoria') is not null
	drop proc spListarCategoria
go

create proc spListarCategoria
as
begin
	select CodCategoria,Nombre,CategoriaPadre from TCategoria
end
go

exec spListarCategoria
go


--Agregar una Categoria
if OBJECT_ID('spAgregarCategoria') is not null
	drop proc spAgregarCategoria
go

create proc spAgregarCategoria
@CodCategoria varchar(4),@Nombre varchar(50),@CategoriaPadre varchar(4)
as
begin
	--Validar Codigo Categoria no se repita
	if not exists(select CodCategoria from TCategoria where CodCategoria=@CodCategoria)
		--Validar Categoria Padre exista
		if exists(select CodCategoria from TCategoria where CodCategoria=@CategoriaPadre)
		begin
			begin tran TransAgregarCategoria
			begin try
			insert into TCategoria values(@CodCategoria,@Nombre,@CategoriaPadre)
			commit tran TransAgregarCategoria
			select CodError=0, Mensaje='Categoria insertada correctamente'
			end try

			begin catch
				rollback tran TransAgregarCategoria
				select CodError = 1, Mensaje = 'Error: No se ejecuto la transaccion'
			end catch
		end
		else 
			if (@CategoriaPadre = 'null')
			begin
				begin tran TransAgregar
				begin try
				insert into TCategoria values(@CodCategoria,@Nombre,null)
				commit tran TransAgregar
				select CodError=0, Mensaje='Categoria insertada correctamente'
				end try

				begin catch
					rollback tran TransAgregar
					select CodError = 1, Mensaje = 'Error: No se ejecuto la transaccion'
				end catch
			end
			else select CodError = 1, Mensaje = 'Error: Categoria padre no existe'		
	else select CodError=1,Mensaje='Error: Codigo de Categoria duplicado'
end
go

exec spListarCategoria
go

exec spAgregarCategoria 'C007','Prueba2','C020'
go

exec spAgregarCategoria 'C008','Prueba2','C020'
go

exec spAgregarCategoria 'C009','Prueba2','null'
go

--Eliminar Categoria
if OBJECT_ID('spEliminarCategoria') is not null
	drop proc spEliminarCategoria
go

create proc spEliminarCategoria
@CodCategoria varchar(4)
as
begin
	-- Categoria existente
	if exists(select CodCategoria from TCategoria where CodCategoria=@CodCategoria)
	begin
		begin tran TransEliminarCategoria
		begin try
			delete from TProducto where CodCategoria=@CodCategoria
			delete from TCategoria where CategoriaPadre=@CodCategoria
			delete from TCategoria where CodCategoria=@CodCategoria
			commit tran TransEliminarCategoria
			select CodError=0,Mensaje='Categoria eliminada correctamente'
		end try
		begin catch
			rollback tran TransEliminarCategoria
			select CodError=1,Mensaje='Error: Problemas en la transaccion'
		end catch
	end
	else select CodError=1,Mensaje='Error: Codigo de Categoria no existe'
end
go

exec spEliminarCategoria 'C009'
go

--Actualizar Categoria
if OBJECT_ID('spActualizarCategoria') is not null
	drop proc spActualizarCategoria
go
create proc spActualizarCategoria
@CodCategoria varchar(4),@Nombre varchar(50),@CategoriaPadre varchar(4)
as
begin
	--Validar que el CodCategoria exista
	if exists(select CodCategoria from TCategoria where CodCategoria = @CodCategoria)
		--Validar que el Categoria padre exista
		if exists(select CodCategoria from TCategoria where CodCategoria=@CategoriaPadre)
			--Validar que el codigo categoria no sea igual a la categoria padre
			if(@CodCategoria!=@CategoriaPadre)
				begin
					Update TCategoria set Nombre=@Nombre,CategoriaPadre=@CategoriaPadre 
					where CodCategoria = @CodCategoria
					select CodError = 0, Mensaje = 'Categoria modificada correctamente'
				end
			else select CodError = 1, Mensaje = 'Error: Categoria Padre y Codigo de Categoria iguales'
		else
			if (@CategoriaPadre = 'null')		
			begin
				Update TCategoria set Nombre=@Nombre,CategoriaPadre=null 
						where CodCategoria = @CodCategoria
						select CodError = 0, Mensaje = 'Categoria modificada correctamente'
			end
			else select CodError=1, Mensaje='Error: Categoria Padre no existe'
	else select CodError = 1, Mensaje = 'Error: Categoria no existe'
end
go

exec spListarCategoria
go

exec spActualizarCategoria 'C007','Prueba','C007'
go
exec spActualizarCategoria 'C007','Prueba1','null'
go
exec spActualizarCategoria 'C007','Prueba','C003'
go


--Buscar Categoria
if OBJECT_ID('spBuscarCategoria') is not null
	drop proc spBuscarCategoria
go
create proc spBuscarCategoria
@Texto varchar(50), @Criterio varchar(50)
as
begin
	if(@Criterio = 'CodCategoria') --Busqueda exacta
		select CodCategoria,Nombre,CategoriaPadre from TCategoria where CodCategoria = @Texto 
	else if (@Criterio = 'Nombre') --Busqueda sensitiva
		select CodCategoria,Nombre,CategoriaPadre from TCategoria where Nombre like '%'+@Texto+'%'
end
go

exec spBuscarCategoria 'C001','CodCategoria'
go

exec spBuscarCategoria 'prueba','Nombre'
go