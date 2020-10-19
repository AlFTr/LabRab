<%@ Page Title="Домашняя страница" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="Web._Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
<h3 style = "margin-left: 40%;"> Контактные лица</h3>
    <asp:GridView ID="таблица" runat="server"  AutoGenerateColumns="False">      
       <Columns>           
             <asp:BoundField DataField="ФИО" HeaderText="Фамилия" />      
              <asp:BoundField DataField="Телефон" HeaderText="Телефон" />    
              <asp:BoundField DataField="Место_работы" HeaderText="Место работы" />   
              <asp:BoundField DataField="Адрес_проживания" HeaderText="Адрес проживания" />   
              <asp:BoundField DataField="Персональные_данные" HeaderText="Персональные данные" />   
              <asp:TemplateField HeaderText="Редактировать">        
                  <ItemTemplate>                
                   <a href="/addFormFace.aspx?ID=<%# Eval("Номер") %>">Редактировать</a>    
                   </ItemTemplate>      
                 </asp:TemplateField>  
               </Columns> 
    </asp:GridView> 
            <asp:Button ID ="butAdd" runat = "server" onclick="butAdd_Click1" 
        Height="30px" style="margin-top: 18px" Text="Добавить" />
</asp:Content>
