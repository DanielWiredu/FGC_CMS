<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Services.aspx.cs" Inherits="FGC_CMS.Setups.Services" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
     <div class="box box-default">
            <div class="box-header with-border">
              <h3 class="box-title">Services </h3>
              <div class="box-tools pull-right">
                <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
              </div>
            </div><!-- /.box-header -->
            <div class="box-body">
                <asp:UpdatePanel runat="server" >
                    <ContentTemplate>
                        <telerik:RadGrid ID="serviceGrid" runat="server" AutoGenerateColumns="False" DataSourceID="serviceSource" GroupPanelPosition="Top" AllowFilteringByColumn="True" AllowPaging="True" AllowSorting="True" OnItemCommand="serviceGrid_ItemCommand" OnItemDeleted="serviceGrid_ItemDeleted">
                            <ClientSettings>
                                <Scrolling AllowScroll="True" UseStaticHeaders="True" />
                                <Selecting AllowRowSelect="true" />
                            </ClientSettings>
                            <GroupingSettings CaseSensitive="false" />
                                <MasterTableView DataKeyNames="ServiceID" DataSourceID="serviceSource" AllowAutomaticDeletes="true" CommandItemDisplay="Top" CommandItemSettings-AddNewRecordText="Add New Service">
                                <Columns>
                                    <telerik:GridBoundColumn DataField="ServiceID" FilterControlAltText="Filter ServiceID column" HeaderText="Service ID" SortExpression="ServiceID" UniqueName="ServiceID" AutoPostBackOnFilter="true" ShowFilterIcon="false" FilterControlWidth="100px" Display="false">
                                        <HeaderStyle Width="120px" />
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="ServiceName" FilterControlAltText="Filter ServiceName column" HeaderText="Service Name" SortExpression="ServiceName" UniqueName="ServiceName" AutoPostBackOnFilter="true" ShowFilterIcon="false" FilterControlWidth="240px" MaxLength="50">
                                    <HeaderStyle Width="250px" />
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="ServiceType" FilterControlAltText="Filter ServiceType column" HeaderText="Service Type" SortExpression="ServiceType" UniqueName="ServiceType" AutoPostBackOnFilter="true" ShowFilterIcon="false" FilterControlWidth="120px" MaxLength="10">
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
                        <asp:SqlDataSource ID="serviceSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Services] ORDER BY [ServiceID]" DeleteCommand="DELETE FROM [Services] WHERE [ServiceID] = @ServiceID">
                            <DeleteParameters>
                                <asp:Parameter Name="ServiceID" Type="Int32" />
                            </DeleteParameters>
                        </asp:SqlDataSource>

                    </ContentTemplate>
                </asp:UpdatePanel>
            </div><!-- /.box-body -->
         
          </div><!-- /.box -->

      <div class="modal fade" id="newservicemodal">

    <div class="modal-dialog" style="width:50%">
        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                 <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">New Service</h4>
                </div>
                        <div class="modal-body">
                             <div class="form-group">
                                 <div class="row">
                                       <div class="col-md-12">
                                        <label>Service Name</label>
                                       <asp:TextBox runat="server" ID="txtService" Width="100%" MaxLength="50"></asp:TextBox>
                                   <asp:RequiredFieldValidator runat="server" ErrorMessage="Required Field" ControlToValidate="txtService" Display="Dynamic" ForeColor="Red" SetFocusOnError="true" ValidationGroup="newservice"></asp:RequiredFieldValidator>
                                </div>
                                 </div>
                             </div>
                            <div class="form-group">
                                <div class="row">
                                     <div class="col-md-12">
                                        <label>Service Type</label>
                                          <telerik:RadDropDownList ID="dlServiceType" runat="server" Width="100%">
                                            <Items>
                                                <telerik:DropDownListItem Text="Service" Selected="true"/>
                                                <telerik:DropDownListItem Text="Program"/>
                                            </Items>
                                        </telerik:RadDropDownList>
                                </div>
                                </div>
                            </div>
                               
                             
                       </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-warning" data-dismiss="modal">Close</button>
                    <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-success" OnClick="btnSave_Click" ValidationGroup="newservice" />
                </div>
            </div>
            </ContentTemplate>
        </asp:UpdatePanel>

        </div>
         </div>



             <div class="modal fade" id="editservicemodal">

    <div class="modal-dialog" style="width:50%">
        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                  <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">Edit Service</h4>
                </div>
                        <div class="modal-body">
                            <div class="form-group">
                                 <div class="row">
                                       <div class="col-md-12">
                                        <label>Service Name</label>
                                       <asp:TextBox runat="server" ID="txtService1" Width="100%" MaxLength="50"></asp:TextBox>
                                   <asp:RequiredFieldValidator runat="server" ErrorMessage="Required Field" ControlToValidate="txtService1" Display="Dynamic" ForeColor="Red" SetFocusOnError="true" ValidationGroup="editservice"></asp:RequiredFieldValidator>
                                </div>
                                 </div>
                             </div>
                            <div class="form-group">
                                <div class="row">
                                     <div class="col-md-12">
                                        <label>Service Type</label>
                                          <telerik:RadDropDownList ID="dlServiceType1" runat="server" Width="100%">
                                            <Items>
                                                <telerik:DropDownListItem Text="Service" Selected="true"/>
                                                <telerik:DropDownListItem Text="Program"/>
                                            </Items>
                                        </telerik:RadDropDownList>
                                </div>
                                </div>
                            </div>
                             
                       </div>

                <div class="modal-footer">
                     <button type="button" class="btn btn-warning" data-dismiss="modal">Close</button>
                    <asp:Button runat="server" ID="btnUpdate" CssClass="btn btn-success" Text="Update" OnClick="btnUpdate_Click" ValidationGroup="editservice"/>
                </div>
            </div>
            </ContentTemplate>
        </asp:UpdatePanel>

        </div>
    </div>
    <script type="text/javascript">
        function newserviceModal() {
            $('#newservicemodal').modal('show');
        }
        function closenewserviceModal() {
            $('#newservicemodal').modal('hide');
        }
        function editserviceModal() {
            $('#editservicemodal').modal('show');
        }
        function closeeditserviceModal() {
            $('#editservicemodal').modal('hide');
        }
    </script>
</asp:Content>
