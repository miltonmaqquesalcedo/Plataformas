using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Web.Security;

namespace SeguridadFrontEnd
{
    public partial class Login : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        ServiceReferenceUsuario.wsUsuarioSoapClient servicio = new ServiceReferenceUsuario.wsUsuarioSoapClient();
        
        protected void lInicio_Authenticate(object sender, AuthenticateEventArgs e)
        {
            
            string usuario = lInicio.UserName;
            string contrasena = lInicio.Password;
            string[] respuesta = servicio.Login(usuario, contrasena).ToArray();
            string codError = respuesta[0];
            string mensaje = respuesta[1];

            if (codError == "true")
                FormsAuthentication.RedirectFromLoginPage(mensaje, false);
            else
                lInicio.FailureText = mensaje;
        }
    }
}