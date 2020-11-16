using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using CapaEntidad;

using System.Text;
using System.Security.Cryptography;


namespace CapaWeb
{    
    public partial class LoginCliente : System.Web.UI.Page
    {
        private ServiceReferenceCliente.wsClienteSoapClient servicio = new ServiceReferenceCliente.wsClienteSoapClient();
        private ServiceReferenceUsuario.wsUsuarioSoapClient servicio2 = new ServiceReferenceUsuario.wsUsuarioSoapClient();
        private ServiceReferenceVendedor.wsVendedorSoapClient servicio3 = new ServiceReferenceVendedor.wsVendedorSoapClient();

        int Estado;
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.AppendHeader("Cache-Control", "no-store");
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
        

        protected void btnCliente_Click(object sender, EventArgs e)
        {            
            mvEjemplo.ActiveViewIndex = 0;
            Estado = 1;
        }

        protected void btnVendedor_Click(object sender, EventArgs e)
        {
            mvEjemplo.ActiveViewIndex = 1;
            Estado = 2;
        }

        protected void btnLoguinCliente_Click1(object sender, EventArgs e)
        {
            string usuario = txtUsuario.Text.Trim();
            string contrasena = txtContrasena.Text.Trim();
            string[] respuesta = servicio.Login(usuario, contrasena).ToArray();
            string codError = respuesta[0];
            string mensaje = respuesta[1];
            if (codError == "true")
            {
                Response.Write("<script>alert('" + mensaje+ "');</script>");
                Response.Redirect("Cliente.aspx?nombre=" + mensaje);
            }
            else
                Response.Write("<script>alert('" + mensaje + "');</script>");
        }

        protected void btnLoguinVendedor_Click(object sender, EventArgs e)
        {
            
            string usuario = txtUsuarioV.Text.Trim();
            string contrasena = txtContrasenaV.Text.Trim();
            string[] respuesta = servicio3.Login(usuario,contrasena).ToArray();
            string codError = respuesta[0];
            string mensaje = respuesta[1];
            if (codError == "true")
            {
                Response.Write("<script>alert('" + mensaje + "');</script>");
                Response.Redirect("AccesoVendedor.aspx?nombre=" + mensaje);
            }
            else
                Response.Write("<script>alert('" + mensaje + "');</script>");
        }

        protected void btnIniciar_Click(object sender, EventArgs e)
        {
            Response.Redirect("AgregarCliente.aspx");
        }
    }
}