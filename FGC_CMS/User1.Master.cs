using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.Security;

namespace FGC_CMS
{
    public partial class User1 : System.Web.UI.MasterPage
    {
        static string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection connection = new SqlConnection(connectionString);
        SqlDataAdapter adapter = new SqlDataAdapter();
        SqlDataReader reader;
        SqlCommand command = new SqlCommand();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblUser.Text = Context.User.Identity.Name;

                //get birthdays
                string query = "SELECT isnull(count(MemberID),0) as bdays FROM Members WHERE (Ministry LIKE '" + Session["userministry"].ToString() + "%') AND day(birthday) = day(getdate()) and month(birthday) = month(getdate())";
                int bdays = 0;
                //string query = "select datename(month,birthday) as mm, isnull(count(birthday),0) as bdays from Members where MONTH(birthday) = MONTH(getdate()) and Active = 1 group by datename(month,birthday)";
                command = new SqlCommand(query, connection);
                try
                {
                    if (connection.State == ConnectionState.Closed)
                    {
                        connection.Open();
                    }
                    reader = command.ExecuteReader();
                    if (reader.Read())
                    {
                        bdays = Convert.ToInt16(reader["bdays"]);
                    }
                    reader.Close();
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "", "toastr.error('" + ex.Message.Replace("'", "").Replace("\r\n", "") + "', 'Error');", true);
                }
                finally
                {
                    connection.Close();
                }

                if (bdays != 0)
                {
                    lblBdays.InnerText = bdays.ToString();
                    lblBdays.Visible = true;
                    lkBdays.InnerText = bdays + " Members(s) have birthday today";
                }
                else
                {
                    lblBdays.Visible = false;
                    lkBdays.InnerText = "0 Member(s) have birthday today";
                }
            }
        }

        protected void bntLogout_Click(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            Session.Abandon();

            //clear authentication cookie
            HttpCookie cookie1 = new HttpCookie(FormsAuthentication.FormsCookieName, "");
            cookie1.Expires = DateTime.Now.AddYears(-1);
            Response.Cookies.Add(cookie1);

            //
            HttpCookie cookie2 = new HttpCookie("ASP.NET_SessionId", "");
            cookie2.Expires = DateTime.Now.AddYears(-1);
            Response.Cookies.Add(cookie2);

            Response.Redirect("/Login.aspx");
        }
    }
}