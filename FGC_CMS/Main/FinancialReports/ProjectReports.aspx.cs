using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FGC_CMS.FinancialReports
{
    public partial class ProjectReports : MasterPageChange
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnReport_Click(object sender, EventArgs e)
        {
            Session["sdate"] = dpSdate.SelectedDate.Value.ToString("dd-MMM-yyyy");
            Session["edate"] = dpEdate.SelectedDate.Value.ToString("dd-MMM-yyyy");
            if (rdPayType.SelectedValue == "Member")
            {
                Session["rptMemberID"] = txtPayerID.Text;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "newTab", "window.open('/Reports/Projects/MemberPayments.aspx');", true);
            }
            else if (rdPayType.SelectedValue == "Visitor")
            {
                Session["rptVisitorID"] = txtPayerID.Text;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "newTab", "window.open('/Main/FinancialReports/Projects/VisitorPayments.aspx');", true);
            }
        }
    }
}