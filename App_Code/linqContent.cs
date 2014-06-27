using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.Configuration;
using System.Data.SqlClient;

/// <summary>
/// Summary description for linqContent
/// </summary>
public class linqContent
{
    //get employee list
    public IQueryable<Employee> getContentList()
    {
        EmployeesDataContext obj = new EmployeesDataContext();
        var list = obj.Employees.Select(x => x);
        return list;
    }
    //get employee list by id
    public IQueryable<Employee> getContentListByID(int _id)
    {
        EmployeesDataContext obj = new EmployeesDataContext();
        var list = obj.Employees.Where(x => x.EmployeeId == _id).Select(x => x);
        return list;
    }

    //insert employee
    public bool commitInsert(int _id, string _name, int _age, string _gender)
    {
        EmployeesDataContext objList = new EmployeesDataContext();
        using (objList)
        {
            Employee obj = new Employee();
            obj.EmployeeId = _id;
            obj.Name = _name;
            obj.Age = _age;
            obj.Gender = _gender;
            objList.Employees.InsertOnSubmit(obj);
            objList.SubmitChanges();
            return true;
        }
    }

    //delete employee by id
    public bool commitDelete(int _id)
    {
        EmployeesDataContext objList = new EmployeesDataContext();
        using (objList)
        {
            var obj = objList.Employees.Single(x => x.EmployeeId == _id);
            objList.Employees.DeleteOnSubmit(obj);
            objList.SubmitChanges();
            return true;
        }
    }

    //update employee
    public bool commitUpdate(int _id, string _name, int _age, string _gender)
    {
        EmployeesDataContext objList = new EmployeesDataContext();
        using (objList)
        {
            var obj = objList.Employees.Single(x => x.EmployeeId == _id);
            obj.Name = _name;
            obj.Age = _age;
            obj.Gender = _gender;
            objList.SubmitChanges();
            return true;
        }
    }


}