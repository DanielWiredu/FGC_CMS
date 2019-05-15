<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="FGC_CMS.Dashboard" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
     <div class="box box-default">
            <div class="box-header with-border">
              <h3 class="box-title">Dashboard </h3>
              <div class="box-tools pull-right">
                <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
              </div>
            </div><!-- /.box-header -->
            <div class="box-body">
                  <div class="row">
            <div class="col-lg-3 col-xs-6">
              <!-- small box -->
              <div class="small-box bg-aqua">
                <div class="inner">
                  <h3 runat="server" id="lblMembers" ></h3>
                  <p>Membership</p>
                </div>
                <div class="icon">
                  <i class="ion ion-bag"></i>
                </div>
               
              </div>
            </div><!-- ./col -->
            <div class="col-lg-3 col-xs-6">
              <!-- small box -->
              <div class="small-box bg-green">
                <div class="inner">
                  <h3 runat="server" id="lblFemales"><sup style="font-size: 20px">%</sup></h3>
                  <p>Female Rate</p>
                </div>
                <div class="icon">
                  <i class="ion ion-stats-bars"></i>
                </div>
               
              </div>
            </div><!-- ./col -->
            <div class="col-lg-3 col-xs-6">
              <!-- small box -->
              <div class="small-box bg-yellow">
                <div class="inner">
                  <h3 runat="server" id="lblCommittees"></h3>
                  <p>Male Rate</p>
                </div>
                <div class="icon">
                  <i class="ion ion-bonfire"></i>
                </div>
                
              </div>
            </div><!-- ./col -->
            <div class="col-lg-3 col-xs-6">
              <!-- small box -->
              <div class="small-box bg-red">
                <div class="inner">
                  <h3 runat="server" id="lblNotabernacle"></h3>
                  <p>System Users</p>
                </div>
                <div class="icon">
                  <i class="ion ion-pie-graph"></i>
                </div>
               
              </div>
            </div><!-- ./col -->
          </div>

                <div class="row">
                    <div class="col-md-12">
                                    <telerik:RadHtmlChart runat="server" Width="100%" Height="500px" ID="chtAgeDistribution" Skin="Silk" DataSourceID="agedistSource">
            <PlotArea>
                <Series>
                    <telerik:ColumnSeries Name="Total Members" DataFieldY="MEMBERS">
                        <TooltipsAppearance Color="White"  />
                    </telerik:ColumnSeries>
                </Series>
                <XAxis  DataLabelsField="AGEGROUP">
                    <LabelsAppearance RotationAngle="75">
                    </LabelsAppearance>
                    <TitleAppearance Text="Age band">
                    </TitleAppearance>
                </XAxis>
                <YAxis>
                    <TitleAppearance Text="Total Members">
                    </TitleAppearance>
                </YAxis>
            </PlotArea>
            <Legend>
                <Appearance Visible="false">
                </Appearance>
            </Legend>
            <ChartTitle Text="Membership Age Distribution">
            </ChartTitle>
        </telerik:RadHtmlChart>

                    <asp:SqlDataSource ID="agedistSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT AGEGROUP, COUNT(MEMBERID) AS MEMBERS FROM MEMBERS GROUP BY AGEGROUP ORDER BY AGEGROUP"></asp:SqlDataSource>
                
                    <telerik:RadButton ID="btnExport" Text="Export to PDF" runat="server" OnClientClicked="exportRadHtmlChart" UseSubmitBehavior="false" AutoPostBack="false"></telerik:RadButton>
                    <telerik:RadClientExportManager ID="RadClientExportManager1" runat="server"></telerik:RadClientExportManager>

                    </div>

                </div>
            </div><!-- /.box-body -->
         
          </div><!-- /.box -->


      <script>
          var $ = $telerik.$;

          function exportRadHtmlChart() {
              $find('<%=RadClientExportManager1.ClientID%>').exportPDF($(".RadHtmlChart"));
        }

    </script>
</asp:Content>
