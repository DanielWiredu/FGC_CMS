<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="NewVisitor.aspx.cs" Inherits="FGC_CMS.Main.NewVisitor" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
                     <div class="box box-default">
            <div class="box-header with-border">
              <h3 class="box-title">New Visitor </h3>
              <div class="box-tools pull-right">
                <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
              </div>
            </div><!-- /.box-header -->
            <div class="box-body">
                         <asp:UpdatePanel runat="server" >
                    <ContentTemplate>
                         <div runat="server" id="lblMsg"></div>
                 <div>
                  <div class="form-group">
                 <div class="row">
                      <div class="col-md-3">
                         <label>VisitorID</label>
                         <asp:TextBox ID="txtVisitorID" runat="server" Width="100%" Enabled="false"></asp:TextBox>
                     </div>
                     <div class="col-md-3">
                         <label>Surname</label>
                         <asp:TextBox ID="txtSurname" runat="server" Width="100%"></asp:TextBox>
                          <asp:RequiredFieldValidator runat="server" ControlToValidate="txtSurname" Display="Dynamic" ErrorMessage="Required Field" SetFocusOnError="true" ForeColor="Red"></asp:RequiredFieldValidator>
                     </div>
                     <div class="col-md-3">
                         <label>OtherName(s)</label>
                         <asp:TextBox ID="txtOthernames" runat="server" Width="100%"></asp:TextBox>
                          <asp:RequiredFieldValidator runat="server" ControlToValidate="txtOthernames" Display="Dynamic" ErrorMessage="Required Field" SetFocusOnError="true" ForeColor="Red"></asp:RequiredFieldValidator>
                     </div>
                    <div class="col-md-3">
                         <label>Gender</label>
                         <telerik:RadDropDownList ID="dlGender" runat="server" Width="100%">
                             <Items>
                                 <telerik:DropDownListItem Text="Male" />
                                 <telerik:DropDownListItem Text="Female"/>
                             </Items>
                         </telerik:RadDropDownList>
                     </div>
                    
                 </div>
             </div>
                      <div class="form-group">
                 <div class="row">
                      <div class="col-md-3">
                         <label>Date of Visit </label>
                         <telerik:RadDatePicker ID="dpVisitDate" runat="server" Width="100%" DateInput-ReadOnly="true" MinDate="1/1/1850"></telerik:RadDatePicker>
                           <asp:RequiredFieldValidator runat="server" ControlToValidate="dpVisitDate" Display="Dynamic" ErrorMessage="Required Field" SetFocusOnError="true" ForeColor="Red"></asp:RequiredFieldValidator>
                     </div>
                    <div class="col-md-3">
                         <label>Telephone</label>
                         <asp:TextBox ID="txtTelephone" runat="server" Width="100%" TextMode="Number"></asp:TextBox>
                       </div>
                       <div class="col-md-6">
                         <label>Email</label>
                         <asp:TextBox ID="txtEmail" runat="server" Width="100%" TextMode="Email"></asp:TextBox>
                       </div>
                 </div>
             </div>
                       <div class="form-group">
                           <div class="row">
                               <div class="col-md-6">
                                 <label>Residential Address</label>
                                 <asp:TextBox ID="txtResAddress" runat="server" Width="100%"></asp:TextBox>
                     </div>
                       <div class="col-md-6">
                                 <label>Type of Visit</label>
                                 <asp:RadioButtonList runat="server" ID="rdVisitType" RepeatDirection="Horizontal" Width="100%" >
                                     <asp:ListItem Text="First Time" Value="First Time"></asp:ListItem>
                                     <asp:ListItem Text="Occasional" Value="Occasional"></asp:ListItem>
                                     <asp:ListItem Text="Regular" Value="Regular"></asp:ListItem>
                                 </asp:RadioButtonList>
                             </div>
                           </div>
                       </div>
                            </div>
                                  <div class="modal-footer"> 
                    <asp:Button runat="server" CssClass="btn btn-danger" Text="Exit" PostBackUrl="~/Main/Visitors.aspx" CausesValidation="false" style="margin-bottom:0px" />  
                     <asp:Button runat="server"  CssClass="btn btn-warning" Text="Clear" OnClick="Unnamed_Click" CausesValidation="false" />           
                    <asp:Button ID="btnSave" CssClass="btn btn-success" runat="server" Text="Save" CausesValidation="true" OnClick="btnSave_Click" />         
                </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div><!-- /.box-body -->
         
          </div><!-- /.box -->
</asp:Content>
