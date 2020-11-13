using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CapaServicio;

namespace CapaWeb
{
    public partial class Producto : System.Web.UI.Page
    {
        
        private ServiceReferenceProducto.wsProductoSoapClient servicio = new ServiceReferenceProducto.wsProductoSoapClient();
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
                Listar();
        }

        private void Listar()
        {
            gvProducto.DataSource = servicio.Listar();
            gvProducto.DataBind();
        }
        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            string CodProducto = txtCodProducto.Text.Trim();
            string Nombre = txtNombre.Text.Trim();
            string  Unidad = txtUnidadMedida.Text.Trim();
            double Precio = Double.Parse(txtPrecio.Text.Trim());
            int Stock = int.Parse(txtStock.Text.Trim());
            string CodCategoria = txtCodCategoria.Text.Trim();
            if (servicio.Agregar(CodProducto,Nombre,Unidad,Precio,Stock,CodCategoria))
            Listar();
        }

        protected void btnEiminar_Click(object sender, EventArgs e)
        {            
            string CodProducto = txtCodProducto.Text.Trim();
            if (servicio.Eliminar(CodProducto))
            {
                Listar();
            }
        }

        protected void btnActualizar_Click(object sender, EventArgs e)
        {
            string CodProducto = txtCodProducto.Text.Trim();
            string Nombre = txtNombre.Text.Trim();
            string Unidad = txtUnidadMedida.Text.Trim();
            double Precio = Double.Parse(txtPrecio.Text.Trim());
            int Stock = int.Parse(txtStock.Text.Trim());
            string CodCategoria = txtCodCategoria.Text.Trim();
            if (servicio.Actualizar(CodProducto, Nombre, Unidad, Precio, Stock, CodCategoria) == true)
                Listar();
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            string texto = txtBuscar.Text.Trim();
            int criterio = ddlCriterio.SelectedIndex;
            if (criterio == 0)
            {
                gvProducto.DataSource = servicio.Buscar(texto, "CodProducto");
                gvProducto.DataBind();
            }
            else if (criterio == 1)
            {
                gvProducto.DataSource = servicio.Buscar(texto, "Nombre");
                gvProducto.DataBind();
            }
        }
    }
}