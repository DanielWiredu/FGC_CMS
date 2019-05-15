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
    public partial class Committee : MasterPageChange
    {
        static string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection connection = new SqlConnection(connectionString);
        SqlDataAdapter adapter = new SqlDataAdapter();
        SqlCommand command = new SqlCommand();
        int rows = 0;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void commGrid_ItemDeleted(object sender, GridDeletedEventArgs e)
        {
            if (e.Exception != null)
            {
                e.ExceptionHandled = true;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "", "toastr.error('Committee has existing members...Cannot Delete', 'Error');", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "", "toastr.success('Deleted Successfully', 'Success');", true);
            }
        }

        protected void commGrid_ItemCommand(object sender, GridCommandEventArgs e)
        {
            if (e.CommandName == "InitInsert")
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "", "newcommModal();", true);
                e.Canceled = true;
            }
            if (e.CommandName == "Edit")
            {
                GridDataItem item = e.Item as GridDataItem;
                ViewState["CommCode"] = item["CommCode"].Text;
                txtCommName1.Text = item["CommName"].Text;
                txtCommHead1.Text = item["CommHead"].Text;
                txtContact1.Text = item["Contact"].Text;

                ScriptManager.RegisterStartupScript(this, this.GetType(), "", "editcommModal();", true);
                e.Canceled = true;
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                string query = "insert into Committee(CommName,CommHead,Contact) values(@cname,@chead,@contact)";
                command = new SqlCommand(query, connection);
                command.Parameters.Add("@cname", SqlDbType.VarChar).Value = txtCommName.Text.ToUpper();
                command.Parameters.Add("@chead", SqlDbType.VarChar).Value = txtCommHead.Text;
                command.Parameters.Add("@contact", SqlDbType.VarChar).Value = txtContact.Text;

                if (connection.State == ConnectionState.Closed)
                {
                    connection.Open();
                }
                rows = command.ExecuteNonQuery();
                if (rows == 1)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "", "toastr.success('Committee Saved Successfully', 'Success');", true);
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "closenewcommModal();", true);
                    commGrid.Rebind();
                    txtCommName.Text = ""; txtCommHead.Text = ""; txtContact.Text = "";
                }
                command.Dispose();
            }
            catch (SqlException ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "", "toastr.error('Committee name already exist', 'Error');", true);
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
                string query = "update Committee set CommName=@cname,CommHead=@chead,Contact=@contact where CommCode = '" + ViewState["CommCode"].ToString() + "'";
                command = new SqlCommand(query, connection);
                command.Parameters.Add("@cname", SqlDbType.VarChar).Value = txtCommName1.Text.ToUpper();
                command.Parameters.Add("@chead", SqlDbType.VarChar).Value = txtCommHead1.Text;
                command.Parameters.Add("@contact", SqlDbType.VarChar).Value = txtContact1.Text;

                if (connection.State == ConnectionState.Closed)
                {
                    connection.Open();
                }
                rows = command.ExecuteNonQuery();
                if (rows == 1)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "", "toastr.success('Committee Updated Successfully', 'Success');", true);
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "closeeditcommModal();", true);
                    commGrid.Rebind();
                }
                command.Dispose();
            }
            catch (SqlException ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "", "toastr.error('Committee name already exist', 'Error');", true);
            }
            finally
            {
                connection.Close();
            }
        }

    }
}