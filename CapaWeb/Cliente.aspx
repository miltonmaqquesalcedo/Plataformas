<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Cliente.aspx.cs" Inherits="CapaWeb.Cliente" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
                <div class="jumbotron" align="center">
                    <img width="200px" src="imagenes/perro.svg"/>
                    <h1>&nbsp;</h1>
                    <p class="lead">Bienvenido a nuestro Sistema de Ventas en ASP.NET <BR /></p>                    
                    <div align="center">
                        <asp:Button class="btn btn-primary btn-lg btn-block" runat="server" ID="btnCerrar" text="Cerrar Sesion" OnClick="btnCerrar_Click" />                                  
                    </div> 
                </div>

            
</asp:Content>
