<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MembersByOccupation.aspx.cs" Inherits="FGC_CMS.Main.MemberReports.MembersByOccupation" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" Namespace="CrystalDecisions.Web" TagPrefix="CR" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
   <!--      <asp:DropDownList ID="DropDownList1" runat="server" ForeColor="Black" Width="215px">
    <asp:ListItem>Portable Document (PDF)</asp:ListItem>
    <asp:ListItem>Rich Text (RTF)</asp:ListItem>
    <asp:ListItem>MS Word (DOC)</asp:ListItem>
    <asp:ListItem>MS Excel (XLS)</asp:ListItem>
</asp:DropDownList>
        <asp:Button ID="Button1" runat="server" ForeColor="#003366" Text="Export Statement" Width="145px" OnClick="Button1_Click" />
        -->

        <CR:CrystalReportViewer ID="ReportDocument" runat="server" AutoDataBind="true" EnableDatabaseLogonPrompt="false" OnLoad="ReportDocument_Load" />
    </div>
    </form>
</body>
</html>
