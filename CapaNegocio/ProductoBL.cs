using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CapaEntidad;
using System.Data;

using CapaDatos;

namespace CapaNegocio
{
    public class ProductoBL : Interface.IProducto
    {
        private Datos datos = new DatosSQL();
        private string mensaje;
        public string Mensaje
        {
            get { return mensaje; }
        }

        public bool Actualizar(Producto producto)
        {
            DataRow fila = datos.TraerDataRow("spActualizarProducto", producto.CodProducto, producto.Nombre, producto.UnidadMedida, producto.Precio, producto.Stock, producto.CodCategoria);
            mensaje = fila["Mensaje"].ToString();
            byte codError = Convert.ToByte(fila["CodError"]);
            if (codError == 0) return true;
            else return false;
        }

        public bool Agregar(Producto producto)
        {
            DataRow fila = datos.TraerDataRow("spAgregarProducto", producto.CodProducto,producto.Nombre,producto.UnidadMedida,producto.Precio,producto.Stock,producto.CodCategoria);
            mensaje = fila["Mensaje"].ToString();
            byte codError = Convert.ToByte(fila["CodError"]);
            if (codError == 0) return true;
            else return false;
        }

        public DataSet Buscar(string texto, string criterio)
        {
            return datos.TraerDataSet("spBuscarProducto", texto, criterio);
        }

        public bool Eliminar(string CodProducto)
        {
            DataRow fila = datos.TraerDataRow("spEliminarProducto", CodProducto);
            byte codError = Convert.ToByte(fila["CodError"]);
            mensaje = fila["Mensaje"].ToString();
            if (codError == 0) return true;
            else return false;
        }

        public DataSet Listar()
        {
            return datos.TraerDataSet("spListarProducto");
        }
    }
}
