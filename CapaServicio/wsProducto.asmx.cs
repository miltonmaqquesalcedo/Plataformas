using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

using System.Data;
using CapaNegocio;
using CapaEntidad;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.Services.Protocols;

namespace CapaServicio
{
    /// <summary>
    /// Descripción breve de wsProducto
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente. 
    // [System.Web.Script.Services.ScriptService]
    public class wsProducto : System.Web.Services.WebService
    {
        [WebMethod(Description = "Listar datos de la tabla Producto")]
        public DataSet Listar()
        {
            ProductoBL producto = new ProductoBL();
            return producto.Listar();
        }
        [WebMethod(Description = "Agregar un Producto")]
        public bool Agregar(string CodProducto,string Nombre,string UnidadMedida,double Precio,int Stock, string CodCategoria)
        {
            Producto producto = new Producto();
            producto.CodProducto = CodProducto;
            producto.Nombre = Nombre;
            producto.UnidadMedida = UnidadMedida;
            producto.Precio = Precio;
            producto.Stock = Stock;
            producto.CodCategoria = CodCategoria;
            
            ProductoBL productoBL = new ProductoBL();
            if (productoBL.Agregar(producto)) return true;
            else return false;
        }

        [WebMethod(Description = "Eliminar Producto")]
        public bool Eliminar(string CodProducto)
        {
            ProductoBL producto = new ProductoBL();
            if (producto.Eliminar(CodProducto)) return true;
            else return false;
        }

        [WebMethod(Description = "Actualizar Producto")]
        public bool Actualizar(string CodProducto, string Nombre, string UnidadMedida, double Precio, int Stock, string CodCategoria)
        {
            Producto producto = new Producto();
            producto.CodProducto = CodProducto;
            producto.Nombre = Nombre;
            producto.UnidadMedida = UnidadMedida;
            producto.Precio = Precio;
            producto.Stock = Stock;
            producto.CodCategoria = CodCategoria;

            ProductoBL productoBL = new ProductoBL();
            if (productoBL.Actualizar(producto)) return true;
            else return false;
        }

        [WebMethod(Description = "Buscar Producto")]
        public DataSet Buscar(string texto,string Categoria)
        {
            ProductoBL producto = new ProductoBL();
            return producto.Buscar(texto,Categoria);
        }


    }
}
