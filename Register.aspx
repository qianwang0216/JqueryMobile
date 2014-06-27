<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="http://code.jquery.com/mobile/1.0.1/jquery.mobile-1.0.1.min.css" />
	<script src="http://code.jquery.com/jquery-1.6.4.min.js"></script>
	<script src="http://code.jquery.com/mobile/1.0.1/jquery.mobile-1.0.1.min.js"></script>    <script src="js/global.js"></script>    <link rel="stylesheet" href="css/global.css" />

</head>
<body>
    <!-- Registeration page -->
	<div data-role="page" id="regPage" data-dom-cache="true" >
		<script type="text/javascript">
		    $("#regPage").live('pageinit', function () {
		        //bind swipe event
		        $('#regPage').bind("swiperight", function () {
		            $.mobile.changePage('Login.aspx', { transition: "slide", reverse: true });
		        });
		        $('#regPage').bind("swipeleft", function () {
		            $.mobile.changePage('#imgPage', { transition: "slide" });
		        });
		    });
		    $("#regPage").live("pageshow", function () {
		    });
		    
	</script>
		<div data-role="header"  data-theme="b">
		    <span class="ui-btn-left">
		        <a href="Login.aspx" data-role="button" data-inline="true" data-icon="back" class="ui-btn-left">Return</a> 
		    </span>
		    <h1>
			    Sign up
		    </h1>
		</div>
		<div data-role="content" data-theme="d">
			<form action="#" method="post" id="regForm" runat="server">
				<div data-role="fieldcontain" class="ui-hide-label">        
					<asp:Label ID="Label1" runat="server"> Username: </asp:Label>
                    <asp:TextBox ID="txt_name" runat="server" />
                    <asp:RequiredFieldValidator ID = "rfv_name" runat = "server" ControlToValidate = "txt_name" Display = "Dynamic" ErrorMessage = "Please input username"> </asp:RequiredFieldValidator>  
                    <br />
                    <asp:Label ID="Label2" runat="server"> Password: </asp:Label>
                    <asp:TextBox ID="txt_psw" runat="server" />
                    <asp:RequiredFieldValidator ID = "rfv_psw" runat = "server" ControlToValidate = "txt_psw" Display = "Dynamic" ErrorMessage = "Please input password"> </asp:RequiredFieldValidator> 
				    <br />
                </div>
                <!--Get the 'img' parameter from imgPage using jquery-->
						<a href="#imgPage" data-role="button">Choose a picture</a>
						<div id="headimg" class="seleced-user-head-img"></div>
                        <asp:HiddenField ID="hdf" runat="server" Value="" />
                                    <!--Choose a security question-->                    <asp:Label ID="lbl_question" runat="server" Text="Security question : " />                    <fieldset data-role="fieldcontain">                        <asp:DropDownList ID="ddl_secure" runat="server">
                            <asp:ListItem>What's your father's first name?</asp:ListItem>
                            <asp:ListItem>What's your mother's first name?</asp:ListItem>
                            <asp:ListItem>What's your pet's first name?</asp:ListItem>
                        </asp:DropDownList>                     </fieldset>                    <!--Type a security answer-->                    <asp:Label ID="lbl_answer" runat="server"> Security answer: </asp:Label>
                    <asp:TextBox ID="txt_answer" runat="server" />
                    <asp:RequiredFieldValidator ID = "rfv_answer" runat = "server" ControlToValidate = "txt_answer" Display = "Dynamic" ErrorMessage = "Please input answer"> </asp:RequiredFieldValidator>  
                    <br />                <!--Administrator opinions about this website-->
                <asp:Label ID="lbl_opinion" runat="server" Text="How do you feel this website?" /><br />
                <fieldset data-role="controlgroup" data-type="horizontal">
                    <asp:RadioButton ID="rb1" runat="server" Text="Bad" GroupName="Group2" />
                    <asp:RadioButton ID="rb2" runat="server" Text="Average" GroupName="Group2" />
                    <asp:RadioButton ID="rb3" runat="server" Text="Good" GroupName="Group2" Checked="true" />
		        </fieldset>                <!--Collect suggestions for this site-->                <asp:Label ID="lbl_suggestion" runat="server" Text="Which aspect do you think we can improve? "></asp:Label>                <fieldset data-role="controlgroup">
                    <asp:CheckBoxList ID="cbl" runat="server">
                        <asp:ListItem Value="0" Text="Color" ></asp:ListItem>
                        <asp:ListItem Value="1" Text="Content"></asp:ListItem>
                        <asp:ListItem Value="2" Text="Function"></asp:ListItem>
                        <asp:ListItem Value="3" Text="Others" Selected="True"></asp:ListItem>
                    </asp:CheckBoxList>
                </fieldset>      
                       
                <!--if (Request.Cookies["image"] != null)
        {
            lbl_welcome.Text = "Welcome, " + Request.Cookies["image"].Value + " ! ";-->
                <asp:Button ID="btn_submit" runat="server" Text="Sign up" data-theme="e" OnClick="btn_submit_Click" />
				<a href="Login.aspx" data-role="button" data-theme="c">Cancel</a>
              
			</form>
		</div>
	</div>
	
    <!-- User image  page -->
	<div data-role="page" id="imgPage" data-dom-cache="true">
	<script type="text/javascript">
	    var myScroll;
	    function loaded4() {
	        if (myScroll != null) {
	            myScroll.destroy();
	        }
	        myScroll = new iScroll("wrapperHead", { checkDOMChange: false });
	    }
	    function selectImg(img) {
	        $("#headimg").html("<img src=\"img/" + img + ".jpg\" onerror=\"errpic(this)\" />");
            //pass the 'img' to the HiddenField which is in registration page
	        $("#hdf").val(img);
	        //SetCookie("image", img);
	        goTo("#regPage");
	    }
        //Show the picture gallery
	    $("#imgPage").live('pageinit', function () {
	        var content = ""
	        for (var i = 1; i < 10; i++) {
	            content = content + "<li>";
	            content = content + "<a href=\"#\"><img src=\"img/" + i + ".jpg\" onerror=\"errpic(this)\" onclick=\"selectImg(" + i + ")\" /></a>";
	            content = content + "</li>";
	        }
	        $("#headpicul").append(content);

	        //bind swipe event
	        $('#imgPage').bind("swiperight", function () {
	            $.mobile.changePage('#regPage', { transition: "slide", reverse: true });
	        });
	    });
	    $("#imgPage").live("pagebeforeshow", function () {
	        setTimeout(loaded4, 200);
	    });

	    $("#imgPage").live('pageshow', function () {

	    });

	</script>
			<div data-role="header" data-theme="b">
				<span class="ui-btn-left"> <a href="#regPage" data-role="button" data-inline="true" data-icon="back" class="ui-btn-left">Return</a> </span>
				<h1>
					Choose a picture
				</h1>
			</div>
			<div data-role="content">
			<div id="wrapperHead" class="wrapper">
					<div id="scrollerHead" class="scroller">
						<ul id="headpicul" class="gallery">
						</ul>
					</div>
				</div>
			</div>
		</div>

</body>
</html>
