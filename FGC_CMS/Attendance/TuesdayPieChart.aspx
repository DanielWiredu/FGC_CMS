<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TuesdayPieChart.aspx.cs" Inherits="FGC_CMS.Setups.TuesdayPieChart" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport"/>
    <!-- Bootstrap 3.3.5 -->
    <link rel="stylesheet" href="/bootstrap/css/bootstrap.min.css"/>
    <!-- Font Awesome -->
    <link href="/bootstrap/fonts/font-awesome/css/font-awesome.css" rel="stylesheet" />

    <link rel="stylesheet" href="/dist/css/AdminLTE.min.css"/>
 
    <link rel="stylesheet" href="/dist/css/skins/skin-blue.min.css"/>

        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
     <!-- toastr references -->
    <script src="/plugins/toastr/jquery-2.1.1.js"></script>
    <link href="/plugins/toastr/toastr.min.css" rel="stylesheet" />
    <script src="/plugins/toastr/toastr.min.js"></script>

        <script src="/plugins/jQuery/jQuery-2.1.4.min.js"></script>
    <!-- Bootstrap 3.3.5 -->
    <script src="/bootstrap/js/bootstrap.min.js"></script>
    <!-- AdminLTE App -->
    <script src="/dist/js/app.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <telerik:RadSkinManager ID="RadSkinManager1" runat="server" Skin="Office2010Blue"></telerik:RadSkinManager>
          <div class="box box-default">
            <div class="box-header with-border">
              <h3 class="box-title">Tuesday Service Attendance Chart </h3>
              <div class="box-tools pull-right">
                <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
              </div>
            </div><!-- /.box-header -->
            <div class="box-body">

                <div>
                    <telerik:RadDatePicker ID="dpSdate" runat="server" >
                    </telerik:RadDatePicker>
                    <telerik:RadDatePicker ID="dpEdate" runat="server" >
                    </telerik:RadDatePicker>
                    <asp:Button ID="btnRun" runat="server" Text="Run" CssClass="btn-success"  OnClick="btnRun_Click"/>
                    <asp:HiddenField runat="server" ID="hfSdate" />
                    <asp:HiddenField runat="server" ID="hfEdate" />
                </div>

                
                     <telerik:RadHtmlChart runat="server" Width="100%" Height="500px" ID="RadHtmlChart2" DataSourceID="chartSource" Skin="Silk">
            <PlotArea>
                <Series>
                    <telerik:DonutSeries DataFieldY="VALUE" Name="MEMBERS" NameField="MEMBERS" StartAngle="90">
                        <LabelsAppearance Position="OutsideEnd" DataField="MEMBERS">
                            <TextStyle FontSize="14" />
                        </LabelsAppearance>
                    </telerik:DonutSeries>

                </Series>
            </PlotArea>
            <Legend>
                <Appearance Visible="true">
                    <TextStyle FontSize="16" Bold="true" />
                </Appearance>
            </Legend>
            <ChartTitle Text="Tuesday Service Attendance Chart">
                <Appearance>
                    <TextStyle FontSize="24" Bold="true" />
                </Appearance>
            </ChartTitle>
        </telerik:RadHtmlChart> 
                <asp:SqlDataSource ID="chartSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT MEMBERS,VALUE FROM TUESDAYPIE">
                </asp:SqlDataSource>
    
                 <telerik:RadButton ID="btnExport" Text="Export to PDF" runat="server" OnClientClicked="exportRadHtmlChart" UseSubmitBehavior="false" AutoPostBack="false"></telerik:RadButton>
                    <telerik:RadClientExportManager ID="RadClientExportManager1" runat="server"></telerik:RadClientExportManager>
            </div><!-- /.box-body -->
         
          </div><!-- /.box -->
    </div>

           <script>
               var $ = $telerik.$;
               function exportRadHtmlChart() {
                   $find('<%=RadClientExportManager1.ClientID%>').exportPDF($(".RadHtmlChart"));
               }
    </script>
    </form>
</body>
</html>
