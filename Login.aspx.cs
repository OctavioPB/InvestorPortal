using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PurchaserPortal1
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            var usuario = user.Text;
            var contrasena = pass.Text;
            switch (usuario)
            {
                case "eduardo@greenpacecapital.com":
                    if (contrasena == "emartinez")
                    {
                        Response.Write("<script>alert('Accepted');</script>");
                        Session["Name"] = "Eduardo Martinez";
                        Server.Transfer("AdminView.aspx", true);
                    }
                    else
                    {
                        Response.Write("<script>alert('Wrong Password');</script>");
                    }
                    break;
                case "andrew@greenpacecapital.com":
                    if (contrasena == "agold")
                    {
                        Response.Write("<script>alert('Accepted');</script>");
                        Session["Name"] = "Andrew Gold";
                        Server.Transfer("PurchaserPortal.aspx", true);
                    }
                    else
                    {
                        Response.Write("<script>alert('Wrong Password');</script>");
                    }
                    break;
                case "octavio@greenpacecapital.com":
                    if (contrasena == "operez")
                    {
                        Response.Write("<script>alert('Accepted');</script>");
                        Session["Name"] = "Octavio Perez";
                        Server.Transfer("PurchaserPortal.aspx", true);  
                    }
                    else
                    {
                        Response.Write("<script>alert('Wrong Password');</script>");
                    }
                    break;
                case "lorena@greenpacecapital.com":
                    if (contrasena == "lmarabotto")
                    {
                        Response.Write("<script>alert('Aceptado');</script>");
                        Session["Name"] = "Lorena Marabotto";
                        Server.Transfer("PurchaserPortal.aspx", true);
                    }
                    else
                    {
                        Response.Write("<script>alert('Contraseña Incorrecta');</script>");
                    }
                    break;
                default:
                    Response.Write("<script>alert('Usuario Incorrecto');</script>");
                    break;
            }
        }
    
    }
}