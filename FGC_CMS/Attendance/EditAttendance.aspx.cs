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
    public partial class EditAttendance : MasterPageChange
    {
        static string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection connection = new SqlConnection(connectionString);
        SqlDataAdapter adapter = new SqlDataAdapter();
        SqlCommand command = new SqlCommand();
        SqlDataReader reader;
        int rows = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    string query = "select * from Attendance where AttendanceID = '" + Session["AttendanceID"].ToString() + "'";
                    command = new SqlCommand(query, connection);
                    if (connection.State == ConnectionState.Closed)
                    {
                        connection.Open();
                    }
                    reader = command.ExecuteReader();
                    if (reader.Read())
                    {
                        ViewState["AttendanceID"] = reader["AttendanceID"].ToString();
                        dlService.SelectedValue = reader["Service"].ToString();
                        dpServiceDate.SelectedDate = Convert.ToDateTime(reader["ServiceDate"]);
                        foreach (ListItem item in rdService.Items)
                        {
                            if (item.Text == reader["ServiceKind"].ToString())
                                item.Selected = true;
                        }
                        txtMales.Value = Convert.ToDouble(reader["Males"]);
                        txtFemales.Value = Convert.ToDouble(reader["Females"]);
                        txtYouth.Value = Convert.ToDouble(reader["Youth"]);
                        txtChildren.Value = Convert.ToDouble(reader["Children"]);
                        txtSpeaker.Text = Convert.ToString(reader["Speaker"]);
                        txtComments.Text = Convert.ToString(reader["Comments"]);
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
           
            }
        }

        protected void btnClose_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Attendance/Attendance.aspx");
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                string servicetype = null;
                string query = "select servicetype from services where servicename = '" + dlService.SelectedItem.Text + "'";
                command = new SqlCommand(query, connection);
                if (connection.State == ConnectionState.Closed)
                {
                    connection.Open();
                }
                reader = command.ExecuteReader();
                if (reader.Read())
                {
                    servicetype = reader["servicetype"].ToString();
                }
                reader.Close();

                query = "update Attendance set Service=@service,ServiceType=@stype,ServiceDate=@sdate,ServiceKind=@skind,Males=@males,Females=@females,Youth=@youth,Children=@children,Speaker=@speaker,Comments=@comments where AttendanceID = '" + ViewState["AttendanceID"].ToString() + "'";
                command = new SqlCommand(query, connection);
                command.Parameters.Add("@service", SqlDbType.VarChar).Value = dlService.SelectedItem.Text;
                command.Parameters.Add("@stype", SqlDbType.VarChar).Value = servicetype;
                command.Parameters.Add("@sdate", SqlDbType.Date).Value = dpServiceDate.SelectedDate.Value.ToString("yyyy-MM-dd");
                command.Parameters.Add("@skind", SqlDbType.VarChar).Value = rdService.SelectedItem.Text;
                command.Parameters.Add("@males", SqlDbType.Int).Value = txtMales.Value;
                command.Parameters.Add("@females", SqlDbType.Int).Value = txtFemales.Value;
                command.Parameters.Add("@youth", SqlDbType.Int).Value = txtYouth.Value;
                command.Parameters.Add("@children", SqlDbType.Int).Value = txtChildren.Value;
                command.Parameters.Add("@speaker", SqlDbType.VarChar).Value = txtSpeaker.Text;
                command.Parameters.Add("@comments", SqlDbType.VarChar).Value = txtComments.Text;

                rows = command.ExecuteNonQuery();
                if (rows == 1)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "", "toastr.success('Attendance Updated Successfully', 'Success');", true);
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

        protected void dlService_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {
            if (dlService.SelectedValue.Contains("Sunday"))
            {
                rdService.SelectedItem.Selected = false;
                rdService.Items[1].Selected = true;
            }
            else
            {
                rdService.SelectedItem.Selected = false;
                rdService.Items[0].Selected = true;
            }
        }
    }
}