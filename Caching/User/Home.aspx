<%@ Page Language="C#" MasterPageFile="~/User/User.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="User_Home" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p class="style1"  align="center" style="font-weight: bold; font-size: x-large; color: #003366;">
        <br /><br /><br />
        Welcome <asp:Label ID="name" runat="server" Text=""></asp:Label>
    </p>
</asp:Content>

