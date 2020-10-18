using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MiniProjet
{
    public partial class ListeLiens : System.Web.UI.Page
    {
        String CS = ConfigurationManager.ConnectionStrings["SearchBaseConnectionString"].ConnectionString;
        DataSet ds = new DataSet();
        Rechercher r = new Rechercher();
        protected void Page_Load(object sender, EventArgs e)
        {
               if(IsPostBack)
               {
                    string txt = txtResRecherche.Text;
                    NouvelRecherche(txt);
               }
               else
               {
                    txtResRecherche.Text = r.Recherche;
                    string txt = txtResRecherche.Text;
                    NouvelRecherche(txt);
               }
               
        }

        private void NouvelRecherche(string txt)
        {
            using (SqlConnection con = new SqlConnection(CS))
            {
                //------ Affichage des liens triés selon le nombre de cliques en utilisant les trois tables (Historique, Recherche, Lien) dans le GridView1 --------
                SqlDataAdapter da = new SqlDataAdapter("select final.Idlien, final.URL , final.Description from ( ( select res.Idlien, URL , Description from (select top 100 r.IdLien, COUNT(IdLien) as click from (select distinct top 100 h.IdHist, h.Date, h.IdSearch from Historique h order by h.Date desc)hi inner join Recherche r on hi.IdSearch = r.IdSearch group by IdLien order by click desc) res inner join Lien l on res.IdLien = l.IdLien ) union all select IdLien, URL, Description from Lien where IdLien not in (select res.Idlien from (select top 100 r.IdLien, COUNT(IdLien) as click from (select distinct top 100 h.IdHist, h.Date, h.IdSearch from Historique h order by h.Date desc)hi inner join Recherche r on hi.IdSearch = r.IdSearch group by IdLien order by click desc) res inner join Lien l on res.IdLien = l.IdLien ) ) final where final.Description like '%" + txt + "%' ", con);
                con.Open();
                da.Fill(ds);
                Afficher();
                //---- Si on trouve des liens qui contient le mot recherché ----
                if (GridView1.Rows.Count != 0)
                {
                    //------  Insertion du mot recherché dans la table Mot ----------
                    SqlDataAdapter da2 = new SqlDataAdapter("if not exists (select * From Mot where TextMot = '" + txt + "') insert into Mot(TextMot) VALUES('" + txt + "') ", con);
                    da2.Fill(ds);
                    GridView1.Visible = true;
                    Label1.Visible = false;
                }
                //---- Si on ne trouve aucun lien qui contient le mot recherché ----
                else
                {
                    Label1.Text = "Aucun resultat pour ce mot!";
                    Label1.Visible = true;
                }
            }
        }

        //------------ L'evenement OnClick de LinkButton --------------------
        protected void btnUrl_Click(object sender, EventArgs e)
        {
            try
            {
                //---- On récupère la ligne dont on a cliquée sur le lien ---
                GridViewRow row = (GridViewRow)(sender as Control).NamingContainer;
                int rowindex = row.RowIndex;
                 
                int id = Convert.ToInt32(GridView1.Rows[rowindex].Cells[0].Text);
                //--- On récupère l'url ---
                string url = (row.FindControl("btnUrl") as LinkButton).Text;
                SqlConnection con = new SqlConnection(CS);
                //------- Remplissage de la table Recherche --------
                SqlDataAdapter da3 = new SqlDataAdapter("IF NOT EXISTS (select IdMot,IdLien from Recherche where IdMot=(select IdMot from Mot where TextMot = '" + txtResRecherche.Text + "') AND IdLien = (select IdLien from Lien where IdLien = " + id + " )) INSERT INTO Recherche (IdMot,IdLien) VALUES ((select IdMot from Mot where TextMot = '" + txtResRecherche.Text + "'),(select IdLien from Lien where IdLien = " + id + " )) ", con);
                con.Open();
                da3.Fill(ds);
                con.Close();
                //-------- Remplissage de la table Historique ----------
                SqlDataAdapter da4 = new SqlDataAdapter("INSERT INTO Historique (Date,IdSearch) VALUES (" + DateTime.UtcNow.Date.ToString("yyyy-MM-dd") + ", (Select IdSearch from Recherche where IdMot=(select IdMot from Mot where TextMot = '" + txtResRecherche.Text + "') AND IdLien = (select IdLien from Lien where IdLien = " + id + " ) )) ", con);
                con.Open();
                da4.Fill(ds);
                con.Close();
                //--- Pour nous rediriger vers le lien ---
                Response.Redirect(url);
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
        }

        private void Afficher()
        {
            GridView1.DataSource = null;
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        
    }
    

}