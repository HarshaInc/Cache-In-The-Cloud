<%@ Page Language="C#" MasterPageFile="~/User/User.master" AutoEventWireup="true" CodeFile="Profile.aspx.cs" Inherits="User_Profile" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <br />
        <br />
        <table align="center" cellpadding="8" frame="border">
        <tr><td>Plan : </td><td><asp:Label ID="plan" runat="server" ></asp:Label></td></tr>
        <tr><td>Price :</td><td><asp:Label ID="price" runat="server" ></asp:Label></td></tr>
        <tr><td>Current Downloads : </td><td><asp:Label ID="currdownloads" runat="server" ></asp:Label></td></tr>
        <tr><td>Total Download Limit : </td><td><asp:Label ID="totallimit" runat="server" ></asp:Label></td></tr>
        <tr><td></td><td></td></tr>
        </table>
        <br />
        <table align="center" cellpadding="9" frame="border">
        <tr><td colspan="2" style="font-size: x-large; font-weight: bold;" align="center">
            Change Password</td></tr>
        <tr><td>UserName</td><td><asp:Label runat="server" ID="uname"></asp:Label></td></tr>
        <tr><td>Password</td><td><asp:TextBox runat="server" ID="pwd" TextMode="Password"></asp:TextBox></td></tr>
        <tr><td>New Password</td><td><asp:TextBox runat="server" ID="newpwd" TextMode="Password"></asp:TextBox></td></tr>
        <tr><td>Confirm Password</td><td><asp:TextBox runat="server" ID="confpwd" TextMode="Password"></asp:TextBox></td></tr>
        <tr><td colspan="2" align="center"><asp:Button runat="server" ID="Submit" 
                Text="Change" Height="36px" onclick="Submit_Click" Width="81px"/></td></tr>
<tr><td colspan="2" align="center">
    <asp:CompareValidator ID="CompareValidator1" runat="server" 
        ControlToCompare="newpwd" ControlToValidate="confpwd" 
        ErrorMessage="Passwords Mismatch"></asp:CompareValidator>
    <asp:Label runat="server" id="status" Font-Size="X-Large" ForeColor="#003399"></asp:Label></td></tr>
        </table>
</asp:Content>

