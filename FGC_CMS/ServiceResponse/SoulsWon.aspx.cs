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

namespace FGC_CMS.ServiceResponse
{
    public partial class SoulsWon : MasterPageChange
    {
        static string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection connection = new SqlConnection(connectionString);
        SqlCommand command;
        int rows = 0;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void soulsGrid_ItemCommand(object sender, GridCommandEventArgs e)
        {
            if (e.CommandName == "Edit")
            {
                GridDataItem item = e.Item as GridDataItem;
                ViewState["ID"] = item["ID"].Text;
                dpServiceDate1.SelectedDate = Convert.ToDateTime(item["ServiceDate"].Text);
                dlService1.SelectedValue = item["ServiceName"].Text;
                txtName1.Text = item["SoulName"].Text;
                txtLocation1.Text = item["Location"].Text;
                txtContactNo1.Text = item["ContactNo"].Text;

                ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "editModal();", true);
                e.Canceled = true;
            }
        }

        protected void soulsGrid_ItemDeleted(object sender, GridDeletedEventArgs e)
        {
            if (e.Exception != null)
            {
                e.ExceptionHandled = true;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "", "toastr.error('" + e.Exception.Message.Replace("'", "").Replace("\r\n", "") + "', 'Error');", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "", "toastr.success('Deleted Successfully', 'Success');", true);
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string query = "INSERT INTO [SoulsWon] ([ServiceDate], [ServiceName], [SoulName], [Location], [ContactNo]) VALUES (@ServiceDate, @ServiceName, @SoulName, @Location, @ContactNo)";
            command = new SqlCommand(query, connection);
            command.Parameters.Add("@ServiceDate", SqlDbType.Date).Value = dpServiceDate.SelectedDate;
            command.Parameters.Add("@ServiceName", SqlDbType.VarChar).Value = dlService.SelectedValue;
            command.Parameters.Add("@SoulName", SqlDbType.VarChar).Value = txtName.Text;
            command.Parameters.Add("@Location", SqlDbType.VarChar).Value = txtLocation.Text;
            command.Parameters.Add("@ContactNo", SqlDbType.VarChar).Value = txtContactNo.Text;
            try
            {
                if (connection.State == ConnectionState.Closed)
                {
                    connection.Open();
                }
                rows = command.ExecuteNonQuery();
                if (rows == 1)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "", "toastr.success('Saved Successfully', 'Success');", true);
                    //ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "closenewModal();", true);
                    txtName.Text = "";
                    txtLocation.Text = "";
                    txtContactNo.Text = "";
                    soulsGrid.Rebind();
                }
                command.Dispose();
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

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            string query = "UPDATE [SoulsWon] SET [ServiceDate] = @ServiceDate, [ServiceName] = @ServiceName, [SoulName] = @SoulName, [Location] = @Location, [ContactNo] = @ContactNo WHERE [id] = @id";
            command = new SqlCommand(query, connection);
            command.Parameters.Add("@ServiceDate", SqlDbType.Date).Value = dpServiceDate1.SelectedDate;
            command.Parameters.Add("@ServiceName", SqlDbType.VarChar).Value = dlService1.SelectedValue;
            command.Parameters.Add("@SoulName", SqlDbType.VarChar).Value = txtName1.Text;
            command.Parameters.Add("@Location", SqlDbType.VarChar).Value = txtLocation1.Text;
            command.Parameters.Add("@ContactNo", SqlDbType.VarChar).Value = txtContactNo1.Text;
            command.Parameters.Add("@Id", SqlDbType.Int).Value = ViewState["ID"].ToString();
            try
            {
                if (connection.State == ConnectionState.Closed)
                {
                    connection.Open();
                }
                rows = command.ExecuteNonQuery();
                if (rows == 1)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "", "toastr.success('Saved Successfully', 'Success');", true);
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "closeeditModal();", true);
                    soulsGrid.Rebind();
                }
                command.Dispose();
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
        protected void btnExcelExport_Click(object sender, EventArgs e)
        {
            soulsGrid.MasterTableView.ExportToExcel();
        }

        protected void btnPDFExport_Click(object sender, EventArgs e)
        {
            soulsGrid.MasterTableView.ExportToPdf();
        }
    }
}