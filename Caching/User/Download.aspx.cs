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
using System.Net;
using System.Web.Caching;
using System.Text;

public partial class User_Download : System.Web.UI.Page
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
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName.Equals("download"))
        {
            int rowid = Convert.ToInt32(e.CommandArgument);
            String fid = GridView1.Rows[rowid].Cells[0].Text;
            String fname = GridView1.Rows[rowid].Cells[1].Text;
            String path = Server.MapPath("../uploads/" + fname);
            if (File.Exists(path))
            {
                int maxcount = Convert.ToInt32(GridView1.Rows[rowid].Cells[2].Text);
                int count = Convert.ToInt32(GridView1.Rows[rowid].Cells[5].Text);
                if (count >= maxcount)
                {
                    Status.Text = "Maximum Download Limit Exceeded for " + fname;
                }
                else
                {
                    //Available to Which User
                    cmd.Connection = con;
                    cmd.CommandText = "select " + Session["plan"].ToString() + " from uploads where fileid = " + fid ;
                    con.Open();
                    SqlDataReader rdr = cmd.ExecuteReader();
                    String available="False";
                    if (rdr.Read())
                    {
                        available = rdr.GetString(0);
                    }
                    con.Close();
                    if (available.Equals("True"))
                    {
                        count++;
                        cmd.Connection = con;
                        cmd.CommandText = "update uploads set count=" + count + " where fileid=" + fid ;
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                        decimal curr = Convert.ToDecimal(Session["currdwlds"].ToString());
                        FileInfo fi = new FileInfo(path);
                        curr += ((decimal)fi.Length / 1024) / 1024;
                        cmd.Connection = con;
                        cmd.CommandText = "select * from plans where pname='" + Session["plan"].ToString() + "'";
                        con.Open();
                        rdr = cmd.ExecuteReader();
                        decimal limit=0;
                        if (rdr.Read())
                        {
                            limit = rdr.GetDecimal(2);
                        }
                        con.Close();
                        if (limit >= curr)
                        {
                            cmd.Connection = con;
                            cmd.CommandText = "update register set currdownloads=" + curr + " where username='" + Session["username"].ToString() + "'";
                            con.Open();
                            cmd.ExecuteNonQuery();
                            con.Close();
                            Session["currdwlds"] = curr;
                            Response.ClearHeaders();
                            HttpResponse response = HttpContext.Current.Response;
                            response.Buffer = true;
                            response.AddHeader("Content-Disposition", "attachment;filename=\"" + fname + "\"");
                            response.ContentType = "application/octet-stream";
                            response.Expires = 10;
                            response.WriteFile(path);
                            response.End();
                            Status.Text = "File Downloading";
                        }
                        else
                        {
                            Status.Text = "You Total Download Limit Exceeded,Please Renew Plan";
                        }
                    }
                    else
                    {
                        Status.Text = "This File is Not Available "+Session["plan"].ToString()+" Users,Please Contact Your Administrator";
                    }
                    GridView1.DataBind();
                }
            }
            else
                Status.Text = "File Download Error,File Not exists";
        }
    }
}
