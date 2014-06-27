using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        

    }
    protected void btn_submit_Click(object sender, EventArgs e)
    {
        //Validation
        if (txt_name.Text != "" && txt_psw.Text != "" && ((HiddenField)regForm.FindControl("hdf")).Value != "" && txt_answer.Text != "")
        {
            int hdf = int.Parse(((HiddenField)regForm.FindControl("hdf")).Value);
            string ddl = ddl_secure.SelectedItem.Text;
            string image = "img/" + Convert.ToString(hdf) + ".jpg";
            
            //check if a radio button is selected
            RadioButton rb1 = (RadioButton)regForm.FindControl("rb1");
            RadioButton rb2 = (RadioButton)regForm.FindControl("rb2");
            RadioButton rb3 = (RadioButton)regForm.FindControl("rb3");
            string opinion = "";
            if (rb1.Checked)
            {
                opinion = rb1.Text;
            }
            else if (rb2.Checked)
            {
                opinion = rb2.Text;
            }
            else
            {
                opinion = rb3.Text;
            }

            //Get the selected items in Checkbox
            CheckBoxList cbl = (CheckBoxList)regForm.FindControl("cbl");
            string str_cbl = "";
            for (int i = 0; i < cbl.Items.Count; i++) {
                if (cbl.Items[i].Selected == true) {
                    str_cbl += cbl.Items[i].Text + ",";
                }
            }

            linqLogin obj = new linqLogin();
            obj.commitInsert(txt_name.Text, txt_psw.Text, ddl, txt_answer.Text, opinion, str_cbl, image);
            Response.Redirect("Login.aspx");
        }

    }
}