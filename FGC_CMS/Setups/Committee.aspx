<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Committee.aspx.cs" Inherits="FGC_CMS.Setups.Committee" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
      <div class="box box-default">
            <div class="box-header with-border">
              <h3 class="box-title">Committees </h3>
              <div class="box-tools pull-right">
                <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
              </div>
            </div><!-- /.box-header -->
            <div class="box-body">
                <asp:UpdatePanel runat="server" >
                    <ContentTemplate>
                        <telerik:RadGrid ID="commGrid" runat="server" AutoGenerateColumns="False" DataSourceID="commSource" GroupPanelPosition="Top" AllowFilteringByColumn="True" AllowPaging="True" AllowSorting="True" OnItemCommand="commGrid_ItemCommand" OnItemDeleted="commGrid_ItemDeleted">
                            <ClientSettings>
                                <Scrolling AllowScroll="True" UseStaticHeaders="True" />
                                <Selecting AllowRowSelect="true" />
                            </ClientSettings>
                            <GroupingSettings CaseSensitive="false" />
                            <MasterTableView DataKeyNames="CommCode" DataSourceID="commSource" AllowAutomaticDeletes="true" CommandItemDisplay="Top" CommandItemSettings-AddNewRecordText="Add New Committee">
                                <Columns>
                                    <telerik:GridBoundColumn DataField="CommCode" FilterControlAltText="Filter CommCode column" HeaderText="Committee Code" SortExpression="CommCode" UniqueName="CommCode" AutoPostBackOnFilter="true" ReadOnly="true" ShowFilterIcon="false" FilterControlWidth="80px" Display="false">
                                        <HeaderStyle Width="80px" />
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="CommName" FilterControlAltText="Filter CommName column" HeaderText="Committee Name" SortExpression="CommName" UniqueName="CommName" AutoPostBackOnFilter="true" ShowFilterIcon="false" FilterControlWidth="250px" MaxLength="50">
                                    <HeaderStyle Width="250px" />
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="CommHead" FilterControlAltText="Filter CommHead column" HeaderText="Committee Head" SortExpression="CommHead" UniqueName="CommHead" FilterControlWidth="150px" AutoPostBackOnFilter="true" ShowFilterIcon="false" MaxLength="50" EmptyDataText="">
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
                        <asp:SqlDataSource ID="commSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Committee] ORDER BY [CommCode]" DeleteCommand="DELETE FROM [Committee] WHERE [CommCode] = @CommCode" InsertCommand="INSERT INTO Committee(CommName, CommHead, Contact) VALUES (@CommName, @CommHead, @Contact)" UpdateCommand="UPDATE [Committee] SET [CommName] = @CommName, [CommHead] = @CommHead, [Contact] = @Contact WHERE [CommCode] = @CommCode">
                            <DeleteParameters>
                                <asp:Parameter Name="CommCode" Type="String" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="CommName" Type="String" />
                                <asp:Parameter Name="CommHead" Type="String" />
                                <asp:Parameter Name="Contact" Type="String" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="CommName" Type="String" />
                                <asp:Parameter Name="CommHead" Type="String" />
                                <asp:Parameter Name="Contact" Type="String" />
                                <asp:Parameter Name="CommCode" Type="String" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div><!-- /.box-body -->
         
          </div><!-- /.box -->


    <!-- new committee modal -->
         <div class="modal fade" id="newcommmodal">
    <div class="modal-dialog" style="width:50%">
        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                 <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">New Committee</h4>
                </div>
                        <div class="modal-body">
                             <div class="form-group">
                                 <div class="row">
                                       <div class="col-md-12">
                                        <label>Committee Name</label>
                                       <asp:TextBox runat="server" ID="txtCommName" Width="100%" MaxLength="50"></asp:TextBox>
                                   <asp:RequiredFieldValidator runat="server" ErrorMessage="Required Field" ControlToValidate="txtCommName" Display="Dynamic" ForeColor="Red" SetFocusOnError="true" ValidationGroup="newcomm"></asp:RequiredFieldValidator>
                                </div>
                                 </div>
                             </div>
                            <div class="form-group">
                                   <div class="row">
                                       <div class="col-md-12">
                                             <label>Committee Head</label>
                                       <asp:TextBox runat="server" ID="txtCommHead" Width="100%" MaxLength="50"></asp:TextBox>
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
                    <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-success" ValidationGroup="newcomm" OnClick="btnSave_Click" />
                </div>
            </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        </div>
         </div>

    <!-- edit committee modal -->
         <div class="modal fade" id="editcommmodal">
    <div class="modal-dialog" style="width:50%">
        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                 <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">Edit Committee</h4>
                </div>
                        <div class="modal-body">
                             <div class="form-group">
                                 <div class="row">
                                       <div class="col-md-12">
                                        <label>Committee Name</label>
                                       <asp:TextBox runat="server" ID="txtCommName1" Width="100%" MaxLength="50"></asp:TextBox>
                                   <asp:RequiredFieldValidator runat="server" ErrorMessage="Required Field" ControlToValidate="txtCommName1" Display="Dynamic" ForeColor="Red" SetFocusOnError="true" ValidationGroup="editcomm"></asp:RequiredFieldValidator>
                                </div>
                                 </div>
                             </div>
                            <div class="form-group">
                                   <div class="row">
                                       <div class="col-md-12">
                                             <label>Committee Head</label>
                                       <asp:TextBox runat="server" ID="txtCommHead1" Width="100%" MaxLength="50"></asp:TextBox>
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
                    <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="btn btn-success" ValidationGroup="editcomm" OnClick="btnUpdate_Click"/>
                </div>
            </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        </div>
         </div>

        <script type="text/javascript">
            function newcommModal() {
                $('#newcommmodal').modal('show');
            }
            function closenewcommModal() {
                $('#newcommmodal').modal('hide');
            }
            function editcommModal() {
                $('#editcommmodal').modal('show');
            }
            function closeeditcommModal() {
                $('#editcommmodal').modal('hide');
            }
    </script>
</asp:Content>
