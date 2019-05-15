using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace FGC_CMS
{
    public partial class Members_2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!IsPostBack)
            //{
            //    dlMinistry.DataBind();
            //    string roles = "ministry,ministry7";
            //    foreach (RadComboBoxItem item in dlMinistry.Items)
            //    {
            //        if (roles.Contains(item.Text)){
            //            item.Checked = true;
            //        }
            //    }
            //}
        }

        //protected void btnSetText_Click(object sender, EventArgs e)
        //{
        //    string roles = "";
        //    string rolenames = "";
        //    foreach (RadComboBoxItem item in dlMinistry.CheckedItems)
        //    {
        //        roles += item.Value + ",";
        //        rolenames += item.Text + ",";
        //    }
        //    txtSpouse.Text = roles.TrimEnd(',');
        //    txtMobile.Text = rolenames.TrimEnd(',');
        //}

        //protected void RadMonthYearPicker1_SelectedDateChanged(object sender, Telerik.Web.UI.Calendar.SelectedDateChangedEventArgs e)
        //{
        //    txtFirstname.Text = RadMonthYearPicker1.SelectedDate.ToString();
        //}
    }
}