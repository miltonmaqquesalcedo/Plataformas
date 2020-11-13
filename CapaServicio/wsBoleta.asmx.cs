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
    /// Descripción breve de wsBoleta
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente. 
    // [System.Web.Script.Services.ScriptService]
    public class wsBoleta : System.Web.Services.WebService
    {

        [WebMethod(Description = "Listar datos de la tabla Boleta")]
        public DataSet Listar()
        {
            BoletaBL boleta = new BoletaBL();
            return boleta.Listar();
        }
        [WebMethod(Description = "Agregar Boleta")]
        public bool Agregar(string NroBoleta, string CodCliente, string CodVendedor, int Anulado)
        {
            Boleta boleta = new Boleta();
            boleta.NroBoleta = NroBoleta;
            boleta.CodCliente = CodCliente;
            boleta.CodVendedor = CodVendedor;
            boleta.Anulado = Anulado;

            BoletaBL boletaBL = new BoletaBL();
            if (boletaBL.Agregar(boleta)) return true;
            else return false;
        }

        [WebMethod(Description = "Eliminar Boleta")]
        public bool Eliminar(string NroBoleta)
        {
            BoletaBL boletaBL = new BoletaBL();
            if (boletaBL.Eliminar(NroBoleta)) return true;
            else return false;
        }

        [WebMethod(Description = "Actualizar Boleta")]
        public bool Actualizar(string NroBoleta, string CodCliente, string CodVendedor, int Anulado)
        {
            Boleta boleta = new Boleta();
            boleta.NroBoleta = NroBoleta;
            boleta.CodCliente = CodCliente;
            boleta.CodVendedor = CodVendedor;
            boleta.Anulado = Anulado;

            BoletaBL boletaBL = new BoletaBL();
            if (boletaBL.Actualizar(boleta)) return true;
            else return false;
        }

        [WebMethod(Description = "Buscar Boleta")]
        public DataSet Buscar(string texto, string Categoria)
        {
            BoletaBL boleta = new BoletaBL();
            return boleta.Buscar(texto, Categoria);
        }
    }
}
