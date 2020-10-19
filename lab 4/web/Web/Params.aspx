<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Params.aspx.cs" Inherits="Web.Params" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
 <table>      
        <tr><td>Сервер</td><td>      
        <asp:TextBox ID="Сервер" runat="server" Width="407px"></asp:TextBox></td></tr> 
        <tr><td>Название базы данных</td><td>      
        <asp:TextBox ID="Название" runat="server" Width="407px"></asp:TextBox></td></tr>   
        <tr><td></td><td style="text-align:right">       
          <asp:Button ID="NewUser" runat="server" Text="Подключится" onclick="NewUser_Click" 
                Width="131px" style="margin-left: 4px" />
            <asp:Button ID="Button2" runat="server" Text="Отмена" onclick="Button1_Click" 
                   Width="140px"  /></td> 
          </tr>   
        </table> 
</asp:Content>
