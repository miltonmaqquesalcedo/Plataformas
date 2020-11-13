
<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AgregarCliente.aspx.cs" Inherits="CapaWeb.AgregarCliente" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div align="center">
    <p>
        <asp:TextBox class="form-control" ID="txtCodCliente" runat="server" placeHolder="Codigo Cliente"></asp:TextBox>
    </p>
    <p>
        <asp:TextBox class="form-control" ID="txtApellidos" runat="server" placeHolder="Apellidos"></asp:TextBox>
    </p>
    <p>
        <asp:TextBox class="form-control" ID="txtNombres" runat="server" placeHolder="Nombres"></asp:TextBox>
    </p>
    <p>
        <asp:TextBox class="form-control" ID="txtDireccion" runat="server" placeHolder="Dirección"></asp:TextBox>
    </p>
    <p>
        <asp:TextBox class="form-control" ID="txtUsuario" runat="server" placeHolder="Usuario"></asp:TextBox>
    </p>
    <p>
        <asp:TextBox class="form-control" ID="txtContrasena" runat="server" TextMode="Password" placeHolder="Contraseña"></asp:TextBox>
    </p>
    </div>
    <div align="center">
        <asp:Button class="btn btn-primary" ID="btnCrear" runat="server" Text="Crear" OnClick="btnCrear_Click"  />
        <asp:Button class="btn btn-light" ID="btnCancelar" runat="server" Text="Cancelar" />
    </div>
    

</asp:Content>
