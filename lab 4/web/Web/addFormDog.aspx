<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="addFormDog.aspx.cs" Inherits="Web.addFormDog" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<h4 style = "margin-left: 25%;"> Редактированин данных о договорах</h4>
<br />
<table>      
       <tr><td>Название</td><td>         
        <asp:TextBox ID="Название" runat="server" Width="407px"></asp:TextBox></td></tr>  
        <tr><td>Дата начала действия</td><td>      
        <asp:Calendar runat="server" Width="407px" Height="160px" 
                style="margin-top: 13px" ID="Дата_начала"></asp:Calendar></td></tr> 
        <tr><td>Дата окончания действия</td><td>      
        <asp:Calendar runat="server" Width="407px" ID="Дата_конца"></asp:Calendar></td></tr>   
        <tr><td>Максимальная сумма</td><td>      
        <asp:TextBox ID="Максимальная_сумма" runat="server" Width="407px"></asp:TextBox></td></tr>
         <tr><td>Номер организации</td><td>      
        <asp:DropDownList ID="НомераОрганизации" runat="server" Width="412px"></asp:DropDownList></td></tr>      
        <tr><td>Контактное лицо</td><td>      
            <asp:DropDownList ID="НомерКонтактныхЛиц" runat="server" Width="412px">
            </asp:DropDownList>
            </td></tr>     
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
