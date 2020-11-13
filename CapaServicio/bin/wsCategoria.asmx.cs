using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

using System.Data;
using CapaNegocio;
using CapaEntidad;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.Services.Protocols;

namespace CapaServicio
{
    /// <summary>
    /// Descripción breve de wsCategoria
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente. 
    // [System.Web.Script.Services.ScriptService]
    public class wsCategoria : System.Web.Services.WebService
    {

        [WebMethod(Description = "Listar datos de la tabla Categoria")]
        public DataSet Listar()
        {
            CategoriaBL categoria = new CategoriaBL();
            return categoria.Listar();
        }
        [WebMethod(Description = "Agregar un Categoria")]
        public bool Agregar(string CodCategoria, string Nombre, string CategoriaPadre)
        {
            Categoria categoria = new Categoria();
            categoria.CodCategoria = CodCategoria;
            categoria.Nombre = Nombre;
            categoria.CategoriaPadre = CategoriaPadre;

            CategoriaBL categoriaBL = new CategoriaBL();
            if (categoriaBL.Agregar(categoria)) return true;
            else return false;
        }

        [WebMethod(Description = "Eliminar Categoria")]
        public bool Eliminar(string CodCategoria)
        {
            CategoriaBL categoriaBL = new CategoriaBL();
            if (categoriaBL.Eliminar(CodCategoria)) return true;
            else return false;
        }

        [WebMethod(Description = "Actualizar Categoria")]
        public bool Actualizar(string CodCategoria, string Nombre, string CategoriaPadre)
        {
            Categoria categoria = new Categoria();
            categoria.CodCategoria = CodCategoria;
            categoria.Nombre = Nombre;
            categoria.CategoriaPadre = CategoriaPadre;

            CategoriaBL categoriaBL = new CategoriaBL();
            if (categoriaBL.Actualizar(categoria)) return true;
            else return false;
        }

        [WebMethod(Description = "Buscar Categoria")]
        public DataSet Buscar(string texto, string Categoria)
        {
            CategoriaBL categoriaBL = new CategoriaBL();
            return categoriaBL.Buscar(texto, Categoria);
        }
    }
}
