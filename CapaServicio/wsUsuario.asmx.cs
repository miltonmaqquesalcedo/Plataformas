using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

using CapaNegocio;
using CapaEntidad;

using System.Text;
using System.Security.Cryptography;

namespace CapaServicio
{
    /// <summary>
    /// Descripción breve de wsUsuario
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente. 
    // [System.Web.Script.Services.ScriptService]
    public class wsUsuario : System.Web.Services.WebService
    {
        

        [WebMethod(Description = "Logear Usuario")]
        public string[] Login(string usuario,string contrasena)
        {
            Usuario usuario1 = new Usuario();
            usuario1._Usuario = usuario;
            //usuario1._Contrasena = generarClaveSHA1(contrasena);
            usuario1._Contrasena = contrasena;
            UsuarioBL usuarioBL = new UsuarioBL();
            string[] respuesta = new string[2];
            bool CodError = usuarioBL.Login(usuario1);
            if (CodError == true) respuesta[0] = "true";
            else respuesta[0] = "false";
            respuesta[1] = usuarioBL.Mensaje;
            return respuesta;
        }

        [WebMethod(Description = "Cambiar Vendedor")]
        public string[] CambiarVendedor(string usuario, string contrasena, string nueva)
        {
            Usuario usuario1 = new Usuario();
            usuario1._Usuario = usuario;
            //usuario1._Contrasena = generarClaveSHA1(contrasena);
            usuario1._Contrasena = generarClaveSHA1(contrasena);
            usuario1._Nueva = generarClaveSHA1(nueva);
            UsuarioBL usuarioBL = new UsuarioBL();
            string[] respuesta = new string[2];
            bool CodError = usuarioBL.CambiarVendedor(usuario1);
            if (CodError == true) respuesta[0] = "true";
            else respuesta[0] = "false";
            respuesta[1] = usuarioBL.Mensaje;
            return respuesta;
        }

        [WebMethod(Description = "Cambiar Cliente")]
        public string[] CambiarCliente(string usuario, string contrasena, string nueva)
        {
            Usuario usuario1 = new Usuario();
            usuario1._Usuario = usuario;
            //usuario1._Contrasena = generarClaveSHA1(contrasena);
            usuario1._Contrasena = contrasena;
            usuario1._Nueva = nueva;
            UsuarioBL usuarioBL = new UsuarioBL();
            string[] respuesta = new string[2];
            bool CodError = usuarioBL.CambiarCliente(usuario1);
            if (CodError == true) respuesta[0] = "true";
            else respuesta[0] = "false";
            respuesta[1] = usuarioBL.Mensaje;
            return respuesta;
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
    }
}
