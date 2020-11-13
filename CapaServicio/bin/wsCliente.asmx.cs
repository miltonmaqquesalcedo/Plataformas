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
    /// Descripción breve de wsCliente
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente. 
    // [System.Web.Script.Services.ScriptService]
    public class wsCliente : System.Web.Services.WebService
    {
        [WebMethod(Description = "Listar datos de la tabla Cliente")]
        public DataSet Listar()
        {
            ClienteBL cliente = new ClienteBL();
            return cliente.Listar();
        }
        [WebMethod(Description = "Agregar un Cliente")]
        public bool Agregar(string CodCliente,string Apellidos, string Nombres,string Direccion,string Usuario, string Contrasena)
        {
            Cliente cliente = new Cliente();
            cliente.CodCliente = CodCliente;
            cliente.Apellidos = Apellidos;
            cliente.Nombres = Nombres;
            cliente.Direccion = Direccion;
            cliente.Usuario = Usuario;
            cliente.Contrasena = Contrasena;

            ClienteBL clienteBL = new ClienteBL();
            if (clienteBL.Agregar(cliente)) return true;
            else return false;
        }

        [WebMethod(Description = "Eliminar Cliente")]
        public bool Eliminar(string CodCliente)
        {
            ClienteBL cliente = new ClienteBL();
            if (cliente.Eliminar(CodCliente)) return true;
            else return false;
        }

        [WebMethod(Description = "Actualizar Cliente")]
        public bool Actualizar(string CodCliente, string Apellidos, string Nombres, string Direccion, string Usuario, string Contrasena)
        {
            Cliente cliente = new Cliente();
            cliente.CodCliente = CodCliente;
            cliente.Apellidos = Apellidos;
            cliente.Nombres = Nombres;
            cliente.Direccion = Direccion;
            cliente.Usuario = Usuario;
            cliente.Contrasena = Contrasena;

            ClienteBL clienteBL = new ClienteBL();
            if (clienteBL.Actualizar(cliente)) return true;
            else return false;
        }

        [WebMethod(Description = "Buscar Cliente")]
        public DataSet Buscar(string texto, string Categoria)
        {
            ClienteBL cliente = new ClienteBL();
            return cliente.Buscar(texto, Categoria);
        }

        [WebMethod(Description = "Logear Cliente")]
        public string[] Login(string usuario, string contrasena)
        {
            Cliente cliente = new Cliente();
            cliente.Usuario = usuario;
            cliente.Contrasena = contrasena;
            ClienteBL clienteBL = new ClienteBL();
            string[] respuesta = new string[2];
            bool CodError = clienteBL.Login(cliente);
            if (CodError == true) respuesta[0] = "true";
            else respuesta[0] = "false";
            respuesta[1] = clienteBL.Mensaje;
            return respuesta;
        }
    }
}
