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
    /// Descripción breve de wsDetalle
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente. 
    // [System.Web.Script.Services.ScriptService]
    public class wsDetalle : System.Web.Services.WebService
    {
        [WebMethod(Description = "Listar datos de la tabla Detalle")]
        public DataSet Listar()
        {
            DetalleBL detalle = new DetalleBL();
            return detalle.Listar();
        }
        [WebMethod(Description = "Agregar un Detalle")]
        public bool Agregar(string NroBoleta, string CodProducto,int Cantidad)
        {
            Detalle detalle = new Detalle();
            detalle.NroBoleta = NroBoleta;
            detalle.CodProducto = CodProducto;
            detalle.Cantidad = Cantidad;

            DetalleBL detalleBL = new DetalleBL();
            if (detalleBL.Agregar(detalle)) return true;
            else return false;
        }

        [WebMethod(Description = "Eliminar Detalle")]
        public bool Eliminar(string CodCategoria, string CodProducto)
        {
            DetalleBL detalle = new DetalleBL();
            if (detalle.Eliminar(CodCategoria, CodProducto)) return true;
            else return false;
        }

        [WebMethod(Description = "Actualizar Detalle")]
        public bool Actualizar(string NroBoleta, string CodProducto, int Cantidad)
        {
            Detalle detalle = new Detalle();
            detalle.NroBoleta = NroBoleta;
            detalle.CodProducto = CodProducto;
            detalle.Cantidad = Cantidad;

            DetalleBL detalleBL = new DetalleBL();
            if (detalleBL.Agregar(detalle)) return true;
            else return false;
        }

        [WebMethod(Description = "Buscar Detalle")]
        public DataSet Buscar(string texto, string Categoria)
        {
            DetalleBL detalleBL  = new DetalleBL();
            return detalleBL.Buscar(texto, Categoria);
        }
    }
}
