<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Vendedor.aspx.cs" Inherits="CapaWeb.Vendedor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h3>Mantenimiento de la Tabla Vendedor</h3>
    <p>CodVendedor:<asp:TextBox runat="server" ID="txtCodVendedor" placeHolder="CodVendedor"></asp:TextBox></p>
    <p>Apellidos:<asp:TextBox runat="server" ID="txtApellidos"></asp:TextBox></p>
    <p>Nombres:<asp:TextBox runat="server" ID="txtNombres"></asp:TextBox></p>
    <p>Usuario:<asp:TextBox runat="server" ID="txtUsuario"></asp:TextBox></p>
    <p>contrasena:<asp:TextBox runat="server" ID="txtContrasena" TextMode="Password"></asp:TextBox></p>
    <p>
        <asp:Button Text="Agregar" runat="server" ID="btnAgregar" OnClick="btnAgregar_Click" />
        <asp:Button Text="Eliminar" runat="server" ID="btnEliminar" OnClick="btnEliminar_Click" />
        <asp:Button Text="Actualizar" runat="server" ID="btnActualizar" />

    </p>

    <asp:GridView runat="server" ID="gvVendedor" CellPadding="4" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />

    </asp:GridView>
</asp:Content>
