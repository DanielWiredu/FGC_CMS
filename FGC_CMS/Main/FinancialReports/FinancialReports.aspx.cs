﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FGC_CMS.FinancialReports
{
    public partial class FinancialReports : MasterPageChange
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnReport_Click(object sender, EventArgs e)
        {
            Session["sdate"] = dpSdate.SelectedDate.Value.ToString("dd-MMM-yyyy");
            Session["edate"] = dpEdate.SelectedDate.Value.ToString("dd-MMM-yyyy");
            Session["currency"] = dlCurrency.SelectedValue;
            ScriptManager.RegisterStartupScript(this, this.GetType(), "newTab", "window.open('/Main/FinancialReports/Financials/Statement1.aspx');", true);
        }

        protected void btnReportSummary_Click(object sender, EventArgs e)
        {
            if (rdType.SelectedValue == "Monthly")
                Session["yyyymm"] = dpPeriod.SelectedDate.Value.ToString("yyyyMM");
            else if (rdType.SelectedValue == "Yearly")
                Session["yyyymm"] = dpPeriod.SelectedDate.Value.ToString("yyyy");
            Session["currency"] = dlCur.SelectedValue;
            ScriptManager.RegisterStartupScript(this, this.GetType(), "newTab", "window.open('/Main/FinancialReports/Financials/SummarizedStatement.aspx');", true);
        }
    }
}