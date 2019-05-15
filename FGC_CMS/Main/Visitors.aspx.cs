using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace FGC_CMS.Main
{
    public partial class Visitors : MasterPageChange
    {
        protected void visitorsGrid_ItemCommand(object sender, GridCommandEventArgs e)
        {
            if (e.CommandName == "InitInsert")
            {
                Response.Redirect("/Main/NewVisitor.aspx");
            }
            if (e.CommandName == "Edit")
            {
                GridDataItem item = e.Item as GridDataItem;
                Session["visitorid"] = item["VisitorID"].Text;
                Response.Redirect("/Main/EditVisitor.aspx");
            }
        }

        protected void visitorsGrid_ItemDeleted(object sender, GridDeletedEventArgs e)
        {
            if (e.Exception != null)
            {
                e.ExceptionHandled = true;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "", "toastr.error('"+ e.Exception.Message.Replace("'", "").Replace("\r\n", "") + "', 'Error');", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "", "toastr.success('Deleted Successfully', 'Success');", true);
            }
        }
        protected void btnExcelExport_Click(object sender, EventArgs e)
        {
            visitorsGrid.MasterTableView.ExportToExcel();
        }

        protected void btnPDFExport_Click(object sender, EventArgs e)
        {
            visitorsGrid.MasterTableView.ExportToPdf();
        }
    }
}