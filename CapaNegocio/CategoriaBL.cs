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
    public class CategoriaBL : Interface.ICategoria
    {
        private Datos datos = new DatosSQL();
        private string mensaje;
        public string Mensaje
        {
            get { return mensaje; }
        }

        public bool Actualizar(Categoria categoria)
        {
            DataRow fila = datos.TraerDataRow("spActualizarCategoria", categoria.CodCategoria,categoria.Nombre,categoria.CategoriaPadre);
            mensaje = fila["Mensaje"].ToString();
            byte codError = Convert.ToByte(fila["CodError"]);
            if (codError == 0) return true;
            else return false;
        }

        public bool Agregar(Categoria categoria)
        {
            DataRow fila = datos.TraerDataRow("spAgregarCategoria", categoria.CodCategoria, categoria.Nombre, categoria.CategoriaPadre);
            mensaje = fila["Mensaje"].ToString();
            byte codError = Convert.ToByte(fila["CodError"]);
            if (codError == 0) return true;
            else return false;
        }

        public DataSet Buscar(string texto, string criterio)
        {
            return datos.TraerDataSet("spBuscarCategoria", texto, criterio);
        }

        public bool Eliminar(string CodCategoria)
        {
            DataRow fila = datos.TraerDataRow("spEliminarCategoria", CodCategoria);
            byte codError = Convert.ToByte(fila["CodError"]);
            mensaje = fila["Mensaje"].ToString();
            if (codError == 0) return true;
            else return false;
        }

        public DataSet Listar()
        {
            return datos.TraerDataSet("spListarCategoria");
        }
    }
}
