<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Visitors.aspx.cs" Inherits="FGC_CMS.Main.Visitors" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  
                     <div class="box box-default">
            <div class="box-header with-border">
              <h3 class="box-title">Visitors </h3>
              <div class="box-tools pull-right">
                <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
              </div>
            </div><!-- /.box-header -->
            <div class="box-body">

                <div class="row">
                                        <div class="col-sm-4 pull-right" style="width:inherit">
                                           <asp:Button runat="server" ID="btnExcelExport" CssClass="btn btn-success" Text="Excel" CausesValidation="false" OnClick="btnExcelExport_Click"/>
                                            <asp:Button runat="server" ID="btnPDFExport" CssClass="btn btn-warning" Text="PDF" CausesValidation="false" OnClick="btnPDFExport_Click"/>
                                        </div>
                                        <div class="col-sm-8 pull-left">
                                            <div class="toolbar-btn-action">
                                                                <asp:Button runat="server" Text="Add Visitor" CssClass="btn btn-primary" PostBackUrl="~/Main/NewVisitor.aspx" />
                                            </div>
                                        </div>
                                    </div>

                         <asp:UpdatePanel runat="server" >
                    <ContentTemplate>
                         <telerik:RadGrid ID="visitorsGrid" runat="server" AutoGenerateColumns="False"  GroupPanelPosition="Top" AllowFilteringByColumn="True" AllowPaging="True" AllowSorting="True" CellSpacing="-1" DataSourceID="visitorSource" GridLines="Both" OnItemCommand="visitorsGrid_ItemCommand" OnItemDeleted="visitorsGrid_ItemDeleted" >
                            <ClientSettings>
                                <Scrolling AllowScroll="True" UseStaticHeaders="True" />
                                <Selecting AllowRowSelect="true" />
                               <Scrolling AllowScroll="true" ScrollHeight="350px" />
                            </ClientSettings>
                            <GroupingSettings CaseSensitive="false" />
                           <ExportSettings IgnorePaging="true" ExportOnlyData="true" OpenInNewWindow="true" FileName="visitors" HideStructureColumns="true" >
                                        <Pdf AllowPrinting="true" AllowCopy="true" PaperSize="Letter" PageTitle="Visitors" PageWidth="800"></Pdf>
                                    </ExportSettings>
                            <MasterTableView DataKeyNames="VisitorID" DataSourceID="visitorSource" CommandItemDisplay="None" CommandItemSettings-AddNewRecordText="Add New Visitor" AllowAutomaticDeletes="true">
                                <Columns>
                                    <telerik:GridBoundColumn DataField="VisitorID" FilterControlAltText="Filter VisitorID column" HeaderText="VisitorID" ReadOnly="True" SortExpression="VisitorID" UniqueName="VisitorID" AutoPostBackOnFilter="true" ShowFilterIcon="false" FilterControlWidth="90px" >
                                        <HeaderStyle Width="110px" />
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="Surname" FilterControlAltText="Filter Surname column" HeaderText="Surname" SortExpression="Surname" UniqueName="Surname" AutoPostBackOnFilter="true" ShowFilterIcon="false" FilterControlWidth="120px">
                                     <HeaderStyle Width="150px" />
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="Othername" FilterControlAltText="Filter Othername column" HeaderText="Othername" SortExpression="Othername" UniqueName="Othername" AutoPostBackOnFilter="true" ShowFilterIcon="false" FilterControlWidth="120px">
                                     <HeaderStyle Width="150px" />
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="Gender" FilterControlAltText="Filter Gender column" HeaderText="Gender" SortExpression="Gender" UniqueName="Gender" AutoPostBackOnFilter="true" ShowFilterIcon="false" FilterControlWidth="80px">
                                     <HeaderStyle Width="100px" />
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="Telephone" FilterControlAltText="Filter Telephone column" HeaderText="Telephone" SortExpression="Telephone" UniqueName="Telephone" AutoPostBackOnFilter="true" ShowFilterIcon="false" FilterControlWidth="80px" >
                                     <HeaderStyle Width="100px" />
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="VisitType" FilterControlAltText="Filter VisitType column" HeaderText="Visit Type" SortExpression="VisitType" UniqueName="VisitType" AutoPostBackOnFilter="true" ShowFilterIcon="false" FilterControlWidth="80px" >
                                     <HeaderStyle Width="100px" />
                                    </telerik:GridBoundColumn>
                                     <telerik:GridButtonColumn ButtonType="PushButton" CommandName="Edit" ButtonCssClass="btn-info" Text="Edit" Exportable="false">
                                        <HeaderStyle Width="50px" />
                                    </telerik:GridButtonColumn>
                                    <telerik:GridButtonColumn Text="Delete" CommandName="Delete" UniqueName="Delete" ConfirmText="Delete Visitor?" ButtonType="PushButton" ButtonCssClass="btn-danger" Exportable="false">
                                        <HeaderStyle Width="60px" />
                                    </telerik:GridButtonColumn>
                                </Columns>
                            </MasterTableView>
                           
                        </telerik:RadGrid>
                        <asp:SqlDataSource ID="visitorSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT VisitorID, Surname, Othername, Gender, Telephone, VisitType FROM Visitors" DeleteCommand="DELETE FROM [Visitors] WHERE [VisitorID] = @VisitorID">
                            <DeleteParameters>
                                <asp:Parameter Name="VisitorID" Type="String" />
                            </DeleteParameters>
                        </asp:SqlDataSource>
                    </ContentTemplate>
                              <Triggers>
                                  <asp:PostBackTrigger ControlID="btnExcelExport" />
                                  <asp:PostBackTrigger ControlID="btnPDFExport" />
                              </Triggers>
                </asp:UpdatePanel>
            </div><!-- /.box-body -->
         
          </div><!-- /.box -->
</asp:Content>
