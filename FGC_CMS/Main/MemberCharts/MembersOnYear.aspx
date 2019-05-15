<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MembersOnYear.aspx.cs" Inherits="FGC_CMS.Main.MemberCharts.MembersOnYear" %>

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
              <h3 class="box-title"> Members Chart (Yearly) </h3>
              <div class="box-tools pull-right">
                <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
              </div>
            </div><!-- /.box-header -->
            <div class="box-body">

                <div>
                    <telerik:RadDropDownList ID="dlGender" runat="server" Width="300px">
                             <Items>
                                 <telerik:DropDownListItem Text="Male" Value="Male"/>
                                 <telerik:DropDownListItem Text="Female" Value="Female"/>
                                 <telerik:DropDownListItem Text="All" Value="" Selected="true" />
                             </Items>
                         </telerik:RadDropDownList>
                    <telerik:RadDatePicker ID="dpSdate" runat="server" >
                    </telerik:RadDatePicker>
                    <telerik:RadDatePicker ID="dpEdate" runat="server" >
                    </telerik:RadDatePicker>
                    <asp:Button ID="btnRun" runat="server" Text="Run" CssClass="btn-success"  OnClick="btnRun_Click"/>
                    <asp:HiddenField runat="server" ID="hfSdate" />
                    <asp:HiddenField runat="server" ID="hfEdate" />
                </div>

                
                     <telerik:RadHtmlChart runat="server" Width="100%" Height="600px" ID="RadHtmlChart2" DataSourceID="chartSource" Skin="Silk">
            <PlotArea>
                <Series>
                    <telerik:LineSeries DataFieldY="MEMBERS" Name="YEAR">
                        <LineAppearance Width="3" />
                         <LabelsAppearance Color="DarkRed" DataField="MEMBERS" Position="Above">
                             <TextStyle FontSize="16" Bold="true" />
                         </LabelsAppearance>
                        <TooltipsAppearance Color="Yellow" DataFormatString="{0:#}"></TooltipsAppearance>
                    </telerik:LineSeries>
                </Series>
                 <XAxis DataLabelsField="YYYY">
                    <LabelsAppearance RotationAngle="75">
                        <TextStyle FontSize="16" />
                    </LabelsAppearance>
                    <TitleAppearance Text="YEAR">
                        <TextStyle FontSize="16" Bold="true" />
                    </TitleAppearance>
                </XAxis>
                <YAxis>
                    <TitleAppearance Text="Members">
                        <TextStyle FontSize="18" Bold="true" />
                    </TitleAppearance>
                </YAxis>
            </PlotArea>
            <Legend>
                <Appearance Visible="false">
                </Appearance>
            </Legend>
            <ChartTitle Text="Members Chart (Yearly)">
                <Appearance>
                    <TextStyle FontSize="24" Bold="true" />
                </Appearance>
            </ChartTitle>
        </telerik:RadHtmlChart> 
                <asp:SqlDataSource ID="chartSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT year(regdate) as YYYY, count(memberid) as MEMBERS from Members where (Gender LIKE @GENDER + '%') AND (Regdate BETWEEN @SDATE AND @EDATE) GROUP BY year(regdate) order by YYYY">
                     <SelectParameters>
                        
                        <asp:ControlParameter ControlID="hfSdate" Name="SDATE" PropertyName="Value" />
                        <asp:ControlParameter ControlID="hfEdate" Name="EDATE" PropertyName="Value" />
                         <asp:ControlParameter ControlID="dlGender" ConvertEmptyStringToNull="False" DefaultValue="" Name="GENDER" PropertyName="SelectedValue" />
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

