<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StackGraph.aspx.cs" Inherits="FGC_CMS.Attendance.StackGraph" %>

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
              <h3 class="box-title"> Attendance Chart (Monthly) </h3>
              <div class="box-tools pull-right">
                <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
              </div>
            </div><!-- /.box-header -->
            <div class="box-body">

                <div class="form-group">
                    <div class="row">
                        <div class="col-md-4">
                            <label>Service</label>
                             <telerik:RadDropDownList ID="dlService" runat="server" Width="100%" DataSourceID="serviceSource" DataTextField="ServiceName" DataValueField="ServiceName"></telerik:RadDropDownList>
                             <asp:SqlDataSource ID="serviceSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT ServiceName FROM [Services]"></asp:SqlDataSource>
                        </div>
                        <div class="col-md-3">
                            <label>Service Mode</label>
                            <telerik:RadDropDownList ID="dlServiceMode" runat="server" Width="100%">
                         <Items>
                             <telerik:DropDownListItem Text="Joint Service" />
                             <telerik:DropDownListItem Text="Ahurusie Som" />
                             <telerik:DropDownListItem Text="Soma 1" />
                             <telerik:DropDownListItem Text="Soma 2" />
                             <telerik:DropDownListItem Text="Youth Service" />
                         </Items>
                         </telerik:RadDropDownList>
                        </div>
                        <div class="col-md-2">
                            <label>Month</label>
                            <telerik:RadDropDownList ID="dlMnth" runat="server" Width="100%">
                                            <Items>
                                                <telerik:DropDownListItem Text="January" Value="01"/>
                                                <telerik:DropDownListItem Text="February" Value="02"/>
                                                <telerik:DropDownListItem Text="March" Value="03"/>
                                                <telerik:DropDownListItem Text="April" Value="04"/>
                                                <telerik:DropDownListItem Text="May" Value="05"/>
                                                <telerik:DropDownListItem Text="June" Value="06"/>
                                                <telerik:DropDownListItem Text="July" Value="07"/>
                                                <telerik:DropDownListItem Text="August" Value="08"/>
                                                <telerik:DropDownListItem Text="September" Value="09"/>
                                                <telerik:DropDownListItem Text="October" Value="10"/>
                                                <telerik:DropDownListItem Text="November" Value="11"/>
                                                <telerik:DropDownListItem Text="December" Value="12"/>
                                            </Items>
                              </telerik:RadDropDownList>
                        </div>
                        <div class="col-md-2">
                            <label>Year</label>
                            <telerik:RadDropDownList ID="dlYear" runat="server" Width="100%"> </telerik:RadDropDownList>
                        </div>
                        <div class="col-md-1">
                            <label>Run</label>
                             <asp:Button ID="btnRun" runat="server" Text="Run" CssClass="btn-success" Width="100%"  OnClick="btnRun_Click"/>
                        </div>
                    </div>
                </div>

                
            <telerik:RadHtmlChart runat="server" Width="100%" Height="600px" ID="RadHtmlChart2" DataSourceID="chartSource" Skin="Silk">
            <PlotArea>
                <Series>
                    <telerik:ColumnSeries DataFieldY="MALES" Name="MALE">
                         <LabelsAppearance Color="DarkRed" DataField="MALES" Position="OutsideEnd" DataFormatString="{0:#}">
                              <TextStyle Bold="true" FontSize="20" />
                         </LabelsAppearance>
                        <TooltipsAppearance Color="Yellow" DataFormatString="{0:#}"></TooltipsAppearance>
                    </telerik:ColumnSeries>
                     <telerik:ColumnSeries DataFieldY="FEMALES" Name="FEMALE">
                         <LabelsAppearance Color="DarkRed" DataField="FEMALES" Position="OutsideEnd" DataFormatString="{0:#}">
                              <TextStyle Bold="true" FontSize="20" />
                         </LabelsAppearance>
                        <TooltipsAppearance Color="Yellow" DataFormatString="{0:#}"></TooltipsAppearance>
                    </telerik:ColumnSeries>
                    <telerik:ColumnSeries DataFieldY="YOUTH" Name="YOUTH">
                         <LabelsAppearance Color="DarkRed" DataField="YOUTH" Position="OutsideEnd" DataFormatString="{0:#}">
                              <TextStyle Bold="true" FontSize="20" />
                         </LabelsAppearance>
                        <TooltipsAppearance Color="Yellow" DataFormatString="{0:#}"></TooltipsAppearance>
                    </telerik:ColumnSeries>
                    <telerik:ColumnSeries DataFieldY="CHILDREN" Name="CHILDREN">
                         <LabelsAppearance Color="DarkRed" DataField="CHILDREN" Position="OutsideEnd" DataFormatString="{0:#}">
                             <TextStyle Bold="true" FontSize="20" />
                         </LabelsAppearance>
                        <TooltipsAppearance Color="Yellow" DataFormatString="{0:#}"></TooltipsAppearance>
                    </telerik:ColumnSeries>
                </Series>
                 <XAxis DataLabelsField="SERVICEDATE" Type="Category">
                    <LabelsAppearance RotationAngle="0" DataFormatString="{0:dd-MMM-yyyy}">
                        <TextStyle FontSize="18" />
                    </LabelsAppearance>
                    <TitleAppearance Text="DAY OF SERVICE" Visible="false">
                    </TitleAppearance>
                </XAxis>
                <YAxis>
                    <TitleAppearance Text="Attendance">
                        <TextStyle Bold="true" FontSize="18" />
                    </TitleAppearance>
                </YAxis>
            </PlotArea>
            <Legend>
                <Appearance Visible="true" Position="Top" Orientation="Horizontal">
                    <TextStyle Bold="true" FontSize="16" />
                </Appearance>
            </Legend>
            <ChartTitle Text="">
                <Appearance><TextStyle Bold="true" FontSize="26" /></Appearance>
            </ChartTitle>
        </telerik:RadHtmlChart> 
                <asp:SqlDataSource ID="chartSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT SERVICEDATE, MALES, FEMALES, YOUTH, CHILDREN, COMMENTS FROM Attendance WHERE (SERVICE = @service) AND (SERVICEKIND = @servicekind) AND (YEAR(SERVICEDATE) = @yr) AND (MONTH(SERVICEDATE) = @mm) ORDER BY SERVICEDATE">
                     <SelectParameters>
                        <asp:ControlParameter ControlID="dlService" Name="service" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="dlServiceMode" Name="servicekind" PropertyName="SelectedText" />
                         <asp:ControlParameter ControlID="dlYear" Name="yr" PropertyName="SelectedText" />
                         <asp:ControlParameter ControlID="dlMnth" Name="mm" PropertyName="SelectedValue" />
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