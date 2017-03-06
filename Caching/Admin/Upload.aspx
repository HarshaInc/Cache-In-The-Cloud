<%@ Page Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="Upload.aspx.cs" Inherits="Admin_UploadFiles" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p align="center">
        <br />
    </p>
    <script  language="javascript" type ="text/javascript" >
function Validateplans(source, args)
{
  var chkListModules= document.getElementById ('<%= CheckBoxList1.ClientID %>');
  var chkListinputs = chkListModules.getElementsByTagName("input");
  for (var i=0;i<chkListinputs .length;i++)
  {
    if (chkListinputs [i].checked)
    {
      args.IsValid = true;
      return;
    }
  }
  args.IsValid = false;
}
        </script>
        <table align="center" style="width: 411px">
          <tr><td>File ID :</td>
          <td><asp:TextBox ID="fileid" runat="server" ReadOnly="True"></asp:TextBox></td></tr>
          <tr><td>Max Download Count : </td>
          <td><asp:TextBox ID="maxdownload" runat="server"></asp:TextBox>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                  ControlToValidate="maxdownload" ErrorMessage="*"></asp:RequiredFieldValidator>
                        </td></tr>
          <tr><td>File For Available for </td><td>
              <asp:CheckBoxList ID="CheckBoxList1" runat="server" Height="99px" Width="135px">
                  <asp:ListItem Selected="True" Value="Silver">Silver Users</asp:ListItem>
                  <asp:ListItem Value="Gold">Gold Users</asp:ListItem>
                  <asp:ListItem Value="Platinum">Platinum Users</asp:ListItem>
              </asp:CheckBoxList>
          <asp:CustomValidator runat="server" ID="cvplanlist" ClientValidationFunction="Validateplans" ErrorMessage="Please Select Atleast one Plan" ></asp:CustomValidator>
  </td></tr>
          <tr><td>File :</td>
            <td><asp:FileUpload ID="FileUpload1" runat="server" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="FileUpload1" ErrorMessage="*"></asp:RequiredFieldValidator>
                        </td></tr>
        <tr><td>Description : </td><td>
            <asp:TextBox ID="TextBox1" runat="server" TextMode="MultiLine"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                ControlToValidate="TextBox1" ErrorMessage="*"></asp:RequiredFieldValidator>
            </td></tr>
        <tr><td align="center" colspan="2">
            <asp:Button ID="Button1" runat="server" Text="Upload" Height="32px" 
                Width="175px" onclick="Button1_Click" />
        </td></tr>
        </table>
        <br /><center>
    <asp:Label ID="err" runat="server" Text=""></asp:Label>&nbsp;</center>
        <br />
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AllowSorting="True" AutoGenerateColumns="False" BorderColor="Black" 
            BorderStyle="Solid" BorderWidth="1px" CellPadding="4" 
            DataSourceID="SqlDataSource1" ForeColor="#333333" 
            Width="1053px" HorizontalAlign="Center" 
        EmptyDataText="No Files Uploded" onrowcommand="GridView1_RowCommand" 
    PageSize="5" Height="40px">
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <RowStyle BackColor="#EFF3FB" />
            <Columns>
                <asp:BoundField DataField="fileid" HeaderText="File ID" 
                    SortExpression="fileid" />
                <asp:BoundField DataField="filename" HeaderText="File Name" 
                    SortExpression="filename" />
                <asp:BoundField DataField="maxcount" HeaderText="Maximum Download Count" 
                    SortExpression="maxcount" />
                <asp:BoundField DataField="size" HeaderText="File Size (KB)" 
                    SortExpression="size" />
                <asp:BoundField DataField="silver" HeaderText="Silver Users" 
                    SortExpression="silver" />
                <asp:BoundField DataField="gold" HeaderText="Gold Users" 
                    SortExpression="gold" />
                <asp:BoundField DataField="platinum" HeaderText="Platinum Users" 
                    SortExpression="platinum" />
                <asp:BoundField DataField="description" HeaderText="Description" 
                    SortExpression="description" />
                <asp:BoundField DataField="count" HeaderText="Download Count" 
                    SortExpression="count" />
                <asp:ButtonField ButtonType="Button" CommandName="deletefile" Text="Delete" />
            </Columns>
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" 
                BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" />
            <EditRowStyle BackColor="#2461BF" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView><center>
    </center>
        
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:Caching %>" 
            
            SelectCommand="SELECT uploads.* FROM uploads">
        </asp:SqlDataSource>
        
        
    </p>
</asp:Content>

