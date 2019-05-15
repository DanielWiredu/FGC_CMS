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


namespace FGC_CMS.Setups
{
    public partial class Ministry : MasterPageChange
    {
        static string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection connection = new SqlConnection(connectionString);
        SqlDataAdapter adapter = new SqlDataAdapter();
        SqlCommand command = new SqlCommand();
        int rows = 0;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ministryGrid_ItemDeleted(object sender, GridDeletedEventArgs e)
        {
            if (e.Exception != null)
            {
                e.ExceptionHandled = true;
              //  ScriptManager.RegisterStartupScript(this, this.GetType(), "", "toastr.error('" + e.Exception.Message.Replace("'","").Replace("\r\n","") + "', 'Error');", true);
                ScriptManager.RegisterStartupScript(this, this.GetType(), "", "toastr.error('Ministry has existing members...Cannot Delete', 'Error');", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "", "toastr.success('Deleted Successfully', 'Success');", true);
            }
        }

        protected void ministryGrid_ItemCommand(object sender, GridCommandEventArgs e)
        {
            if (e.CommandName == "InitInsert")
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "", "newministryModal();", true);
                e.Canceled = true;
            }
            if (e.CommandName == "Edit")
            {
                GridDataItem item = e.Item as GridDataItem;
                ViewState["MinistryCode"] = item["MinistryCode"].Text;
                txtMinistryName1.Text = item["MinistryName"].Text;
                txtMinistryHead1.Text = item["MinistryHead"].Text;
                txtContact1.Text = item["Contact"].Text;

                ScriptManager.RegisterStartupScript(this, this.GetType(), "", "editministryModal();", true);
                e.Canceled = true;
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                string query = "insert into Ministry(MinistryName,MinistryHead,Contact) values(@mname,@mhead,@contact)";
                command = new SqlCommand(query, connection);
                command.Parameters.Add("@mname", SqlDbType.VarChar).Value = txtMinistryName.Text.ToUpper();
                command.Parameters.Add("@mhead", SqlDbType.VarChar).Value = txtMinistryHead.Text;
                command.Parameters.Add("@contact", SqlDbType.VarChar).Value = txtContact.Text;

                if (connection.State == ConnectionState.Closed)
                {
                    connection.Open();
                }
                rows = command.ExecuteNonQuery();
                if (rows == 1)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "", "toastr.success('Ministry Saved Successfully', 'Success');", true);
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "closenewministryModal();", true);
                    ministryGrid.Rebind();
                    txtMinistryName.Text = ""; txtMinistryHead.Text = ""; txtContact.Text = "";
                }
                command.Dispose();
            }
            catch (SqlException ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "", "toastr.error('Ministry name already exist', 'Error');", true);
            }
            finally
            {
                connection.Close();
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                string query = "update Ministry set MinistryName=@mname,MinistryHead=@mhead,Contact=@contact where MinistryCode = '" + ViewState["MinistryCode"].ToString() + "'";
                command = new SqlCommand(query, connection);
                command.Parameters.Add("@mname", SqlDbType.VarChar).Value = txtMinistryName1.Text.ToUpper();
                command.Parameters.Add("@mhead", SqlDbType.VarChar).Value = txtMinistryHead1.Text;
                command.Parameters.Add("@contact", SqlDbType.VarChar).Value = txtContact1.Text;

                if (connection.State == ConnectionState.Closed)
                {
                    connection.Open();
                }
                rows = command.ExecuteNonQuery();
                if (rows == 1)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "", "toastr.success('Ministry Updated Successfully', 'Success');", true);
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "closeeditministryModal();", true);
                    ministryGrid.Rebind();
                }
                command.Dispose();
            }
            catch (SqlException ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "", "toastr.error('Ministry name already exist', 'Error');", true);
            }
            finally
            {
                connection.Close();
            }
        }

    }
}