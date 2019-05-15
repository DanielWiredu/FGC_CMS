<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="IncomeList.aspx.cs" Inherits="FGC_CMS.Financials.IncomeList" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="box box-default">
            <div class="box-header with-border">
              <h3 class="box-title">Income </h3>
              <div class="box-tools pull-right">
                <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
              </div>
            </div><!-- /.box-header -->
            <div class="box-body">
                <asp:Button runat="server" ID="btnAddNew" Text="Add Income" CssClass="btn btn-success" OnClick="btnAddNew_Click" />
                         <asp:UpdatePanel runat="server" >
                    <ContentTemplate>
                        <telerik:RadGrid ID="paymentsGrid" runat="server" AllowFilteringByColumn="True" AllowPaging="True" AllowSorting="True" DataSourceID="paymentsSource" GroupPanelPosition="Top" OnItemCommand="paymentsGrid_ItemCommand" OnItemDeleted="paymentsGrid_ItemDeleted">
                            <ClientSettings>
                                <Selecting AllowRowSelect="True" />
                                <Scrolling AllowScroll="True" UseStaticHeaders="True" />
                            </ClientSettings>
                            <GroupingSettings CaseSensitive="false" />
                            <MasterTableView AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="paymentsSource" CommandItemDisplay="None" AllowAutomaticDeletes="true" CommandItemSettings-AddNewRecordText="Add Income">
                                <Columns>
                                    <telerik:GridBoundColumn DataField="id" DataType="System.Int32" FilterControlAltText="Filter id column" HeaderText="id" ReadOnly="True" SortExpression="id" UniqueName="id" AutoPostBackOnFilter="true" ShowFilterIcon="false" FilterControlWidth="80px" Display="false">
                                    <HeaderStyle Width="100px" />
                                    </telerik:GridBoundColumn>
                                    <telerik:GridDateTimeColumn DataField="Paydate" DataType="System.DateTime" FilterControlAltText="Filter Paydate column" HeaderText="Date" SortExpression="Paydate" UniqueName="Paydate" AutoPostBackOnFilter="true" ShowFilterIcon="false" FilterControlWidth="120px" DataFormatString="{0:dd-MMM-yyyy}">
                                    <HeaderStyle Width="150px" />
                                    </telerik:GridDateTimeColumn>
                                    <telerik:GridBoundColumn DataField="Payname" FilterControlAltText="Filter Payname column" HeaderText="Name" SortExpression="Payname" UniqueName="Payname" AutoPostBackOnFilter="true" ShowFilterIcon="false" FilterControlWidth="160px">
                                    <HeaderStyle Width="200px" />
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="Description" FilterControlAltText="Filter Description column" HeaderText="Description" SortExpression="Description" UniqueName="Description" AutoPostBackOnFilter="true" ShowFilterIcon="false" FilterControlWidth="160px">
                                    <HeaderStyle Width="200px" />
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="PayMode" FilterControlAltText="Filter PayMode column" HeaderText="PayMode" SortExpression="PayMode" UniqueName="PayMode" AutoPostBackOnFilter="true" ShowFilterIcon="false" FilterControlWidth="60px">
                                    <HeaderStyle Width="80px" />
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="Currency" FilterControlAltText="Filter Currency column" HeaderText="Currency" SortExpression="Currency" UniqueName="Currency" AutoPostBackOnFilter="true" ShowFilterIcon="false" FilterControlWidth="50px">
                                    <HeaderStyle Width="70px" />
                                    </telerik:GridBoundColumn>
                                    <telerik:GridNumericColumn DataField="Amount" FilterControlAltText="Filter Amount column" HeaderText="Amount" SortExpression="Amount" UniqueName="Amount" AutoPostBackOnFilter="true" ShowFilterIcon="false" FilterControlWidth="100px" DataFormatString="{0:N02}">
                                    <HeaderStyle Width="120px" />
                                    </telerik:GridNumericColumn>
                                    <telerik:GridButtonColumn ButtonType="PushButton" CommandName="Edit" ButtonCssClass="btn-info" Text="Edit">
                                        <HeaderStyle Width="50px" />
                                    </telerik:GridButtonColumn>
                                    <telerik:GridButtonColumn Text="Delete" CommandName="Delete" UniqueName="Delete" ConfirmText="Delete Record?" ButtonType="PushButton" ButtonCssClass="btn-danger">
                                        <HeaderStyle Width="60px" />
                                    </telerik:GridButtonColumn>
                                </Columns>
                            </MasterTableView>
                        </telerik:RadGrid>
                        <asp:SqlDataSource ID="paymentsSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Payments] WHERE [id] = @id" SelectCommand="SELECT [id], [Paydate], [Payname], [Description], [PayMode], [Currency], [Amount] FROM [Payments] WHERE [PayType] = 'Income' ORDER BY [Paydate] DESC">
                            <DeleteParameters>
                                <asp:Parameter Name="id" Type="Int32" />
                            </DeleteParameters>
                        </asp:SqlDataSource>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div><!-- /.box-body -->
         
          </div><!-- /.box -->

</asp:Content>
