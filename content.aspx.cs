using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.Configuration;

public partial class content : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {
            //Check if the user logged in
            if (Request.Cookies["username"] != null) 
            {
                lbl_welcome.Text = "Welcome, " + Request.Cookies["username"].Value + " ! ";
                img_userpic.ImageUrl = Request.Cookies["userpic"].Value ;
                BindListView();
            }
        }
    }
    //Bind the ListView using linq
    private void BindListView()
    {
        linqContent obj = new linqContent();
        ListView1.DataSource = obj.getContentList();
        ListView1.DataBind();
    }
    //Delete a employee
    protected void ListView1_ItemDeleting(object sender, ListViewDeleteEventArgs e)
    {
        int id = int.Parse(e.Keys[0].ToString());
        linqContent obj = new linqContent();
        obj.commitDelete(id);
        Response.Redirect("~/content.aspx");
    }
}