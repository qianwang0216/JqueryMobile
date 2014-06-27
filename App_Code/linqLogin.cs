using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.Configuration;
using System.Data.SqlClient;

/// <summary>
/// Summary description for linqLogin
/// </summary>
public class linqLogin
{
    //get admin list
    public IQueryable<Admin> getAdminList()
    {
        AdminDataContext obj = new AdminDataContext();
        var list = obj.Admins.Select(x => x);
        return list;
    }
    //get admin list by id
    public IQueryable<Admin> getAdminListByID(int _id)
    {
        AdminDataContext obj = new AdminDataContext();
        var list = obj.Admins.Where(x => x.Id == _id).Select(x => x);
        return list;
    }

    //insert admin
    public bool commitInsert(string _username, string _password, string _question, string _answer, string _opinion, string _suggestion, string _image)
    {
        AdminDataContext objList = new AdminDataContext();
        using (objList)
        {
            Admin obj = new Admin();
            obj.username = _username;
            obj.password = _password;
            obj.security_question = _question;
            obj.security_answer = _answer;
            obj.opinion = _opinion;
            obj.suggestion = _suggestion;
            obj.image = _image;
            objList.Admins.InsertOnSubmit(obj);
            objList.SubmitChanges();
            return true;
        }
    }


}

