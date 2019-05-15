<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Birthday.aspx.cs" Inherits="FGC_CMS.Main.Birthday" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  
     <div class="box box-default">
            <div class="box-header with-border">
              <h3 class="box-title">Birthday Members </h3>
              <div class="box-tools pull-right">
                <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
              </div>
            </div><!-- /.box-header -->
            <div class="box-body">
                <asp:UpdatePanel runat="server" >
                    <ContentTemplate>
                                 <asp:Button ID="btnNewSMS" CssClass="btn btn-primary" runat="server" Text="New Message" OnClick="btnNewSMS_Click" CausesValidation="false"/>         
                <div>
                    &nbsp;
                </div>
                       
                         <telerik:RadGrid ID="memberGrid" runat="server" AutoGenerateColumns="False" AllowMultiRowSelection="true"  GroupPanelPosition="Top" AllowFilteringByColumn="True" AllowPaging="false" AllowSorting="True" CellSpacing="-1" DataSourceID="memeberSource" GridLines="Both" OnItemDataBound="memberGrid_ItemDataBound">
                            <ClientSettings>
                                <Scrolling AllowScroll="True" UseStaticHeaders="True" />
                                <Selecting AllowRowSelect="true" />
                            </ClientSettings>
                            <GroupingSettings CaseSensitive="false" />
                           
                            <MasterTableView DataKeyNames="MemberID" DataSourceID="memeberSource" >
                                <Columns>
                                    <telerik:GridClientSelectColumn>
                                        <HeaderStyle Width="20px" />
                                    </telerik:GridClientSelectColumn>
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
                                </Columns>
                            </MasterTableView>
                           
                        </telerik:RadGrid>
                        <asp:SqlDataSource ID="memeberSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT MemberID, Surname, Firstname, Gender, Birthday, Mobile FROM Members WHERE (Ministry LIKE @ministry + '%') AND day(birthday) = day(getdate()) and month(birthday) = month(getdate())">
                            <SelectParameters>
                                <asp:SessionParameter Name="ministry" SessionField="userministry" ConvertEmptyStringToNull="false" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div><!-- /.box-body -->
         
          </div><!-- /.box -->

       <div class="modal fade" id="newmodal">
    <div class="modal-dialog" style="width:50%">
        <asp:UpdatePanel runat="server" ID="upMessage">
            <ContentTemplate>
                  <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">New SMS</h4>
                </div>
                        <div class="modal-body">
                            <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="upMessage">
                                <ProgressTemplate>
                                    Sending....
                                    <img alt="" src="/dist/img/loader.gif" />
                            </ProgressTemplate>
                        </asp:UpdateProgress>
                              <div class="form-group">
                               <label>Send As</label>
                               <asp:TextBox ID="txtHeader" runat="server" Width="100%" MaxLength="11" Text="FGC-DP"></asp:TextBox>
                               <asp:RequiredFieldValidator runat="server" ControlToValidate="txtHeader" Display="Dynamic" ForeColor="Red" ErrorMessage="Required Field" SetFocusOnError="true"></asp:RequiredFieldValidator>
                           </div>
                         <div class="form-group">
                               <label>Message</label>
                               <asp:TextBox ID="txtMessage" runat="server" Width="100%" TextMode="MultiLine" Rows="5"></asp:TextBox>
                              <asp:RequiredFieldValidator runat="server" ControlToValidate="txtMessage" Display="Dynamic" ForeColor="Red" ErrorMessage="Required Field" SetFocusOnError="true"></asp:RequiredFieldValidator>
                           </div>
                       </div>
                <div class="modal-footer">
                     <button type="button" class="btn btn-warning" data-dismiss="modal">Close</button>
                    <asp:Button ID="btnSend" runat="server" Text="Send" CssClass="btn btn-success" OnClick="btnSend_Click" />
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
    </script>
</asp:Content>
