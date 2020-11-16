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
    public partial class Boleta : System.Web.UI.Page
    {
        private ServiceReferenceBoleta.wsBoletaSoapClient servicio = new ServiceReferenceBoleta.wsBoletaSoapClient();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Listar();
            }
                
        }        
    
        private void Listar()
        {
            gvBoleta1.DataSource = servicio.Listar();
            gvBoleta1.DataBind();
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
                gvBoleta1.DataSource = servicio.Buscar(texto, "NroBoleta");
                gvBoleta1.DataBind();
            }
            else if (criterio == 1)
            {
                gvBoleta1.DataSource = servicio.Buscar(texto, "CodCliente");
                gvBoleta1.DataBind();
            }
            else 
            {
                if (criterio == 2)
                {
                    gvBoleta1.DataSource = servicio.Buscar(texto, "CodVendedor");
                    gvBoleta1.DataBind();
                }
            }
            
        }

        protected void gvBoleta_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvBoleta1.PageIndex = e.NewPageIndex;
            Listar();
        }

        protected void btnProducto_Click(object sender, EventArgs e)
        {
            Response.Redirect("Producto.aspx");
        }

        protected void btnCategoria_Click(object sender, EventArgs e)
        {
            Response.Redirect("Categoria.aspx");
        }

        protected void btnBoleta_Click(object sender, EventArgs e)
        {
            Response.Redirect("Boleta.aspx");
        }

        protected void btnCerrar_Click(object sender, EventArgs e)
        {
            Response.Redirect("LoginCliente.aspx");
        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            //base.VerifyRenderingInServerForm(control);
        }

        protected void btnExcel_Click(object sender, EventArgs e)
        {
            Response.Clear();
            Response.Buffer = true;
            Response.Charset = "";
            Response.AddHeader("content-disposition", "attachment;filename=GridViewExport.xls");
            Response.ContentType = "application/ms-excel ";
            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            gvBoleta1.AllowPaging = false;
            gvBoleta1.DataBind();
            gvBoleta1.RenderControl(hw);
            Response.Output.Write(sw.ToString());
            Response.Flush();
            Response.End();
        }

        protected void btnPdf_Click(object sender, EventArgs e)
        {

        }

        
        protected void btnListar_Click(object sender, EventArgs e)
        {
            string Codigo = txtCodigoListar.Text.Trim();
            gvBoleta2.DataSource = servicio.ListarBoleta(Codigo);
            gvBoleta2.DataBind();
            gvDetalle1.DataSource = servicio.ListarDetalle(Codigo);
            gvDetalle1.DataBind();
        }
    }
}