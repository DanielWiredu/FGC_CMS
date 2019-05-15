<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Occupation.aspx.cs" Inherits="FGC_CMS.Setups.Occupation" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
                 <div class="box box-default">
            <div class="box-header with-border">
              <h3 class="box-title">Occupation </h3>
              <div class="box-tools pull-right">
                <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
              </div>
            </div><!-- /.box-header -->
            <div class="box-body">
                <asp:UpdatePanel runat="server" >
                    <ContentTemplate>
                        <telerik:RadGrid ID="occupationGrid" runat="server" AutoGenerateColumns="False" DataSourceID="occupationSource" GroupPanelPosition="Top" AllowFilteringByColumn="True" AllowPaging="True" AllowSorting="True" OnItemDeleted="occupationGrid_ItemDeleted" OnItemCommand="occupationGrid_ItemCommand">
                            <ClientSettings>
                                <Scrolling AllowScroll="True" UseStaticHeaders="True" />
                                <Selecting AllowRowSelect="true" />
                            </ClientSettings>
                            <GroupingSettings CaseSensitive="false" />
                            <MasterTableView DataKeyNames="OccID" DataSourceID="occupationSource" AllowAutomaticDeletes="true" CommandItemDisplay="Top" CommandItemSettings-AddNewRecordText="Add New Occupation">
                                <Columns>
                                    <telerik:GridBoundColumn DataField="OccID" FilterControlAltText="Filter OccID column" HeaderText="ID" SortExpression="OccID" UniqueName="OccID" AutoPostBackOnFilter="true" FilterControlWidth="50px" ReadOnly="true" Display="false">
                                        <HeaderStyle Width="50px" />
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="Occupation" FilterControlAltText="Filter Occupation column" HeaderText="Occupation" SortExpression="Occupation" UniqueName="Occupation" AutoPostBackOnFilter="true" ShowFilterIcon="false" FilterControlWidth="250px" MaxLength="30">
                                        <HeaderStyle Width="400px" />
                                        <ColumnValidationSettings EnableRequiredFieldValidation="true">
                                            <RequiredFieldValidator ForeColor="Red" ErrorMessage="Required Field" SetFocusOnError="true" Display="Dynamic"></RequiredFieldValidator>
                                        </ColumnValidationSettings>
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
                        <asp:SqlDataSource ID="occupationSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Occupation] ORDER BY [OccID]" DeleteCommand="DELETE FROM [Occupation] WHERE [OccID] = @OccID" UpdateCommand="UPDATE [Occupation] SET [Occupation] = @Occupation WHERE [OccID] = @OccID" InsertCommand="INSERT INTO Occupation(Occupation) VALUES (@Occupation)">
                            <DeleteParameters>
                                <asp:Parameter Name="OccID" Type="String" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="Occupation" Type="String" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="Occupation" Type="String" />
                                <asp:Parameter Name="OccID" Type="String" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div><!-- /.box-body -->
         
          </div><!-- /.box -->


      <!-- new occupation modal -->
         <div class="modal fade" id="newoccmodal">
    <div class="modal-dialog" style="width:50%">
        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                 <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">New Occupation</h4>
                </div>
                        <div class="modal-body">
                             <div class="form-group">
                                 <div class="row">
                                       <div class="col-md-12">
                                        <label>Occupation</label>
                                       <asp:TextBox runat="server" ID="txtOccupation" Width="100%" MaxLength="50"></asp:TextBox>
                                   <asp:RequiredFieldValidator runat="server" ErrorMessage="Required Field" ControlToValidate="txtOccupation" Display="Dynamic" ForeColor="Red" SetFocusOnError="true" ValidationGroup="newocc"></asp:RequiredFieldValidator>
                                </div>
                                 </div>
                             </div>
                       </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-warning" data-dismiss="modal">Close</button>
                    <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-success" ValidationGroup="newocc" OnClick="btnSave_Click" />
                </div>
            </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        </div>
         </div>

    <!-- edit occupation modal -->
         <div class="modal fade" id="editoccmodal">
    <div class="modal-dialog" style="width:50%">
        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                 <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">Edit Occupation</h4>
                </div>
                        <div class="modal-body">
                             <div class="form-group">
                                 <div class="row">
                                       <div class="col-md-12">
                                        <label>Occupation</label>
                                       <asp:TextBox runat="server" ID="txtOccupation1" Width="100%" MaxLength="50"></asp:TextBox>
                                   <asp:RequiredFieldValidator runat="server" ErrorMessage="Required Field" ControlToValidate="txtOccupation1" Display="Dynamic" ForeColor="Red" SetFocusOnError="true" ValidationGroup="editocc"></asp:RequiredFieldValidator>
                                </div>
                                 </div>
                             </div>
                       </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-warning" data-dismiss="modal">Close</button>
                    <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="btn btn-success" ValidationGroup="editocc" OnClick="btnUpdate_Click"/>
                </div>
            </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        </div>
         </div>

        <script type="text/javascript">
            function newoccModal() {
                $('#newoccmodal').modal('show');
            }
            function closenewoccModal() {
                $('#newoccmodal').modal('hide');
            }
            function editoccModal() {
                $('#editoccmodal').modal('show');
            }
            function closeeditoccModal() {
                $('#editoccmodal').modal('hide');
            }
    </script>
</asp:Content>
