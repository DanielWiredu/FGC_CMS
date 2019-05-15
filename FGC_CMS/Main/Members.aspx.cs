using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace FGC_CMS.Main
{
    public partial class Members : MasterPageChange
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void memberGrid_ItemCommand(object sender, GridCommandEventArgs e)
        {
            if (e.CommandName == "InitInsert")
            {
                Response.Redirect("/Main/NewMember.aspx");
            }
            if (e.CommandName == "Edit")
            {
                GridDataItem item = e.Item as GridDataItem;
                Session["memberid"] = item["MemberID"].Text;
                Response.Redirect("/Main/EditMember.aspx");
            }
        }

        protected void memberGrid_ItemDeleted(object sender, GridDeletedEventArgs e)
        {
            if (e.Exception != null)
            {
                e.ExceptionHandled = true;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "", "toastr.error('" + e.Exception.Message + "', 'Error');", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "", "toastr.success('Deleted Successfully', 'Success');", true);
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Main/NewMember.aspx");
        }
    }
}