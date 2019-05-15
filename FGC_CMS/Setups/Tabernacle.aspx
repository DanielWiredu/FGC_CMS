<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Tabernacle.aspx.cs" Inherits="FGC_CMS.Setups.Tabernacle" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
          <div class="box box-default">
            <div class="box-header with-border">
              <h3 class="box-title">Tabernacles </h3>
              <div class="box-tools pull-right">
                <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
              </div>
            </div><!-- /.box-header -->
            <div class="box-body">
                <asp:UpdatePanel runat="server" >
                    <ContentTemplate>
                        <telerik:RadGrid ID="tabGrid" runat="server" AutoGenerateColumns="False" DataSourceID="tabSource" GroupPanelPosition="Top" AllowFilteringByColumn="True" AllowPaging="True" AllowSorting="True" OnItemDeleted="tabGrid_ItemDeleted" OnItemCommand="tabGrid_ItemCommand">
                            <ClientSettings>
                                <Scrolling AllowScroll="True" UseStaticHeaders="True" />
                                <Selecting AllowRowSelect="true" />
                            </ClientSettings>
                            <GroupingSettings CaseSensitive="false" />
                            <MasterTableView DataKeyNames="TabCode" DataSourceID="tabSource" AllowAutomaticDeletes="true" CommandItemDisplay="Top" CommandItemSettings-AddNewRecordText="Add New Tabernacle">
                                <Columns>
                                    <telerik:GridBoundColumn DataField="TabCode" FilterControlAltText="Filter TabCode column" HeaderText="Tabernacle Code" SortExpression="TabCode" UniqueName="TabCode" AutoPostBackOnFilter="true" ShowFilterIcon="false" FilterControlWidth="80px" Display="false" ReadOnly="true">
                                        <HeaderStyle Width="80px" />
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="TabName" FilterControlAltText="Filter TabName column" HeaderText="Tabernacle Name" SortExpression="TabName" UniqueName="TabName" AutoPostBackOnFilter="true" ShowFilterIcon="false" FilterControlWidth="250px" MaxLength="50">
                                    <HeaderStyle Width="250px" />
                                         <ColumnValidationSettings EnableRequiredFieldValidation="True">
                                            <RequiredFieldValidator ForeColor="Red" ErrorMessage="Required Field" SetFocusOnError="true" Display="Dynamic"></RequiredFieldValidator>
                                        </ColumnValidationSettings>
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="TabHead" FilterControlAltText="Filter TabHead column" HeaderText="Tabernacle Shepherd" SortExpression="TabHead" UniqueName="TabHead" FilterControlWidth="150px" AutoPostBackOnFilter="true" ShowFilterIcon="false" MaxLength="50" EmptyDataText="">
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
                                    <EditColumn FilterControlAltText="Filter EditTabandColumn1 column" UniqueName="EditTabandColumn1">
                                    </EditColumn>
                                </EditFormSettings>
                            </MasterTableView>
                        </telerik:RadGrid>
                        <asp:SqlDataSource ID="tabSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Tabernacle] ORDER BY [TabCode]" DeleteCommand="DELETE FROM [Tabernacle] WHERE [TabCode] = @TabCode" InsertCommand="INSERT INTO Tabernacle(TabName, TabHead, Contact) VALUES (@TabName, @TabHead, @Contact)" UpdateCommand="UPDATE [Tabernacle] SET [TabName] = @TabName, [TabHead] = @TabHead, [Contact] = @Contact WHERE [TabCode] = @TabCode">
                            <DeleteParameters>
                                <asp:Parameter Name="TabCode" Type="String" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="TabName" Type="String" />
                                <asp:Parameter Name="TabHead" Type="String" />
                                <asp:Parameter Name="Contact" Type="String" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="TabName" Type="String" />
                                <asp:Parameter Name="TabHead" Type="String" />
                                <asp:Parameter Name="Contact" Type="String" />
                                <asp:Parameter Name="TabCode" Type="String" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div><!-- /.box-body -->
         
          </div><!-- /.box -->


      <!-- new tabernacle modal -->
         <div class="modal fade" id="newtabmodal">
    <div class="modal-dialog" style="width:50%">
        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                 <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">New Tabernacle</h4>
                </div>
                        <div class="modal-body">
                             <div class="form-group">
                                 <div class="row">
                                       <div class="col-md-12">
                                        <label>Tabernacle Name</label>
                                       <asp:TextBox runat="server" ID="txtTabName" Width="100%" MaxLength="50"></asp:TextBox>
                                   <asp:RequiredFieldValidator runat="server" ErrorMessage="Required Field" ControlToValidate="txtTabName" Display="Dynamic" ForeColor="Red" SetFocusOnError="true" ValidationGroup="newtab"></asp:RequiredFieldValidator>
                                </div>
                                 </div>
                             </div>
                            <div class="form-group">
                                   <div class="row">
                                       <div class="col-md-12">
                                             <label>Tabernacle Shepherd</label>
                                       <asp:TextBox runat="server" ID="txtTabHead" Width="100%" MaxLength="50"></asp:TextBox>
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
                    <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-success" ValidationGroup="newtab" OnClick="btnSave_Click" />
                </div>
            </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        </div>
         </div>

    <!-- edit tabernacle modal -->
         <div class="modal fade" id="edittabmodal">
    <div class="modal-dialog" style="width:50%">
        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                 <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">Edit Tabernacle</h4>
                </div>
                        <div class="modal-body">
                             <div class="form-group">
                                 <div class="row">
                                       <div class="col-md-12">
                                        <label>Tabernacle Name</label>
                                       <asp:TextBox runat="server" ID="txtTabName1" Width="100%" MaxLength="50"></asp:TextBox>
                                   <asp:RequiredFieldValidator runat="server" ErrorMessage="Required Field" ControlToValidate="txtTabName1" Display="Dynamic" ForeColor="Red" SetFocusOnError="true" ValidationGroup="edittab"></asp:RequiredFieldValidator>
                                </div>
                                 </div>
                             </div>
                            <div class="form-group">
                                   <div class="row">
                                       <div class="col-md-12">
                                             <label>Tabernacle Head</label>
                                       <asp:TextBox runat="server" ID="txtTabHead1" Width="100%" MaxLength="50"></asp:TextBox>
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
                    <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="btn btn-success" ValidationGroup="edittab" OnClick="btnUpdate_Click"/>
                </div>
            </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        </div>
         </div>

        <script type="text/javascript">
            function newtabModal() {
                $('#newtabmodal').modal('show');
            }
            function closenewtabModal() {
                $('#newtabmodal').modal('hide');
            }
            function edittabModal() {
                $('#edittabmodal').modal('show');
            }
            function closeedittabModal() {
                $('#edittabmodal').modal('hide');
            }
    </script>
</asp:Content>
