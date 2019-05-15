using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FGC_CMS.Main.MemberReports
{
    public partial class Reports : MasterPageChange
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnReport_Click(object sender, EventArgs e)
        {
            if (dpSdate.SelectedDate.HasValue)
                Session["sdate"] = dpSdate.SelectedDate.Value.ToString("dd-MMM-yyyy");
            else
                Session["sdate"] = "1-Jan-2000";

            if (dpEdate.SelectedDate.HasValue)
                Session["edate"] = dpEdate.SelectedDate.Value.ToString("dd-MMM-yyyy");
            else
                Session["edate"] = DateTime.Now.ToString("dd-MMM-yyyy");

            if (rdAll.Checked == true)
            {
                if (dlType.SelectedValue == "All")
                {
                    //ScriptManager.RegisterStartupScript(this, this.GetType(), "newTab", "window.open('/Main/MemberReports/MembersList.aspx');", true);
                    Response.Redirect("/Main/MemberReports/MembersList.aspx");
                }
                else if (dlType.SelectedValue == "Gender")
                {
                    Session["gender"] = "";
                    Response.Redirect("/Main/MemberReports/MembersByGender.aspx");
                }
                else if (dlType.SelectedValue == "Occupation")
                {
                    Session["occupation"] = "";
                    Response.Redirect("/Main/MemberReports/MembersByOccupation.aspx");
                }
                else if (dlType.SelectedValue == "Department")
                {
                    Session["department"] = "";
                    Response.Redirect("/Main/MemberReports/MembersByDepartment.aspx");
                }
                else if (dlType.SelectedValue == "Ministry")
                {
                    Session["ministry"] = "";
                    Response.Redirect("/Main/MemberReports/MembersByMinistry.aspx");
                }
                else if (dlType.SelectedValue == "Committee")
                {
                    Session["committee"] = "";
                    Response.Redirect("/Main/MemberReports/MembersByCommittee.aspx");
                }
                else if (dlType.SelectedValue == "Tabernacle")
                {
                    Session["tabernacle"] = "";
                    Response.Redirect("/Main/MemberReports/MembersByTabernacle.aspx");
                }
            }
            else if (rdSpecific.Checked == true)
            {
                if (dlType.SelectedValue == "All")
                {
                    Response.Redirect("/Main/MemberReports/MembersList.aspx");
                }
                else if (dlType.SelectedValue == "Gender")
                {
                    Session["gender"] = dlGender.SelectedValue;
                    Response.Redirect("/Main/MemberReports/MembersByGender.aspx");
                }
                else if (dlType.SelectedValue == "Occupation")
                {
                    Session["occupation"] = dlOccupation.SelectedValue;
                    Response.Redirect("/Main/MemberReports/MembersByOccupation.aspx");
                }
                else if (dlType.SelectedValue == "Department")
                {
                    Session["department"] = dlDepartment.SelectedValue;
                    Response.Redirect("/Main/MemberReports/MembersByDepartment.aspx");
                }
                else if (dlType.SelectedValue == "Ministry")
                {
                    Session["ministry"] = dlMinistry.SelectedValue;
                    Response.Redirect("/Main/MemberReports/MembersByMinistry.aspx");
                }
                else if (dlType.SelectedValue == "Committee")
                {
                    Session["committee"] = dlCommittee.SelectedValue;
                    Response.Redirect("/Main/MemberReports/MembersByCommittee.aspx");
                }
                else if (dlType.SelectedValue == "Tabernacle")
                {
                    Session["tabernacle"] = dlTabernacle.SelectedValue;
                    Response.Redirect("/Main/MemberReports/MembersByTabernacle.aspx");
                }
            }
        }


        protected void rdAll_CheckedChanged(object sender, EventArgs e)
        {
            if (rdAll.Checked == true)
            {
                lblType.InnerText = "";
                dlGender.Visible = false;
                dlOccupation.Visible = false;
                dlDepartment.Visible = false;
                dlMinistry.Visible = false;
                dlCommittee.Visible = false;
                dlTabernacle.Visible = false;
            }
        }

        protected void rdSpecific_CheckedChanged(object sender, EventArgs e)
        {
            if (rdSpecific.Checked == true)
            {
                reportOption();
            }
        }

        protected void dlType_ItemSelected(object sender, Telerik.Web.UI.DropDownListEventArgs e)
        {
            if (rdAll.Checked == true)
            {
                lblType.InnerText = "";
                dlGender.Visible = false;
                dlOccupation.Visible = false;
                dlDepartment.Visible = false;
                dlMinistry.Visible = false;
                dlCommittee.Visible = false;
                dlTabernacle.Visible = false;
            }
            else if (rdSpecific.Checked == true)
            {
                reportOption();
            }
        }
        protected void reportOption()
        {
            if (dlType.SelectedValue == "All")
            {
                lblType.InnerText = "";
                dlGender.Visible = false;
                dlOccupation.Visible = false;
                dlDepartment.Visible = false;
                dlMinistry.Visible = false;
                dlCommittee.Visible = false;
                dlTabernacle.Visible = false;
            }
            else if (dlType.SelectedValue == "Gender")
            {
                lblType.InnerText = "Gender";
                dlGender.Visible = true;
                dlOccupation.Visible = false;
                dlDepartment.Visible = false;
                dlMinistry.Visible = false;
                dlCommittee.Visible = false;
                dlTabernacle.Visible = false;
            }
            else if (dlType.SelectedValue == "Occupation")
            {
                lblType.InnerText = "Occupation";
                dlGender.Visible = false;
                dlOccupation.Visible = true;
                dlDepartment.Visible = false;
                dlMinistry.Visible = false;
                dlCommittee.Visible = false;
                dlTabernacle.Visible = false;
            }
            else if (dlType.SelectedValue == "Department")
            {
                lblType.InnerText = "Department";
                dlGender.Visible = false;
                dlOccupation.Visible = false;
                dlDepartment.Visible = true;
                dlMinistry.Visible = false;
                dlCommittee.Visible = false;
                dlTabernacle.Visible = false;
            }
            else if (dlType.SelectedValue == "Ministry")
            {
                lblType.InnerText = "Ministry";
                dlGender.Visible = false;
                dlOccupation.Visible = false;
                dlDepartment.Visible = false;
                dlMinistry.Visible = true;
                dlCommittee.Visible = false;
                dlTabernacle.Visible = false;
            }
            else if (dlType.SelectedValue == "Committee")
            {
                lblType.InnerText = "Committee";
                dlGender.Visible = false;
                dlOccupation.Visible = false;
                dlDepartment.Visible = false;
                dlMinistry.Visible = false;
                dlCommittee.Visible = true;
                dlTabernacle.Visible = false;
            }
            else if (dlType.SelectedValue == "Tabernacle")
            {
                lblType.InnerText = "Tabernacle";
                dlGender.Visible = false;
                dlOccupation.Visible = false;
                dlDepartment.Visible = false;
                dlMinistry.Visible = false;
                dlCommittee.Visible = false;
                dlTabernacle.Visible = true;
            }
        }
    }
}