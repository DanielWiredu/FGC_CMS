<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="TitheReports.aspx.cs" Inherits="FGC_CMS.FinancialReports.TitheReports" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="box box-default">
            <div class="box-header with-border">
              <h3 class="box-title">Tithe Reports </h3>
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
                              <div class="col-md-1">

                              </div>
                              <div class="col-md-3">
                                  <label>Start Date</label>
                                  <telerik:RadDatePicker ID="dpSdate" runat="server" Width="100%" DateInput-ReadOnly="true"></telerik:RadDatePicker>
                                  <asp:RequiredFieldValidator runat="server" ControlToValidate="dpSdate" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ErrorMessage="Start date required"></asp:RequiredFieldValidator>
                              </div>
                                <div class="col-md-3">
                                  <label>End Date</label>
                                  <telerik:RadDatePicker ID="dpEdate" runat="server" Width="100%" DateInput-ReadOnly="true"></telerik:RadDatePicker>
                                  <asp:RequiredFieldValidator runat="server" ControlToValidate="dpEdate" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ErrorMessage="End date required"></asp:RequiredFieldValidator>
                              </div>
                              <div class="col-md-4">
                                  <label>Member ID</label>
                                  <asp:TextBox runat="server" ID="txtMemberID" Width="100%"></asp:TextBox>
                                   <asp:RequiredFieldValidator runat="server" ControlToValidate="txtMemberID" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ErrorMessage="Enter Member ID"></asp:RequiredFieldValidator>

                              </div>
                              <div class="col-md-1">

                              </div>
                          </div>
                      </div>

                     <div class="modal-footer">
                    <asp:Button ID="btnReport" CssClass="btn btn-primary" runat="server" Text="Generate Report" OnClick="btnReport_Click"/>         
                </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div><!-- /.box-body -->
         
          </div><!-- /.box -->

</asp:Content>
