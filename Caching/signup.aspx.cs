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

public partial class signup : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    double downloads = 0.00000;
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["Cachingcon"]);
    SqlCommand cmd = new SqlCommand();
    protected void Button1_Click(object sender, EventArgs e)
    {
        cmd.CommandText = "select * from register where username='" + uname.Text + "'";
        cmd.Connection = con;
        con.Open();
        SqlDataReader rdr = cmd.ExecuteReader();
        bool rows = rdr.HasRows;
        con.Close();
        if (rows)
        {
            err.Text = "Username Exists,Try Another UserName";
        }
        else
        {
            con.Open();
            cmd.CommandText = "insert into register values('" + uname.Text + "','" + pwd.Text + "','" + email.Text + "','" + phoneno.Text + "','"+RadioButtonList1.SelectedItem.Text+"','user',"+downloads+")";
            int i = cmd.ExecuteNonQuery();
            con.Close();
            if (i > 0)
            {
                err.Text = "User Registered Succesfully";
                clear();
            }

            else
            {
                err.Text = "User Registration error";
                clear();
            }
        }
        
    }
    private void clear()
    {
        uname.Text = "";
        email.Text="";
        phoneno.Text = "";

    }
}
