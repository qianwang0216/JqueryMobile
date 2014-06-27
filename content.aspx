<%@ Page Language="C#" AutoEventWireup="true" CodeFile="content.aspx.cs" Inherits="content" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="http://code.jquery.com/mobile/1.0.1/jquery.mobile-1.0.1.min.css" />
	<script src="http://code.jquery.com/jquery-1.6.4.min.js"></script>
	<script src="http://code.jquery.com/mobile/1.0.1/jquery.mobile-1.0.1.min.js"></script>

    <script>
        function check() {
            return confirm("Delete?");
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div data-role = "page" > 
            <!-- header --> 
            <div data-role = "header" data-position = "fixed" data-theme = "b"> 
                <h1> Employee Management </h1>
                <div style="float:right"> 
                    <asp:Label ID="lbl_welcome" runat="server" />
                    <asp:Image ID="img_userpic" runat="server" Width="15%" Height="15%" />
                </div>
            </div> 
            <!-- /header --> 

            <!-- content --> 
            <div data-role = "content"> 
                <!--Display a employee list-->
                    <a href = "Edit.aspx?Mode=Insert" data-icon = "plus" data-ajax = "false" data-role = "button"> Insert </a> 
                    <br/>
                    <asp:ListView ID="ListView1" runat="server" DataKeyNames="EmployeeId" OnItemDeleting="ListView1_ItemDeleting">
                        <AlternatingItemTemplate> 
                            <li style = "background-color: #9ACFC0"> 
                                <div class = "ui-grid-a"> 
                                    <div class = "ui-block-a"> Employee No: </div> 
                                    <div class = "ui-block-b"> 
                                        <asp:Label ID = "lbl_EmployeeId" runat = "server" Text = '<%# Eval("EmployeeId") %>' /> 
                                    </div> 
                                </div> 
                                <div class = "ui-grid-a"> 
                                    <div class = "ui-block-a"> Name: </div> 
                                    <div class = "ui-block-b"> 
                                        <asp:Label ID = "lbl_name" runat = "server" Text = '<%# Eval("Name") %>' /> 
                                    </div> 
                                </div> 
                                <div class = "ui-grid-a"> 
                                    <div class = "ui-block-a"> Age: </div> 
                                    <div class = "ui-block-b"> 
                                        <asp:Label ID = "lbl_age" runat = "server" Text = '<%# Eval("Age") %>' /> 
                                    </div> 
                                </div>
                                <div class = "ui-grid-a"> 
                                    <div class = "ui-block-a"> Gender: </div> 
                                    <div class = "ui-block-b"> 
                                        <asp:Label ID = "lbl_gender" runat = "server" Text = '<%# Eval("Gender") %>' /> 
                                    </div> 
                                </div> 
                                <div class = "ui-grid-a"> 
                                    <div class = "ui-block-a"> 
                                        <a data-ajax = "false" data-icon = "grid" data-role = "button" href = 'Edit.aspx?id=<%# Eval("EmployeeId") %>'> Edit </a>  
                                    </div> 
                                    <div class = "ui-block-b"> 
                                        <asp:Button ID = "DeleteButton" data-icon = "delete" runat = "server" CommandName = "Delete" OnClientClick = "return check()" Text = "Delete" /> 
                                    </div> 
                                </div> 
                            </li> 
                        </AlternatingItemTemplate> 
                        <EmptyDataTemplate> 
                            No data. 
                        </EmptyDataTemplate> 
                        <ItemTemplate> 
                            <li style = ""> 
                                <div class = "ui-grid-a"> 
                                    <div class = "ui-block-a"> Employee No: </div> 
                                    <div class = "ui-block-b"> 
                                        <asp:Label ID = "lbl_EmployeeId" runat = "server" Text = '<%# Eval("EmployeeId") %>' /> 
                                    </div> 
                                </div> 
                                <div class = "ui-grid-a"> 
                                    <div class = "ui-block-a"> Name: </div> 
                                    <div class = "ui-block-b"> 
                                        <asp:Label ID = "lbl_name" runat = "server" Text = '<%# Eval("Name") %>' /> 
                                    </div> 
                                </div> 
                                <div class = "ui-grid-a"> 
                                    <div class = "ui-block-a"> Age: </div> 
                                    <div class = "ui-block-b"> 
                                        <asp:Label ID = "lbl_age" runat = "server" Text = '<%# Eval("Age") %>' /> 
                                    </div> 
                                </div>
                                <div class = "ui-grid-a"> 
                                    <div class = "ui-block-a"> Gender: </div> 
                                    <div class = "ui-block-b"> 
                                        <asp:Label ID = "lbl_gender" runat = "server" Text = '<%# Eval("Gender") %>' /> 
                                    </div> 
                                </div>
                                <div class = "ui-grid-a"> 
                                    <div class = "ui-block-a"> <a data-ajax = "false" data-icon = "grid" data-role = "button" href = 'Edit.aspx?id=<%# Eval("EmployeeId") %>'> Edit </a></div> 
                                    <div class="ui-block-b"> 
                                        <asp:Button ID = "DeleteButton" data-icon = "delete" runat = "server" CommandName = "Delete" OnClientClick = "return check()" Text = "Delete" /> 
                                    </div> 
                                </div> 
                            </li> 
                        </ItemTemplate> 
                        <LayoutTemplate> 
                            <ul id = "itemPlaceholderContainer" runat = "server" style = "" data-role = "listview"> 
                                <li runat = "server" id = "itemPlaceholder" /> 
                            </ul> 
                        </LayoutTemplate> 
                    </asp:ListView> 
                
            </div> 
            <!-- /content --> 
            <div data-role = "footer" data-position = "fixed" data-theme = "b"> 
                <h4> ©Copyright 2014 </h4> 
            </div> 
            <!-- /footer --> 
        </div> 
    </form>
</body>
</html>
