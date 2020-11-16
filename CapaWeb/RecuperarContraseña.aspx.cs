using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using CapaWeb;

namespace CapaWeb
{
    public partial class RecuperarContraseña : System.Web.UI.Page
    {
        private ServiceReferenceUsuario.wsUsuarioSoapClient servicio = new ServiceReferenceUsuario.wsUsuarioSoapClient();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnVerificar_Click(object sender, EventArgs e)
        {
            string usuario = txtRecuperarU.Text.Trim();
            string contrasena = txtRecuperarC.Text.Trim();
            string contrasenaRepetir = txtRecuperarC2.Text.Trim();
            string nuevaContrasena = txtNuevaContraseña.Text.Trim();
            string []respuesta;

            int criterio = ddlCriterio.SelectedIndex;
            if (criterio == 0)
            {
                if (contrasena.Equals(contrasenaRepetir))
                {
                    respuesta = servicio.CambiarVendedor(usuario, contrasena, nuevaContrasena).ToArray();
                    string codError = respuesta[0];
                    string mensaje = respuesta[1];
                    if (codError == "true")
                    {
                        Response.Write("<script>alert('" + mensaje + "');</script>");
                        Response.Redirect("AccesoVendedor.aspx?nombre=" + usuario);
                    }
                    else
                    {
                        Response.Write("<script>alert('" + mensaje + "');</script>");
                    }
                }
            }
            else if (criterio == 1)
            {
                if (contrasena.Equals(contrasenaRepetir))
                {
                    respuesta = servicio.CambiarCliente(usuario, contrasena, nuevaContrasena).ToArray();
                    string codError = respuesta[0];
                    string mensaje = respuesta[1];
                    if (codError == "true")
                    {
                        Response.Write("<script>alert('" + mensaje + "');</script>");
                        Response.Redirect("Cliente.aspx?nombre=" + usuario);
                    }
                    else
                    {
                        Response.Write("<script>alert('" + mensaje + "');</script>");
                    }
                }
            }


        }
    }
}