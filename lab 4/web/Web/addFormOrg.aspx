<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="addFormOrg.aspx.cs" Inherits="Web.addFormOrg" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<h4 style = "margin-left: 25%;"> Редактированин данных об организациях</h4>
<br />
 <table>      
        <tr><td>Название</td><td>      
        <asp:TextBox ID="Название" runat="server" Width="407px"></asp:TextBox></td></tr> 
        <tr><td>Адрес</td><td>      
        <asp:TextBox ID="Адрес" runat="server" Width="407px"></asp:TextBox></td></tr>   
        <tr><td>ФИО Начальника</td><td>      
        <asp:TextBox ID="ФИО_Начальника" runat="server" Width="407px"></asp:TextBox></td></tr>   
        <tr><td></td><td style="text-align:right">          
          <asp:Button ID="NewUser" runat="server" Text="Сохранить" onclick="NewUser_Click" 
                Width="131px" style="margin-left: 4px" />
            <asp:Button ID="Button2" runat="server" Text="Отмена" onclick="Button1_Click" 
                   Width="140px"  />
                    <asp:Button ID="Button1" runat="server" Text="Удалить запись" onclick="Button1_Click1" 
                   Width="140px" style="margin-left: 0px"  />
          </tr>   
        </table> 
</asp:Content>
