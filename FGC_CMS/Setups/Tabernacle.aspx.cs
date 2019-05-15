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
    public partial class Tabernacle : MasterPageChange
    {
        static string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection connection = new SqlConnection(connectionString);
        SqlDataAdapter adapter = new SqlDataAdapter();
        SqlCommand command = new SqlCommand();
        int rows = 0;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void tabGrid_ItemInserted(object sender, GridInsertedEventArgs e)
        {
            if (e.Exception != null)
            {
                e.ExceptionHandled = true;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "", "toastr.error('Tabernacle name already exist...Cannot Save', 'Error');", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "", "toastr.success('Saved Successfully', 'Success');", true);
            }
        }

        protected void tabGrid_ItemUpdated(object sender, GridUpdatedEventArgs e)
        {
            if (e.Exception != null)
            {
                e.ExceptionHandled = true;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "", "toastr.error('Tabernacle name already exist...Cannot Update', 'Error');", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "", "toastr.success('Updated Successfully', 'Success');", true);
            }
        }

        protected void tabGrid_ItemDeleted(object sender, GridDeletedEventArgs e)
        {
            if (e.Exception != null)
            {
                e.ExceptionHandled = true;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "", "toastr.error('Tabernacle has existing members...Cannot Delete', 'Error');", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "", "toastr.success('Deleted Successfully', 'Success');", true);
            }
        }

        protected void tabGrid_ItemCommand(object sender, GridCommandEventArgs e)
        {
            if (e.CommandName == "InitInsert")
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "", "newtabModal();", true);
                e.Canceled = true;
            }
            if (e.CommandName == "Edit")
            {
                GridDataItem item = e.Item as GridDataItem;
                ViewState["TabCode"] = item["TabCode"].Text;
                txtTabName1.Text = item["TabName"].Text;
                txtTabHead1.Text = item["TabHead"].Text;
                txtContact1.Text = item["Contact"].Text;

                ScriptManager.RegisterStartupScript(this, this.GetType(), "", "edittabModal();", true);
                e.Canceled = true;
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                string query = "insert into Tabernacle(TabName,TabHead,Contact) values(@tname,@thead,@contact)";
                command = new SqlCommand(query, connection);
                command.Parameters.Add("@tname", SqlDbType.VarChar).Value = txtTabName.Text.ToUpper();
                command.Parameters.Add("@thead", SqlDbType.VarChar).Value = txtTabHead.Text;
                command.Parameters.Add("@contact", SqlDbType.VarChar).Value = txtContact.Text;

                if (connection.State == ConnectionState.Closed)
                {
                    connection.Open();
                }
                rows = command.ExecuteNonQuery();
                if (rows == 1)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "", "toastr.success('Tabernacle Saved Successfully', 'Success');", true);
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "closenewtabModal();", true);
                    tabGrid.Rebind();
                    txtTabName.Text = ""; txtTabHead.Text = ""; txtContact.Text = "";
                }
                command.Dispose();
            }
            catch (SqlException ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "", "toastr.error('Tabernacle name already exist', 'Error');", true);
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
                string query = "update Tabernacle set TabName=@tname,TabHead=@thead,Contact=@contact where TabCode = '" + ViewState["TabCode"].ToString() + "'";
                command = new SqlCommand(query, connection);
                command.Parameters.Add("@tname", SqlDbType.VarChar).Value = txtTabName1.Text.ToUpper();
                command.Parameters.Add("@thead", SqlDbType.VarChar).Value = txtTabHead1.Text;
                command.Parameters.Add("@contact", SqlDbType.VarChar).Value = txtContact1.Text;

                if (connection.State == ConnectionState.Closed)
                {
                    connection.Open();
                }
                rows = command.ExecuteNonQuery();
                if (rows == 1)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "", "toastr.success('Tabernacle Updated Successfully', 'Success');", true);
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "closeedittabModal();", true);
                    tabGrid.Rebind();
                }
                command.Dispose();
            }
            catch (SqlException ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "", "toastr.error('Tabernacle name already exist', 'Error');", true);
            }
            finally
            {
                connection.Close();
            }
        }


    }
}