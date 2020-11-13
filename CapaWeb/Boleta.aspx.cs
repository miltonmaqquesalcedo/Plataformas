using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CapaServicio;

namespace CapaWeb
{
    public partial class Boleta : System.Web.UI.Page
    {
        private ServiceReferenceBoleta.wsBoletaSoapClient servicio = new ServiceReferenceBoleta.wsBoletaSoapClient();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
                Listar();
        }        
    
        private void Listar()
        {
            gvBoleta.DataSource = servicio.Listar();
            gvBoleta.DataBind();
        }
        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            string NroBoleta = txtNroBoleta.Text.Trim();
            string CodCliente = txtCodCliente.Text.Trim();
            string CodVendedor = txtCodVendedor.Text.Trim();
            if (servicio.Agregar(NroBoleta,CodCliente,CodVendedor,0))
                Listar();
        }

        protected void btnEiminar_Click(object sender, EventArgs e)
        {
            string NroBoleta = txtNroBoleta.Text.Trim();
            if (servicio.Eliminar(NroBoleta))
                Listar();
        }

        protected void btnActualizar_Click(object sender, EventArgs e)
        {
            string NroBoleta = txtNroBoleta.Text.Trim();
            string CodCliente = txtCodCliente.Text.Trim();
            string CodVendedor = txtCodVendedor.Text.Trim();
            int Anulado = int.Parse(txtAnulado.Text.Trim());
            if (servicio.Actualizar(NroBoleta, CodCliente, CodVendedor, Anulado))
                Listar();
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            string texto = txtBuscar.Text.Trim();
            int criterio = ddlCriterio.SelectedIndex;
            if (criterio == 0)
            {
                gvBoleta.DataSource = servicio.Buscar(texto, "NroBoleta");
                gvBoleta.DataBind();
            }
            else if (criterio == 1)
            {
                gvBoleta.DataSource = servicio.Buscar(texto, "CodCliente");
                gvBoleta.DataBind();
            }
            else 
            {
                if (criterio == 2)
                {
                    gvBoleta.DataSource = servicio.Buscar(texto, "CodVendedor");
                    gvBoleta.DataBind();
                }
            }
            
        }

        
    }
}