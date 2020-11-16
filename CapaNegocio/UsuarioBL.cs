using CapaDatos;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CapaEntidad;
using System.Data;

using CapaDatos;

namespace CapaNegocio
{
    public class UsuarioBL: Interface.IUsuario
    {
        private Datos datos = new DatosSQL();
        private string mensaje;
        public string Mensaje
        {
            get { return mensaje; }
        }
        public bool Login(Usuario usuario)
        {
            DataRow fila = datos.TraerDataRow("spLoginCliente", usuario._Usuario, usuario._Contrasena);
            mensaje = fila["Mensaje"].ToString();
            byte codError = Convert.ToByte(fila["CodError"]);
            if (codError == 0) return true;
            else return false;
        }

        public bool CambiarCliente(Usuario usuario1)
        {
            DataRow fila = datos.TraerDataRow("spCambioContraseñaCliente", usuario1._Usuario, usuario1._Contrasena,usuario1._Nueva);
            mensaje = fila["Mensaje"].ToString();
            byte codError = Convert.ToByte(fila["CodError"]);
            if (codError == 0) return true;
            else return false;
        }

        public bool CambiarVendedor(Usuario usuario)
        {
            DataRow fila = datos.TraerDataRow("spCambioContraseñaVendedor", usuario._Usuario, usuario._Contrasena, usuario._Nueva);
            mensaje = fila["Mensaje"].ToString();
            byte codError = Convert.ToByte(fila["CodError"]);
            if (codError == 0) return true;
            else return false;
        }

    }
}
