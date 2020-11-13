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
                Listar();
                string mensaje = Request.QueryString["nombre"].ToString();
                codigoVendedor = mensaje.Substring(mensaje.Length - 4);
                string nombre = mensaje.Substring(0, mensaje.Length - 4);
                lblNombre.Text = nombre;
                lblNombre.Text = nombre;
            }           

        }

        private void Listar()
        {
            gvVentas.DataSource = servicio.Listar();
            gvVentas.DataBind();
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
            gvVentas.AllowPaging = false;
            gvVentas.DataBind();
            gvVentas.RenderControl(hw);
            Response.Output.Write(sw.ToString());
            Response.Flush();
            Response.End();
        }        

        protected void btnCambiar_Click1(object sender, EventArgs e)
        {
            Contra.ActiveViewIndex = 0;
            btnCambiar.Visible = false;
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {

        }

        

        protected void btnPdf_Click(object sender, EventArgs e)
        {
            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename=GridViewExport.pdf");
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            gvVentas.AllowPaging = false;
            gvVentas.DataBind();
            gvVentas.RenderControl(hw);
            StringReader sr = new StringReader(sw.ToString());
            Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 10f, 0f);
            HTMLWorker html = new HTMLWorker(pdfDoc);
            PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
            pdfDoc.Open();
            html.Parse(sr);
            //pdfDoc.Close();
            Response.Write(pdfDoc.ToString());
            Response.End();
        }

        protected void btnCambiar_Click(object sender, EventArgs e)
        {
            
        }
        
    }
}