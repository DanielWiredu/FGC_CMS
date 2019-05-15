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

namespace FGC_CMS.Main
{
    public partial class EditMember : MasterPageChange
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
                    string query = "select * from members where memberid = '" + Session["memberid"].ToString() + "'";
                    command = new SqlCommand(query, connection);
                    if (connection.State == ConnectionState.Closed)
                    {
                        connection.Open();
                    }
                    reader = command.ExecuteReader();
                    if (reader.Read())
                    {
                        txtMemberID.Text = reader["MemberID"].ToString();
                        txtSurname.Text = reader["surname"].ToString();
                        txtFirstname.Text = reader["firstname"].ToString();
                        txtOthername.Text = reader["othername"].ToString();
                        dlGender.SelectedText = reader["gender"].ToString();
                        dpDOB.SelectedDate = Convert.ToDateTime(reader["birthday"]);
                        dlMaritalStatus.SelectedText = reader["maritalstatus"].ToString();
                        txtSpouse.Text = reader["spouse"].ToString();
                        txtMobile.Text = reader["mobile"].ToString();
                        txtPhone.Text = reader["telephone"].ToString();
                        txtEmail.Text = reader["email"].ToString();
                        dlOccupation.SelectedValue = reader["occupation"].ToString();
                        txtResAddress.Text = reader["resaddress"].ToString();
                        txtPostAddress.Text = reader["postaddress"].ToString();
                        dlMinistry.SelectedValue = reader["ministry"].ToString();
                        dlDepartment.SelectedValue = reader["department"].ToString();
                        dlCommittee.SelectedValue = reader["committee"].ToString();
                        dlTabernacle.SelectedValue = reader["tabernacle"].ToString();

                        Byte[] bytes = reader["photo"] as Byte[];
                        ViewState["image"] = bytes;
                        string imagestring = Convert.ToBase64String(bytes, 0, bytes.Length);
                        Image1.ImageUrl = Convert.ToString("data:image/png;base64,") + imagestring;
                    }
                    reader.Close();
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "", "toastr.error('" + ex.Message + "', 'Error');", true);
                }
                finally
                {
                    connection.Close();
                }
            }
        }
        protected void btnClose_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Main/Members.aspx");
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                string agegroup = "";
                DateTime dob = dpDOB.SelectedDate.Value;
                DateTime nowdate = DateTime.Now;
                int age = nowdate.Year - dob.Year;
                // Are we before the birth date this year? If so subtract one year from the mix
                if (nowdate.Month < dob.Month || (nowdate.Month == dob.Month && nowdate.Day < dob.Day))
                {
                    age--;
                }
                if (age <= 10)
                    agegroup = "0 - 10";
                else if (age <= 20)
                    agegroup = "11 - 20";
                else if (age <= 30)
                    agegroup = "21 - 30";
                else if (age <= 50)
                    agegroup = "31 - 50";
                else if (age <= 70)
                    agegroup = "51 - 70";
                else if (age > 70)
                    agegroup = "71 +";

                string query = "UPDATE members SET surname=@surname,firstname=@firstname,othername=@othername,gender=@gender,birthday=@birthday,agegroup=@agegroup,";
                query += "maritalstatus=@marstatus,spouse=@spouse,telephone=@phone,mobile=@mobile,occupation=@occupation,resaddress=@resaddress,postaddress=@postaddress,";
                query += "ministry=@ministry,department=@department,committee=@committee,tabernacle=@tabernacle,photo=@photo,email=@email ";
                query += "WHERE memberid=@memberid";

                command = new SqlCommand(query, connection);

                command.Parameters.Add("@surname", SqlDbType.VarChar).Value = txtSurname.Text.ToUpper();
                command.Parameters.Add("@firstname", SqlDbType.VarChar).Value = txtFirstname.Text.ToUpper();
                command.Parameters.Add("@othername", SqlDbType.VarChar).Value = txtOthername.Text.ToUpper();
                command.Parameters.Add("@gender", SqlDbType.VarChar).Value = dlGender.SelectedValue;
                command.Parameters.Add("@birthday", SqlDbType.VarChar).Value = dob.ToString("yyyy-MM-dd");
                command.Parameters.Add("@agegroup", SqlDbType.VarChar).Value = agegroup;
                command.Parameters.Add("@marstatus", SqlDbType.VarChar).Value = dlMaritalStatus.SelectedValue;
                command.Parameters.Add("@spouse", SqlDbType.VarChar).Value = txtSpouse.Text;
                command.Parameters.Add("@phone", SqlDbType.VarChar).Value = txtPhone.Text;
                command.Parameters.Add("@mobile", SqlDbType.VarChar).Value = txtMobile.Text;
                command.Parameters.Add("@occupation", SqlDbType.VarChar).Value = dlOccupation.SelectedValue;
                command.Parameters.Add("@resaddress", SqlDbType.VarChar).Value = txtResAddress.Text;
                command.Parameters.Add("@postaddress", SqlDbType.VarChar).Value = txtPostAddress.Text;
                command.Parameters.Add("@ministry", SqlDbType.VarChar).Value = dlMinistry.SelectedValue;
                command.Parameters.Add("@department", SqlDbType.VarChar).Value = dlDepartment.SelectedValue;
                command.Parameters.Add("@committee", SqlDbType.VarChar).Value = dlCommittee.SelectedValue;
                command.Parameters.Add("@tabernacle", SqlDbType.VarChar).Value = dlTabernacle.SelectedValue;
                command.Parameters.Add("@photo", SqlDbType.Binary).Value = ViewState["image"];
                command.Parameters.Add("@email", SqlDbType.VarChar).Value = txtEmail.Text;
                command.Parameters.Add("@memberid", SqlDbType.VarChar).Value = txtMemberID.Text.Trim();

                if (connection.State == ConnectionState.Closed)
                {
                    connection.Open();
                }
                rows = command.ExecuteNonQuery();
                if (rows > 0)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "", "toastr.success('Member Updated Successfully', 'Success');", true);
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

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            // Read the file and convert it to Byte Array
            string filePath = FileUpload1.PostedFile.FileName;
            string filename = Path.GetFileName(filePath);
            string ext = Path.GetExtension(filename);
            string contenttype = String.Empty;

            //Set the contenttype based on File Extension
            switch (ext)
            {
                case ".jpg":
                    contenttype = "image/jpg";
                    break;
                case ".png":
                    contenttype = "image/png";
                    break;
                case ".gif":
                    contenttype = "image/gif";
                    break;
            }
            if (contenttype != String.Empty)
            {
                Stream fs = FileUpload1.PostedFile.InputStream;
                BinaryReader br = new BinaryReader(fs);
                Byte[] bytes = br.ReadBytes((Int32)fs.Length);
                ViewState["image"] = bytes;

                string imagestring = Convert.ToBase64String(bytes, 0, bytes.Length);
                Image1.ImageUrl = Convert.ToString("data:image/png;base64,") + imagestring;
            }
            else
            {
                ViewState["image"] = new Byte[0];
                ScriptManager.RegisterStartupScript(this, this.GetType(), "", "toastr.error('No Image selected', 'Error');", true); 
            }
        }
    }
}