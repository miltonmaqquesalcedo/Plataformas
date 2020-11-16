<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AccesoVendedor.aspx.cs" Inherits="CapaWeb.AccesoVendedor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
                <div class="jumbotron" align="center">
                    <img width="200px" src="imagenes/perro.svg"/>
                    <h1><asp:label id="lblNombre1" runat="server" Text="a "></asp:label></h1>
                    <p class="lead">Bienvenido a nuestro Sistema de Ventas en ASP.NET <BR />Administra tus Productos, Boletas y más.</p>                    
                    <div align="center">
                        <asp:Button class="btn btn-info" runat="server" ID="btnBoleta" Text="Boletas" Width="120px" OnClick="btnBoleta_Click" />
                        <asp:Button class="btn btn-info" runat="server" ID="btnProducto" Text="Productos" Width="120px" OnClick="btnProducto_Click" />
                        <asp:Button class="btn btn-info" runat="server" ID="btnCategoria" Text="Categorias" Width="120px" OnClick="btnCategoria_Click"/>
                                                          
                    </div>
                    <br />
                    <div>
                        <asp:Button class="btn btn-danger" runat="server" ID="btnEliminar" text="Eliminar Cuenta" OnClick="btnEliminar_Click" Width="120px" />
                        <asp:Button class="btn btn-danger" runat="server" ID="btnCerrar" Text="Cerrar Sesion" Width="120px" OnClick="btnCerrar_Click" />
                    </div>
                </div>
</asp:Content>
