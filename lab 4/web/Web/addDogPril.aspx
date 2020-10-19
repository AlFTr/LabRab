<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="addDogPril.aspx.cs" Inherits="Web.addDogPril" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<h4 style = "margin-left: 25%;"> Редактированин данных о приложениях договора</h4>
<br />
   <table>      
        <tr><td>Тип документа</td><td>      
        <asp:TextBox ID="ТипДокумента" runat="server" Width="407px"></asp:TextBox></td></tr> 
        <tr><td>Содержание</td><td>      
        <asp:TextBox ID="Содержание" runat="server" Width="407px"></asp:TextBox></td></tr>   
        <tr><td>Дата составления</td><td>      
            <asp:Calendar ID="ДатаСоставления" runat="server" Width="300px"></asp:Calendar></asp:TextBox></td></tr>   
        <tr><td></td><td style="text-align:right">         
          <asp:Button ID="NewUser" runat="server" Text="Сохранить" onclick="NewUser_Click" 
                Width="131px" style="margin-left: 4px" />
            <asp:Button ID="Button2" runat="server" Text="Отмена" onclick="Button1_Click" 
                   Width="140px"  />
                    <asp:Button ID="Button1" runat="server" Text="Удалить запись" onclick="Button1_Click1" 
                   Width="140px" style="margin-left: 0px"  /></td> 
          </tr>   
        </table> 
</asp:Content>
