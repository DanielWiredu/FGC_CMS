<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="EditMember.aspx.cs" Inherits="FGC_CMS.Main.EditMember" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
      <div class="box box-default">
            <div class="box-header with-border">
              <h3 class="box-title">Edit Member </h3>
              <div class="box-tools pull-right">
                <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
              </div>
            </div><!-- /.box-header -->
            <div class="box-body">
                <asp:UpdatePanel runat="server" >
                    <ContentTemplate>
                        <div class="bg-primary">Member Details</div>
                    <div>
                    <table>
                        <tr>
                            <td style="padding-top:10px">
                                <!-- left side of membership form -->
                                    <table>
        <tr >
           <td align="right" > <label>Member ID</label><span>&nbsp;&nbsp; </span></td>
           <td style="padding-bottom:2px"><asp:TextBox ID="txtMemberID" runat="server" Width="150px" Enabled="false"></asp:TextBox></td>
         </tr>
        <tr >
           <td align="right"> <label>Surname</label><span>&nbsp;&nbsp; </span></td>
           <td style="padding-bottom:2px"> <asp:TextBox ID="txtSurname" runat="server" Width="300px"></asp:TextBox>
               <asp:RequiredFieldValidator runat="server" ControlToValidate="txtSurname" Display="Dynamic" ErrorMessage="Required Field" SetFocusOnError="true" ForeColor="Red"></asp:RequiredFieldValidator>
           </td>
         </tr>
        <tr >
           <td align="right"> <label>Firstname</label><span>&nbsp;&nbsp; </span></td>
           <td  style="padding-bottom:2px"> <asp:TextBox ID="txtFirstname" runat="server" Width="300px"></asp:TextBox>
               <asp:RequiredFieldValidator runat="server" ControlToValidate="txtFirstname" Display="Dynamic" ErrorMessage="Required Field" SetFocusOnError="true" ForeColor="Red"></asp:RequiredFieldValidator>
           </td>
         </tr>
        <tr>
           <td align="right"> <label>Othername(s)</label><span>&nbsp;&nbsp; </span></td>
           <td style="padding-bottom:2px"><asp:TextBox ID="txtOthername" runat="server" Width="300px"></asp:TextBox></td>
               
         </tr>

        <tr>
           <td align="right"> <label>Gender</label><span>&nbsp;&nbsp; </span></td>
           <td style="padding-bottom:2px; padding-right:2px""><telerik:RadDropDownList ID="dlGender" runat="server" Width="300px">
                             <Items>
                                 <telerik:DropDownListItem Text="Male" Value="Male"/>
                                 <telerik:DropDownListItem Text="Female" Value="Female" Selected="true" />
                             </Items>
                         </telerik:RadDropDownList></td>
         </tr>

        <tr >
           <td align="right"> <label>Date of Birth</label><span>&nbsp;&nbsp; </span></td>
           <td style="padding-bottom:2px"><telerik:RadDatePicker ID="dpDOB" runat="server" Width="300px" MinDate="1/1/1850"></telerik:RadDatePicker>
               <asp:RequiredFieldValidator runat="server" ControlToValidate="dpDOB" Display="Dynamic" ErrorMessage="Required Field" SetFocusOnError="true" ForeColor="Red"></asp:RequiredFieldValidator>
           </td>
         </tr>

        <tr>
           <td align="right"> <label>Marital Status</label><span>&nbsp;&nbsp; </span></td>
           <td style="padding-bottom:2px; padding-right:2px">   <telerik:RadDropDownList ID="dlMaritalStatus" runat="server" Width="300px" >
                             <Items>
                                 <telerik:DropDownListItem Text="Single" Value="Single" Selected="true"/>
                                 <telerik:DropDownListItem Text="Married" Value="Married" />
                                 <telerik:DropDownListItem Text="Separated" Value="Separated" />
                                 <telerik:DropDownListItem Text="Divorced" Value="Divorced" />
                                 <telerik:DropDownListItem Text="Widowed" Value="Widowed"/>
                             </Items>
                         </telerik:RadDropDownList></td>
         </tr>
             <tr >
           <td align="right"> <label>Spouse</label><span>&nbsp;&nbsp; </span></td>
           <td style="padding-bottom:2px"><asp:TextBox ID="txtSpouse" runat="server" Width="300px"></asp:TextBox></td>
         </tr>
               <tr >
           <td align="right"> <label>Mobile No.</label><span>&nbsp;&nbsp; </span></td>
           <td style="padding-bottom:2px"><asp:TextBox ID="txtMobile" runat="server" Width="300px"></asp:TextBox></td>
         </tr>

               <tr >
           <td align="right"> <label>Telephone</label><span>&nbsp;&nbsp; </span></td>
           <td style="padding-bottom:2px"><asp:TextBox ID="txtPhone" runat="server" Width="300px"></asp:TextBox></td>
         </tr>
               <tr >
           <td align="right"> <label>Occupation</label><span>&nbsp;&nbsp; </span></td>
           <td style="padding-bottom:2px">  <telerik:RadComboBox ID="dlOccupation" runat="server" Width="300px" DataSourceID="occupationSource" DataTextField="Occupation" DataValueField="Occupation" Filter="Contains" MarkFirstMatch="True" Text="Select Occupation"></telerik:RadComboBox>
                            <asp:SqlDataSource ID="occupationSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Occupation]"></asp:SqlDataSource> </td>
         </tr>
                <tr >
           <td align="right"> <label>Email</label><span>&nbsp;&nbsp; </span></td>
           <td style="padding-bottom:2px"><asp:TextBox ID="txtEmail" runat="server" Width="300px"></asp:TextBox></td>
         </tr>
                <tr >
           <td align="right"> <label>Residential Address</label><span>&nbsp;&nbsp; </span></td>
           <td style="padding-bottom:2px"><asp:TextBox ID="txtResAddress" runat="server" Width="300px"></asp:TextBox></td>
         </tr>
                <tr >
           <td align="right"> <label>Postal Address</label><span>&nbsp;&nbsp; </span></td>
           <td style="padding-bottom:2px"><asp:TextBox ID="txtPostAddress" runat="server" Width="300px"></asp:TextBox></td>
         </tr>
             <tr >
           <td align="right"> <label>Ministry</label><span>&nbsp;&nbsp; </span></td>
           <td style="padding-bottom:2px">     <telerik:RadComboBox ID="dlMinistry" runat="server" Width="300px" DataSourceID="ministrySource" DataTextField="MinistryName" DataValueField="MinistryName" Filter="Contains" MarkFirstMatch="True" Text="Select Ministry"></telerik:RadComboBox>
                            <asp:SqlDataSource ID="ministrySource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT MinistryName FROM Ministry WHERE (MinistryName LIKE @ministry + '%')">
                                <SelectParameters>
                                    <asp:SessionParameter Name="ministry" SessionField="userministry" ConvertEmptyStringToNull="false" />
                                </SelectParameters>
               </asp:SqlDataSource>   
                        </td>
         </tr>
                  <tr >
           <td align="right"> <label>Department</label><span>&nbsp;&nbsp; </span></td>
           <td style="padding-bottom:2px">      <telerik:RadComboBox ID="dlDepartment" runat="server" Width="300px" DataSourceID="deptSource" DataTextField="DeptName" DataValueField="DeptName" Filter="Contains" MarkFirstMatch="True" Text="Select Department"></telerik:RadComboBox>
                            <asp:SqlDataSource ID="deptSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DeptName FROM [Department]"></asp:SqlDataSource>                               
                        </td>
         </tr>
                 <tr >
           <td align="right"> <label>Committee</label><span>&nbsp;&nbsp; </span></td>
           <td style="padding-bottom:2px">      <telerik:RadComboBox ID="dlCommittee" runat="server" Width="300px" DataSourceID="commSource" DataTextField="CommName" DataValueField="CommName" Filter="Contains" MarkFirstMatch="True" Text="Select Committee"></telerik:RadComboBox>
                            <asp:SqlDataSource ID="commSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT CommName FROM [Committee]"></asp:SqlDataSource>                               
                        </td>
         </tr>
                <tr >
           <td align="right"> <label>Tabernacle</label><span>&nbsp;&nbsp; </span></td>
           <td style="padding-bottom:2px">      <telerik:RadComboBox ID="dlTabernacle" runat="server" Width="300px" DataSourceID="tabSource" DataTextField="TabName" DataValueField="TabName" Filter="Contains" MarkFirstMatch="True" Text="Select Tabernacle"></telerik:RadComboBox>
                            <asp:SqlDataSource ID="tabSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT TabName FROM [Tabernacle]"></asp:SqlDataSource>                               
                         </td>
         </tr>
    </table>
                            </td>
                            <td style="vertical-align:top; padding-left:100px; padding-top:10px">
                                <!-- right side of form -->
                                <table>
                                         <tr >
           <td align="right"> <label>Image</label><span>&nbsp;&nbsp; </span></td>
           <td style="padding-bottom:2px"> <asp:Image ID="Image1" runat="server" Width="200px" Height="160px" BackColor="#cccccc" />
                            <asp:Button runat="server" ID="btnUpload" Text="Upload" OnClick="btnUpload_Click" CausesValidation="false" />
                            <asp:FileUpload ID="FileUpload1" runat="server" /></td>
         </tr>
         
                                </table>
                            </td>
                        </tr>
                    </table>
                    </div>
                           <div class="modal-footer">
                    <asp:Button runat="server" CssClass="btn btn-danger" ID="btnClose" Text="Exit" CausesValidation="false" OnClick="btnClose_Click"/>              
                    <asp:Button ID="btnSave" CssClass="btn btn-success" runat="server" Text="Update" OnClick="btnSave_Click"/>         
                </div>
                    </ContentTemplate>
                          <Triggers>
                        <asp:PostBackTrigger ControlID="btnUpload" />
                    </Triggers>
                </asp:UpdatePanel>
            </div><!-- /.box-body -->
         
          </div><!-- /.box -->
</asp:Content>
