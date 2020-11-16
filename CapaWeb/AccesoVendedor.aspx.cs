using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CapaServicio;

using System.IO;
using System.Web.UI.HtmlControls;
using System.Text;

using iTextSharp.text;
using iTextSharp.text.pdf;
using System.Data;
using iTextSharp.text.html;
using iTextSharp.text.html.simpleparser;

namespace CapaWeb
{
    public partial class AccesoVendedor : System.Web.UI.Page
    {
        private ServiceReferenceBoleta.wsBoletaSoapClient servicio = new ServiceReferenceBoleta.wsBoletaSoapClient();
        string codigoVendedor;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                string mensaje = Request.QueryString["nombre"].ToString();
                codigoVendedor = mensaje.Substring(mensaje.Length - 4);
                string nombre = mensaje.Substring(0, mensaje.Length - 4);
                lblNombre1.Text = nombre;
            }           

        } 


        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            servicio.Eliminar(codigoVendedor);
            Session.RemoveAll();
            Session.Abandon();
            Response.Cookies.Add(new HttpCookie("ASP.NET_SessionId", ""));
            Response.AppendHeader("Cache-Control", "no-store");
            Response.Redirect("LoginCliente.aspx");
        }

        protected void btnBoleta_Click(object sender, EventArgs e)
        {
            Response.Redirect("Boleta.aspx");
        }

        protected void btnProducto_Click(object sender, EventArgs e)
        {
            Response.Redirect("Producto.aspx");
        }

        protected void btnCategoria_Click(object sender, EventArgs e)
        {
            Response.Redirect("Categoria.aspx");
        }

        protected void btnCerrar_Click(object sender, EventArgs e)
        {
            Response.Redirect("LoginCliente.aspx");
        }
    }
}