using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using Telerik.Web.UI;
using System.IO;

namespace FGC_CMS.Main
{
    public partial class Messaging : MasterPageChange
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void TestSend()
        {
            try
            {
                string url = "http://api.mytxtbox.com/v3/messages/send?" +
 "From=RevEastwood&To=%2B233543581406" +
 "&Content=From%FGCChurchApp" +
 "&ClientId=qfhjdgwb" +
 "&ClientSecret=ynvijlcd" +
 "&RegisteredDelivery=true";
                WebClient client = new WebClient();
                string text = client.DownloadString(url);
                ScriptManager.RegisterStartupScript(this, this.GetType(), "", "toastr.success('Message Sent','Message Info');", true);
                //  Console.WriteLine(text);
                // Console.ReadKey();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "", "toastr.error('" + ex.Message + "','Message Info');", true);
            }
     
        }

        protected void btnNewSMS_Click(object sender, EventArgs e)
        {
            if (memberGrid.SelectedItems.Count == 0)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "", "toastr.warning('No Member(s) Selected', 'Info');", true);
                return;
            }
            else
            {
                txtMessage.Text = "";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "newModal();", true);
            }
        }

        protected void memberGrid_ItemDataBound(object sender, GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                GridDataItem item = e.Item as GridDataItem;
                if (item["Mobile"].Text == "")
                {
                    item.SelectableMode = GridItemSelectableMode.None;
                }
            }
        }

        protected void btnSend_Click(object sender, EventArgs e)
        {

            //if (!Directory.Exists("c:\\ChurchSoftware\\messagelog"))
            //    Directory.CreateDirectory("c:\\ChurchSoftware\\messagelog");
            //StreamWriter successWriter = new StreamWriter("c:\\ChurchSoftware\\messagelog\\successlog.txt", true);
            //StreamWriter failedWriter = new StreamWriter("c:\\ChurchSoftware\\messagelog\\failedlog.txt", true);
            string receiver = "";
            string header = txtHeader.Text.Trim();
            string message = txtMessage.Text;
            string memberid, firstname, telephone;
            int sentsms = 0; int failedsms = 0;
            foreach (GridDataItem item in memberGrid.SelectedItems)
            {
                memberid = item["MemberID"].Text;
                firstname = item["Firstname"].Text;
                telephone = item["Mobile"].Text;
                if (telephone.Length == 10)
                    receiver = telephone.Substring(1, 9);
                //txtMessage.Text += telephone + " ";
                try
                {
                    string url = "http://api.mytxtbox.com/v3/messages/send?" +
                    "From=" + header + "&To=%2B233" + receiver +
                    "&Content=" + message +
                    "&ClientId=qfhjdgwb" + 
                    "&ClientSecret=ynvijlcd" +
                    "&RegisteredDelivery=true";
                    WebClient client = new WebClient();
                    string text = client.DownloadString(url);
                    //successWriter.WriteLine(DateTime.Now.ToString() + "  " + telephone);
                    sentsms++;
                }
                catch (Exception ex)
                {
                    //failedWriter.WriteLine(DateTime.Now.ToString() + "  " + telephone);
                    failedsms++;
                }
            }
            //successWriter.Close();
            //successWriter.Dispose();
            //failedWriter.Close();
            //failedWriter.Dispose();

            if (sentsms > 0)
                ScriptManager.RegisterStartupScript(this, this.GetType(), "sent", "toastr.success('" + sentsms + " Message(s) Sent Successfully','Success');", true);
            if (failedsms > 0)
                ScriptManager.RegisterStartupScript(this, this.GetType(), "failed", "toastr.error('" + failedsms + " Message(s) could not be sent','Failed');", true);

            ScriptManager.RegisterStartupScript(this, this.GetType(), "log", "toastr.info('Check messaging log','Log');", true);

            ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "closenewModal();", true);
        }

    }
}