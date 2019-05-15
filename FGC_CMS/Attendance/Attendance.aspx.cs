using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace FGC_CMS.Setups
{
    public partial class Attendance : MasterPageChange
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void attendanceGrid_ItemCommand(object sender, GridCommandEventArgs e)
        {
            if (e.CommandName == "InitInsert")
            {
                Response.Redirect("/Attendance/NewAttendance.aspx");
                e.Canceled = true;
            }
            if (e.CommandName == "Edit")
            {
                GridDataItem item = e.Item as GridDataItem;
                Session["attendanceID"] = item["AttendanceID"].Text;
                Response.Redirect("/Attendance/EditAttendance.aspx");
            }
        }

        protected void attendanceGrid_ItemDeleted(object sender, GridDeletedEventArgs e)
        {
            if (e.Exception != null)
            {
                e.ExceptionHandled = true;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "", "toastr.error('Error occured during delete. Try again', 'Error');", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "", "toastr.success('Deleted Successfully', 'Success');", true);
            }
        }
    }
}