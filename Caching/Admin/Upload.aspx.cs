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

public partial class Admin_UploadFiles : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Caching"].ConnectionString);
    SqlCommand cmd=new SqlCommand();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["username"] == null)
        {
            Response.Redirect("../login.aspx");
        }
        cmd.CommandText = "Select max(fileid) from uploads";
        cmd.Connection = con;
        con.Open();
        SqlDataReader rdr = cmd.ExecuteReader();
        int id=0;
        if(rdr.HasRows)
        {
            rdr.Read();
            if(!rdr.IsDBNull(0))
                id = rdr.GetInt32(0);
            id++;
        }

        con.Close();
        fileid.Text = id.ToString();
    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName.Equals("deletefile"))
        {
            int rowid = Convert.ToInt32(e.CommandArgument);
            String fid = GridView1.Rows[rowid].Cells[0].Text;
            String fname = GridView1.Rows[rowid].Cells[1].Text;
            cmd.Connection = con;
            cmd.CommandText = "delete from uploads where fileid='" + fid + "'";
            con.Open();
            int i = cmd.ExecuteNonQuery();
            con.Close();
            if (i > 0)
            {
                err.Text = "File Deleted";
                File.Delete(Server.MapPath("~/uploads/") + fname);
            }
            else
                err.Text = "File Delete Error";
            GridView1.DataBind();
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //DropDownList1.SelectedItem.Value;
        //TextBox1.Text;
        //FileUpload1.FileName;

        if (FileUpload1.HasFile)
        {
            try
            {
                string filename = Path.GetFileName(FileUpload1.FileName);
                if (File.Exists(Server.MapPath("~/Uploads/") + filename))
                {
                    err.Text = "File Upload Error. File Already Exists in Server";
                }
                else
                {
                    FileUpload1.SaveAs(Server.MapPath("~/uploads/") + filename);
                    err.Text = "File Uploaded to Server";
                    FileInfo file=new FileInfo(Server.MapPath("~/uploads/") + filename);
                    File.SetAttributes(Server.MapPath("~/uploads/") + filename,FileAttributes.ReadOnly);
                    double flength = file.Length/1024.0;
                    cmd.Connection = con;
                    bool[] plan=new bool[3];
                    int i=0;
                    foreach( ListItem li in CheckBoxList1.Items)
                    {
                        plan[i] = li.Selected;
                        i++;
                    }
                    int maxcount = Convert.ToInt32(maxdownload.Text);
                    cmd.CommandText = "insert into uploads values(" + fileid.Text + ",'" + filename + "'," + maxcount + ",'" + flength + "','" + plan[0] + "','" + plan[1] + "','" + plan[2] + "','" + TextBox1.Text + "',0)";
                    try
                    {
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }
                    catch (Exception ee)
                    {
                        file.Delete();
                    }
                    Page_Load(sender, e);
                    maxdownload.Text = "";
                    TextBox1.Text = "";
                }
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                err.Text = "The file could not be uploaded. The following error occured: "+cmd.CommandText + ex.Message;
            }
        }
        else
        {
            err.Text = "Please Select A File";
        }
    }
}
