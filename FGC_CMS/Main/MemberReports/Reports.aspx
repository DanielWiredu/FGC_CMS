<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Reports.aspx.cs" Inherits="FGC_CMS.Main.MemberReports.Reports" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   

     <div class="box box-default">
            <div class="box-header with-border">
              <h3 class="box-title">Reports </h3>
              <div class="box-tools pull-right">
                <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
              </div>
            </div><!-- /.box-header -->
            <div class="box-body">
                <asp:UpdatePanel runat="server" >
                    <ContentTemplate>
                          <div class="bg-primary">Select duration for Report</div>
                      <div class="form-group">
                          <div class="row">
                              <div class="col-md-3">

                              </div>
                              <div class="col-md-3">
                                  <label>Option</label><br />
                                  <asp:RadioButton ID="rdAll" runat="server" Text="All" Checked="true" GroupName="opt" AutoPostBack="true" OnCheckedChanged="rdAll_CheckedChanged" />
                                  <asp:RadioButton ID="rdSpecific" runat="server" Text="Specific" GroupName="opt" AutoPostBack="true" OnCheckedChanged="rdSpecific_CheckedChanged" />
                              </div>
                              <div class="col-md-3">
                                  <label>Select Type</label>
                                  <telerik:RadDropDownList ID="dlType" runat="server" Width="100%" AutoPostBack="true" CausesValidation="false" OnItemSelected="dlType_ItemSelected">
                                      <Items>
                                          <telerik:DropDownListItem Text="Member Listing" Value="All" Selected="true" />
                                          <telerik:DropDownListItem Text="Member List - Group by Occupation" Value="Occupation" />
                                          <telerik:DropDownListItem Text="Member List - Group by Gender" Value="Gender" />
                                          <telerik:DropDownListItem Text="Member List - Group by Department" Value="Department" />
                                          <telerik:DropDownListItem Text="Member List - Group by Ministry" Value="Ministry" />
                                          <telerik:DropDownListItem Text="Member List - Group by Committee" Value="Committee" />
                                          <telerik:DropDownListItem Text="Member List - Group by Tabernacle" Value="Tabernacle" />
                                      </Items>
                                  </telerik:RadDropDownList>
                              </div>
                              <div class="col-md-3">

                              </div>
                          </div>
                      </div>
                       <div class="form-group">
                          <div class="row">
                              <div class="col-md-1">

                              </div>
                              <div class="col-md-2">
                                  <label>Start Date</label>
                                  <telerik:RadDatePicker ID="dpSdate" runat="server" Width="100%" DateInput-ReadOnly="true"></telerik:RadDatePicker>
                                  <%--<asp:RequiredFieldValidator runat="server" ControlToValidate="dpSdate" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ErrorMessage="Start date required"></asp:RequiredFieldValidator>--%>
                              </div>
                                <div class="col-md-2">
                                  <label>End Date</label>
                                  <telerik:RadDatePicker ID="dpEdate" runat="server" Width="100%" DateInput-ReadOnly="true"></telerik:RadDatePicker>
                                  <%--<asp:RequiredFieldValidator runat="server" ControlToValidate="dpEdate" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ErrorMessage="End date required"></asp:RequiredFieldValidator>--%>
                              </div>
                              <div class="col-md-6">
                                  <label runat="server" id="lblType"></label>
                                  <telerik:RadDropDownList ID="dlGender" runat="server" Width="100%" Visible="false">
                             <Items>
                                 <telerik:DropDownListItem Text="Male" Value="Male"/>
                                 <telerik:DropDownListItem Text="Female" Value="Female" Selected="true" />
                             </Items>
                         </telerik:RadDropDownList>

                                 <telerik:RadComboBox ID="dlOccupation" runat="server" Width="100%" DataSourceID="occupationSource" DataTextField="Occupation" DataValueField="Occupation" Filter="Contains" MarkFirstMatch="True" Text="Select Occupation" Visible="false"></telerik:RadComboBox>
                            <asp:SqlDataSource ID="occupationSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Occupation]"></asp:SqlDataSource>
                                   <asp:RequiredFieldValidator runat="server" ControlToValidate="dlOccupation" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ErrorMessage="Select Occupation"></asp:RequiredFieldValidator>

                                  <telerik:RadComboBox ID="dlMinistry" runat="server" Width="100%" DataSourceID="ministrySource" DataTextField="MinistryName" DataValueField="MinistryName" Filter="Contains" MarkFirstMatch="True" Text="Select Ministry" Visible="false"></telerik:RadComboBox>
                            <asp:SqlDataSource ID="ministrySource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT MinistryName FROM [Ministry]"></asp:SqlDataSource>
                                  <asp:RequiredFieldValidator runat="server" ControlToValidate="dlMinistry" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ErrorMessage="Select Ministry"></asp:RequiredFieldValidator>

                                  <telerik:RadComboBox ID="dlDepartment" runat="server" Width="100%" DataSourceID="deptSource" DataTextField="DeptName" DataValueField="DeptName" Filter="Contains" MarkFirstMatch="True" Text="Select Department" Visible="false"></telerik:RadComboBox>
                            <asp:SqlDataSource ID="deptSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DeptName FROM [Department]"></asp:SqlDataSource>
                                   <asp:RequiredFieldValidator runat="server" ControlToValidate="dlDepartment" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ErrorMessage="Select Department"></asp:RequiredFieldValidator> 

                                  <telerik:RadComboBox ID="dlCommittee" runat="server" Width="100%" DataSourceID="commSource" DataTextField="CommName" DataValueField="CommName" Filter="Contains" MarkFirstMatch="True" Text="Select Committee" Visible="false"></telerik:RadComboBox>
                            <asp:SqlDataSource ID="commSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT CommName FROM [Committee]"></asp:SqlDataSource> 
                                  <asp:RequiredFieldValidator runat="server" ControlToValidate="dlCommittee" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ErrorMessage="Select Committee"></asp:RequiredFieldValidator> 

                                  <telerik:RadComboBox ID="dlTabernacle" runat="server" Width="100%" DataSourceID="tabSource" DataTextField="TabName" DataValueField="TabName" Filter="Contains" MarkFirstMatch="True" Text="Select Tabernacle" Visible="false"></telerik:RadComboBox>
                            <asp:SqlDataSource ID="tabSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT TabName FROM [Tabernacle]"></asp:SqlDataSource>
                                  <asp:RequiredFieldValidator runat="server" ControlToValidate="dlTabernacle" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ErrorMessage="Select Tabernacle"></asp:RequiredFieldValidator> 
                                    
                              </div>
                              <div class="col-md-1">

                              </div>
                          </div>
                      </div>

                     <div class="modal-footer">
                    <asp:Button ID="btnReport" CssClass="btn btn-success" runat="server" Text="Generate Report" OnClick="btnReport_Click" />         
                </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div><!-- /.box-body -->
         
          </div><!-- /.box -->

</asp:Content>
