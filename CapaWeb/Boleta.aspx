<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Boleta.aspx.cs" Inherits="CapaWeb.Boleta" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div align="center">
            <h3 align="center">MANTENIMIENTO BOLETA</h3>
            <p><asp:TextBox class="form-control" runat="server" ID="txtNroBoleta" placeholder="Número de Boleta" ></asp:TextBox></p>
            <p><asp:TextBox class="form-control" runat="server" ID="txtCodCliente" placeholder="Codigo Cliente"></asp:TextBox></p>
            <p><asp:TextBox class="form-control" runat="server" ID="txtCodVendedor" placeholder="Codigo Vendedor"></asp:TextBox></p>            
            <p><asp:TextBox class="form-control" runat="server" ID="txtAnulado" placeholder="Anulado"></asp:TextBox></p>
        </div>
        <div  align="center">
            <asp:Button class="btn btn-warning" Text="Agregar" runat="server" ID="btnAgregar" OnClick="btnAgregar_Click" />
            <asp:Button class="btn btn-warning" Text="Eliminar" runat="server" ID="btnEiminar" OnClick="btnEiminar_Click" />
            <asp:Button class="btn btn-warning" Text="Actualizar" runat="server" ID="btnActualizar" OnClick="btnActualizar_Click" />
        </div><br />
        <div align="center">
            <p><asp:TextBox class="form-control" runat="server" ID="txtBuscar" placeholder="Ingrese aquí"></asp:TextBox></p>
            <p><asp:DropDownList class="form-control" runat="server" ID="ddlCriterio">
                   <asp:ListItem Text="NroBoleta"></asp:ListItem>
                   <asp:ListItem Text="CodCliente"></asp:ListItem>
                   <asp:ListItem Text="CodVendedor"></asp:ListItem>
            </asp:DropDownList></p>
            <p><asp:Button class="btn btn-info" Text="Buscar" runat="server" ID="btnBuscar" OnClick="btnBuscar_Click" /></p>            
        </div>
        <div  align="center">
            <asp:GridView ID="gvBoleta" runat="server" class="table"></asp:GridView>
        </div>
</asp:Content>
