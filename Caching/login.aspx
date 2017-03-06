<%@ Page Language="C#" Debug="true" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" Title="Untitled Page" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center>
        <br />
        <asp:Login ID="Login1" runat="server" BackColor="#669999" BorderColor="#336699" 
            BorderStyle="Solid" BorderWidth="1px" Width="357px" 
            onauthenticate="Login1_Authenticate" DisplayRememberMe="False">
    </asp:Login>
        <br />
    </cent
</asp:Content>
      