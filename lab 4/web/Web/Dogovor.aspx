<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Dogovor.aspx.cs" Inherits="Web.Dogovor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<h3 style = "margin-left: 40%;"> Договоры</h3>
<asp:GridView ID="таблица" runat="server"  AutoGenerateColumns="False">      
       <Columns>           
             <asp:BoundField DataField="Номер" HeaderText="Номер" />      
             <asp:BoundField DataField="Название" HeaderText="Название" />  
              <asp:BoundField DataField="Дата_начала_действия" HeaderText="Дата начала действия" />    
              <asp:BoundField DataField="Дата_окончания_действия" HeaderText="Дата окончания действия" />   
              <asp:BoundField DataField="Максимальная_сумма" HeaderText="Максимальная сумма" />   
              <asp:BoundField DataField="Контактное_Лицо.ФИО" HeaderText="Контактное лицо" /> 
              <asp:BoundField DataField="Организация.Название" HeaderText="Организация" />   
              <asp:TemplateField HeaderText="Редактировать">        
                  <ItemTemplate>                
                   <a href="/addFormDog.aspx?ID=<%# Eval("Номер") %>">Редактировать</a>    
                   </ItemTemplate>      
                 </asp:TemplateField>  
                 <asp:TemplateField HeaderText="Список приложений договора">        
                  <ItemTemplate>                
                   <a href="/dogPril.aspx?ID=<%# Eval("Номер") %>">Открыть</a>    
                   </ItemTemplate>      
                 </asp:TemplateField>  
               </Columns> 
    </asp:GridView> 
            <asp:Button ID ="butAdd" runat = "server" onclick="butAdd_Click1" 
        Height="30px" style="margin-top: 18px" Text="Добавить" />
</asp:Content>
