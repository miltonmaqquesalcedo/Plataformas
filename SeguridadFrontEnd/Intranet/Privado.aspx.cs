using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SeguridadFrontEnd.Intranet
{
    public partial class Privado : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnOpcion1_Click(object sender, EventArgs e)
        {
            mvOpciones.ActiveViewIndex = 0;
        }

        protected void btnOpcion2_Click(object sender, EventArgs e)
        {
            mvOpciones.ActiveViewIndex = 1;
        }

        protected void btnOpcion3_Click(object sender, EventArgs e)
        {
            mvOpciones.ActiveViewIndex = 2;
        }
    }
}