<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Org.aspx.cs" Inherits="Web.Org" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<h3 style = "margin-left: 40%;"> Организации</h3>
   <asp:GridView ID="таблица" runat="server"  AutoGenerateColumns="False">      
       <Columns>           
             <asp:BoundField DataField="Номер" HeaderText="Номер" />      
              <asp:BoundField DataField="Название" HeaderText="Название" />    
              <asp:BoundField DataField="Адрес" HeaderText="Адрес" />   
              <asp:BoundField DataField="ФИО_Начальника" HeaderText="ФИО Начальника" />   
              <asp:TemplateField HeaderText="Редактировать">        
                  <ItemTemplate>                
                   <a href="/addFormOrg.aspx?ID=<%# Eval("Номер") %>">Редактировать</a>    
                   </ItemTemplate>      
                 </asp:TemplateField>  
               </Columns> 
    </asp:GridView> 
            <asp:Button ID ="butAdd" runat = "server" onclick="butAdd_Click1" 
        Height="30px" style="margin-top: 18px" Text="Добавить" />
</asp:Content>
