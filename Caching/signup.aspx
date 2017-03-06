 <%@ Page Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="signup.aspx.cs" Inherits="signup" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center>
    <br />
    <table cellpadding="10" cellspacing="0" border="0" style="color: #003300">
    <tr><td colspan="2" align="center" 
            style="font-size: x-large; font-weight: bold; text-transform: capitalize; color: #336699">Signup</td></tr>
    <tr><td>Username :</td><td>
        <asp:TextBox ID="uname" runat="server"></asp:TextBox>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                              ControlToValidate="uname" ErrorMessage="*"></asp:RequiredFieldValidator>
                          </td></tr>
    <tr><td>Password :</td><td>
        <asp:TextBox ID="pwd" runat="server" TextMode="Password"></asp:TextBox>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                              ControlToValidate="pwd" ErrorMessage="*"></asp:RequiredFieldValidator>
                          </td></tr>
    <tr><td>Confirm Password :</td><td>
        <asp:TextBox ID="cpwd" runat="server" TextMode="Password"></asp:TextBox>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                              ControlToValidate="cpwd" ErrorMessage="*"></asp:RequiredFieldValidator>
                          <asp:CompareValidator ID="CompareValidator1" runat="server" 
                              ControlToCompare="pwd" ControlToValidate="cpwd" 
                              ErrorMessage="Password Mismatch"></asp:CompareValidator>
                          </td></tr>
    <tr><td>Email :</td><td>
        <asp:TextBox ID="email" runat="server"></asp:TextBox>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                              ControlToValidate="email" ErrorMessage="*"></asp:RequiredFieldValidator>
                          </td></tr>
    <tr><td>Phone No :</td><td>
        <asp:TextBox ID="phoneno" runat="server"></asp:TextBox>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                              ControlToValidate="phoneno" ErrorMessage="*"></asp:RequiredFieldValidator>
                          </td></tr>
    <tr><td>Select Download Service</td><td><table>
    <tr>
    <td>
        <asp:RadioButtonList ID="RadioButtonList1" runat="server" 
            RepeatDirection="Horizontal" Width="88px">
            <asp:ListItem Selected="True" Value="29$/1M - 200Gb/M ">silver</asp:ListItem>
            <asp:ListItem Value="39$/1M - 500Gb/M ">gold</asp:ListItem>
            <asp:ListItem Value="49$/1M - Unlimited Downloads ">platinum</asp:ListItem>
        </asp:RadioButtonList>
    </td> 
    </tr>
    </table>
    </td></tr>
    <tr><td colspan="2"><asp:Label ID="err" runat="server" Font-Bold="True" 
            Font-Overline="False" Font-Size="Large" ForeColor="#333399"></asp:Label></td></tr>
    <tr><td colspan="2" align="center">
        <asp:Button ID="Button1" runat="server" Text="Signup" Height="42px" 
            Width="133px" onclick="Button1_Click" /></td></tr>
    </table>
    <br />
    </center>
</asp:Content>

