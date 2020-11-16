--Procedimientos almacenados para TProducto
--Pavel Rodrigo Arizbal Caceres
--3/10/2020

use BDVentas
go

--Listar
if OBJECT_ID('spListarProducto') is not null
	drop proc spListarProducto
go

create proc spListarProducto
as
begin
	--select CodProducto,TProducto.Nombre,UnidadMedida,Precio,Stock,TCategoria.Nombre 'Categoria' from TProducto inner join TCategoria on TProducto.CodCategoria = TCategoria.CodCategoria
	select CodProducto,TCategoria.Nombre 'Categoria',TProducto.Nombre,UnidadMedida,Precio,Stock from TProducto inner join TCategoria on TProducto.CodCategoria = TCategoria.CodCategoria
end
go

exec spListarProducto
go


--agregar un Producto
if OBJECT_ID('spAgregarProducto') is not null
	drop proc spAgregarProducto
go

create proc spAgregarProducto
@CodProducto varchar(4), @Nombre varchar(50), @UnidadMedida varchar(30), @Precio real, @Stock int,
@CodCategoria varchar(4)
as
begin
	--Validar Codigo Producto no se repita
	if not exists(select CodProducto from TProducto where CodProducto=@CodProducto)
		--Validar Categoria existe
		if exists(select CodCategoria from TCategoria where CodCategoria=@CodCategoria)
		begin
			begin tran TransAgregarProducto
			begin try
			insert into TProducto values(@CodProducto,@Nombre,@UnidadMedida,@Precio,@Stock,@CodCategoria)
			commit tran TransAgregarProducto
			select CodError=0, Mensaje='Producto insertado correctamente'
			end try

			begin catch
				rollback tran TransAgregarProducto
				select CodError = 1, Mensaje = 'Error: No se ejecuto la transaccion'
			end catch
		end
		else select CodError=1,Mensaje='Error: Codigo de Categoria no existente'
	else select CodError=1,Mensaje='Error: Codigo de Producto duplicado'
end
go

exec spAgregarProducto 'P019','MANZANILLA','LITRO',90,10,'C003'
go

--Eliminar Producto
if OBJECT_ID('spEliminarProducto') is not null
	drop proc spEliminarProducto
go

create proc spEliminarProducto
@CodProducto varchar(4)
as
begin
	-- Producto existente
	if exists(select CodProducto from TProducto where CodProducto=@CodProducto)
	begin
		begin tran TransEliminarProducto
		begin try
			delete from TProducto where CodProducto=@CodProducto
			commit tran TransEliminarProducto
			select CodError=0,Mensaje='Producto eliminado correctamente'
		end try
		begin catch
			rollback tran TransEliminarProducto
			select CodError=1,Mensaje='Error: Problemas en la transaccion'
		end catch
	end
	else select CodError=1,Mensaje='Error: Codigo de Producto no existe'
end
go

exec spEliminarProducto 'P019'
go

--Actualizar Producto
if OBJECT_ID('spActualizarProducto') is not null
	drop proc spActualizarProducto
go
create proc spActualizarProducto
@CodProducto varchar(4), @Nombre varchar(50), @UnidadMedida varchar(30), @Precio real, @Stock int,
@CodCategoria varchar(4)
as
begin
	--Validar que el CodProducto existe
	if exists(select CodProducto from TProducto where CodProducto = @CodProducto)
		--Validar que el CodCategoria exista
		if exists(select CodCategoria from TCategoria where CodCategoria = @CodCategoria)
			begin
				Update TProducto set Nombre=@Nombre,UnidadMedida=@UnidadMedida,Precio=@Precio,Stock=@Stock,
				CodCategoria=@CodCategoria where CodProducto=@CodProducto
				select CodError = 0, Mensaje = 'Producto modificado correctamente'
			end
		else select CodError = 1, Mensaje = 'Error: Categoria no existe'
	else select CodError = 1, Mensaje = 'Error: Producto no existe'
end
go

exec spActualizarProducto 'P019','MANZANILLA','ML',95.1,10,'C003'
go

exec spListarProducto
go

--Buscar Producto
if OBJECT_ID('spBuscarProducto') is not null
	drop proc spBuscarProducto
go
create proc spBuscarProducto
@Texto varchar(50), @Criterio varchar(50)
as
begin
	if(@Criterio = 'CodProducto') --Busqueda exacta
		select CodProducto,TCategoria.Nombre 'Categoria',TProducto.Nombre,UnidadMedida,Precio,Stock from TProducto inner join TCategoria on TProducto.CodCategoria = TCategoria.CodCategoria where CodProducto = @Texto 
		--select CodProducto,Nombre,UnidadMedida,Precio,Stock,CodCategoria from TProducto where CodProducto = @Texto 
	else if (@Criterio = 'Nombre') --Busqueda sensitiva
		--select CodProducto,Nombre,UnidadMedida,Precio,Stock,CodCategoria from TProducto where Nombre like '%'+@Texto+'%'
		select CodProducto,TCategoria.Nombre 'Categoria',TProducto.Nombre,UnidadMedida,Precio,Stock from TProducto inner join TCategoria on TProducto.CodCategoria = TCategoria.CodCategoria where TProducto.Nombre like '%'+@Texto+'%'
end
go

exec spBuscarProducto 'P001','CodProducto'
go
select * from TProducto

exec spBuscarProducto 'C','Nombre'
go