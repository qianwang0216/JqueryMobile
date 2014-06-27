<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="http://code.jquery.com/mobile/1.0.1/jquery.mobile-1.0.1.min.css" />
	<script src="http://code.jquery.com/jquery-1.6.4.min.js"></script>
	<script src="http://code.jquery.com/mobile/1.0.1/jquery.mobile-1.0.1.min.js"></script>    <script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.12.0/jquery.validate.min.js"></script>
</head>
<body>
    <div data-role="page" id="loginPage" data-dom-cache="true">
	    <!--header-->
		<div data-role="header" data-theme="b">
			<h1>Login</h1>
		</div>
        <!--content-->
		<div data-role="content" data-theme="d">
			<form  method="post" id="loginForm" runat="server">
				<div data-role="fieldcontain" class="ui-hide-label">
                    <asp:Label ID="lbl_username" runat="server"> Username: </asp:Label>
                    <asp:TextBox ID="txt_username" runat="server" />
                    <asp:RequiredFieldValidator ID = "RequiredFieldValidator1" runat = "server" ControlToValidate = "txt_username" Display = "Dynamic" ErrorMessage = "Please input username"> </asp:RequiredFieldValidator>  
                    <br />
                    <asp:Label ID="lbl_password" runat="server"> Password: </asp:Label>
                    <asp:TextBox ID="txt_password" runat="server" />
                    <asp:RequiredFieldValidator ID = "RequiredFieldValidator2" runat = "server" ControlToValidate = "txt_password" Display = "Dynamic" ErrorMessage = "Please input password"> </asp:RequiredFieldValidator> 
				</div>
                <asp:Button ID="btn_login" runat="server" Text="Sign in" data-theme="e" OnClick="btn_login_Click" />
				<!--Sign up-->
                <br />
					Do not have an account? <a href="Register.aspx" id="regButton" >Click here to sign up</a>
			</form>
		</div>
        <div data-role = "footer" data-position = "fixed" data-theme = "b"> 
                <h4> ©Copyright 2014 </h4> 
            </div> 
            <!-- /footer --> 
	</div>

</body>
</html>
