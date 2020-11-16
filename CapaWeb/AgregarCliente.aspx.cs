using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CapaServicio;

using System.Text;
using System.Security.Cryptography;

namespace CapaWeb
{
    public partial class AgregarCliente : System.Web.UI.Page
    {
        private ServiceReferenceCliente.wsClienteSoapClient servicio = new ServiceReferenceCliente.wsClienteSoapClient();
        private ServiceReferenceVendedor.wsVendedorSoapClient servicio1 = new ServiceReferenceVendedor.wsVendedorSoapClient();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCrear_Click(object sender, EventArgs e)
        {
            string codCliente = txtCodCliente.Text.Trim();
            string apellidos = txtApellidos.Text.Trim();
            string nombres = txtNombres.Text.Trim();
            string direccion = txtDireccion.Text.Trim();
            string usuario = txtUsuario.Text.Trim();
            string contrasena = txtContrasena.Text.Trim();

            servicio.Agregar(codCliente, apellidos, nombres, direccion, usuario, contrasena);
                           
        }
                

        protected void btnClienteR_Click(object sender, EventArgs e)
        {
            mvRegistro.ActiveViewIndex = 0;
        }

        protected void btnVendedorR_Click(object sender, EventArgs e)
        {
            mvRegistro.ActiveViewIndex = 1;
        }

        private string generarClaveSHA1(string cadena)
        {
            UTF8Encoding enc = new UTF8Encoding();
            byte[] data = enc.GetBytes(cadena);
            byte[] result;

            SHA1CryptoServiceProvider sha = new SHA1CryptoServiceProvider();

            result = sha.ComputeHash(data);

            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < result.Length; i++)
            {
                // Convertimos los valores en hexadecimal
                // cuando tiene una cifra hay que rellenarlo con cero
                // para que siempre ocupen dos dígitos.
                if (result[i] < 16)
                {
                    sb.Append("0");
                }
                sb.Append(result[i].ToString("x"));
            }
            //Devolvemos la cadena con el hash en mayúsculas para que quede más chuli :)
            return sb.ToString().ToUpper();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string codVendedor = txtCodVendedor.Text.Trim();
            string apellidos = txtApellidosV.Text.Trim();
            string nombres = txtNombreV.Text.Trim();
            string usuario = txtUsuarioV.Text.Trim();
            string contrasena = txtContrasenaV.Text.Trim();
            servicio1.Agregar(codVendedor, apellidos, nombres, usuario, generarClaveSHA1(contrasena));
        }

        protected void btnIniciar_Click(object sender, EventArgs e)
        {
            Response.Redirect("LoginCliente.aspx");
        }
    }
}