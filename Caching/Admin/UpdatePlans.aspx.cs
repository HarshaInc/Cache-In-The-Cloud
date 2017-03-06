using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;
using System.IO;

public partial class Admin_Hash : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Caching"].ConnectionString);
    SqlCommand cmd = new SqlCommand();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["username"] == null)
        {
            Response.Redirect("../login.aspx");
        }
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        pname.Text = GridView1.SelectedRow.Cells[1].Text;
        price.Text = GridView1.SelectedRow.Cells[2].Text;
        maxdownloads.Text = GridView1.SelectedRow.Cells[3].Text;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        err.Text = "";
        String planname = pname.Text;
        Int32 price1=Convert.ToInt32(price.Text);
        Int32 maxsize=Convert.ToInt32(maxdownloads.Text);
        cmd.CommandText = "update plans set rate=" + price1 + " , maxsize=" + maxsize + " where pname='" + planname + "'";
        cmd.Connection = con;
        con.Open();
        int i = cmd.ExecuteNonQuery();
        con.Close();
        if (i > 0)
            err.Text = planname + " Plan Updated Successfully";
        else
            err.Text = planname + " Plan Updation Error";
        GridView1.DataBind();
    }
}
