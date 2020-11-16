<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Detalle.aspx.cs" Inherits="CapaWeb.Detalle" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div align="center">
            <h3 align="center">MANTENIMIENTO DETALLE</h3>
            <p><asp:TextBox class="form-control" runat="server" ID="txtNroBoleta" placeholder="Número de Boleta" ></asp:TextBox></p>
            <p><asp:TextBox class="form-control" runat="server" ID="txtCodProducto" placeholder="Codigo de Producto"></asp:TextBox></p>
            <p><asp:TextBox class="form-control" runat="server" ID="txtCantidad" placeholder="Cantidad"></asp:TextBox></p>            
            <!--<p><asp:TextBox class="form-control" runat="server" ID="txtPrecioUnitario" placeholder="Precio Unitario"></asp:TextBox></p>-->
        </div>
        <div  align="center">
            <asp:Button class="btn btn-success" Text="Agregar" runat="server" ID="btnAgregar" OnClick="btnAgregar_Click" />
            <asp:Button class="btn btn-success" Text="Eliminar" runat="server" ID="btnEiminar" OnClick="btnEiminar_Click" />
            <asp:Button class="btn btn-success" Text="Actualizar" runat="server" ID="btnActualizar" OnClick="btnActualizar_Click" />
        </div><br />
        <div align="center">
            <p><asp:TextBox class="form-control" runat="server" ID="txtBuscar" placeholder="Ingrese aquí"></asp:TextBox></p>
            <p><asp:DropDownList class="form-control" runat="server" ID="ddlCriterio">
                   <asp:ListItem Text="NroBoleta"></asp:ListItem>
            </asp:DropDownList></p>
            <p><asp:Button class="btn btn-info" Text="Buscar" runat="server" ID="btnBuscar" OnClick="btnBuscar_Click" /></p>            
        </div>
        <div  align="center">
            <asp:GridView ID="gvDetalle" runat="server" class="table"></asp:GridView>
        </div>
</asp:Content>
