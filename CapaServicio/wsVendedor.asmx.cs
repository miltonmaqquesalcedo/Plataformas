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

using System.Text;
using System.Security.Cryptography;


namespace CapaServicio
{
    /// <summary>
    /// Descripción breve de wsVendedor
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente. 
    // [System.Web.Script.Services.ScriptService]
    public class wsVendedor : System.Web.Services.WebService
    {

        [WebMethod(Description = "Listar datos de la tabla Vendedor")]
        public DataSet Listar() 
        {
            VendedorBL vendedor = new VendedorBL();
            return vendedor.Listar();
        }
        [WebMethod(Description = "Agregar un vendedor a la tabla Vendedor")]
        public bool Agregar(string CodVendedor, string Apellidos, string Nombres, string Usuario, string Contrasena)
        {
            Vendedor vendedor = new Vendedor();
            vendedor.CodVendedor = CodVendedor;
            vendedor.Apellidos = Apellidos;
            vendedor.Nombres = Nombres;
            vendedor.Usuario = Usuario;
            vendedor.Contrasena = generarClaveSHA1(Contrasena);

            VendedorBL vendedorBL = new VendedorBL();
            if (vendedorBL.Agregar(vendedor))return true;
            else return false;           
        }

        [WebMethod(Description = "Actualizar  Vendedor")]
        public bool Actualizar(string CodVendedor, string Apellidos, string Nombres, string Usuario, string Contrasena)
        {
            Vendedor vendedor = new Vendedor();
            vendedor.CodVendedor = CodVendedor;
            vendedor.Apellidos = Apellidos;
            vendedor.Nombres = Nombres;
            vendedor.Usuario = Usuario;
            vendedor.Contrasena = generarClaveSHA1(Contrasena);

            VendedorBL vendedorBL = new VendedorBL();
            if (vendedorBL.Actualizar(vendedor)) return true;
            else return false;
        }

        [WebMethod(Description ="Eliminar Vendedor")]
        public bool Eliminar(string CodVendedor) 
        {
            VendedorBL vendedor = new VendedorBL();
            if (vendedor.Eliminar(CodVendedor)) return true;
            else return false;
        }

        [WebMethod(Description = "Buscar Vendedor")]
        public DataSet Buscar(string texto, string Categoria)
        {
            VendedorBL vendedor = new VendedorBL();
            return vendedor.Buscar(texto, Categoria);
        }

        private string generarClaveSHA1(string cadena)
        {
            UTF8Encoding enc = new UTF8Encoding();
            byte[] data = enc.GetBytes(cadena);
            byte[] result;

            SHA1CryptoServiceProvider sha = new SHA1CryptoServiceProvider();

            result = sha.ComputeHash(data);

            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < result.Length; i++)
            {

                // Convertimos los valores en hexadecimal
                // cuando tiene una cifra hay que rellenarlo con cero
                // para que siempre ocupen dos dígitos.
                if (result[i] < 16)
                {
                    sb.Append("0");
                }
                sb.Append(result[i].ToString("x"));
            }

            //Devolvemos la cadena con el hash en mayúsculas para que quede más chuli :)
            return sb.ToString().ToUpper();
        }

        [WebMethod(Description = "Login Vendedor")]
        public string[] Login(string usuario, string contrasena)
        {
            Vendedor vendedor = new Vendedor();
            vendedor.Usuario = usuario;
            vendedor.Contrasena = generarClaveSHA1(contrasena);
            VendedorBL vendedorBL = new VendedorBL();
            string[] respuesta = new string[2];
            bool CodError = vendedorBL.Login(vendedor);
            if (CodError == true) respuesta[0] = "true";
            else respuesta[0] = "false";
            respuesta[1] = vendedorBL.Mensaje;
            return respuesta;
        }

    }
}
