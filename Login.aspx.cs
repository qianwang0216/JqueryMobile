using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btn_login_Click(object sender, EventArgs e)
    {
        linqLogin obj = new linqLogin();
        string username = string.Empty;
        string password = string.Empty;
        string userpic = string.Empty;
        var all = obj.getAdminList();
        //Check the admin table
        foreach(var admin in all)
        {
            username = admin.username.ToString();
            password = admin.password.ToString();
            userpic = admin.image.ToString();
            if (username == txt_username.Text && password == txt_password.Text) 
            {   //Record the cookies
                Response.Cookies["username"].Value = username;
                Response.Cookies["username"].Expires = DateTime.Now.AddHours(1);
                Response.Cookies["userpic"].Value = userpic;
                Response.Cookies["userpic"].Expires = DateTime.Now.AddHours(1);
                Response.Redirect("content.aspx");
            }
        }
        
    }
    
}