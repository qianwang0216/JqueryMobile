using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.Configuration;

public partial class Edit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
        if (Request.Cookies["username"] != null)
        {
            //Show the welcome information
            lbl_welcome.Text = "Welcome, " + Request.Cookies["username"].Value + " ! ";
            img_userpic.ImageUrl = Request.Cookies["userpic"].Value;
            if (Request.QueryString["mode"] != null)
            {
                FormView1.DefaultMode = FormViewMode.Insert;
            }
            if (Page.IsPostBack == false && Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"].ToString());
                BindListView(id);
            }
        }
         
    }
    //Bind the ListView data source
    private void BindListView(int id)
    {
        linqContent obj = new linqContent();
        FormView1.DataSource = obj.getContentListByID(id);
        FormView1.DataBind();
    }

    //Update a employee information
    protected void FormView1_ItemUpdating(object sender, FormViewUpdateEventArgs e)
    {
        int id = int.Parse(Request.QueryString["id"]);
        string name = e.NewValues[0].ToString();
        int age = int.Parse(e.NewValues[1].ToString());
        //string gender = e.NewValues[2].ToString();
        RadioButton rb2 = (RadioButton)FormView1.FindControl("rb2");
        RadioButton rb3 = (RadioButton)FormView1.FindControl("rb3");
        string value = "";
        bool isChecked = rb2.Checked;
        if (isChecked)
        {
            value = rb2.Text;
        }
        else
        {
            value = rb3.Text;
        }
        linqContent obj = new linqContent();
        obj.commitUpdate(id, name, age, value);

        Response.Redirect("~/content.aspx");
    }

    //Insert a employee
    protected void FormView1_ItemInserting(object sender, FormViewInsertEventArgs e)
    {
        int id = int.Parse(e.Values[0].ToString());
        string name = e.Values[1].ToString();
        int age = int.Parse(e.Values[2].ToString());
        //string gender = e.Values[3].ToString();
        RadioButton rb2 = (RadioButton)FormView1.FindControl("rb2");
        RadioButton rb3 = (RadioButton)FormView1.FindControl("rb3");
        string value = "";
        bool isChecked = rb2.Checked;
        if (isChecked)
        {
            value = rb2.Text;
        }
        else 
        {
            value = rb3.Text;
        }
        linqContent obj = new linqContent();
        obj.commitInsert(id, name, age, value);
        Response.Redirect("~/content.aspx");
    }
}