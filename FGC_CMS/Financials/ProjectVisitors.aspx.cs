using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace FGC_CMS.Financials
{
    public partial class ProjectVisitors : MasterPageChange
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void visitorsGrid_ItemCommand(object sender, GridCommandEventArgs e)
        {
            if (e.CommandName == "Payment")
            {
                GridDataItem item = e.Item as GridDataItem;
                Session["payerid"] = item["VisitorID"].Text;
                Session["surname"] = item["Surname"].Text;
                Session["othernames"] = item["Othername"].Text;
                Session["telephone"] = item["Telephone"].Text;
                Response.Redirect("/Financials/ProjectPayments.aspx");
            }
        }
    }
}