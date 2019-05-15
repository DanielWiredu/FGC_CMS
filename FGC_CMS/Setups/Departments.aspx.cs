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
    public partial class Departments : MasterPageChange
    {
        static string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection connection = new SqlConnection(connectionString);
        SqlDataAdapter adapter = new SqlDataAdapter();
        SqlCommand command = new SqlCommand();
        int rows = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void deptsGrid_ItemDeleted(object sender, GridDeletedEventArgs e)
        {
            if (e.Exception != null)
            {
                e.ExceptionHandled = true;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "", "toastr.error('Department has existing members...Cannot Delete', 'Error');", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "", "toastr.success('Deleted Successfully', 'Success');", true);
            }
        }

        protected void deptsGrid_ItemCommand(object sender, GridCommandEventArgs e)
        {
            if (e.CommandName == "InitInsert")
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "", "newdeptModal();", true);
                e.Canceled = true;
            }
            if (e.CommandName == "Edit")
            {
                GridDataItem item = e.Item as GridDataItem;
                ViewState["DeptCode"] = item["DeptCode"].Text;
                txtDeptName1.Text = item["DeptName"].Text;
                txtDeptHead1.Text = item["DeptHead"].Text;
                txtContact1.Text = item["Contact"].Text;

                ScriptManager.RegisterStartupScript(this, this.GetType(), "", "editdeptModal();", true);
                e.Canceled = true;
            }
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                string query = "insert into Department(DeptName,DeptHead,Contact) values(@dname,@dhead,@contact)";
                command = new SqlCommand(query, connection);
                command.Parameters.Add("@dname", SqlDbType.VarChar).Value = txtDeptName.Text.ToUpper();
                command.Parameters.Add("@dhead", SqlDbType.VarChar).Value = txtDeptHead.Text;
                command.Parameters.Add("@contact", SqlDbType.VarChar).Value = txtContact.Text;

                if (connection.State == ConnectionState.Closed)
                {
                    connection.Open();
                }
                rows = command.ExecuteNonQuery();
                if (rows == 1)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "", "toastr.success('Department Saved Successfully', 'Success');", true);
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "closenewdeptModal();", true);
                    deptsGrid.Rebind();
                    txtDeptName.Text = ""; txtDeptHead.Text = ""; txtContact.Text = "";
                }
                command.Dispose();
            }
            catch (SqlException ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "", "toastr.error('Department name already exist', 'Error');", true);
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
                string query = "update Department set DeptName=@dname,DeptHead=@dhead,Contact=@contact where DeptCode = '" + ViewState["DeptCode"].ToString() + "'";
                command = new SqlCommand(query, connection);
                command.Parameters.Add("@dname", SqlDbType.VarChar).Value = txtDeptName1.Text.ToUpper();
                command.Parameters.Add("@dhead", SqlDbType.VarChar).Value = txtDeptHead1.Text;
                command.Parameters.Add("@contact", SqlDbType.VarChar).Value = txtContact1.Text;

                if (connection.State == ConnectionState.Closed)
                {
                    connection.Open();
                }
                rows = command.ExecuteNonQuery();
                if (rows == 1)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "", "toastr.success('Department Updated Successfully', 'Success');", true);
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "closeeditdeptModal();", true);
                    deptsGrid.Rebind();
                }
                command.Dispose();
            }
            catch (SqlException ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "", "toastr.error('Department name already exist', 'Error');", true);
            }
            finally
            {
                connection.Close();
            }
        }

    }
}