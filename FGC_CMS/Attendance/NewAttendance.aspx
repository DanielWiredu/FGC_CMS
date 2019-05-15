<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="NewAttendance.aspx.cs" Inherits="FGC_CMS.Setups.NewAttendance" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
     <div class="box box-default">
            <div class="box-header with-border">
              <h3 class="box-title">New Attendance </h3>
              <div class="box-tools pull-right">
                <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
              </div>
            </div><!-- /.box-header -->
            <div class="box-body">
                <asp:UpdatePanel runat="server" >
                    <ContentTemplate>
                    <div>
                    <table>
                        <tr>
                            <td>
                                <!-- left side of membership form -->
                                    <table>
              <tr >
           <td align="right"> <label>Service</label><span>&nbsp;&nbsp; </span></td>
           <td style="padding-bottom:2px">  <telerik:RadComboBox ID="dlService" runat="server" Width="300px" DataSourceID="serviceSource" DataTextField="ServiceName" DataValueField="ServiceName" Text="Select Service"></telerik:RadComboBox>
                            <asp:SqlDataSource ID="serviceSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT ServiceName FROM [Services]"></asp:SqlDataSource> </td>
         </tr>
             <tr >
           <td align="right"> <label>Service Date</label><span>&nbsp;&nbsp; </span></td>
           <td style="padding-bottom:2px"><telerik:RadDatePicker ID="dpServiceDate" runat="server" Width="300px"></telerik:RadDatePicker>
               <asp:RequiredFieldValidator runat="server" ErrorMessage="Required Field" ControlToValidate="dpServiceDate" Display="Dynamic" ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>
           </td>
         </tr>
        <tr >
           <td align="right"> <label>Service Kind</label><span>&nbsp;&nbsp; </span></td>
           <td style="padding-bottom:2px"> <asp:RadioButtonList ID="rdService" runat="server" CausesValidation="false" RepeatDirection="Vertical">
                                            <asp:ListItem Text="Celebration Assembly" Selected="True"></asp:ListItem>
                                            <asp:ListItem Text="Ahurisie Som"></asp:ListItem>
                                            <asp:ListItem Text="Peka Lasikoo"></asp:ListItem>
                                            <asp:ListItem Text="Desert Parash"></asp:ListItem>
                                            <asp:ListItem Text="Child Destiny School"></asp:ListItem>
                                            <asp:ListItem Text="Joint Service"></asp:ListItem>
                                           </asp:RadioButtonList></td>
         </tr>
        <tr >
           <td align="right"> <label>Males</label><span>&nbsp;&nbsp; </span></td>
           <td  style="padding-bottom:2px"><telerik:RadNumericTextBox ID="txtMales" runat="server" NumberFormat-DecimalDigits="0" MinValue="0" ShowSpinButtons="true" Width="300px" Value="0"></telerik:RadNumericTextBox>
                <asp:RequiredFieldValidator runat="server" ErrorMessage="Required Field" ControlToValidate="txtMales" Display="Dynamic" ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>
           </td>
         </tr>
        <tr>
           <td align="right"> <label>Females</label><span>&nbsp;&nbsp; </span></td>
           <td style="padding-bottom:2px"><telerik:RadNumericTextBox ID="txtFemales" runat="server" NumberFormat-DecimalDigits="0" MinValue="0" ShowSpinButtons="true" Width="300px" Value="0"></telerik:RadNumericTextBox>
                <asp:RequiredFieldValidator runat="server" ErrorMessage="Required Field" ControlToValidate="txtFemales" Display="Dynamic" ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>
           </td>
               
         </tr>
             <tr >
           <td align="right"> <label>Youth</label><span>&nbsp;&nbsp; </span></td>
           <td style="padding-bottom:2px"><telerik:RadNumericTextBox ID="txtYouth" runat="server" NumberFormat-DecimalDigits="0" MinValue="0" ShowSpinButtons="true" Width="300px" Value="0"></telerik:RadNumericTextBox>
                <asp:RequiredFieldValidator runat="server" ErrorMessage="Required Field" ControlToValidate="txtYouth" Display="Dynamic" ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>
           </td>
         </tr>
               <tr >
           <td align="right"> <label>Children</label><span>&nbsp;&nbsp; </span></td>
           <td style="padding-bottom:2px"><telerik:RadNumericTextBox ID="txtChildren" runat="server" NumberFormat-DecimalDigits="0" MinValue="0" ShowSpinButtons="true" Width="300px" Value="0"></telerik:RadNumericTextBox>
                <asp:RequiredFieldValidator runat="server" ErrorMessage="Required Field" ControlToValidate="txtChildren" Display="Dynamic" ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>
           </td>
         </tr>
         <tr >
           <td align="right"> <label>Speaker</label><span>&nbsp;&nbsp; </span></td>
           <td style="padding-bottom:2px"><asp:TextBox ID="txtSpeaker" runat="server" Width="300px"></asp:TextBox>
           </td>
         </tr>
         <tr >
           <td align="right"> <label>Comments</label><span>&nbsp;&nbsp; </span></td>
           <td style="padding-bottom:2px"><asp:TextBox ID="txtComments" runat="server" Width="300px" TextMode="MultiLine" Rows="5"></asp:TextBox>
           </td>
         </tr>
              
    </table>
                            </td>
                        </tr>
                    </table>
                    </div>
                           <div class="modal-footer">
                    <asp:Button runat="server" CssClass="btn btn-danger" ID="btnClose" Text="Exit" CausesValidation="false" OnClick="btnClose_Click"/>              
                    <asp:Button ID="btnSave" CssClass="btn btn-success" runat="server" Text="Save" OnClick="btnSave_Click"/>         
                </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div><!-- /.box-body -->
         
          </div><!-- /.box -->
</asp:Content>
