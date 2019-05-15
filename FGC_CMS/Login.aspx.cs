using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Security.Cryptography;

namespace FGC_CMS
{
    public partial class Login : System.Web.UI.Page
    {
        static string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection connection = new SqlConnection(connectionString);
        SqlDataAdapter adapter = new SqlDataAdapter();
        SqlCommand command = new SqlCommand();
        SqlDataReader reader;
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!this.IsPostBack)
            //{
            //    if (this.Page.User.Identity.IsAuthenticated)
            //    {
            //        FormsAuthentication.SignOut();
            //        Response.Redirect("~/Login.aspx");
            //    }
            //}
            if (Request.IsAuthenticated && !string.IsNullOrEmpty(Request.QueryString["ReturnUrl"]))
                // This is an unauthorized, authenticated request...
                Response.Redirect("~/UnauthorizedAccess.aspx");
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                string query = "select * from Users where UserName = '" + uname.Text + "'";
                command = new SqlCommand(query, connection);
                if (connection.State == ConnectionState.Closed)
                connection.Open();
                reader = command.ExecuteReader();
            if (reader.Read())
            {
                byte[] hashedPassword = reader["UserPassword"] as byte[];
                if (MatchSHA1(hashedPassword, GetSHA1(uname.Text, pword.Text)))
                {
                    bool isPersistent = chkRemember.Checked;
                    string userrole = reader["AccessLevel"].ToString();
                    string ministry = reader["Ministry"].ToString();
                    Session["userministry"] = ministry;

                    FormsAuthentication.SetAuthCookie(uname.Text.Trim(), false);

                    FormsAuthenticationTicket ticket1 = new FormsAuthenticationTicket(
                               1,                                   // version
                            this.uname.Text.Trim(),   // get username  from the form
                            DateTime.Now,                        // issue time is now
                            DateTime.Now.AddMinutes(20),         // expires in 10 minutes
                            isPersistent,      // cookie is not persistent
                            userrole                            // role assignment is stored in userData
                            );

                    HttpCookie cookie1 = new HttpCookie(FormsAuthentication.FormsCookieName, FormsAuthentication.Encrypt(ticket1));
                    Response.Cookies.Add(cookie1);

                    // 4. Do the redirect. 
                    String returnUrl1 = "/Dashboard.aspx";
                    // the login is successful
                    //if (Request.QueryString["ReturnUrl"] == null || Request.QueryString["ReturnUrl"] == "/")
                    //{
                    //    returnUrl1 = "/Dashboard.aspx";
                    //}

                    ////login not unsuccessful 
                    //else
                    //{
                    //    returnUrl1 = Request.QueryString["ReturnUrl"];
                    //}
                    Response.Redirect(returnUrl1);
                }
                else
                {
                    lblAlert.InnerText = "Wrong Username or Password";
                    lblAlert.Visible = true;
                    lblAlert.Attributes["class"] = "alert alert-danger";
                }
            }
            else
            {
                lblAlert.InnerText = "User does not exist";
                lblAlert.Visible = true;
                lblAlert.Attributes["class"] = "alert alert-danger";
            }
            reader.Close();

            }
            catch (Exception ex)
            {
                lblAlert.InnerText = ex.Message;
                lblAlert.Visible = true;
                lblAlert.Attributes["class"] = "alert alert-danger";
            }
            finally
            {
                connection.Close();
            }

        }
        private static bool MatchSHA1(byte[] p1, byte[] p2)
        {
            bool result = false;
            if (p1 != null && p2 != null)
            {
                if (p1.Length == p2.Length)
                {
                    result = true;
                    for (int i = 0; i < p1.Length; i++)
                    {
                        if (p1[i] != p2[i])
                        {
                            result = false;
                            break;
                        }
                    }
                }
            }
            return result;
        }
        /// <summary>
        /// Returns the SHA1 hash of the combined userID and password.
        /// </summary>
        /// <param name="userID"></param>
        /// <param name="password"></param>
        /// <returns></returns>
        private static byte[] GetSHA1(string userID, string password)
        {
            SHA1CryptoServiceProvider sha = new SHA1CryptoServiceProvider();
            return sha.ComputeHash(System.Text.Encoding.ASCII.GetBytes(userID + password));
        }
    }
}