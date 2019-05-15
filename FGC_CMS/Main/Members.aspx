<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Members.aspx.cs" Inherits="FGC_CMS.Main.Members" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
                     <div class="box box-default">
            <div class="box-header with-border">
              <h3 class="box-title">Members </h3>
              <div class="box-tools pull-right">
                <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
              </div>
            </div><!-- /.box-header -->
            <div class="box-body">
                <asp:UpdatePanel runat="server" >
                    <ContentTemplate>
                           
                    <asp:Button ID="btnSave" CssClass="btn btn-primary" runat="server" Text="Add Member" OnClick="btnSave_Click"/>         
                <div>
                    &nbsp;
                </div>

                        <telerik:RadGrid ID="memberGrid" runat="server" AutoGenerateColumns="False"  GroupPanelPosition="Top" AllowFilteringByColumn="True" AllowPaging="True" AllowSorting="True" CellSpacing="-1" DataSourceID="memeberSource" GridLines="Both" OnItemCommand="memberGrid_ItemCommand" OnItemDeleted="memberGrid_ItemDeleted">
                            <ClientSettings>
                                <Scrolling AllowScroll="True" UseStaticHeaders="True" />
                                <Selecting AllowRowSelect="true" />
                            </ClientSettings>
                            <GroupingSettings CaseSensitive="false" />
                           
                            <MasterTableView DataKeyNames="MemberID" DataSourceID="memeberSource" CommandItemDisplay="Top" CommandItemSettings-AddNewRecordText="Add New Member" AllowAutomaticDeletes="true">
                                <Columns>
                                    <telerik:GridBoundColumn DataField="MemberID" FilterControlAltText="Filter MemberID column" HeaderText="MemberID" ReadOnly="True" SortExpression="MemberID" UniqueName="MemberID" AutoPostBackOnFilter="true" ShowFilterIcon="false" FilterControlWidth="110px" >
                                        <HeaderStyle Width="120px" />
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="Surname" FilterControlAltText="Filter Surname column" HeaderText="Surname" SortExpression="Surname" UniqueName="Surname" AutoPostBackOnFilter="true" ShowFilterIcon="false" FilterControlWidth="140px">
                                     <HeaderStyle Width="150px" />
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="Firstname" FilterControlAltText="Filter Firstname column" HeaderText="Firstname" SortExpression="Firstname" UniqueName="Firstname" AutoPostBackOnFilter="true" ShowFilterIcon="false" FilterControlWidth="140px">
                                     <HeaderStyle Width="150px" />
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="Gender" FilterControlAltText="Filter Gender column" HeaderText="Gender" SortExpression="Gender" UniqueName="Gender" AutoPostBackOnFilter="true" ShowFilterIcon="false" FilterControlWidth="80px">
                                     <HeaderStyle Width="100px" />
                                    </telerik:GridBoundColumn>
                                    <telerik:GridDateTimeColumn DataField="Birthday" DataType="System.DateTime" FilterControlAltText="Filter Birthday column" HeaderText="Birthday" SortExpression="Birthday" UniqueName="Birthday" AutoPostBackOnFilter="true" ShowFilterIcon="false" FilterControlWidth="140px" DataFormatString="{0:dd-MMM-yyyy}">
                                     <HeaderStyle Width="150px" />
                                    </telerik:GridDateTimeColumn>
                                    <telerik:GridBoundColumn DataField="Mobile" FilterControlAltText="Filter Mobile column" HeaderText="Mobile" SortExpression="Mobile" UniqueName="Mobile" AutoPostBackOnFilter="true" ShowFilterIcon="false" FilterControlWidth="110px" >
                                     <HeaderStyle Width="120px" />
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
                        <asp:SqlDataSource ID="memeberSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT MemberID, Surname, Firstname, Gender, Birthday, Mobile FROM Members WHERE (Ministry LIKE @ministry + '%')" DeleteCommand="DELETE FROM [Members] WHERE [MemberID] = @MemberID">
                            <DeleteParameters>
                                <asp:Parameter Name="MemberID" Type="String" />
                            </DeleteParameters>
                            <SelectParameters>
                                <asp:SessionParameter Name="ministry" SessionField="userministry" ConvertEmptyStringToNull="false" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div><!-- /.box-body -->
         
          </div><!-- /.box -->

</asp:Content>
