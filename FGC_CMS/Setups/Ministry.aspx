<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Ministry.aspx.cs" Inherits="FGC_CMS.Setups.Ministry" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
             <div class="box box-default">
            <div class="box-header with-border">
              <h3 class="box-title">Ministries </h3>
              <div class="box-tools pull-right">
                <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
              </div>
            </div><!-- /.box-header -->
            <div class="box-body">
                <asp:UpdatePanel runat="server" >
                    <ContentTemplate>
                        <telerik:RadGrid ID="ministryGrid" runat="server" AutoGenerateColumns="False" DataSourceID="ministrySource" GroupPanelPosition="Top" AllowFilteringByColumn="True" AllowPaging="True" AllowSorting="True" OnItemDeleted="ministryGrid_ItemDeleted" OnItemCommand="ministryGrid_ItemCommand">
                            <ClientSettings>
                                <Scrolling AllowScroll="True" UseStaticHeaders="True" />
                                <Selecting AllowRowSelect="true" />
                            </ClientSettings>
                            <GroupingSettings CaseSensitive="false" />
                            <MasterTableView DataKeyNames="MinistryCode" DataSourceID="ministrySource" AllowAutomaticDeletes="true" CommandItemDisplay="Top" CommandItemSettings-AddNewRecordText="Add New Ministry">
                                <Columns>
                                    <telerik:GridBoundColumn DataField="MinistryCode" FilterControlAltText="Filter MinistryCode column" HeaderText="Ministry Code" SortExpression="MinistryCode" UniqueName="MinistryCode" AutoPostBackOnFilter="true" ShowFilterIcon="false" FilterControlWidth="80px" ReadOnly="true" Display="false">
                                        <HeaderStyle Width="80px" />
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="MinistryName" FilterControlAltText="Filter MinistryName column" HeaderText="Ministry Name" SortExpression="MinistryName" UniqueName="MinistryName" AutoPostBackOnFilter="true" ShowFilterIcon="false" FilterControlWidth="250px" MaxLength="50">
                                    <HeaderStyle Width="250px" />
                                         <ColumnValidationSettings EnableRequiredFieldValidation="True">
                                            <RequiredFieldValidator ForeColor="Red" ErrorMessage="Required Field" SetFocusOnError="true" Display="Dynamic"></RequiredFieldValidator>
                                        </ColumnValidationSettings>
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="MinistryHead" FilterControlAltText="Filter MinistryHead column" HeaderText="Ministry Head" SortExpression="MinistryHead" UniqueName="MinistryHead" FilterControlWidth="150px" AutoPostBackOnFilter="true" ShowFilterIcon="false" MaxLength="50" EmptyDataText="">
                                    <HeaderStyle Width="150px" />
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="Contact" FilterControlAltText="Filter Contact column" HeaderText="Contact" SortExpression="Contact" UniqueName="Contact" FilterControlWidth="120px" AutoPostBackOnFilter="true" ShowFilterIcon="false" MaxLength="30" EmptyDataText="">
                                    <HeaderStyle Width="120px" />
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
                        <asp:SqlDataSource ID="ministrySource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Ministry] ORDER BY [MinistryCode]" DeleteCommand="DELETE FROM [Ministry] WHERE [MinistryCode] = @MinistryCode" InsertCommand="INSERT INTO Ministry(MinistryName, MinistryHead, Contact) VALUES (@MinistryName, @MinistryHead, @Contact)" UpdateCommand="UPDATE [Ministry] SET [MinistryName] = @MinistryName, [MinistryHead] = @MinistryHead, [Contact] = @Contact WHERE [MinistryCode] = @MinistryCode">
                            <DeleteParameters>
                                <asp:Parameter Name="MinistryCode" Type="String" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="MinistryName" Type="String" />
                                <asp:Parameter Name="MinistryHead" Type="String" />
                                <asp:Parameter Name="Contact" Type="String" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="MinistryName" Type="String" />
                                <asp:Parameter Name="MinistryHead" Type="String" />
                                <asp:Parameter Name="Contact" Type="String" />
                                <asp:Parameter Name="MinistryCode" Type="String" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div><!-- /.box-body -->
         
          </div><!-- /.box -->

     <!-- new ministry modal -->
         <div class="modal fade" id="newministrymodal">
    <div class="modal-dialog" style="width:50%">
        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                 <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">New Ministry</h4>
                </div>
                        <div class="modal-body">
                             <div class="form-group">
                                 <div class="row">
                                       <div class="col-md-12">
                                        <label>Ministry Name</label>
                                       <asp:TextBox runat="server" ID="txtMinistryName" Width="100%" MaxLength="50"></asp:TextBox>
                                   <asp:RequiredFieldValidator runat="server" ErrorMessage="Required Field" ControlToValidate="txtMinistryName" Display="Dynamic" ForeColor="Red" SetFocusOnError="true" ValidationGroup="newministry"></asp:RequiredFieldValidator>
                                </div>
                                 </div>
                             </div>
                            <div class="form-group">
                                   <div class="row">
                                       <div class="col-md-12">
                                             <label>Ministry Head</label>
                                       <asp:TextBox runat="server" ID="txtMinistryHead" Width="100%" MaxLength="50"></asp:TextBox>
                                       </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="row">
                                     <div class="col-md-12">
                                        <label>Contact</label>
                                         <asp:TextBox runat="server" ID="txtContact" Width="100%" TextMode="Number" MaxLength="30"></asp:TextBox>
                                </div>
                                </div>
                            </div>
                       </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-warning" data-dismiss="modal">Close</button>
                    <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-success" ValidationGroup="newministry" OnClick="btnSave_Click" />
                </div>
            </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        </div>
         </div>

    <!-- edit ministry modal -->
         <div class="modal fade" id="editministrymodal">
    <div class="modal-dialog" style="width:50%">
        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                 <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">Edit Ministry</h4>
                </div>
                        <div class="modal-body">
                             <div class="form-group">
                                 <div class="row">
                                       <div class="col-md-12">
                                        <label>Ministry Name</label>
                                       <asp:TextBox runat="server" ID="txtMinistryName1" Width="100%" MaxLength="50"></asp:TextBox>
                                   <asp:RequiredFieldValidator runat="server" ErrorMessage="Required Field" ControlToValidate="txtMinistryName1" Display="Dynamic" ForeColor="Red" SetFocusOnError="true" ValidationGroup="editministry"></asp:RequiredFieldValidator>
                                </div>
                                 </div>
                             </div>
                            <div class="form-group">
                                   <div class="row">
                                       <div class="col-md-12">
                                             <label>Ministry Head</label>
                                       <asp:TextBox runat="server" ID="txtMinistryHead1" Width="100%" MaxLength="50"></asp:TextBox>
                                       </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="row">
                                     <div class="col-md-12">
                                        <label>Contact</label>
                                         <asp:TextBox runat="server" ID="txtContact1" Width="100%" TextMode="Number" MaxLength="30"></asp:TextBox>
                                </div>
                                </div>
                            </div>
                       </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-warning" data-dismiss="modal">Close</button>
                    <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="btn btn-success" ValidationGroup="editministry" OnClick="btnUpdate_Click"/>
                </div>
            </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        </div>
         </div>

        <script type="text/javascript">
            function newministryModal() {
                $('#newministrymodal').modal('show');
            }
            function closenewministryModal() {
                $('#newministrymodal').modal('hide');
            }
            function editministryModal() {
                $('#editministrymodal').modal('show');
            }
            function closeeditministryModal() {
                $('#editministrymodal').modal('hide');
            }
    </script>
</asp:Content>
