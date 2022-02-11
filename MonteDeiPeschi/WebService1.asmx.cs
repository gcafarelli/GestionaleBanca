using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace MonteDeiPeschi
{
    /// <summary>
    /// Descrizione di riepilogo per WebService1
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // Per consentire la chiamata di questo servizio Web dallo script utilizzando ASP.NET AJAX, rimuovere il commento dalla riga seguente. 
    // [System.Web.Script.Services.ScriptService]
    public class WebService1 : System.Web.Services.WebService
    {

        [WebMethod]
        public decimal Saldo(string numConto, string codiceFiscale)
        {
            string conn = ConfigurationManager.ConnectionStrings["ConnectionStringDB"].ToString();
            SqlConnection connection = new SqlConnection(conn);


            connection.Open();
            try
            {
                SqlCommand comando = new SqlCommand("select Saldo from ContiCorrente inner join Correntisti on ContiCorrente.IdCorrentista=ContiCorrente.IdCorrentista where CodiceFiscale like @codiceFiscale and NumeroConto=@numConto", connection);
                comando.Parameters.AddWithValue("codiceFiscale", codiceFiscale);
                comando.Parameters.AddWithValue("numConto", numConto);
                SqlDataReader reader = comando.ExecuteReader();
                decimal num = 0;
                while(reader.Read())
                {
                    num = Convert.ToDecimal(reader["Saldo"]);
                }
                connection.Close();
                return num;

            }
            catch
            {
                connection.Close();
                return 0;
            }
            
        }
    }
}
