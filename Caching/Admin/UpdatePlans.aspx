<%@ Page Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="UpdatePlans.aspx.cs" Inherits="Admin_Hash" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<p></p>
    <center>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"  
        CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" 
        GridLines="None" Width="437px" 
            onselectedindexchanged="GridView1_SelectedIndexChanged">
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <RowStyle BackColor="#EFF3FB" />
        <Columns>
            <asp:CommandField SelectText="Change" ShowSelectButton="True" />
            <asp:BoundField DataField="pname" HeaderText="Plan Name" 
                SortExpression="pname" />
            <asp:BoundField DataField="rate" HeaderText="Plan Price" 
                SortExpression="rate" />
            <asp:BoundField DataField="maxsize" HeaderText="Maximum Downloads (Mb)" 
                SortExpression="maxsize" />
        </Columns>
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#2461BF" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
    <br>
  
        <asp:Label ID="err" runat="server"></asp:Label>
  
        <br />
  
    <br />
        <table>
        <tr><td>Plan Name : </td><td>
                            <asp:TextBox ID="pname" runat="server" ReadOnly="True"></asp:TextBox>
                            <br /></td></tr>
        <tr><td>Plan Price : </td><td><asp:TextBox ID="price" runat="server"></asp:TextBox>$</td></tr>
        <tr><td>Download Limit:</td><td> <asp:TextBox ID="maxdownloads" runat="server"></asp:TextBox>MB<br /></td></tr>
        <tr><td colspan="2" align="center"><asp:Button ID="Button1" runat="server" 
                Text="Update" Height="36px" onclick="Button1_Click" Width="120px" /></td></tr>
        </table>
        
        <br /><br /><br /><br />
    
    
    
    
    
    
    
    
    
    </center>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:Caching %>" 
        SelectCommand="SELECT [pname], [rate], [maxsize] FROM [plans]"></asp:SqlDataSource>
    </asp:Content>

