﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="BankTransactions.aspx.cs" Inherits="FGC_CMS.Financials.BankTransactions" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="box box-default">
            <div class="box-header with-border">
              <h3 class="box-title">Bank Transactions </h3>
              <div class="box-tools pull-right">
                <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
              </div>
            </div><!-- /.box-header -->
            <div class="box-body">
                <asp:Button runat="server" ID="btnAddNew" Text="Add New" CssClass="btn btn-success" PostBackUrl="~/Financials/NewBankTransaction.aspx" />
                         <asp:UpdatePanel runat="server" >
                    <ContentTemplate>
                        <telerik:RadGrid ID="bankTransGrid" runat="server" AllowFilteringByColumn="True" AllowPaging="True" AllowSorting="True" DataSourceID="banktranSource" GroupPanelPosition="Top" OnItemCommand="bankTransGrid_ItemCommand" OnItemDeleted="bankTransGrid_ItemDeleted">
                            <ClientSettings>
                                <Selecting AllowRowSelect="True" />
                                <Scrolling AllowScroll="True" UseStaticHeaders="True" />
                            </ClientSettings>
                            <GroupingSettings CaseSensitive="false" />
                            <MasterTableView AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="banktranSource" CommandItemDisplay="None" AllowAutomaticDeletes="true" CommandItemSettings-AddNewRecordText="Add Income">
                                <Columns>
                                    <telerik:GridBoundColumn DataField="id" DataType="System.Int32" FilterControlAltText="Filter id column" HeaderText="id" ReadOnly="True" SortExpression="id" UniqueName="id" AutoPostBackOnFilter="true" ShowFilterIcon="false" FilterControlWidth="80px" Display="false">
                                    <HeaderStyle Width="100px" />
                                    </telerik:GridBoundColumn>
                                    <telerik:GridDateTimeColumn DataField="TransDate" DataType="System.DateTime" FilterControlAltText="Filter TransDate column" HeaderText="Date" SortExpression="TransDate" UniqueName="TransDate" AutoPostBackOnFilter="true" ShowFilterIcon="false" FilterControlWidth="120px" DataFormatString="{0:dd-MMM-yyyy}">
                                    <HeaderStyle Width="150px" />
                                    </telerik:GridDateTimeColumn>
                                    <telerik:GridBoundColumn DataField="TransName" FilterControlAltText="Filter TransName column" HeaderText="Name" SortExpression="TransName" UniqueName="TransName" AutoPostBackOnFilter="true" ShowFilterIcon="false" FilterControlWidth="160px">
                                    <HeaderStyle Width="200px" />
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="TransType" FilterControlAltText="Filter TransType column" HeaderText="TransType" SortExpression="TransType" UniqueName="TransType" AutoPostBackOnFilter="true" ShowFilterIcon="false" FilterControlWidth="80px">
                                    <HeaderStyle Width="100px" />
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="TransBank" FilterControlAltText="Filter TransBank column" HeaderText="Bank" SortExpression="TransBank" UniqueName="TransBank" AutoPostBackOnFilter="true" ShowFilterIcon="false" FilterControlWidth="60px">
                                    <HeaderStyle Width="120px" />
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="TransMode" FilterControlAltText="Filter TransMode column" HeaderText="Mode" SortExpression="TransMode" UniqueName="TransMode" AutoPostBackOnFilter="true" ShowFilterIcon="false" FilterControlWidth="60px">
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
                        <asp:SqlDataSource ID="banktranSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [BankTransactions] WHERE [id] = @id" SelectCommand="SELECT [id], [TransDate], [TransName], [TransType], [TransBank], [TransMode], [Currency], [Amount] FROM [BankTransactions] ORDER BY [TransDate] DESC">
                            <DeleteParameters>
                                <asp:Parameter Name="id" Type="Int32" />
                            </DeleteParameters>
                        </asp:SqlDataSource>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div><!-- /.box-body -->
         
          </div><!-- /.box -->

</asp:Content>
