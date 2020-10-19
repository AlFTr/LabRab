<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="dogPril.aspx.cs" Inherits="Web.dogPril" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<h3 style = "margin-left: 40%;"> Приложения к договору <asp:Label id="lebDogName" runat="server"></asp:Label> </h3> 
<asp:GridView ID="таблица" runat="server"  AutoGenerateColumns="False">      
       <Columns>           
             <asp:BoundField DataField="Номер" HeaderText="Номер" />      
              <asp:BoundField DataField="ТипДокумента" HeaderText="Тип документа" />    
              <asp:BoundField DataField="Содержание" HeaderText="Содержание" />   
              <asp:BoundField DataField="ДатаСоставления" HeaderText="Дата составления" />     
              <asp:TemplateField HeaderText="Редактировать">        
                  <ItemTemplate>                
                   <a href="/addDogPril.aspx?ID=<%# Eval("Номер") %>&IDDOG=<%# Eval("Договор.Номер") %>">Редактировать</a>    
                   </ItemTemplate>      
                 </asp:TemplateField>  
               </Columns> 
    </asp:GridView> 
            <asp:Button ID ="butAdd" runat = "server" onclick="butAdd_Click1" 
        Height="30px" style="margin-top: 18px" Text="Добавить" />
</asp:Content>
