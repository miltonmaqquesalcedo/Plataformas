using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CapaServicio;

namespace CapaWeb
{
    public partial class Categoria : System.Web.UI.Page
    {
        private ServiceReferenceCategoria.wsCategoriaSoapClient servicio = new ServiceReferenceCategoria.wsCategoriaSoapClient();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
                Listar();
        }

        private void Listar()
        {
            gvCategoria.DataSource = servicio.Listar();
            gvCategoria.DataBind();
        }
        

        protected void btnEiminar_Click(object sender, EventArgs e)
        {
            string CodCategoria = txtCodCategoria.Text.Trim();
            if (servicio.Eliminar(CodCategoria))
                Listar();
        }

        protected void btnActualizar_Click(object sender, EventArgs e)
        {
            string CodCategoria = txtCodCategoria.Text.Trim();
            string Nombre = txtNombre.Text.Trim();
            string CategoriaPadre = txtCategoriaPadre.Text.Trim();
            if (servicio.Actualizar(CodCategoria, Nombre, CategoriaPadre))
                Listar();
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            string texto = txtBuscar.Text.Trim();
            int criterio = ddlCriterio.SelectedIndex;
            if (criterio == 0)
            {
                gvCategoria.DataSource = servicio.Buscar(texto, "CodCategoria");
                gvCategoria.DataBind();
            }
            else if (criterio == 1)
            {
                gvCategoria.DataSource = servicio.Buscar(texto, "Nombre");
                gvCategoria.DataBind();
            }
        }

        protected void btnAgregarC_Click(object sender, EventArgs e)
        {
            string CodCategoria = txtCodCategoria.Text.Trim();
            string Nombre = txtNombre.Text.Trim();
            string CategoriaPadre = txtCategoriaPadre.Text.Trim();
            if (servicio.Agregar(CodCategoria, Nombre, CategoriaPadre))
                Listar();
        }
    }
}