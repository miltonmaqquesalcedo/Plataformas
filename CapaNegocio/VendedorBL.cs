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
    public class VendedorBL : Interface.IVendedor
    {
        private Datos datos = new DatosSQL();
        private string mensaje;
        public string Mensaje 
        {
            get { return mensaje; }
        }

        public bool Actualizar(Vendedor vendedor)
        {
            DataRow fila = datos.TraerDataRow("spActualizarVendedor", vendedor.CodVendedor, vendedor.Apellidos, vendedor.Nombres, vendedor.Usuario, vendedor.Contrasena);
            mensaje = fila["Mensaje"].ToString();
            byte codError = Convert.ToByte(fila["CodError"]);
            if (codError == 0) return true;
            else return false;
        }

        public bool Agregar(Vendedor vendedor)
        {
            DataRow fila = datos.TraerDataRow("spAgregarVendedor",vendedor.CodVendedor,vendedor.Apellidos,vendedor.Nombres,vendedor.Usuario,vendedor.Contrasena);
            mensaje = fila["Mensaje"].ToString();
            byte codError = Convert.ToByte(fila["CodError"]);
            if (codError == 0) return true;
            else return false;
        }

        public DataSet Buscar(string texto, string criterio)
        {
            return datos.TraerDataSet("spBuscarVendedor", texto, criterio);
        }

        public bool Eliminar(string CodVendedor)
        {
            DataRow fila = datos.TraerDataRow("spEliminarVendedor", CodVendedor);
            byte codError = Convert.ToByte(fila["CodError"]);
            mensaje = fila["Mensaje"].ToString();
            if (codError == 0) return true;
            else return false;
        }

        public DataSet Listar()
        {
            return datos.TraerDataSet("spListarVendedor");
        }

        public bool Login(Vendedor vendedor)
        {
            DataRow fila = datos.TraerDataRow("spLoginVendedor", vendedor.Usuario,vendedor.Contrasena);
            mensaje = fila["Mensaje"].ToString();
            byte codError = Convert.ToByte(fila["CodError"]);
            if (codError == 0) return true;
            else return false;
        }
    }
}
