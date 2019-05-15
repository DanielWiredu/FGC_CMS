<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="NewPayment.aspx.cs" Inherits="FGC_CMS.Financials.NewPayment" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="box box-default">
            <div class="box-header with-border">
              <h3 class="box-title">New </h3>
              <div class="box-tools pull-right">
                <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
              </div>
            </div><!-- /.box-header -->
            <div class="box-body">
                 <asp:UpdatePanel runat="server" >
                    <ContentTemplate>
                        <div class="form-group">
                                <div class="row">
                                    <div class="col-md-4">
                                                <label>Payment Date</label>
                                       <telerik:RadDatePicker runat="server" ID="dpPaydate" Width="100%" DateInput-ReadOnly="true"></telerik:RadDatePicker>
                                   <asp:RequiredFieldValidator runat="server" ErrorMessage="Required Field" ControlToValidate="dpPaydate" Display="Dynamic" ForeColor="Red" SetFocusOnError="true" ValidationGroup="new"></asp:RequiredFieldValidator>
                                        </div>
                                    <div class="col-md-4">
                                        <label>Name</label>
                                        <asp:TextBox runat="server" ID="txtName" Width="100%"></asp:TextBox>
                                    </div>
                                    <div class="col-md-4">
                                        <label>Description</label>
                                        <telerik:RadDropDownList runat="server" ID="dlDescription" Width="100%" DefaultMessage="Select Description" DataSourceID="descriptionSource" DataTextField="Description" DataValueField="TransactionType"></telerik:RadDropDownList>
                                        <asp:RequiredFieldValidator runat="server" ErrorMessage="Required Field" ControlToValidate="dlDescription" Display="Dynamic" ForeColor="Red" SetFocusOnError="true" ValidationGroup="new"></asp:RequiredFieldValidator>
                                        <asp:SqlDataSource ID="descriptionSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Description], [TransactionType] FROM [TransactionTypes] WHERE [TransactionType] = @Paytype">
                                            <SelectParameters>
                                                <asp:SessionParameter Name="Paytype" SessionField="npType" Type="String" DefaultValue=" " />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </div>
                                </div>
                            </div>
                             <div class="form-group">
                                    <div class="row">
                                        <div class="col-md-4">
                                        <label>Paymode</label>
                                        <telerik:RadDropDownList ID="dlPaymode" runat="server" Width="100%" AutoPostBack="true" OnItemSelected="dlPaymode_ItemSelected" CausesValidation="false">
                                            <Items>
                                                <telerik:DropDownListItem Text="Cash" />
                                                <telerik:DropDownListItem Text="Cheque" />
                                            </Items>
                                        </telerik:RadDropDownList>
                                    </div>
                                        <div class="col-md-4">
                                    <label>Currency</label>
                                    <telerik:RadDropDownList ID="dlCurrency" runat="server" Width="100%" DataSourceID="currencySource" DataTextField="cur_code" DataValueField="cur_rate" DefaultMessage="Select Currency"></telerik:RadDropDownList>
                                    <asp:RequiredFieldValidator runat="server" ErrorMessage="Required Field" ControlToValidate="dlCurrency" Display="Dynamic" ForeColor="Red" SetFocusOnError="true" ValidationGroup="new"></asp:RequiredFieldValidator>
                                    <asp:SqlDataSource ID="currencySource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [cur_code], [cur_rate] FROM [Currencies]"></asp:SqlDataSource>
                                </div>
                                 <div class="col-md-4">
                               <label>Amount</label>
                                <telerik:RadNumericTextBox runat="server" ID="txtAmount" MinValue="0" ShowSpinButtons="true" Width="100%" Value="0"></telerik:RadNumericTextBox>
                                <asp:RequiredFieldValidator runat="server" ErrorMessage="Required Field" ControlToValidate="txtAmount" Display="Dynamic" ForeColor="Red" SetFocusOnError="true" ValidationGroup="new"></asp:RequiredFieldValidator>
                            </div>
                                      
                                    </div>
                             </div>
                            <div class="form-group">
                                <div class="row">
                                     <div class="col-md-4">
                                        <label>Bank</label>
                                        <telerik:RadDropDownList runat="server" ID="dlBank" Width="100%" DefaultMessage="Select Bank" DataSourceID="bankSource" DataTextField="Bankname" DataValueField="Bankname" Enabled="false"></telerik:RadDropDownList>
                                        <asp:SqlDataSource ID="bankSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Bankname] FROM [Banks]"></asp:SqlDataSource>
                                    </div>
                                      <div class="col-md-4">
                                        <label>Cheque No.</label>
                                         <asp:TextBox runat="server" ID="txtChequeno" Width="100%" Enabled="false"></asp:TextBox>
                                    </div>
                                    <div class="col-md-4">
                                           <label>Value Date</label>
                                       <telerik:RadDatePicker runat="server" ID="dpValueDate" Width="100%" Enabled="false"></telerik:RadDatePicker>
                                   <asp:RequiredFieldValidator runat="server" ErrorMessage="Required Field" ControlToValidate="dpValueDate" Display="Dynamic" ForeColor="Red" SetFocusOnError="true" ValidationGroup="new"></asp:RequiredFieldValidator>
                                        </div>
                                </div>
                            </div>
                              <div class="form-group">
                                            <label>Remarks</label>
                                            <asp:TextBox runat="server" ID="txtRemarks" Width="100%"></asp:TextBox>
                                        </div>
                        <div class="modal-footer">
                    <asp:Button ID="btnReturn" runat="server" Text="Return" CssClass="btn btn-warning" CausesValidation="false" style="margin-bottom:0px"  />
                    <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-primary" ValidationGroup="new" OnClick="btnSave_Click" />
                </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div><!-- /.box-body -->
         
          </div><!-- /.box -->

</asp:Content>
