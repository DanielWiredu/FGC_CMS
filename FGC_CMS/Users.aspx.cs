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
using System.Security.Cryptography;

namespace FGC_CMS
{
    public partial class Users : MasterPageChange
    {
        static string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection connection = new SqlConnection(connectionString);
        SqlDataAdapter adapter = new SqlDataAdapter();
        SqlCommand command = new SqlCommand();
        SqlDataReader reader;
        int rows = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!IsPostBack)
            //{
            //    bool isinrole = Page.User.IsInRole("User");
            //    if (isinrole)
            //    {
            //        Response.Redirect("~/UnauthorizedAccess.aspx");
            //    }
            //}
        }

        protected void usersGrid_ItemCommand(object sender, GridCommandEventArgs e)
        {
            if (e.CommandName == "InitInsert")
            {
                txtUsername.Text = "";
                dlMinistry.ClearSelection();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "", "newuserModal();", true);
                e.Canceled = true;
            }
            if (e.CommandName == "Edit")
            {
                GridDataItem item = e.Item as GridDataItem;
                string userid = item["UserID"].Text;
                try
                {
                    string query = "select * from users where UserID = '" + userid + "'";
                    command = new SqlCommand(query, connection);
                    if (connection.State == ConnectionState.Closed)
                    {
                        connection.Open();
                    }
                    reader = command.ExecuteReader();
                    if (reader.Read())
                    {
                        ViewState["userid"] = userid;
                        txtUname.Text = reader["UserName"].ToString();
                        txtUPass.Text = "password";
                        dlLevel.SelectedText = reader["AccessLevel"].ToString();
                        dlMinistry1.ClearSelection();
                        dlMinistry1.SelectedValue = reader["Ministry"].ToString();
                    }
                    reader.Close();

                    ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "edituserModal();", true);
                    e.Canceled = true;
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

        protected void btnSave_Click(object sender, EventArgs e)
        {
            byte[] hashedPassword = GetSHA1(txtUsername.Text, txtPassword.Text);
            try
            {
                string ministry = "";
                if (dlAccessLevel.SelectedText == "User")
                    ministry = dlMinistry.SelectedValue;

                string query = "insert into Users(UserName,UserPassword,AccessLevel,Ministry) values(@uname,@upass,@ulevel,@ministry)";
                command = new SqlCommand(query, connection);
                command.Parameters.Add("@uname", SqlDbType.VarChar).Value = txtUsername.Text;
                command.Parameters.Add("@upass", SqlDbType.VarBinary).Value = hashedPassword;
                command.Parameters.Add("@ulevel", SqlDbType.VarChar).Value = dlAccessLevel.SelectedText;
                command.Parameters.Add("@ministry", SqlDbType.VarChar).Value = ministry;
        
                if (connection.State == ConnectionState.Closed)
                {
                    connection.Open();
                }
                rows = command.ExecuteNonQuery();
                if (rows == 1)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "", "toastr.success('User Saved Successfully', 'Success');", true);
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "closenewuserModal();", true);
                    usersGrid.Rebind();
                }
                command.Dispose();
            }
            catch (SqlException ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "", "toastr.error('User already exist', 'Error');", true);
            }
            finally
            {
                connection.Close();
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            byte[] hashedPassword = GetSHA1(txtUname.Text, txtUPass.Text);
            try
            {
                string ministry = "";
                if (dlLevel.SelectedText == "User")
                    ministry = dlMinistry1.SelectedValue;

                string query = "update Users set UserName=@uname,UserPassword=@upass,AccessLevel=@ulevel,Ministry=@ministry where UserID=@userid";
                command = new SqlCommand(query, connection);
                command.Parameters.Add("@uname", SqlDbType.VarChar).Value = txtUname.Text;
                command.Parameters.Add("@upass", SqlDbType.VarBinary).Value = hashedPassword;
                command.Parameters.Add("@ulevel", SqlDbType.VarChar).Value = dlLevel.SelectedText;
                command.Parameters.Add("@ministry", SqlDbType.VarChar).Value = ministry;
                command.Parameters.Add("@userid", SqlDbType.Int).Value = ViewState["userid"];
                if (connection.State == ConnectionState.Closed)
                {
                    connection.Open();
                }
                rows = command.ExecuteNonQuery();
                if (rows == 1)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "", "toastr.success('User Updated Successfully', 'Success');", true);
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "closeedituserModal();", true);
                    usersGrid.Rebind();
                }
                command.Dispose();
            }
            catch (SqlException ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "", "toastr.error('User already exist', 'Error');", true);
            }
            finally
            {
                connection.Close();
            }
        }

        protected void usersGrid_ItemDeleted(object sender, GridDeletedEventArgs e)
        {
            if (e.Exception != null)
            {
                e.ExceptionHandled = true;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "", "toastr.error('Error occured during delete. Try again', 'Error');", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "", "toastr.success('Deleted Successfully', 'Success');", true);
            }
        }

        //protected void dlMinistry_ItemDataBound(object sender, DropDownListItemEventArgs e)
        //{
        //    if (e.Item is DropDownListItem)
        //    {
        //        DropDownListItem item = e.Item;
        //        if (item.Text.StartsWith("A"))
        //        {
        //            item.Enabled = false;
        //        }
        //    }
        //}

    }
}