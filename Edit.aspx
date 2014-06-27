<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Edit.aspx.cs" Inherits="Edit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="http://code.jquery.com/mobile/1.0.1/jquery.mobile-1.0.1.min.css" />
	<script src="http://code.jquery.com/jquery-1.6.4.min.js"></script>
	<script src="http://code.jquery.com/mobile/1.0.1/jquery.mobile-1.0.1.min.js"></script>
    <script>
        $().ready(function () {
            $("#AgeInput").val($("#AgeHiddenField").val());
            $("#AgeInput").slider('refresh');

            $('#AgeInput').change(function () {
                $("#AgeHiddenField").val($(this).val());
            })
        });
    </script>
   
</head>

<body>
    <form id="form1" runat="server">
        <div data-role = "page"> 
            <div data-role = "header" data-position = "fixed" data-theme = "b"> 
                <h1> Edit Employees </h1>  
                <div style="float:right"> 
                    <asp:Label ID="lbl_welcome" runat="server" />
                    <asp:Image ID="img_userpic" runat="server" Width="15%" Height="15%" />
                </div>
                <a target="_self" data-role="button" data-icon="home" href="content.aspx">Home</a>
            </div> 
            <!-- /header --> 

            <!--Display a employee list for the administrator to edit-->
            <div data-role = "content"> 
                <asp:FormView ID = "FormView1" runat = "server" DataKeyNames="EmployeeId" DefaultMode="Edit" Width="100%" OnItemUpdating="FormView1_ItemUpdating" OnItemInserting="FormView1_ItemInserting"> 
                    <EditItemTemplate> 
                        <div class = "ui-grid-a"> 
                            <div class = "ui-block-a"> Employee No: </div> 
                            <div class = "ui-block-b"> 
                                <asp:Label ID="lbl_EmployeeId" runat = "server" Text = '<%# Eval("EmployeeId") %>' /> 
                            </div> 
                        </div> 
                        <div class = "ui-grid-a"> 
                            <div class = "ui-block-a"> Name: </div> 
                            <div class = "ui-block-b"> 
                                <asp:TextBox ID = "txt_name" runat = "server" Text = '<%# Bind("Name") %>' /> 
                                <asp:RequiredFieldValidator ID = "RequiredFieldValidator1" runat = "server" ControlToValidate = "txt_name" Display = "Dynamic" ErrorMessage = "Please input name"> </asp:RequiredFieldValidator> 
                            </div> 
                        </div> 
                        <div class = "ui-grid-a"> 
                            <div class = "ui-block-a"> Age: </div> 
                            <div class = "ui-block-b"> 
                                <div data-role = "fieldcontain"> 
                                    <input type = "range" name = "AgeInput" id = "AgeInput" min = "10" max = "100" /> 
                                </div> 
                                <asp:HiddenField Value = '<%# Bind("Age") %>' ID = "AgeHiddenField" ClientIDMode = "Static" runat = "server" /> 
                            </div> 
                        </div>
                        <div class = "ui-grid-a"> 
                            <div class = "ui-block-a"> Gender: </div> 
		                        <div class = "ui-block-b">
		                        <fieldset data-role="controlgroup" data-type="horizontal">
                                    <asp:RadioButton ID="rb2" runat="server" Text="Female" GroupName="Group2" Checked="true" />
                                    <asp:RadioButton ID="rb3" runat="server" Text="Male" GroupName="Group2" />
		                        </fieldset>
                                <asp:HiddenField Value = '<%# Bind("Gender") %>' ID = "GenderHiddenField" ClientIDMode = "Static" runat = "server" />      
                            </div>
                        </div>  
                        <div class = "ui-grid-a"> 
                            <div class = "ui-block-a"> 
                                <asp:LinkButton data-role = "button" data-icon = "check" ID = "UpdateButton" runat = "server" CausesValidation = "True" CommandName = "Update" Text = "Update" /> 
                            </div> 
                            <div class = "ui-block-b"> 
                                <a data-rel = "back" data-role = "button" data-icon = "back"> Cancel </a> 
                            </div> 
                        </div> 
                    </EditItemTemplate> 
                    <InsertItemTemplate> 
                        <div class = "ui-grid-a"> 
                            <div class = "ui-block-a"> Employee No: </div> 
                            <div class = "ui-block-b"> 
                                <asp:TextBox ID = "txt_id" runat = "server" Text = '<%# Bind("EmployeeId") %>' /> 
                                <asp:RequiredFieldValidator ID = "RequiredFieldValidator2" runat = "server" ControlToValidate = "txt_id" Display = "Dynamic" ErrorMessage = "Please input Employee No"> </asp:RequiredFieldValidator> 
                                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="txt_id" ErrorMessage="Please input number" Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                            </div> 
                        </div> 
                        <div class = "ui-grid-a"> 
                            <div class = "ui-block-a"> Name: </div> 
                            <div class = "ui-block-b"> 
                                <asp:TextBox ID = "txt_name" runat = "server" Text = '<%# Bind("Name") %>' /> 
                                <asp:RequiredFieldValidator ID = "RequiredFieldValidator1" runat = "server" ControlToValidate = "txt_name" Display = "Dynamic" ErrorMessage = "Please input name"> </asp:RequiredFieldValidator> 
                            </div> 
                        </div> 
                        <div class = "ui-grid-a"> 
                            <div class = "ui-block-a"> Age: </div> 
                            <div class = "ui-block-b"> 
                                <div data-role = "fieldcontain"> 
                                    <input type = "range" name = "AgeInput" id = "AgeInput" value = "25" min = "10" max = "100" /> 
                                </div> 
                                <asp:HiddenField Value = '<%# Bind("Age") %>' ID = "AgeHiddenField" ClientIDMode = "Static" runat = "server" /> 
                            </div> 
                        </div> 
                        <div class = "ui-grid-a"> 
                            <div class = "ui-block-a"> Gender: </div>
                            <div class = "ui-block-b">
		                        <fieldset data-role="controlgroup" data-type="horizontal">
                                    <asp:RadioButton ID="rb2" runat="server" Text="Female" GroupName="Group2" Checked="true" />
                                    <asp:RadioButton ID="rb3" runat="server" Text="Male" GroupName="Group2" />
		                        </fieldset>
                                <asp:HiddenField Value = '<%# Bind("Gender") %>' ID = "GenderHiddenField" ClientIDMode = "Static" runat = "server" />      
                            </div>
                        </div> 
                        <div class = "ui-grid-a"> 
                            <div class = "ui-block-a"> 
                                <asp:LinkButton data-role = "button" data-icon = "plus" ID = "InsertButton" runat = "server" CausesValidation = "True" CommandName = "Insert" Text = "Insert" /> 
                            </div> 
                            <div class = "ui-block-b"> 
                                <a data-rel = "back" data-role = "button" data-icon = "back"> Cancel </a> 
                            </div> 
                        </div> 

                    </InsertItemTemplate> 
                </asp:FormView>
                    
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
