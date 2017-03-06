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

public partial class User_Profile : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Caching"].ConnectionString);
    SqlCommand cmd = new SqlCommand();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["username"] == null)
        {
            Response.Redirect("../login.aspx");
        }
        else
        {
            uname.Text = Session["username"].ToString();
            plan.Text = Session["plan"].ToString();
            cmd.Connection = conn;
            cmd.CommandText = "select * from plans where pname ='" + Session["plan"].ToString() + "'";
            conn.Open();
            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.Read())
            {
                price.Text = rdr.GetInt32(1).ToString()+" $";
                totallimit.Text = rdr.GetDecimal(2).ToString()+" MB";
            }
            conn.Close();
            cmd.CommandText = "select currdownloads from register where username='" + Session["username"].ToString() + "'";
            conn.Open();
            rdr = cmd.ExecuteReader();
            if (rdr.Read())
            {
                currdownloads.Text = rdr.GetDecimal(0).ToString()+" MB";
            }
            conn.Close();
        }
    }
    protected void Submit_Click(object sender, EventArgs e)
    {
        if (Session["username"] != null)
        {
            cmd.Connection = conn;
            cmd.CommandText = "select * from register where username='" + Session["username"].ToString() + "' and password='" + pwd.Text + "'";
            conn.Open();
            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.Read())
            {
                String password = rdr.GetString(0);
                conn.Close();
                int i = -1;
                conn.Open();
                cmd.CommandText = "update register set password='"+newpwd.Text+"' where username='"+Session["username"].ToString()+"'";
                i = cmd.ExecuteNonQuery();
                if (i > 0)
                    status.Text = "Password Changed Successfully";
                else
                    status.Text = "Password Can't Changed";
                conn.Close();
            }
            else
            {
                status.Text = "Wrong Password";
                conn.Close();
            }
        }
        else
        {
            Response.Redirect("../login.aspx");
        }
    }
}
