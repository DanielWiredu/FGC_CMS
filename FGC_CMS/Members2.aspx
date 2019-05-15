<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Members2.aspx.cs" Inherits="FGC_CMS.Members_2" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <telerik:RadScriptManager ID="RadScriptManager1" runat="server"></telerik:RadScriptManager>
      <%--<div class="box box-default">
            <div class="box-header with-border">
              <h3 class="box-title">Add Member </h3>
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
        <tr >
           <td align="right" > <label>Member ID</label><span>&nbsp;&nbsp; </span></td>
           <td style="padding-bottom:2px"><asp:TextBox ID="TextBox2" runat="server" Width="150px"></asp:TextBox></td>
         </tr>
        <tr >
           <td align="right"> <label>Surname</label><span>&nbsp;&nbsp; </span></td>
           <td style="padding-bottom:2px"> <asp:TextBox ID="txtSurname" runat="server" Width="300px"></asp:TextBox></td>
         </tr>
        <tr >
           <td align="right"> <label>Firstname</label><span>&nbsp;&nbsp; </span></td>
           <td  style="padding-bottom:2px"> <asp:TextBox ID="txtFirstname" runat="server" Width="300px"></asp:TextBox></td>
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
                                 <telerik:DropDownListItem Text="Unknown" Value="Unknown" />
                             </Items>
                         </telerik:RadDropDownList></td>
         </tr>

        <tr >
           <td align="right"> <label>Date of Birth</label><span>&nbsp;&nbsp; </span></td>
           <td style="padding-bottom:2px"><telerik:RadDatePicker ID="dpDOB" runat="server" Width="300px"></telerik:RadDatePicker></td>
         </tr>

        <tr>
           <td align="right"> <label>Marital Status</label><span>&nbsp;&nbsp; </span></td>
           <td style="padding-bottom:2px; padding-right:2px">   <telerik:RadDropDownList ID="dlMaritalStatus" runat="server" Width="300px">
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
           <td style="padding-bottom:2px"><asp:TextBox ID="TextBox1" runat="server" Width="300px"></asp:TextBox></td>
         </tr>
                <tr >
           <td align="right"> <label>Postal Address</label><span>&nbsp;&nbsp; </span></td>
           <td style="padding-bottom:2px"><asp:TextBox ID="TextBox3" runat="server" Width="300px"></asp:TextBox></td>
         </tr>
             <tr >
           <td align="right"> <label>Ministry</label><span>&nbsp;&nbsp; </span></td>
           <td style="padding-bottom:2px">     <telerik:RadComboBox ID="dlMinistry" CheckBoxes="true" EnableCheckAllItemsCheckBox="true" runat="server" Width="300px" DataSourceID="ministrySource" DataTextField="MinistryName" DataValueField="MinistryCode" Filter="None" MarkFirstMatch="false" Text="Select Ministry"></telerik:RadComboBox>
                            <asp:SqlDataSource ID="ministrySource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT MinistryCode, MinistryName FROM [Ministry]"></asp:SqlDataSource>   
                        </td>
         </tr>
                  <tr >
           <td align="right"> <label>Department</label><span>&nbsp;&nbsp; </span></td>
           <td style="padding-bottom:2px">      <telerik:RadComboBox ID="dlDepartment" runat="server" Width="300px" DataSourceID="deptSource" DataTextField="DeptName" DataValueField="DeptCode" Filter="Contains" MarkFirstMatch="True" Text="Select Department"></telerik:RadComboBox>
                            <asp:SqlDataSource ID="deptSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DeptCode, DeptName FROM [Department]"></asp:SqlDataSource>                               
                        </td>
         </tr>
                 <tr >
           <td align="right"> <label>Committee</label><span>&nbsp;&nbsp; </span></td>
           <td style="padding-bottom:2px">      <telerik:RadComboBox ID="dlCommittee" runat="server" Width="300px" DataSourceID="commSource" DataTextField="CommName" DataValueField="CommCode" Filter="Contains" MarkFirstMatch="True" Text="Select Committee"></telerik:RadComboBox>
                            <asp:SqlDataSource ID="commSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT CommCode, CommName FROM [Committee]"></asp:SqlDataSource>                               
                        </td>
         </tr>
                <tr >
           <td align="right"> <label>Tabernacle</label><span>&nbsp;&nbsp; </span></td>
           <td style="padding-bottom:2px">      <telerik:RadComboBox ID="dlTabernacle" runat="server" Width="300px" DataSourceID="tabSource" DataTextField="TabName" DataValueField="TabCode" Filter="Contains" MarkFirstMatch="True" Text="Select Tabernacle"></telerik:RadComboBox>
                            <asp:SqlDataSource ID="tabSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT TabCode, TabName FROM [Tabernacle]"></asp:SqlDataSource>                               
                         </td>
         </tr>
             <tr >
           <td align="right"> <label>Image</label><span>&nbsp;&nbsp; </span></td>
           <td style="padding-bottom:2px"> <asp:Image ID="Image1" runat="server" Width="200px" Height="160px" BackColor="#cccccc" />
                            <asp:Button runat="server" ID="btnUpload" Text="Upload" />
                            <asp:FileUpload ID="FileUpload1" runat="server" /></td>
         </tr>


                              <tr >
           <td align="right"> <label>Image</label><span>&nbsp;&nbsp; </span></td>
           <td style="padding-bottom:2px"> 
               <telerik:RadMonthYearPicker ID="RadMonthYearPicker1" runat="server" AutoPostBack="True" OnSelectedDateChanged="RadMonthYearPicker1_SelectedDateChanged"></telerik:RadMonthYearPicker>
           </td>
         </tr>
           <tr>
               <td>
                   <asp:Button ID="btnSetText" CssClass="btn btn-success" runat="server" Text="Button" OnClick="btnSetText_Click" />
               </td>
           </tr>
   
    
    </table>
                    </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div><!-- /.box-body -->
         
          </div>--%><!-- /.box -->



      <div class="box box-default">
            <div class="box-header with-border">
              <h3 class="box-title">New Member </h3>
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
                  <div class="form-group">
                 <div class="row">
                      <div class="col-md-3">
                         <label>MemberID</label>
                         <asp:TextBox ID="txtMemberID" runat="server" Width="100%" Enabled="false"></asp:TextBox>
                     </div>
                     <div class="col-md-3">
                         <label>Surname</label>
                         <asp:TextBox ID="txtSurname" runat="server" Width="100%"></asp:TextBox>
                          <asp:RequiredFieldValidator runat="server" ControlToValidate="txtSurname" Display="Dynamic" ErrorMessage="Required Field" SetFocusOnError="true" ForeColor="Red"></asp:RequiredFieldValidator>
                     </div>
                     <div class="col-md-3">
                         <label>Firstname</label>
                         <asp:TextBox ID="txtFirstname" runat="server" Width="100%"></asp:TextBox>
                          <asp:RequiredFieldValidator runat="server" ControlToValidate="txtFirstname" Display="Dynamic" ErrorMessage="Required Field" SetFocusOnError="true" ForeColor="Red"></asp:RequiredFieldValidator>
                     </div>
                   <div class="col-md-3">
                         <label>Othername(s)</label>
                         <asp:TextBox ID="TextBox6" runat="server" Width="100%"></asp:TextBox>
                     </div>
                    
                 </div>
             </div>
                      <div class="form-group">
                 <div class="row">
                        <div class="col-md-3">
                         <label>Gender</label>
                         <telerik:RadDropDownList ID="RadDropDownList1" runat="server" Width="100%">
                             <Items>
                                 <telerik:DropDownListItem Text="Male" Value="Male"/>
                                 <telerik:DropDownListItem Text="Female" Value="Female" Selected="true" />
                                 <telerik:DropDownListItem Text="Unknown" Value="Unknown" />
                             </Items>
                         </telerik:RadDropDownList>
                     </div>
                      <div class="col-md-3">
                         <label>Date of Birth</label>
                         <telerik:RadDatePicker ID="dpDOB" runat="server" Width="100%"></telerik:RadDatePicker>
                           <asp:RequiredFieldValidator runat="server" ControlToValidate="dpDOB" Display="Dynamic" ErrorMessage="Required Field" SetFocusOnError="true" ForeColor="Red"></asp:RequiredFieldValidator>
                     </div>
                   
                     <div class="col-md-3">
                         <label>Marital Status</label>
                         <telerik:RadDropDownList ID="RadDropDownList2" runat="server" Width="100%" >
                             <Items>
                                 <telerik:DropDownListItem Text="Single" Value="Single" Selected="true"/>
                                 <telerik:DropDownListItem Text="Married" Value="Married" />
                                 <telerik:DropDownListItem Text="Separated" Value="Separated" />
                                 <telerik:DropDownListItem Text="Divorced" Value="Divorced" />
                                 <telerik:DropDownListItem Text="Widowed" Value="Widowed"/>
                             </Items>
                         </telerik:RadDropDownList>
                     </div>
                     <div class="col-md-3">
                         <label>Spouse</label>
                         <asp:TextBox ID="TextBox7" runat="server" Width="100%"></asp:TextBox>
                       </div>
                      
                 
                 </div>
             </div>
                     <div class="form-group">
                         <div class="row">
                             <div class="col-md-3">
                         <label>Mobile No.</label>
                         <asp:TextBox ID="TextBox8" runat="server" Width="100%"></asp:TextBox>
                     </div>
                             <div class="col-md-3">
                         <label>Telephone</label>
                         <asp:TextBox ID="TextBox9" runat="server" Width="100%"></asp:TextBox>
                            </div>
                             <div class="col-md-3">
                               <label>Occupation</label>
                               <telerik:RadComboBox ID="RadComboBox1" runat="server" Width="100%" DataSourceID="occupationSource" DataTextField="Occupation" DataValueField="Occupation" Filter="Contains" MarkFirstMatch="True" Text="Select Occupation"></telerik:RadComboBox>
                            <asp:SqlDataSource ID="occupationSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Occupation]"></asp:SqlDataSource>                               
                         </div>
                         <div class="col-md-3">
                         <label>Email</label>
                         <asp:TextBox ID="TextBox10" runat="server" Width="100%" TextMode="Email"></asp:TextBox>
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
                                 <label>Postal Address</label>
                                 <asp:TextBox ID="txtPostAddress" runat="server" Width="100%" ></asp:TextBox>
                             </div>
                         </div>
                     </div>
                      <div class="form-group">
                 <div class="row">
                       <div class="col-md-3">
                               <label>Ministry</label>
                               <telerik:RadComboBox ID="RadComboBox2" runat="server" Width="100%" DataSourceID="ministrySource" DataTextField="MinistryName" DataValueField="MinistryName" Filter="Contains" MarkFirstMatch="True" Text="Select Ministry"></telerik:RadComboBox>
                            <asp:SqlDataSource ID="ministrySource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT MinistryName FROM [Ministry]"></asp:SqlDataSource>   
                         </div>
                         <div class="col-md-3">
                               <label>Department</label>
                               <telerik:RadComboBox ID="RadComboBox3" runat="server" Width="100%" DataSourceID="deptSource" DataTextField="DeptName" DataValueField="DeptName" Filter="Contains" MarkFirstMatch="True" Text="Select Department"></telerik:RadComboBox>
                            <asp:SqlDataSource ID="deptSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DeptName FROM [Department]"></asp:SqlDataSource>                               
                         </div>
                         <div class="col-md-3">
                               <label>Committee</label>
                               <telerik:RadComboBox ID="RadComboBox4" runat="server" Width="100%" DataSourceID="commSource" DataTextField="CommName" DataValueField="CommName" Filter="Contains" MarkFirstMatch="True" Text="Select Committee"></telerik:RadComboBox>
                            <asp:SqlDataSource ID="commSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT CommName FROM [Committee]"></asp:SqlDataSource>                               
                         </div>
                         <div class="col-md-3">
                               <label>Tabernacle</label>
                               <telerik:RadComboBox ID="RadComboBox5" runat="server" Width="100%" DataSourceID="tabSource" DataTextField="TabName" DataValueField="TabName" Filter="Contains" MarkFirstMatch="True" Text="Select Tabernacle"></telerik:RadComboBox>
                            <asp:SqlDataSource ID="tabSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT TabName FROM [Tabernacle]"></asp:SqlDataSource>                               
                         </div>
                 </div>
             </div>
                 
                     <div class="form-group">
                         <div class="row">
                        <div class="col-md-3">
                            <label>Image</label>
                            <asp:Image ID="Image2" runat="server" Width="100%" Height="160px" BackColor="#cccccc" />
                            <asp:Button runat="server" ID="Button1" Text="Upload" CausesValidation="false" />
                            <asp:FileUpload ID="FileUpload2" runat="server" />
                        </div>
                         </div>
                     </div>
                     <div class="modal-footer">
                    <asp:Button runat="server" CssClass="btn btn-danger" ID="btnClose" Text="Exit" CausesValidation="false"/>              
                    <asp:Button ID="btnSave" CssClass="btn btn-success" runat="server" Text="Save" />         
                </div>
                            </div>
                    </ContentTemplate>
                   <%-- <Triggers>
                        <asp:PostBackTrigger ControlID="btnUpload" />
                    </Triggers>--%>
                </asp:UpdatePanel>
            </div><!-- /.box-body -->
         
          </div><!-- /.box -->
</asp:Content>
