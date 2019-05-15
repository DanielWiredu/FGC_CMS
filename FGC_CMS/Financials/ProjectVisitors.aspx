<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="ProjectVisitors.aspx.cs" Inherits="FGC_CMS.Financials.ProjectVisitors" %>

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
                 <asp:UpdatePanel runat="server" >
                    <ContentTemplate>
                         <telerik:RadGrid ID="visitorsGrid" runat="server" AutoGenerateColumns="False"  GroupPanelPosition="Top" AllowFilteringByColumn="True" AllowPaging="True" AllowSorting="True" CellSpacing="-1" DataSourceID="visitorSource" GridLines="Both" OnItemCommand="visitorsGrid_ItemCommand" >
                            <ClientSettings>
                                <Scrolling AllowScroll="True" UseStaticHeaders="True" />
                                <Selecting AllowRowSelect="true" />
                               <Scrolling AllowScroll="true" ScrollHeight="350px" />
                            </ClientSettings>
                            <GroupingSettings CaseSensitive="false" />
                           
                            <MasterTableView DataKeyNames="VisitorID" DataSourceID="visitorSource" >
                                <Columns>
                                    <telerik:GridBoundColumn DataField="VisitorID" FilterControlAltText="Filter VisitorID column" HeaderText="VisitorID" ReadOnly="True" SortExpression="VisitorID" UniqueName="VisitorID" AutoPostBackOnFilter="true" ShowFilterIcon="false" FilterControlWidth="90px" >
                                        <HeaderStyle Width="110px" />
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="Surname" FilterControlAltText="Filter Surname column" HeaderText="Surname" SortExpression="Surname" UniqueName="Surname" AutoPostBackOnFilter="true" ShowFilterIcon="false" FilterControlWidth="120px">
                                     <HeaderStyle Width="150px" />
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="Othername" FilterControlAltText="Filter Othername column" HeaderText="Othername" SortExpression="Othername" UniqueName="Othername" AutoPostBackOnFilter="true" ShowFilterIcon="false" FilterControlWidth="120px" EmptyDataText="" >
                                     <HeaderStyle Width="150px" />
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="Gender" FilterControlAltText="Filter Gender column" HeaderText="Gender" SortExpression="Gender" UniqueName="Gender" AutoPostBackOnFilter="true" ShowFilterIcon="false" FilterControlWidth="80px">
                                     <HeaderStyle Width="100px" />
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="Telephone" FilterControlAltText="Filter Telephone column" HeaderText="Telephone" SortExpression="Telephone" UniqueName="Telephone" AutoPostBackOnFilter="true" ShowFilterIcon="false" FilterControlWidth="80px" EmptyDataText="" >
                                     <HeaderStyle Width="100px" />
                                    </telerik:GridBoundColumn>
                                     <telerik:GridButtonColumn ButtonType="PushButton" CommandName="Payment" ButtonCssClass="btn-info" Text="Payments">
                                        <HeaderStyle Width="80px" />
                                    </telerik:GridButtonColumn>
                                </Columns>
                            </MasterTableView>
                           
                        </telerik:RadGrid>
                        <asp:SqlDataSource ID="visitorSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT VisitorID, Surname, Othername, Gender, Telephone FROM Visitors" DeleteCommand="DELETE FROM [Visitors] WHERE [VisitorID] = @VisitorID">
                            <DeleteParameters>
                                <asp:Parameter Name="VisitorID" Type="String" />
                            </DeleteParameters>
                        </asp:SqlDataSource>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div><!-- /.box-body -->
         
          </div><!-- /.box -->

</asp:Content>
