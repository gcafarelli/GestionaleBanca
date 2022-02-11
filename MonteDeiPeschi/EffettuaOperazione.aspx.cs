using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MonteDeiPeschi
{
    public partial class EffettuaOperazione : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label2.Visible = false;
        }

        protected void EffettuaMovimento_Click(object sender, EventArgs e)
        {

            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionStringDB"].ToString();
            SqlConnection connection = new SqlConnection(connectionString);

            connection.Open();

            if (Convert.ToInt32(TipoMovimento.SelectedValue) == 1)
            {
                SqlCommand command = new SqlCommand("Update ContiCorrente Set Saldo+=@Movimento where IdContoCorrente=@id", connection);
                command.Parameters.AddWithValue("Movimento", Importo.Text);
                command.Parameters.AddWithValue("id",NumeroConto.Text);
                command.ExecuteNonQuery();
            }
            else
            {
                SqlCommand command = new SqlCommand("Update ContiCorrente Set Saldo-=@Movimento where IdContoCorrente=@id", connection);
                command.Parameters.AddWithValue("Movimento", Convert.ToDecimal(Importo.Text));
                command.Parameters.AddWithValue("id", (NumeroConto.Text));
                command.ExecuteNonQuery();
            }

            SqlCommand command2 = new SqlCommand("Insert into Movimento (Idconto,Importo, DataMovimento,TipoMovimento) values(@idconto,@importo,@dataMovimento,@tipo)", connection);
            command2.Parameters.AddWithValue("idconto",NumeroConto.Text);
            command2.Parameters.AddWithValue("importo",Importo.Text);
            command2.Parameters.AddWithValue("dataMovimento",Calendar1.SelectedDate);
            command2.Parameters.AddWithValue("tipo", TipoMovimento.Text);
            command2.ExecuteNonQuery();

            connection.Close();
            Label2.Visible = true;
            Label2.ForeColor = System.Drawing.Color.Green;
            Label2.Text = "Movimento effettuato!";
        }
    }
}