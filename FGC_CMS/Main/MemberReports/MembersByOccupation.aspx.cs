using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using CrystalDecisions.Shared;

namespace FGC_CMS.Main.MemberReports
{
    public partial class MembersByOccupation : System.Web.UI.Page
    {
        rptMembersByOccupation rpt = new rptMembersByOccupation();
        static string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection connection = new SqlConnection(connectionString);
        SqlDataAdapter adapter = new SqlDataAdapter();
        SqlCommand command = new SqlCommand();
        DataSet ds = new DataSet();

        string sdate = "";
        string edate = "";
        string occupation = "";
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ReportDocument_Load(object sender, EventArgs e)
        {
            sdate = Session["sdate"].ToString();
            edate = Session["edate"].ToString();
            occupation = Session["occupation"].ToString();

            ParameterValues parameters = new ParameterValues();
            ParameterDiscreteValue startdate = new ParameterDiscreteValue();
            ParameterDiscreteValue enddate = new ParameterDiscreteValue();

            startdate.Value = sdate;
            enddate.Value = edate;

            adapter = new SqlDataAdapter("select occupation, memberid, surname, firstname, Othername, mobile, regdate, gender from members where occupation like '" + occupation + "%' and regdate between '" + sdate + "' and '" + edate + "'", connection);
            if (connection.State == ConnectionState.Closed)
            {
                connection.Open();
            }
            adapter.Fill(ds, "members");
            rpt.SetDataSource(ds);

            parameters.Add(startdate);
            rpt.DataDefinition.ParameterFields["sDate"].ApplyCurrentValues(parameters);
            parameters.Add(enddate);
            rpt.DataDefinition.ParameterFields["eDate"].ApplyCurrentValues(parameters);

            ReportDocument.ReportSource = rpt;
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            // ExportReport();
            export();
        }

        protected void export()
        {
            //  ReportDocument crystalReport = new ReportDocument();

            ExportFormatType formatType = ExportFormatType.NoFormat;
            switch (DropDownList1.SelectedItem.Text)
            {
                case "Word":
                    formatType = ExportFormatType.WordForWindows;
                    break;
                case "Portable Document (PDF)":
                    formatType = ExportFormatType.PortableDocFormat;
                    break;
                case "Excel":
                    formatType = ExportFormatType.Excel;
                    break;
                case "CSV":
                    formatType = ExportFormatType.CharacterSeparatedValues;
                    break;
            }
            //  crystalReport.ExportToHttpResponse(formatType, Response, true, "Crystal");
            rpt.ExportToHttpResponse(formatType, Response, true, "Crystal");
            // rpt.ExportToDisk(formatType, "C:/test1/statement.pdf");
            // Response.End();
        }
    }
}