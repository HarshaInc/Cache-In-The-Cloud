<%@ Page Language="C#" MasterPageFile="~/User/User.master" AutoEventWireup="true" CodeFile="Download.aspx.cs" Inherits="User_Download" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p align="center">
    <asp:Label ID="Status" runat="server" Text=""></asp:Label>
<br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSource1" BorderStyle="Solid" BorderWidth="1px" 
            CellPadding="4" ForeColor="#333333" HorizontalAlign="Center" Width="603px" 
            onrowcommand="GridView1_RowCommand">
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <RowStyle BackColor="#EFF3FB" />
            <Columns>
                <asp:BoundField DataField="fileid" HeaderText="File ID" 
                    SortExpression="fileid" />
                <asp:BoundField DataField="filename" HeaderText="File Name" 
                    SortExpression="filename" />
                <asp:BoundField DataField="maxcount" HeaderText="Maximum Downloads" 
                    SortExpression="maxcount" />
                <asp:BoundField DataField="size" HeaderText="Size" SortExpression="size" />
                <asp:BoundField DataField="description" HeaderText="File Description" 
                    SortExpression="description" />
                <asp:BoundField DataField="count" HeaderText="Download Count" 
                    SortExpression="count" />
                <asp:BoundField DataField="silver" HeaderText="silver" SortExpression="silver" 
                    Visible="False" />
                <asp:BoundField DataField="gold" HeaderText="gold" SortExpression="gold" 
                    Visible="False" />
                <asp:BoundField DataField="platinum" HeaderText="platinum" 
                    SortExpression="platinum" Visible="False" />
                <asp:ButtonField ButtonType="Button" Text="Download" CommandName="download" />
            </Columns>
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" BorderColor="Black"/>
            <EditRowStyle BackColor="#2461BF" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:Caching %>" 
            
            
            
            SelectCommand="SELECT [fileid], [filename], [maxcount], [size], [silver], [gold], [platinum], [description], [count] FROM [uploads]"></asp:SqlDataSource>
        <br /></p>
</asp:Content>

