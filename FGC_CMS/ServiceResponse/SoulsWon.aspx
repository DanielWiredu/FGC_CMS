<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="SoulsWon.aspx.cs" Inherits="FGC_CMS.ServiceResponse.SoulsWon" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
                     <div class="box box-default">
            <div class="box-header with-border">
              <h3 class="box-title">Souls Won </h3>
              <div class="box-tools pull-right">
                <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
              </div>
            </div><!-- /.box-header -->
            <div class="box-body">
                         <asp:UpdatePanel runat="server" >
                    <ContentTemplate>
                              
                         <div class="row">
                                        <div class="col-sm-4 pull-right" style="width:inherit">
                                           <asp:Button runat="server" ID="btnExcelExport" CssClass="btn btn-success" Text="Excel" CausesValidation="false" OnClick="btnExcelExport_Click"/>
                                            <asp:Button runat="server" ID="btnPDFExport" CssClass="btn btn-warning" Text="PDF" CausesValidation="false" OnClick="btnPDFExport_Click"/>
                                        </div>
                                        <div class="col-sm-8 pull-left">
                                            <div class="toolbar-btn-action">
                                                    <asp:Button runat="server" Text="Add Soul" CssClass="btn btn-primary" OnClientClick="newModal()"  />
                                            </div>
                                        </div>
                                    </div>

                         <telerik:RadGrid ID="soulsGrid" runat="server" AutoGenerateColumns="False"  GroupPanelPosition="Top" AllowFilteringByColumn="True" AllowPaging="True" AllowSorting="True" CellSpacing="-1" DataSourceID="soulSource" GridLines="Both" OnItemCommand="soulsGrid_ItemCommand" OnItemDeleted="soulsGrid_ItemDeleted" >
                            <ClientSettings>
                                <Scrolling AllowScroll="True" UseStaticHeaders="True" />
                                <Selecting AllowRowSelect="true" />
                               <Scrolling AllowScroll="true" ScrollHeight="350px" />
                            </ClientSettings>
                            <GroupingSettings CaseSensitive="false" />
                           <ExportSettings IgnorePaging="true" ExportOnlyData="true" OpenInNewWindow="true" FileName="soulswon" HideStructureColumns="true" >
                                        <Pdf AllowPrinting="true" AllowCopy="true" PaperSize="Letter" PageTitle="Souls Won" PageWidth="900"></Pdf>
                                    </ExportSettings>
                           
                             <MasterTableView DataKeyNames="id" DataSourceID="soulSource" AllowAutomaticDeletes="true">
                                 <Columns>
                                     <telerik:GridBoundColumn Display="false" DataField="id" DataType="System.Int32" FilterControlAltText="Filter id column" HeaderText="id" ReadOnly="True" SortExpression="id" UniqueName="id">
                                     </telerik:GridBoundColumn>
                                     <telerik:GridDateTimeColumn DataField="ServiceDate" DataType="System.DateTime" FilterControlAltText="Filter ServiceDate column" HeaderText="Service Date" SortExpression="ServiceDate" UniqueName="ServiceDate"  AutoPostBackOnFilter="true" ShowFilterIcon="true" FilterControlWidth="120px" DataFormatString="{0:dd-MMM-yyyy}">
                                     <HeaderStyle Width="150px" />
                                     </telerik:GridDateTimeColumn>
                                     <telerik:GridBoundColumn DataField="ServiceName" FilterControlAltText="Filter ServiceName column" HeaderText="Service Name" SortExpression="ServiceName" UniqueName="ServiceName" AutoPostBackOnFilter="true" ShowFilterIcon="false" FilterControlWidth="150px">
                                     <HeaderStyle Width="180px" />
                                     </telerik:GridBoundColumn>
                                     <telerik:GridBoundColumn DataField="SoulName" FilterControlAltText="Filter SoulName column" HeaderText="Soul's Name" SortExpression="SoulName" UniqueName="SoulName" AutoPostBackOnFilter="true" ShowFilterIcon="false" FilterControlWidth="150px">
                                     <HeaderStyle Width="180px" />
                                     </telerik:GridBoundColumn>
                                     <telerik:GridBoundColumn DataField="Location" FilterControlAltText="Filter Location column" HeaderText="Location" SortExpression="Location" UniqueName="Location" AutoPostBackOnFilter="true" ShowFilterIcon="false" FilterControlWidth="150px">
                                     <HeaderStyle Width="180px" />
                                     </telerik:GridBoundColumn>
                                     <telerik:GridBoundColumn DataField="ContactNo" FilterControlAltText="Filter ContactNo column" HeaderText="Contact No" SortExpression="ContactNo" UniqueName="ContactNo" AutoPostBackOnFilter="true" ShowFilterIcon="false" FilterControlWidth="80px">
                                     <HeaderStyle Width="100px" />
                                     </telerik:GridBoundColumn>
                                     <telerik:GridButtonColumn ButtonType="PushButton" CommandName="Edit" ButtonCssClass="btn-info" Text="Edit" Exportable="false">
                                        <HeaderStyle Width="50px" />
                                    </telerik:GridButtonColumn>
                                    <telerik:GridButtonColumn Text="Delete" CommandName="Delete" UniqueName="Delete" ConfirmText="Delete Visitor?" ButtonType="PushButton" ButtonCssClass="btn-danger" Exportable="false">
                                        <HeaderStyle Width="60px" />
                                    </telerik:GridButtonColumn>
                                 </Columns>
                             </MasterTableView>
                        </telerik:RadGrid>
                         <asp:SqlDataSource ID="soulSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [SoulsWon] WHERE [id] = @id" SelectCommand="SELECT [id], [ServiceDate], [ServiceName], [SoulName], [Location], [ContactNo] FROM [SoulsWon]">
                             <DeleteParameters>
                                 <asp:Parameter Name="id" Type="Int32" />
                             </DeleteParameters>
                         </asp:SqlDataSource>
                    </ContentTemplate>
                             <Triggers>
                                  <asp:PostBackTrigger ControlID="btnExcelExport" />
                                  <asp:PostBackTrigger ControlID="btnPDFExport" />
                              </Triggers>
                </asp:UpdatePanel>
            </div><!-- /.box-body -->
         
          </div><!-- /.box -->


    <!-- new modal -->
         <div class="modal fade" id="newmodal">
    <div class="modal-dialog" style="width:50%">
        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                 <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">New </h4>
                </div>
                     <div class="modal-body">
                         <div class="form-group">
                             <label>Service</label>
                             <telerik:RadComboBox ID="dlService" runat="server" Width="100%" DataSourceID="serviceSource" DataTextField="ServiceName" DataValueField="ServiceName" Text="Select Service"></telerik:RadComboBox>
                            <asp:SqlDataSource ID="serviceSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT ServiceName FROM [Services]"></asp:SqlDataSource>
                         </div>
                         <div class="form-group">
                             <label>Date</label>
                             <telerik:RadDatePicker ID="dpServiceDate" runat="server" Width="100%" DateInput-ReadOnly="true"></telerik:RadDatePicker>
                            <asp:RequiredFieldValidator runat="server" ErrorMessage="Required Field" ControlToValidate="dpServiceDate" Display="Dynamic" ForeColor="Red" SetFocusOnError="true" ValidationGroup="new"></asp:RequiredFieldValidator>
                         </div>
                             <div class="form-group">
                                        <label>Name</label>
                                       <asp:TextBox runat="server" ID="txtName" Width="100%" MaxLength="100"></asp:TextBox>
                                   <asp:RequiredFieldValidator runat="server" ErrorMessage="Required Field" ControlToValidate="txtName" Display="Dynamic" ForeColor="Red" SetFocusOnError="true" ValidationGroup="new"></asp:RequiredFieldValidator>
                             </div>
                         <div class="form-group">
                                        <label>Location</label>
                                       <asp:TextBox runat="server" ID="txtLocation" Width="100%" MaxLength="100"></asp:TextBox>
                             </div>
                         <div class="form-group">
                                        <label>Contact No</label>
                                       <asp:TextBox runat="server" ID="txtContactNo" Width="100%" MaxLength="20" TextMode="Number"></asp:TextBox>
                             </div>
                       </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-warning" data-dismiss="modal">Close</button>
                    <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-success" ValidationGroup="new" OnClick="btnSave_Click" />
                </div>
            </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        </div>
         </div>

     <!-- edit modal -->
         <div class="modal fade" id="editmodal">
    <div class="modal-dialog" style="width:50%">
        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                 <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">Edit </h4>
                </div>
                     <div class="modal-body">
                         <div class="form-group">
                             <label>Service</label>
                             <telerik:RadComboBox ID="dlService1" runat="server" Width="100%" DataSourceID="serviceSource" DataTextField="ServiceName" DataValueField="ServiceName" Text="Select Service"></telerik:RadComboBox>
                         </div>
                         <div class="form-group">
                             <label>Date</label>
                             <telerik:RadDatePicker ID="dpServiceDate1" runat="server" Width="100%" DateInput-ReadOnly="true"></telerik:RadDatePicker>
                            <asp:RequiredFieldValidator runat="server" ErrorMessage="Required Field" ControlToValidate="dpServiceDate1" Display="Dynamic" ForeColor="Red" SetFocusOnError="true" ValidationGroup="edit"></asp:RequiredFieldValidator>
                         </div>
                             <div class="form-group">
                                        <label>Name</label>
                                       <asp:TextBox runat="server" ID="txtName1" Width="100%" MaxLength="100"></asp:TextBox>
                                   <asp:RequiredFieldValidator runat="server" ErrorMessage="Required Field" ControlToValidate="txtName1" Display="Dynamic" ForeColor="Red" SetFocusOnError="true" ValidationGroup="edit"></asp:RequiredFieldValidator>
                             </div>
                         <div class="form-group">
                                        <label>Location</label>
                                       <asp:TextBox runat="server" ID="txtLocation1" Width="100%" MaxLength="100"></asp:TextBox>
                             </div>
                         <div class="form-group">
                                        <label>Contact No</label>
                                       <asp:TextBox runat="server" ID="txtContactNo1" Width="100%" MaxLength="20" TextMode="Number"></asp:TextBox>
                             </div>
                       </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-warning" data-dismiss="modal">Close</button>
                    <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="btn btn-success" ValidationGroup="edit" OnClick="btnUpdate_Click" />
                </div>
            </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        </div>
         </div>

        <script type="text/javascript">
            function newModal() {
                $('#newmodal').modal('show');
            }
            function closenewModal() {
                $('#newmodal').modal('hide');
            }
            function editModal() {
                $('#editmodal').modal('show');
            }
            function closeeditModal() {
                $('#editmodal').modal('hide');
            }
    </script>
</asp:Content>
