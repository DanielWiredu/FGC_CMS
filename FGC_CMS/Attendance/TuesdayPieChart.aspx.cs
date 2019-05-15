using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

namespace FGC_CMS.Setups
{
    public partial class TuesdayPieChart : System.Web.UI.Page
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
                DateTime nowdate = DateTime.Now;
                int mn = nowdate.Month;
                int year = nowdate.Year;
                int days = DateTime.DaysInMonth(year, mn);
                hfSdate.Value = year + "-" + mn + "-" + "01";
                hfEdate.Value = year + "-" + mn + "-" + days;
                dpSdate.SelectedDate = Convert.ToDateTime(hfSdate.Value);
                dpEdate.SelectedDate = Convert.ToDateTime(hfEdate.Value);

                reloadTuesdayPie();

                RadHtmlChart2.ChartTitle.Text = "Tuesday Service Attendance Chart (" + dpSdate.SelectedDate.Value.ToString("dd-MMM-yyyy") + " To " + dpEdate.SelectedDate.Value.ToString("dd-MMM-yyyy") + ")";
            }
        }

        protected void btnRun_Click(object sender, EventArgs e)
        {
            hfSdate.Value = dpSdate.SelectedDate.Value.ToString("dd-MMM-yyyy");
            hfEdate.Value = dpEdate.SelectedDate.Value.ToString("dd-MMM-yyyy");
            reloadTuesdayPie();
            RadHtmlChart2.DataBind();

            RadHtmlChart2.ChartTitle.Text = "Tuesday Service Attendance Chart (" + hfSdate.Value + " To " + hfEdate.Value + ")";
        }

        protected void reloadTuesdayPie()
        {
            try
            {
                string query = "delete from TuesdayPie";
                command = new SqlCommand(query, connection);
                if (connection.State == ConnectionState.Closed)
                    connection.Open();
                command.ExecuteNonQuery();
                command.Dispose();

                query = "SELECT SUM(MALES) AS MALES, SUM(FEMALES) AS FEMALES, SUM(YOUTH) AS YOUTH, SUM(CHILDREN) AS CHILDREN from ATTENDANCE WHERE SERVICE LIKE '%Tuesday%' AND (SERVICEDATE BETWEEN '" + hfSdate.Value + "' AND '" + hfEdate.Value + "')";
                command = new SqlCommand(query, connection);
                reader = command.ExecuteReader();
                if (reader.Read())
                {
                    string males = reader["males"].ToString();
                    string females = reader["females"].ToString();
                    string youth = reader["youth"].ToString();
                    string children = reader["children"].ToString();
                    reader.Close();

                    if (!String.IsNullOrEmpty(males))
                    {
                        query = "insert into tuesdaypie(members,value) values('MALES','" + males + "')";
                        command = new SqlCommand(query, connection);
                        command.ExecuteNonQuery();
                        command.Dispose();
                    }
                    
                    if (!String.IsNullOrEmpty(females))
                    {
                        query = "insert into tuesdaypie(members,value) values('FEMALES','" + females + "')";
                        command = new SqlCommand(query, connection);
                        command.ExecuteNonQuery();
                        command.Dispose();
                    }
                    
                    if (!String.IsNullOrEmpty(youth))
                    {
                        query = "insert into tuesdaypie(members,value) values('YOUTH','" + youth + "')";
                        command = new SqlCommand(query, connection);
                        command.ExecuteNonQuery();
                        command.Dispose();
                    }
                 
                    if (!String.IsNullOrEmpty(children))
                    {
                        query = "insert into tuesdaypie(members,value) values('CHILDREN','" + children + "')";
                        command = new SqlCommand(query, connection);
                        command.ExecuteNonQuery();
                        command.Dispose();
                    }
                 
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "", "toastr.error('" + ex.Message.Replace("'", "").Replace("\r\n", "") + "', 'Error');", true);
            }
            finally
            {
                connection.Close();
            }
        }
    }
}