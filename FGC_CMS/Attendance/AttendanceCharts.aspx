<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="AttendanceCharts.aspx.cs" Inherits="FGC_CMS.Setups.AttendanceCharts" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:UpdatePanel runat="server">
        <ContentTemplate>
             <telerik:RadTabStrip ID="RadTabStrip1" runat="server" MultiPageID="RadMultiPage1" SelectedIndex="0" AutoPostBack="true">
                <Tabs>
                    <telerik:RadTab runat="server" Text="Sunday Stack Chart" >
                    </telerik:RadTab>
                    <telerik:RadTab runat="server" Text="Sunday Column Chart" >
                    </telerik:RadTab>
                    <telerik:RadTab runat="server" Text="Tuesday Pie Chart" >
                    </telerik:RadTab>
                    <telerik:RadTab runat="server" Text="Tuesday Bar Chart" >
                    </telerik:RadTab>
                    <telerik:RadTab runat="server" Text="Programs Stack Chart" >
                    </telerik:RadTab>
                    <telerik:RadTab runat="server" Text="Program Column Chart" >
                    </telerik:RadTab>
                    <telerik:RadTab runat="server" Text="Stack Graph" >
                    </telerik:RadTab>
                     <telerik:RadTab runat="server" Text="Line Graph" >
                    </telerik:RadTab>
                </Tabs>
            </telerik:RadTabStrip>
            <telerik:RadMultiPage ID="RadMultiPage1" runat="server" SelectedIndex="0" RenderSelectedPageOnly="true">
                <telerik:RadPageView runat="server" Height="800px" ContentUrl="/Attendance/SundayStackChart.aspx"></telerik:RadPageView>
                 <telerik:RadPageView runat="server" Height="800px" ContentUrl="/Attendance/SundayColumnChart.aspx"></telerik:RadPageView>
                 <telerik:RadPageView runat="server" Height="800px" ContentUrl="/Attendance/TuesdayPieChart.aspx"></telerik:RadPageView>
                <telerik:RadPageView runat="server" Height="800px" ContentUrl="/Attendance/TuesdayBarChart.aspx"></telerik:RadPageView>
                <telerik:RadPageView runat="server" Height="800px" ContentUrl="/Attendance/ProgramStackChart.aspx"></telerik:RadPageView>
                <telerik:RadPageView runat="server" Height="800px" ContentUrl="/Attendance/ProgramColumnChart.aspx"></telerik:RadPageView>
                <telerik:RadPageView runat="server" Height="800px" ContentUrl="/Attendance/StackGraph.aspx"></telerik:RadPageView>
                <telerik:RadPageView runat="server" Height="800px" ContentUrl="/Attendance/LineGraph.aspx"></telerik:RadPageView>
            </telerik:RadMultiPage>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
