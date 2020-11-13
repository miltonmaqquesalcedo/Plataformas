<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AccesoVendedor.aspx.cs" Inherits="CapaWeb.AccesoVendedor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div align="center">
            <h2><asp:Label ID="lblNombre" runat="server" Text="a "></asp:Label></h2>
            <asp:Button class="btn btn-info" runat="server" ID="btnCambiar" text="Cambiar mi contraseña" OnClick="btnCambiar_Click1"/>
            <asp:Button class="btn btn-danger" runat="server" ID="btnEliminar" text="Eliminar Cuenta" OnClick="btnEliminar_Click" />
            <asp:Button class="btn btn-success" runat="server" ID="btnExcel" text="Exportar Excel" OnClick="btnExcel_Click" />
            <asp:Button class="btn btn-warning" runat="server" ID="btnPdf" text="Exportar Pdf" OnClick="btnPdf_Click" /><br />
            <asp:MultiView ID="Contra" runat="server">
                <asp:View ID="vOpcion1" runat="server">
                    <h4>Cambiar Contraseña</h4>
                    <p><asp:TextBox class="form-control" runat="server" ID="txtContrasenaA" placeholder="Contraseña Actual" TextMode="Password"></asp:TextBox></p>
                    <p><asp:TextBox class="form-control" runat="server" ID="txtContrasenaR" placeholder="Repita Contraseña" TextMode="Password"></asp:TextBox></p>
                    <p><asp:TextBox class="form-control" runat="server" ID="txtContrasenaNueva" placeholder="Nueva Conraseña" TextMode="Password"></asp:TextBox></p>
                    <asp:Button class="btn btn-primary" Text="Cambiar Contraseña" runat="server" ID="Button1" OnClick="btnCambiar_Click" />
                </asp:View>                
            </asp:MultiView>
            <br /><br />
            <div  align="center">
                <asp:GridView ID="gvVentas" runat="server" class="table"></asp:GridView>
            </div>
        </div> 
</asp:Content>
