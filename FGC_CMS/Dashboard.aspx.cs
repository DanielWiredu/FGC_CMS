using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;

namespace FGC_CMS
{
    public partial class Dashboard : MasterPageChange
    {
        static string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection connection = new SqlConnection(connectionString);
        SqlDataAdapter adapter = new SqlDataAdapter();
        SqlCommand command = new SqlCommand();
        SqlDataReader reader;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblMembers.InnerText = getMembership();
                lblFemales.InnerText = getFemales() + "%";
               // lblCommittees.InnerText = getCommittees();
                lblNotabernacle.InnerText = unknownTabernacles();
            }
        }
        protected string getMembership()
        {
            string members = "0";
            try
            {
                string query = "select count(memberid) as members from members";
                command = new SqlCommand(query, connection);
                if (connection.State == ConnectionState.Closed)
                {
                    connection.Open();
                }
                reader = command.ExecuteReader();
                if (reader.Read())
                {
                    members = reader["members"].ToString();
                }
                reader.Close();
            }
            finally
            {
                connection.Close();
            }
            return members;
        }
        protected double getFemales()
        {
            double femalerate = 0.0;
            double malerate = 0.0;
            double females = 0.0;
            double males = 0.0;
            try
            {
                string query = "select count(memberid) as females from members where gender='Female'";
                command = new SqlCommand(query, connection);
                if (connection.State == ConnectionState.Closed)
                {
                    connection.Open();
                }
                reader = command.ExecuteReader();
                if (reader.Read())
                {
                    females = Convert.ToDouble(reader["females"]) ;
                }
                reader.Close();

                query = "select count(memberid) as males from members where gender='Male'";
                command = new SqlCommand(query, connection);
                reader = command.ExecuteReader();
                if (reader.Read())
                {
                    males = Convert.ToDouble(reader["males"]);
                }
                reader.Close();

                femalerate = (females / (females + males)) * 100.0;

                malerate = (males / (females + males)) * 100.0;
                if (Double.IsNaN(malerate))
                    malerate = 0.0;
                malerate = Math.Round(malerate, 1);
                lblCommittees.InnerText = malerate + "%";
            }
            finally
            {
                connection.Close();
            }
            if (Double.IsNaN(femalerate))
                femalerate = 0.0;
            return Math.Round(femalerate, 1);
        }
        protected string getCommittees()
        {
            string committees = "0";
            try
            {
                string query = "select count(commcode) as committees from committee";
                command = new SqlCommand(query, connection);
                if (connection.State == ConnectionState.Closed)
                {
                    connection.Open();
                }
                reader = command.ExecuteReader();
                if (reader.Read())
                {
                    committees = reader["committees"].ToString();
                }
                reader.Close();
            }
            catch (Exception ex)
            {

            }
            finally
            {
                connection.Close();
            }
            return committees;
        }
        protected string unknownTabernacles()
        {
            string users = "0";
            try
            {
                string query = "select count(username) as users from users";
                command = new SqlCommand(query, connection);
                if (connection.State == ConnectionState.Closed)
                {
                    connection.Open();
                }
                reader = command.ExecuteReader();
                if (reader.Read())
                {
                    users = reader["users"].ToString();
                }
                reader.Close();
            }
            finally
            {
                connection.Close();
            }
            return users;
        }
    }
}