using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MiniProjet
{
    public partial class Rechercher : System.Web.UI.Page
    {
        public static String rech = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                rech = txtSearch.Text;
                Response.Redirect("ListeLiens.aspx");
            }

           
        }
        //----- On récupère le mot recherché ----------
        public String Recherche
        {
            get { return rech; }
        }
            
    }
}