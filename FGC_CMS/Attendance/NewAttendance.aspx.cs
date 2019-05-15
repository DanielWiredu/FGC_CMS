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
    public partial class NewAttendance : MasterPageChange
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
                dpServiceDate.SelectedDate = DateTime.Now;
            }
        }

        protected void btnClose_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Attendance/Attendance.aspx");
        }

        protected void btnSave_Click(object sender, EventArgs e)
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

                query = "insert into Attendance(Service,ServiceType,ServiceDate,ServiceKind,Males,Females,Youth,Children,Speaker,Comments) values(@service,@stype,@sdate,@skind,@males,@females,@youth,@children,@speaker,@comments)";
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
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "", "toastr.success('Attendance Saved Successfully', 'Success');", true);
                    txtMales.Value = 0;
                    txtFemales.Value = 0;
                    txtYouth.Value = 0;
                    txtChildren.Value = 0;
                    txtSpeaker.Text = "";
                    txtComments.Text = "";
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