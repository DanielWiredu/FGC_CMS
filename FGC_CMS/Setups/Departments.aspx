<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Departments.aspx.cs" Inherits="FGC_CMS.Setups.Departments" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
         <div class="box box-default">
            <div class="box-header with-border">
              <h3 class="box-title">Departments </h3>
              <div class="box-tools pull-right">
                <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
              </div>
            </div><!-- /.box-header -->
            <div class="box-body">
                <asp:UpdatePanel runat="server" >
                    <ContentTemplate>
                        <telerik:RadGrid ID="deptsGrid" runat="server" AutoGenerateColumns="False" DataSourceID="deptSource" GroupPanelPosition="Top" AllowFilteringByColumn="True" AllowPaging="True" AllowSorting="True" OnItemDeleted="deptsGrid_ItemDeleted" OnItemCommand="deptsGrid_ItemCommand">
                            <ClientSettings>
                                <Scrolling AllowScroll="True" UseStaticHeaders="True" />
                                <Selecting AllowRowSelect="true" />
                            </ClientSettings>
                            <GroupingSettings CaseSensitive="false" />
                            <MasterTableView DataKeyNames="DeptCode" DataSourceID="deptSource" AllowAutomaticDeletes="true" CommandItemDisplay="Top" CommandItemSettings-AddNewRecordText="Add New Department">
                                <Columns>
                                    <telerik:GridBoundColumn DataField="DeptCode" FilterControlAltText="Filter DeptCode column" HeaderText="Department Code" SortExpression="DeptCode" UniqueName="DeptCode" AutoPostBackOnFilter="true" ShowFilterIcon="false" FilterControlWidth="80px" Display="false" ReadOnly="true">
                                        <HeaderStyle Width="80px" />
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="DeptName" FilterControlAltText="Filter DeptName column" HeaderText="Department Name" SortExpression="DeptName" UniqueName="DeptName" AutoPostBackOnFilter="true" ShowFilterIcon="false" FilterControlWidth="250px" MaxLength="50">
                                    <HeaderStyle Width="250px" />
                                         <ColumnValidationSettings EnableRequiredFieldValidation="True">
                                            <RequiredFieldValidator ForeColor="Red" ErrorMessage="Required Field" SetFocusOnError="true" Display="Dynamic"></RequiredFieldValidator>
                                        </ColumnValidationSettings>
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="DeptHead" FilterControlAltText="Filter DeptHead column" HeaderText="Department Head" SortExpression="DeptHead" UniqueName="DeptHead" FilterControlWidth="150px" AutoPostBackOnFilter="true" ShowFilterIcon="false" MaxLength="50" EmptyDataText="">
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
                        <asp:SqlDataSource ID="deptSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Department] ORDER BY [DeptCode]" DeleteCommand="DELETE FROM Department WHERE (DeptCode = @DeptCode)" InsertCommand="INSERT INTO Department(DeptName, DeptHead, Contact) VALUES (@DeptName, @DeptHead, @Contact)" UpdateCommand="UPDATE [Department] SET [DeptName] = @DeptName, [DeptHead] = @DeptHead, [Contact] = @Contact WHERE [DeptCode] = @DeptCode">
                            <DeleteParameters>
                                <asp:Parameter Name="DeptCode" Type="String" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="DeptName" Type="String" />
                                <asp:Parameter Name="DeptHead" Type="String" />
                                <asp:Parameter Name="Contact" Type="String" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="DeptName" Type="String" />
                                <asp:Parameter Name="DeptHead" Type="String" />
                                <asp:Parameter Name="Contact" Type="String" />
                                <asp:Parameter Name="DeptCode" Type="String" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div><!-- /.box-body -->
         
          </div><!-- /.box -->


     <!-- new department modal -->
         <div class="modal fade" id="newdeptmodal">
    <div class="modal-dialog" style="width:50%">
        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                 <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">New Department</h4>
                </div>
                        <div class="modal-body">
                             <div class="form-group">
                                 <div class="row">
                                       <div class="col-md-12">
                                        <label>Department Name</label>
                                       <asp:TextBox runat="server" ID="txtDeptName" Width="100%" MaxLength="50"></asp:TextBox>
                                   <asp:RequiredFieldValidator runat="server" ErrorMessage="Required Field" ControlToValidate="txtDeptName" Display="Dynamic" ForeColor="Red" SetFocusOnError="true" ValidationGroup="newdept"></asp:RequiredFieldValidator>
                                </div>
                                 </div>
                             </div>
                            <div class="form-group">
                                   <div class="row">
                                       <div class="col-md-12">
                                             <label>Department Head</label>
                                       <asp:TextBox runat="server" ID="txtDeptHead" Width="100%" MaxLength="50"></asp:TextBox>
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
                    <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-success" ValidationGroup="newdept" OnClick="btnSave_Click" />
                </div>
            </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        </div>
         </div>

    <!-- edit department modal -->
         <div class="modal fade" id="editdeptmodal">
    <div class="modal-dialog" style="width:50%">
        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                 <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">Edit Department</h4>
                </div>
                        <div class="modal-body">
                             <div class="form-group">
                                 <div class="row">
                                       <div class="col-md-12">
                                        <label>Department Name</label>
                                       <asp:TextBox runat="server" ID="txtDeptName1" Width="100%" MaxLength="50"></asp:TextBox>
                                   <asp:RequiredFieldValidator runat="server" ErrorMessage="Required Field" ControlToValidate="txtDeptName1" Display="Dynamic" ForeColor="Red" SetFocusOnError="true" ValidationGroup="editdept"></asp:RequiredFieldValidator>
                                </div>
                                 </div>
                             </div>
                            <div class="form-group">
                                   <div class="row">
                                       <div class="col-md-12">
                                             <label>Deparment Head</label>
                                       <asp:TextBox runat="server" ID="txtDeptHead1" Width="100%" MaxLength="50"></asp:TextBox>
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
                    <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="btn btn-success" ValidationGroup="editdept" OnClick="btnUpdate_Click"/>
                </div>
            </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        </div>
         </div>

        <script type="text/javascript">
            function newdeptModal() {
                $('#newdeptmodal').modal('show');
            }
            function closenewdeptModal() {
                $('#newdeptmodal').modal('hide');
            }
            function editdeptModal() {
                $('#editdeptmodal').modal('show');
            }
            function closeeditdeptModal() {
                $('#editdeptmodal').modal('hide');
            }
    </script>

</asp:Content>
