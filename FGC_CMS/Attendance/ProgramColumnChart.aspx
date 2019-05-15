<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProgramColumnChart.aspx.cs" Inherits="FGC_CMS.Setups.ProgramColumnChart" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title></title>
        <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport"/>
    <!-- Bootstrap 3.3.5 -->
    <link rel="stylesheet" href="/bootstrap/css/bootstrap.min.css"/>
    <!-- Font Awesome -->
    <link href="/bootstrap/fonts/font-awesome/css/font-awesome.css" rel="stylesheet" />

    <link rel="stylesheet" href="/dist/css/AdminLTE.min.css"/>
 
    <link rel="stylesheet" href="/dist/css/skins/skin-blue.min.css"/>

        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>


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
              <h3 class="box-title">Program Attendance Chart </h3>
              <div class="box-tools pull-right">
                <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
              </div>
            </div><!-- /.box-header -->
            <div class="box-body">

                <div>
                    <telerik:RadComboBox ID="dlService" runat="server" Width="300px" DataSourceID="serviceSource" DataTextField="ServiceName" DataValueField="ServiceName" Text="Select Service"></telerik:RadComboBox>
                   <asp:SqlDataSource ID="serviceSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT ServiceName FROM [Services] WHERE ServiceType = 'Program'"></asp:SqlDataSource>
                    <telerik:RadDatePicker ID="dpSdate" runat="server" >
                    </telerik:RadDatePicker>
                    <telerik:RadDatePicker ID="dpEdate" runat="server" >
                    </telerik:RadDatePicker>
                    <asp:Button ID="btnRun" runat="server" Text="Run" CssClass="btn-success"  OnClick="btnRun_Click"/>
                    <asp:HiddenField runat="server" ID="hfSdate" />
                    <asp:HiddenField runat="server" ID="hfEdate" />
                </div>

                 <telerik:RadHtmlChart runat="server" Width="100%" Height="500px" ID="RadHtmlChart2"
            DataSourceID="chartSource" Skin="Silk">
            <PlotArea>
                <Series>
                    <telerik:ColumnSeries DataFieldY="MALES" Name="Males">
                        <LabelsAppearance Visible="true">
                            <TextStyle FontSize="14" Bold="true" />
                        </LabelsAppearance>
                        <TooltipsAppearance Color="White" />
                    </telerik:ColumnSeries>
                    <telerik:ColumnSeries DataFieldY="FEMALES" Name="Females" >
                        <LabelsAppearance Visible="true">
                            <TextStyle FontSize="14" Bold="true" />
                        </LabelsAppearance>
                        <TooltipsAppearance Color="White" />
                    </telerik:ColumnSeries>
                    <telerik:ColumnSeries DataFieldY="YOUTH" Name="Youth">
                        <LabelsAppearance Visible="true">
                            <TextStyle FontSize="14" Bold="true" />
                        </LabelsAppearance>
                        <TooltipsAppearance Color="White" />
                    </telerik:ColumnSeries>
                    <telerik:ColumnSeries DataFieldY="CHILDREN" Name="Children">
                        <LabelsAppearance Visible="true">
                            <TextStyle FontSize="14" Bold="true" />
                        </LabelsAppearance>
                        <TooltipsAppearance Color="White" />
                    </telerik:ColumnSeries>
                    
                </Series>
                <XAxis>
                    <LabelsAppearance RotationAngle="25">
                        <TextStyle FontSize="16"/>
                    </LabelsAppearance>
                    <TitleAppearance Text="Members">
                        <TextStyle FontSize="16" Bold="true" />
                    </TitleAppearance>
                </XAxis>
                <YAxis>
                    <TitleAppearance Text="Attendance">
                        <TextStyle FontSize="18" Bold="true" />
                    </TitleAppearance>
                </YAxis>
            </PlotArea>
            <Legend>
                <Appearance Visible="true">
                    <TextStyle FontSize="18" Bold="true" />
                </Appearance>
            </Legend>
            <ChartTitle Text="Specific Program Attendance Chart">
                <Appearance>
                    <TextStyle FontSize="24" Bold="true" />
                </Appearance>
            </ChartTitle>
        </telerik:RadHtmlChart>
                <asp:SqlDataSource ID="chartSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT SUM(MALES) AS MALES, SUM(FEMALES) AS FEMALES, SUM(YOUTH) AS YOUTH, SUM(CHILDREN) AS CHILDREN from ATTENDANCE WHERE SERVICETYPE = 'Program' AND (SERVICEDATE BETWEEN @SDATE AND @EDATE) AND SERVICE = @SERVICE">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="hfSdate" Name="SDATE" PropertyName="Value" />
                        <asp:ControlParameter ControlID="hfEdate" Name="EDATE" PropertyName="Value" />
                        <asp:ControlParameter ControlID="dlService" Name="SERVICE" PropertyName="SelectedValue" />
                    </SelectParameters>
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
