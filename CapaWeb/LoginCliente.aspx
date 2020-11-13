<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LoginCliente.aspx.cs" Inherits="CapaWeb.LoginCliente" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div align="center">
        <h1>BIENVENIDO</h1>
        <div align="center">
            <asp:Button class="btn btn-warning" Text="Vendedor" runat="server" ID="btnCliente" OnClick="btnCliente_Click"/>
            <asp:Button class="btn btn-danger" Text="Cliente" runat="server" ID="btnVendedor" OnClick="btnVendedor_Click"/>
        </div>
        <div>
            <asp:MultiView ID="mvEjemplo" runat="server">
                <asp:View ID="vOpcion1" runat="server">
                    <h4>Vendedor </h4>                    
                        <p><asp:TextBox class="form-control" runat="server" Id="txtUsuarioV" placeHolder="Usuario"/></p>  
                        <p><asp:TextBox class="form-control" runat="server" Id="txtContrasenaV" placeHolder="Contrasena" TextMode="Password"/></p>
                        <asp:Button class="btn btn-warning" Text="INGRESAR" runat="server" ID="btnLoguinVendedor" OnClick="btnLoguinVendedor_Click"  />
               </asp:View>
                <asp:View Id="vOpcion2" runat="server">
                    <h4>Cliente </h4>
                    <p><asp:TextBox class="form-control" runat="server" Id="txtUsuario" placeHolder="Usuario"/></p>  
                    <p><asp:TextBox class="form-control" runat="server" Id="txtContrasena" placeHolder="Contrasena" TextMode="Password"/></p>
                    <asp:Button class="btn btn-danger" Text="INGRESAR" runat="server" ID="btnLoguinCliente" OnClick="btnLoguinCliente_Click1"  />
                </asp:View>
            </asp:MultiView>                
        </div>        
        
        
    </div>
    
    </div>
    
</asp:Content>
