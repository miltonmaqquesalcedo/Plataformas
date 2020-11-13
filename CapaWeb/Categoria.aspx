<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Categoria.aspx.cs" Inherits="CapaWeb.Categoria" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div align="center">
            <h3 align="center">MANTENIMIENTO CATEGORIA</h3>
            <p><asp:TextBox class="form-control" runat="server" ID="txtCodCategoria" placeholder="Codigo Categoria" ></asp:TextBox></p>
            <p><asp:TextBox class="form-control" runat="server" ID="txtNombre" placeholder="Nombre"></asp:TextBox></p>
            <p><asp:TextBox class="form-control" runat="server" ID="txtCategoriaPadre" placeholder="Categoria Padre"></asp:TextBox></p>            
        </div>
        <div  align="center">
            <asp:Button class="btn btn-danger" Text="Agregar" runat="server" ID="btnAgregarC" OnClick="btnAgregarC_Click"  />
            <asp:Button class="btn btn-danger" Text="Eliminar" runat="server" ID="btnEiminar" OnClick="btnEiminar_Click" />
            <asp:Button class="btn btn-danger" Text="Actualizar" runat="server" ID="btnActualizar" OnClick="btnActualizar_Click" />
        </div><br />
        <div align="center">
            <p><asp:TextBox class="form-control" runat="server" ID="txtBuscar" placeholder="Ingrese aquí"></asp:TextBox></p>
            <p><asp:DropDownList class="form-control" runat="server" ID="ddlCriterio">
                   <asp:ListItem Text="CodCategoria"></asp:ListItem>
                   <asp:ListItem Text="Nombre"></asp:ListItem>
            </asp:DropDownList></p>
            <p><asp:Button class="btn btn-info" Text="Buscar" runat="server" ID="btnBuscar" OnClick="btnBuscar_Click" /></p>            
        </div>
        <div  align="center">
            <asp:GridView ID="gvCategoria" runat="server" class="table"></asp:GridView>
        </div>
</asp:Content>
