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
    public partial class AggiungiCliente : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Visible = false;
        }

        protected void AggiungiClientebtn_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionStringDB"].ToString();
            SqlConnection connection = new SqlConnection(connectionString);

            connection.Open();

            SqlCommand comando3 = new SqlCommand("select * from Correntisti where CodiceFiscale=@cf", connection);
            comando3.Parameters.AddWithValue("cf", CodiceFiscale.Text);
            SqlDataReader reader2 = comando3.ExecuteReader();
            if (reader2.HasRows)
            {
                Label1.Visible = true;
                Label1.ForeColor = System.Drawing.Color.Red;
                Label1.Text = "Cliente gia presente o dati non corretti!";
            }
            else
            {
                SqlCommand command = new SqlCommand(@"insert into Correntisti (Cognome,Nome,Indirizzo,Telefono,Email,Eta,CodiceFiscale,PartitaIva) 
                                                    values(@cognome,@nome,@indirizzo,@telefono,@email,@eta,@codiceFiscale,@partitaIva)", connection);
                command.Parameters.AddWithValue("cognome", Cognome.Text);
                command.Parameters.AddWithValue("nome", Nome.Text);
                command.Parameters.AddWithValue("indirizzo", Indirizzo.Text);
                command.Parameters.AddWithValue("telefono", Telefono.Text);
                command.Parameters.AddWithValue("email", Email.Text);
                command.Parameters.AddWithValue("eta", Età.Text);
                command.Parameters.AddWithValue("codiceFiscale", CodiceFiscale.Text);
                command.Parameters.AddWithValue("partitaIva", PartitaIva.Text);

                command.ExecuteNonQuery();

                int IdCorrentista = 0;

                SqlCommand comando = new SqlCommand("select IdCorrentista from Correntisti where CodiceFiscale=@cf", connection);
                comando.Parameters.AddWithValue("cf", CodiceFiscale.Text);
                SqlDataReader reader = comando.ExecuteReader();
                while (reader.Read())
                {
                    IdCorrentista = Convert.ToInt32(reader["IdCorrentista"].ToString());
                }
                reader.Close();

                SqlCommand command2 = new SqlCommand(@"insert into ContiCorrente (NumeroConto,DataApertura,Saldo,Fido,IdCorrentista) 
                                                    values(@numConto,@dataApertura,@saldo,@fido,@idCorrentista)", connection);
                command2.Parameters.AddWithValue("numConto", NumeroConto.Text);
                command2.Parameters.AddWithValue("dataApertura", DataApertura.SelectedDate);
                command2.Parameters.AddWithValue("saldo", Saldo.Text);
                command2.Parameters.AddWithValue("fido", Fido.Text);
                command2.Parameters.AddWithValue("idCorrentista", IdCorrentista);

                command2.ExecuteNonQuery();
                connection.Close();
                Label1.Visible = true;
                Label1.ForeColor = System.Drawing.Color.Green;
                Label1.Text = "Cliente e Conto aggiunti con successo!";

            }




        }
    }
}