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
    public partial class NewMember : MasterPageChange
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
                ViewState["image"] = new Byte[0];
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
                string memberid = "";
                string nowyear = "";
                string query = "select max(memberid) as memberid from members where memberid like '%"+ nowyear +"'";
                command = new SqlCommand(query, connection);
                if (connection.State == ConnectionState.Closed)
                {
                    connection.Open();
                }
                reader = command.ExecuteReader();
                if (reader.Read() && !String.IsNullOrEmpty(reader["memberid"].ToString()))
                {
                    memberid = reader["memberid"].ToString();
                    memberid = memberid.Substring(2, 4);
                    memberid = (int.Parse(memberid) + 1).ToString();
                }
                else
                {
                    memberid = "1";
                }
                reader.Close();

                switch (memberid.Length)
                {
                    case 1:
                        memberid = "000" + memberid;
                        break;
                    case 2:
                        memberid = "00" + memberid;
                        break;
                    case 3:
                        memberid = "0" + memberid;
                        break;
                }
                memberid = "DP" + memberid + "-" + DateTime.Now.Year.ToString().Substring(2, 2);

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

                query = "INSERT INTO members(memberid,surname,firstname,othername,gender,birthday,agegroup,maritalstatus,spouse,telephone,mobile,occupation,resaddress,postaddress,";
                query += "ministry,department,committee,tabernacle,regdate,photo,email) ";
                query += "VALUES(@memberid,@surname,@firstname,@othername,@gender,@birthday,@agegroup,@marstatus,@spouse,@phone,@mobile,@occupation,@resaddress,@postaddress,";
                query += "@ministry,@department,@committee,@tabernacle,@regdate,@photo,@email)";

                command = new SqlCommand(query, connection);

                command.Parameters.Add("@memberid", SqlDbType.VarChar).Value = memberid;
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
                command.Parameters.Add("@regdate", SqlDbType.VarChar).Value = DateTime.Now.ToString("yyyy-MM-dd");
                command.Parameters.Add("@photo", SqlDbType.Binary).Value = ViewState["image"];
                command.Parameters.Add("@email", SqlDbType.VarChar).Value = txtEmail.Text;

                rows = command.ExecuteNonQuery();
                if (rows > 0)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "", "toastr.success('New Member Saved Successfully... MEMBER_ID = " + memberid + "', 'Success');", true);
                    txtMemberID.Text = memberid;
                }
                command.Dispose();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "", "toastr.error('" + ex.Message.Replace("'","").Replace("\r\n","") + "', 'Error');", true);
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

        protected void btnInsertMembers_Click(object sender, EventArgs e)
        {
            try
            {
                string memberid = "DP1258-16";
                string query = "select * from oldmembers where memberid > 'DP0225-16'";
                SqlCommand cmd = new SqlCommand(query, connection);
                if (connection.State == ConnectionState.Closed)
                {
                    connection.Open();
                }
                reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    memberid = memberid.Substring(2, 4);
                    memberid = (int.Parse(memberid) + 1).ToString();

                    switch (memberid.Length)
                    {
                        case 1:
                            memberid = "000" + memberid;
                            break;
                        case 2:
                            memberid = "00" + memberid;
                            break;
                        case 3:
                            memberid = "0" + memberid;
                            break;
                    }
                    memberid = "DP" + memberid + "-" + "16";

                    query = "INSERT INTO members(memberid,surname,firstname,othername,gender,birthday,maritalstatus,spouse,telephone,mobile,occupation,resaddress,postaddress,";
                    query += "ministry,department,committee,tabernacle,regdate,photo) ";
                    query += "VALUES(@memberid,@surname,@firstname,@othername,@gender,@birthday,@marstatus,@spouse,@phone,@mobile,@occupation,@resaddress,@postaddress,";
                    query += "@ministry,@department,@committee,@tabernacle,@regdate,@photo)";
                    SqlConnection conn = new SqlConnection(connectionString);
                    SqlCommand command = new SqlCommand(query, conn);
                    if (conn.State == ConnectionState.Closed)
                        conn.Open();
                    command.Parameters.Add("@memberid", SqlDbType.VarChar).Value = memberid;
                    command.Parameters.Add("@surname", SqlDbType.VarChar).Value = reader["surname"].ToString().ToUpper();
                    command.Parameters.Add("@firstname", SqlDbType.VarChar).Value = reader["firstname"].ToString().ToUpper();
                    command.Parameters.Add("@othername", SqlDbType.VarChar).Value = reader["othername"].ToString().ToUpper();
                    command.Parameters.Add("@gender", SqlDbType.VarChar).Value = reader["gender"].ToString();
                    command.Parameters.Add("@birthday", SqlDbType.VarChar).Value = reader["birthday"].ToString();
                    command.Parameters.Add("@marstatus", SqlDbType.VarChar).Value = reader["maritalstatus"].ToString();
                    command.Parameters.Add("@spouse", SqlDbType.VarChar).Value = reader["spouse"].ToString();
                    command.Parameters.Add("@phone", SqlDbType.VarChar).Value = reader["telephone"].ToString();
                    command.Parameters.Add("@mobile", SqlDbType.VarChar).Value = reader["mobile"].ToString();
                    command.Parameters.Add("@occupation", SqlDbType.VarChar).Value = reader["occupation"].ToString();
                    command.Parameters.Add("@resaddress", SqlDbType.VarChar).Value = reader["resaddress"].ToString();
                    command.Parameters.Add("@postaddress", SqlDbType.VarChar).Value = reader["postaddress"].ToString();
                    command.Parameters.Add("@ministry", SqlDbType.VarChar).Value = reader["ministry"].ToString();
                    command.Parameters.Add("@department", SqlDbType.VarChar).Value = reader["department"].ToString();
                    command.Parameters.Add("@committee", SqlDbType.VarChar).Value = reader["committee"].ToString();
                    command.Parameters.Add("@tabernacle", SqlDbType.VarChar).Value = reader["tabernacle"].ToString();
                    command.Parameters.Add("@regdate", SqlDbType.VarChar).Value = reader["regdate"].ToString();
                    command.Parameters.Add("@photo", SqlDbType.Binary).Value = ViewState["image"];
                    rows += command.ExecuteNonQuery();
                    command.Dispose();
                }
                
                if (rows > 0)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "", "toastr.success('" + rows + " Members Inserted Successfully...', 'Success');", true);
                }
                
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
}