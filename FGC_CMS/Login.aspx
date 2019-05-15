<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="FGC_CMS.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
         <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>Church Management System</title>
    
    <link href="/charisma/bootstrap-cerulean.min.css" rel="stylesheet" />

    <link href="/charisma/bootstrap-spacelab.min.css" rel="stylesheet" />

    <link href="/bootstrap/fonts/font-awesome/css/font-awesome.css" rel="stylesheet" />

      <link rel="stylesheet" href="/bootstrap/css/bootstrap.min.css"/>


    <link rel="stylesheet" href="/dist/css/skins/skin-blue.min.css"/>

    <link href="/charisma/charisma-app.css" rel="stylesheet" />
</head>
<body style="background-image:url(/dist/img/the-place.jpg)">
    <form runat="server">
<div class="ch-container">
    <div class="row">
        
    <div class="row">
        <div class="col-md-12 center login-header">
            <h1 style="font-family:Cambria; font-weight:bolder; color:saddlebrown">CHURCH MANAGEMENT SYSTEM
            </h1>
        </div>
        <!--/span-->
    </div><!--/row-->

    <div class="row">
        <div class="well col-md-5 center login-box">
            <div class="alert alert-info" runat="server" id="lblAlert">
                Please login with your Username and Password.
            </div>
           
                <fieldset>
                    <div class="input-group input-group-lg">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-user red"></i></span>
                        <asp:TextBox CssClass="form-control" ID="uname" runat="server" placeholder="Username"></asp:TextBox>
                   
                         </div>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Username is required" ControlToValidate="uname" Display="Dynamic" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                    <div class="clearfix"></div><br>

                    <div class="input-group input-group-lg">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-lock red"></i></span>
                       <asp:TextBox CssClass="form-control" ID="pword" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
                    </div>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Password is required" ControlToValidate="pword" Display="Dynamic" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                    <div class="clearfix"></div><br />

                    <div class="input-prepend">
                        <asp:CheckBox ID="chkRemember" Text="Remember me" runat="server" />
                    </div>
                    <div class="clearfix"></div>

                    <p class="center col-md-5">
                        <asp:Button CssClass="btn btn-primary" ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" />
                    </p>
                </fieldset>
           
        </div>
        <!--/span-->
    </div><!--/row-->
</div><!--/fluid-row-->

</div><!--/.fluid-container-->

 </form>
</body>
</html>
