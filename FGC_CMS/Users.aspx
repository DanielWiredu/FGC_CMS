<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="FGC_CMS.Users" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
     <div class="box box-default">
            <div class="box-header with-border">
              <h3 class="box-title">Users </h3>
              <div class="box-tools pull-right">
                <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
              </div>
            </div><!-- /.box-header -->
            <div class="box-body">
                <asp:UpdatePanel runat="server" >
                    <ContentTemplate>
                        <telerik:RadGrid ID="usersGrid" runat="server" AutoGenerateColumns="False" DataSourceID="userSource" GroupPanelPosition="Top" AllowFilteringByColumn="True" AllowPaging="True" AllowSorting="True" OnItemCommand="usersGrid_ItemCommand" OnItemDeleted="usersGrid_ItemDeleted">
                            <ClientSettings>
                                <Scrolling AllowScroll="True" UseStaticHeaders="True" />
                                <Selecting AllowRowSelect="true" />
                            </ClientSettings>
                            <GroupingSettings CaseSensitive="false" />
                            <MasterTableView DataKeyNames="UserID" DataSourceID="userSource" AllowAutomaticDeletes="true" CommandItemDisplay="Top" CommandItemSettings-AddNewRecordText="Add New User">
                                <Columns>
                                    <telerik:GridBoundColumn DataField="UserID" FilterControlAltText="Filter UserID column" HeaderText="User ID" SortExpression="UserID" UniqueName="UserID" AutoPostBackOnFilter="true" ShowFilterIcon="false" FilterControlWidth="100px" MaxLength="20">
                                        <HeaderStyle Width="120px" />
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="UserName" FilterControlAltText="Filter UserName column" HeaderText="User Name" SortExpression="UserName" UniqueName="UserName" AutoPostBackOnFilter="true" ShowFilterIcon="false" FilterControlWidth="240px" MaxLength="50">
                                    <HeaderStyle Width="250px" />
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="AccessLevel" FilterControlAltText="Filter AccessLevel column" HeaderText="Access Level" SortExpression="AccessLevel" UniqueName="AccessLevel" AutoPostBackOnFilter="true" ShowFilterIcon="false" FilterControlWidth="120px" MaxLength="50">
                                    <HeaderStyle Width="150px" />
                                    </telerik:GridBoundColumn>
                                    <telerik:GridButtonColumn ButtonType="PushButton" CommandName="Edit" ButtonCssClass="btn-info" Text="Edit">
                                        <HeaderStyle Width="40px" />
                                    </telerik:GridButtonColumn>
                                    <telerik:GridButtonColumn Text="Delete" CommandName="Delete" UniqueName="Delete" ConfirmText="Delete Record?" ButtonType="PushButton" ButtonCssClass="btn-danger">
                                        <HeaderStyle Width="50px" />
                                    </telerik:GridButtonColumn>
                                </Columns>
                                <EditFormSettings>
                                    <EditColumn FilterControlAltText="Filter EditCommandColumn1 column" UniqueName="EditCommandColumn1">
                                    </EditColumn>
                                </EditFormSettings>
                            </MasterTableView>
                        </telerik:RadGrid>
                        <asp:SqlDataSource ID="userSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Users] ORDER BY [UserID]" DeleteCommand="DELETE FROM [Users] WHERE [UserID] = @UserID">
                            <DeleteParameters>
                                <asp:Parameter Name="UserID" Type="Int32" />
                            </DeleteParameters>
                        </asp:SqlDataSource>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div><!-- /.box-body -->
         
          </div><!-- /.box -->

     <div class="modal fade" id="newusermodal">

    <div class="modal-dialog" style="width:50%">
        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                 <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">New User</h4>
                </div>
                        <div class="modal-body">
                             <div class="form-group">
                                 <div class="row">
                                       <div class="col-md-12">
                                        <label>User Name</label>
                                       <asp:TextBox runat="server" ID="txtUsername" Width="100%" MaxLength="20"></asp:TextBox>
                                   <asp:RequiredFieldValidator runat="server" ErrorMessage="Username is required" ControlToValidate="txtUsername" Display="Dynamic" ForeColor="Red" SetFocusOnError="true" ValidationGroup="newuser"></asp:RequiredFieldValidator>
                                </div>
                                 </div>
                             </div>
                            <div class="form-group">
                                   <div class="row">
                                       <div class="col-md-12">
                                             <label>Password</label>
                                       <asp:TextBox runat="server" ID="txtPassword" Width="100%" TextMode="Password"></asp:TextBox>
                                           <asp:RequiredFieldValidator runat="server" ErrorMessage="Password is required" ControlToValidate="txtPassword" Display="Dynamic" ForeColor="Red" SetFocusOnError="true" ValidationGroup="newuser"></asp:RequiredFieldValidator>
                                       </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="row">
                                     <div class="col-md-12">
                                        <label>Access Level</label>
                                          <telerik:RadDropDownList ID="dlAccessLevel" runat="server" Width="100%">
                                            <Items>
                                                <telerik:DropDownListItem Text="User"/>
                                                <telerik:DropDownListItem Text="Admin"/>
                                            </Items>
                                        </telerik:RadDropDownList>
                                </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="row">
                                     <div class="col-md-12">
                                        <label>Ministry</label>
                                         <telerik:RadDropDownList ID="dlMinistry" runat="server" Width="100%" DataSourceID="ministrySource" DataTextField="MinistryName" DataValueField="MinistryName" DefaultMessage="Select Ministry"></telerik:RadDropDownList>
                                         <asp:SqlDataSource ID="ministrySource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [MinistryName] FROM [Ministry]"></asp:SqlDataSource>
                                </div>
                                </div>
                            </div>   
                             
                       </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-warning" data-dismiss="modal">Close</button>
                    <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-success" OnClick="btnSave_Click" ValidationGroup="newuser" />
                </div>
            </div>
            </ContentTemplate>
        </asp:UpdatePanel>

        </div>
         </div>



             <div class="modal fade" id="editusermodal">

    <div class="modal-dialog" style="width:50%">
        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                  <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">Edit User</h4>
                </div>
                        <div class="modal-body">
                            <div class="form-group">
                                 <div class="row">
                                       <div class="col-md-12">
                                        <label>User Name</label>
                                       <asp:TextBox runat="server" ID="txtUname" Width="100%" MaxLength="20"></asp:TextBox>
                                      <asp:RequiredFieldValidator runat="server" ControlToValidate="txtUname" Display="Dynamic" ForeColor="Red" ErrorMessage="Username is required" SetFocusOnError="true" ValidationGroup="edituser"></asp:RequiredFieldValidator>
                                </div>
                                 </div>
                             </div>
                            <div class="form-group">
                                   <div class="row">
                                       <div class="col-md-12">
                                             <label>Password</label>
                                       <asp:TextBox runat="server" ID="txtUPass" Width="100%" TextMode="Password"></asp:TextBox>
                                           <asp:RequiredFieldValidator runat="server" ControlToValidate="txtUPass" Display="Dynamic" ForeColor="Red" ErrorMessage="Password is required" SetFocusOnError="true" ValidationGroup="edituser"></asp:RequiredFieldValidator>
                                       </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="row">
                                     <div class="col-md-12">
                                        <label>Access Level</label>
                                          <telerik:RadDropDownList ID="dlLevel" runat="server" Width="100%">
                                            <Items>
                                                <telerik:DropDownListItem Text="User" />
                                                <telerik:DropDownListItem Text="Admin"/>
                                            </Items>
                                        </telerik:RadDropDownList>
                                </div>
                                </div>
                            </div>
                             <div class="form-group">
                                <div class="row">
                                     <div class="col-md-12">
                                        <label>Ministry</label>
                                         <telerik:RadDropDownList ID="dlMinistry1" runat="server" Width="100%" DataSourceID="ministrySource" DataTextField="MinistryName" DataValueField="MinistryName" DefaultMessage="Select Ministry"></telerik:RadDropDownList>
                                </div>
                                </div>
                            </div> 
                       </div>

                <div class="modal-footer">
                     <button type="button" class="btn btn-warning" data-dismiss="modal">Close</button>
                    <asp:Button runat="server" ID="btnUpdate" CssClass="btn btn-success" Text="Update" OnClick="btnUpdate_Click" ValidationGroup="edituser"/>
                </div>
            </div>
            </ContentTemplate>
        </asp:UpdatePanel>

        </div>
    </div>
    <script type="text/javascript">
        function newuserModal() {
            $('#newusermodal').modal('show');
        }
        function closenewuserModal() {
            $('#newusermodal').modal('hide');
        }
        function edituserModal() {
            $('#editusermodal').modal('show');
        }
        function closeedituserModal() {
            $('#editusermodal').modal('hide');
        }
    </script>
</asp:Content>
