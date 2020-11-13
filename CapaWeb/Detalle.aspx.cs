using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CapaServicio;

namespace CapaWeb
{
    public partial class Detalle : System.Web.UI.Page
    {
        private ServiceReferenceDetalle.wsDetalleSoapClient servicio = new ServiceReferenceDetalle.wsDetalleSoapClient();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
                Listar();
        }
        private void Listar()
        {
            gvDetalle.DataSource = servicio.Listar();
            gvDetalle.DataBind();
        }
        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            string NroBoleta = txtNroBoleta.Text.Trim();
            string CodDetalle = txtCodProducto.Text.Trim();
            int Cantidad = int.Parse(txtCantidad.Text);

            if (servicio.Agregar(NroBoleta, CodDetalle, Cantidad))
                Listar();
        }

        protected void btnEiminar_Click(object sender, EventArgs e)
        {
            string NroBoleta = txtNroBoleta.Text.Trim();
            string CodProducto = txtCodProducto.Text.Trim();
            if (servicio.Eliminar(NroBoleta,CodProducto))
                Listar();
        }

        protected void btnActualizar_Click(object sender, EventArgs e)
        {
            string NroBoleta = txtNroBoleta.Text.Trim();
            string CodDetalle = txtCodProducto.Text.Trim();
            int Cantidad = int.Parse(txtCantidad.Text);

            if (servicio.Actualizar(NroBoleta, CodDetalle, Cantidad))
                Listar();
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            string texto = txtBuscar.Text.Trim();
            int criterio = ddlCriterio.SelectedIndex;
            if (criterio == 0)
            {
                gvDetalle.DataSource = servicio.Buscar(texto, "NroBoleta");
                gvDetalle.DataBind();
            }
        }
    }
}