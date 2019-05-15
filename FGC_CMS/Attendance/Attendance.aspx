<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Attendance.aspx.cs" Inherits="FGC_CMS.Setups.Attendance" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div class="box box-default">
            <div class="box-header with-border">
              <h3 class="box-title">Attendance </h3>
              <div class="box-tools pull-right">
                <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
              </div>
            </div><!-- /.box-header -->
            <div class="box-body">
                <asp:UpdatePanel runat="server" >
                    <ContentTemplate>
                        <telerik:RadGrid ID="attendanceGrid" runat="server" AutoGenerateColumns="False" GroupPanelPosition="Top" AllowFilteringByColumn="True" AllowPaging="True" AllowSorting="True" CellSpacing="-1" DataSourceID="attendanceSource" GridLines="Both" OnItemCommand="attendanceGrid_ItemCommand" OnItemDeleted="attendanceGrid_ItemDeleted">
                            <ClientSettings>
                                <Scrolling AllowScroll="true" UseStaticHeaders="true" />
                                <Selecting AllowRowSelect="true" />
                            </ClientSettings>
                            <MasterTableView DataKeyNames="AttendanceID" DataSourceID="attendanceSource" AllowAutomaticDeletes="true" CommandItemDisplay="Top">
                                <Columns>
                                    <telerik:GridBoundColumn DataField="AttendanceID" DataType="System.Decimal" FilterControlAltText="Filter AttendanceID column" HeaderText="AttendanceID" ReadOnly="True" SortExpression="AttendanceID" UniqueName="AttendanceID" Display="false">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="Service" FilterControlAltText="Filter Service column" HeaderText="Service" SortExpression="Service" UniqueName="Service" FilterControlWidth="180px" ShowFilterIcon="false" AutoPostBackOnFilter="true">
                                    <HeaderStyle Width="200px" />
                                    </telerik:GridBoundColumn>
                                    <telerik:GridDateTimeColumn DataField="ServiceDate" DataType="System.DateTime" FilterControlAltText="Filter ServiceDate column" HeaderText="ServiceDate" SortExpression="ServiceDate" UniqueName="ServiceDate" FilterControlWidth="120px" ShowFilterIcon="false" AutoPostBackOnFilter="true" DataFormatString="{0:dd-MMM-yyyy}">
                                    <HeaderStyle Width="120px" />
                                    </telerik:GridDateTimeColumn>
                                    <telerik:GridBoundColumn DataField="Males" DataType="System.Decimal" FilterControlAltText="Filter Males column" HeaderText="Males" SortExpression="Males" UniqueName="Males" ShowFilterIcon="false" AutoPostBackOnFilter="true">
                                    <HeaderStyle Width="100px" />
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="Females" DataType="System.Decimal" FilterControlAltText="Filter Females column" HeaderText="Females" SortExpression="Females" UniqueName="Females" ShowFilterIcon="false" AutoPostBackOnFilter="true">
                                    <HeaderStyle Width="100px" />
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="Youth" DataType="System.Decimal" FilterControlAltText="Filter Youth column" HeaderText="Youth" SortExpression="Youth" UniqueName="Youth" ShowFilterIcon="false" AutoPostBackOnFilter="true">
                                    <HeaderStyle Width="100px" />
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="Children" DataType="System.Decimal" FilterControlAltText="Filter Children column" HeaderText="Children" SortExpression="Children" UniqueName="Children" ShowFilterIcon="false" AutoPostBackOnFilter="true">
                                    <HeaderStyle Width="100px" />
                                    </telerik:GridBoundColumn>
                                     <telerik:GridButtonColumn ButtonType="PushButton" CommandName="Edit" ButtonCssClass="btn-info" Text="Edit">
                                        <HeaderStyle Width="50px" />
                                    </telerik:GridButtonColumn>
                                    <telerik:GridButtonColumn Text="Delete" CommandName="Delete" UniqueName="Delete" ConfirmText="Delete Record?" ButtonType="PushButton" ButtonCssClass="btn-danger">
                                        <HeaderStyle Width="60px" />
                                    </telerik:GridButtonColumn>
                                </Columns>
                            </MasterTableView>
                           
                        </telerik:RadGrid>
                        <asp:SqlDataSource ID="attendanceSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Attendance] WHERE [AttendanceID] = @AttendanceID"  SelectCommand="SELECT [AttendanceID], [Service], [ServiceDate], [Males], [Females], [Youth], [Children] FROM [Attendance] ORDER BY [ServiceDate]">
                            <DeleteParameters>
                                <asp:Parameter Name="AttendanceID" Type="Decimal" />
                            </DeleteParameters>
                        </asp:SqlDataSource>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div><!-- /.box-body -->
         
          </div><!-- /.box -->

</asp:Content>
