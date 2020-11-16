using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CapaServicio;
//Pdf

//Excel
using System.IO;
using System.Web.UI.HtmlControls;
using System.Text;

namespace CapaWeb
{
    public partial class Cliente : System.Web.UI.Page
    {
        private ServiceReferenceCliente.wsClienteSoapClient servicio = new ServiceReferenceCliente.wsClienteSoapClient();
        string codigoCliente;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {   
                string mensaje= Request.QueryString["nombre"].ToString();
                codigoCliente = mensaje.Substring(mensaje.Length - 4);
                string nombre = mensaje.Substring(0, mensaje.Length - 4);
                lblNombre.Text = nombre;
            }
            
        }

        protected void btnCambiar_Click(object sender, EventArgs e)
        {

        }

        

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            servicio.Eliminar(codigoCliente);
            
            Session.RemoveAll();
            Session.Abandon();
            Response.Cookies.Add(new HttpCookie("ASP.NET_SessionId", ""));
            Response.AppendHeader("Cache-Control", "no-store");
            Response.Redirect("LoginCliente.aspx");
        }

        protected void btnCerrar_Click(object sender, EventArgs e)
        {
            Response.Redirect("LoginCliente.aspx");
        }
    }
}