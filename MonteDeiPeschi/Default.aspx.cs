using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MonteDeiPeschi
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (Convert.ToInt32(DropDownList1.SelectedValue) == 1)
            {
                tit.Visible = true;
                tit2.Visible = true;
                GridView1.Visible = false;
                Calendar1.Visible = true;
                Calendar2.Visible = true;
                ContoCorrente.Visible = false;
                ContoCorrente1.Visible = false;
            }
            else if (Convert.ToInt32(DropDownList1.SelectedValue) == 2)
            {
                tit.Visible = false;
                tit2.Visible = false;
                GridView1.Visible = false;
                Calendar1.Visible = true;
                Calendar2.Visible = false;
                ContoCorrente.Visible = true;
                ContoCorrente1.Visible = true;

            }
            else if (Convert.ToInt32(DropDownList1.SelectedValue) == 3)
            {
                tit.Visible = false;
                tit2.Visible = false;
                GridView1.Visible = false;
                Calendar1.Visible = false;
                Calendar2.Visible = false;
                ContoCorrente.Visible = false;
                ContoCorrente1.Visible = false;
            }
            else
            {
                tit.Visible = false;
                tit2.Visible = false;
                GridView1.Visible = false;
                Calendar1.Visible = false;
                Calendar2.Visible = false;
                ContoCorrente.Visible = false;
                ContoCorrente1.Visible = false;
            }
        }

        protected void Cerca_Click(object sender, EventArgs e)
        {
            GridView1.Visible=true;
            if (Convert.ToInt32(DropDownList1.SelectedValue) == 1)
            {
                string connectionString = ConfigurationManager.ConnectionStrings["ConnectionStringDB"].ToString();
                SqlConnection connection = new SqlConnection(connectionString);

                connection.Open();


                SqlDataAdapter sqlDa = new SqlDataAdapter("Select * from Movimento where DataMovimento>@Data1 and DataMovimento<@Data2", connection);
                sqlDa.SelectCommand.Parameters.AddWithValue("Data1", Calendar1.SelectedDate);
                sqlDa.SelectCommand.Parameters.AddWithValue("Data2", Calendar2.SelectedDate);
                DataTable dbt1 = new DataTable();
                sqlDa.Fill(dbt1);

                GridView1.DataSource = dbt1;
                GridView1.DataBind();

                connection.Close();
            }
            else if (Convert.ToInt32(DropDownList1.SelectedValue) == 2)
            {
                string connectionString = ConfigurationManager.ConnectionStrings["ConnectionStringDB"].ToString();
                SqlConnection connection = new SqlConnection(connectionString);

                connection.Open();


                SqlDataAdapter sqlDa = new SqlDataAdapter("Select * from Movimento inner join ContiCorrente on ContiCorrente.IdContoCorrente=Movimento.Idconto where DataMovimento=@Data1 and Idconto=@Id", connection);
                sqlDa.SelectCommand.Parameters.AddWithValue("Data1", Calendar1.SelectedDate);
                sqlDa.SelectCommand.Parameters.AddWithValue("Id", ContoCorrente.Text);
                DataTable dbt1 = new DataTable();
                sqlDa.Fill(dbt1);

                GridView1.DataSource = dbt1;
                GridView1.DataBind();

                connection.Close();
            }
            else if (Convert.ToInt32(DropDownList1.SelectedValue) == 3)
            {
                string connectionString = ConfigurationManager.ConnectionStrings["ConnectionStringDB"].ToString();
                SqlConnection connection = new SqlConnection(connectionString);

                connection.Open();


                SqlDataAdapter sqlDa = new SqlDataAdapter("Select * from ContiCorrente where Saldo<0 and (Fido+Saldo)>0", connection);
                DataTable dbt1 = new DataTable();
                sqlDa.Fill(dbt1);

                GridView1.DataSource = dbt1;
                GridView1.DataBind();

                connection.Close();
            }
            else
            {
                string connectionString = ConfigurationManager.ConnectionStrings["ConnectionStringDB"].ToString();
                SqlConnection connection = new SqlConnection(connectionString);

                connection.Open();


                SqlDataAdapter sqlDa = new SqlDataAdapter("Select * from ContiCorrente where Saldo<0 and (Fido+Saldo)<0", connection);
                DataTable dbt1 = new DataTable();
                sqlDa.Fill(dbt1);

                GridView1.DataSource = dbt1;
                GridView1.DataBind();

                connection.Close();
            }
        }

        protected void StampaSaldo_Click1(object sender, EventArgs e)
        {
            totSaldo.Visible = true;
            ServiceReference1.WebService1SoapClient x = new ServiceReference1.WebService1SoapClient();
            decimal b = Convert.ToDecimal(x.Saldo(NumConto.Text,CF.Text));
            totSaldo.Text = $"Il saldo del conto {NumConto.Text} è: {b}€";
            if (b != 0)
            {
                totSaldo.Text = $"Il saldo del conto {NumConto.Text} è: {b}€";
            }
            else
            {
                totSaldo.Text = "Non è possibile recuperare il saldo.Controlla i dati.";
            }
        }
    }
}