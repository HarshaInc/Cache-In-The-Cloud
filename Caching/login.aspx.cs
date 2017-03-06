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

public partial class login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["Cachingcon"]);
        SqlCommand cmd = new SqlCommand();
        SqlDataReader rdr;
        cmd.CommandText = "select auth,planname,currdownloads from register where username='" + Login1.UserName + "' and password='" + Login1.Password + "'";
        cmd.Connection = con;
        con.Open();
        rdr = cmd.ExecuteReader();
        if (rdr.HasRows)
        {
            rdr.Read();
            Session["username"] = Login1.UserName;
            String auth = rdr.GetString(0);
            Session["plan"] = rdr.GetString(1);
            Session["currdwlds"] = rdr.GetDecimal(2).ToString();

            con.Close();
            if (auth.Equals("admin"))
            {
                Response.Redirect("./Admin/Home.aspx");
            }
            else
            {
                Response.Redirect("./User/Home.aspx");
            }
        }
        con.Close();
    }
}
