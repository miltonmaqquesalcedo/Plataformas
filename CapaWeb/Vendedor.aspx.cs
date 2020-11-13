using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;
using CapaServicio;

//MD5 Encriptación
using System.Security.Cryptography;
using System.Text;

namespace CapaWeb
{
    public partial class Vendedor : System.Web.UI.Page
    {
        private ServiceReferenceVendedor.wsVendedorSoapClient servicio = new ServiceReferenceVendedor.wsVendedorSoapClient();
        
        private void Listar()
        {
            gvVendedor.DataSource = servicio.Listar();
            gvVendedor.DataBind();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
                Listar();
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            string codVendedor = txtCodVendedor.Text.Trim();
            string apellidos = txtApellidos.Text.Trim();
            string nombres = txtNombres.Text.Trim();
            string usuario = txtUsuario.Text.Trim();
            string contrasena = txtContrasena.Text.Trim();
            if (servicio.Agregar(codVendedor, apellidos, nombres, usuario, GetMD5(contrasena)))
            Listar();
            
        }

        public static string GetMD5(string str)
        {
            MD5 md5 = MD5CryptoServiceProvider.Create();
            ASCIIEncoding encoding = new ASCIIEncoding();
            byte[] stream = null;
            StringBuilder sb = new StringBuilder();
            stream = md5.ComputeHash(encoding.GetBytes(str));
            for (int i = 0; i < stream.Length; i++) sb.AppendFormat("{0:x2}", stream[i]);
            return sb.ToString();
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {

        }
    }
}