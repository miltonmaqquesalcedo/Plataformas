
<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AgregarCliente.aspx.cs" Inherits="CapaWeb.AgregarCliente" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-6 mx-auto">
                <div class="card" style="width: 23rem;">    
                    <div class="card-body">
                        <div class="row" align="center">
                            <div class="col">
                                <h3>Registro de Usuarios</h3>
                                <asp:Button class="btn btn-primary" Text="Vendedor" runat="server" ID="btnVendedorR" Width="120px" OnClick="btnVendedorR_Click"/>
                                <asp:Button class="btn btn-primary" Text="Cliente" runat="server" ID="btnClienteR" Width="120px" OnClick="btnClienteR_Click"/>
                            </div>
                            <br />
                            <div class="col">
                                <asp:Button class="btn btn-success" Text="Iniciar Sesion" runat="server" ID="btnIniciar" OnClick="btnIniciar_Click" Width="190px" />
                                <div>
                                    <hr />
                                </div>
                            </div>

                        </div>
                    </div>    
                </div>
            </div>
        </div>
    </div>

    <asp:MultiView ID="mvRegistro" runat="server">
        <asp:View ID="vOpcion1" runat="server">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 mx-auto">
                        <div class="card" style="width: 23rem;">
                            <div class="card-body" align="center">

                                <div class="row" align="center">
                                    <div class="col">
                                        <div>
                                            <img width="130px" src="imagenes/agente-de-ventas.svg"/>                                        
                                        </div>
                                    </div>
                                </div>

                                <div class="row" align="center">
                                    <div class="col">
                                        <div>
                                            <h3>Registro Cliente</h3>
                                        </div>
                                    </div>
                                </div>

                                <div class="row" align="center">
                                    <div class="col">
                                        <div class="form-group">
                                            <asp:TextBox class="form-control" ID="txtCodCliente" runat="server" placeHolder="Codigo Cliente" Width="240px"></asp:TextBox>                                            
                                        </div>
                                    </div>
                                </div>

                                <div class="row" align="center">
                                    <div class="col">
                                        <div class="form-group">
                                            <asp:TextBox class="form-control" ID="txtApellidos" runat="server" placeHolder="Apellidos" Width="240px"></asp:TextBox>                                            
                                        </div>
                                    </div>
                                </div>

                                <div class="row" align="center">
                                    <div class="col">
                                        <div class="form-group">
                                            <asp:TextBox class="form-control" ID="txtNombres" runat="server" placeHolder="Nombres" Width="240px"></asp:TextBox>                                         
                                        </div>
                                    </div>
                                </div>

                                <div class="row" align="center">
                                    <div class="col">
                                        <div class="form-group">
                                            <asp:TextBox class="form-control" ID="txtDireccion" runat="server" placeHolder="Dirección" Width="240px"></asp:TextBox>                                            
                                        </div>
                                    </div>
                                </div>

                                <div class="row" align="center">
                                    <div class="col">
                                        <div class="form-group">
                                            <asp:TextBox class="form-control" ID="txtUsuario" runat="server" placeHolder="Usuario" Width="240px"></asp:TextBox>                                            
                                        </div>
                                    </div>
                                </div>

                                <div class="row" align="center">
                                    <div class="col">
                                        <div class="form-group">
                                            <asp:TextBox class="form-control" ID="txtContrasena" runat="server" TextMode="Password" placeHolder="Contraseña" Width="240px"></asp:TextBox>                                            
                                        </div>
                                    </div>
                                </div>

                                <div class="row" align="center">
                                    <div class="col">
                                        <div>
                                            <hr/>
                                        </div>
                                    </div>
                                </div>

                                <div class="row" align="center">
                                    <div class="form-group">
                                        <asp:Button class="btn btn-primary" ID="btnCrear" runat="server" Text="Registrar" OnClick="btnCrear_Click" width="200px" />
                                    </div>
                                </div>
                        

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </asp:View>
        <asp:View ID="View1" runat="server">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 mx-auto">
                        <div class="card" style="width: 23rem;">
                            <div class="card-body" align="center">

                                <div class="row" align="center">
                                    <div class="col">
                                        <div>
                                            <img width="130px" src="imagenes/Vendedor.svg"/>                                        
                                        </div>
                                    </div>
                                </div>

                                <div class="row" align="center">
                                    <div class="col">
                                        <div>
                                            <h3>Registro Vendedor</h3>
                                        </div>
                                    </div>
                                </div>

                                <div class="row" align="center">
                                    <div class="col">
                                        <div class="form-group">
                                            <asp:TextBox class="form-control" runat="server" ID="txtCodVendedor" placeHolder="CodVendedor" Width="240px"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row" align="center">
                                    <div class="col">
                                        <div class="form-group">
                                            <asp:TextBox class="form-control" runat="server" ID="txtApellidosV" placeHolder="Apellidos" Width="240px"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row" align="center">
                                    <div class="col">
                                        <div class="form-group">
                                            <asp:TextBox class="form-control" runat="server" ID="txtNombreV" placeHolder="Nombres" Width="240px"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row" align="center">
                                    <div class="col">
                                        <div class="form-group">
                                            <asp:TextBox class="form-control" runat="server" ID="txtUsuarioV" placeHolder="Usuario" Width="240px"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row" align="center">
                                    <div class="col">
                                        <div class="form-group">
                                            <asp:TextBox class="form-control" runat="server" ID="txtContrasenaV" TextMode="Password" placeHolder="Contraseña" Width="240px"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                        
                        

                                <div class="row" align="center">
                                    <div class="col">
                                        <div>
                                            <hr/>
                                        </div>
                                    </div>
                                </div>

                                <div class="row" align="center">
                                    <div class="form-group">
                                        <asp:Button class="btn btn-primary" ID="Button1" runat="server" Text="Registrar" Width="200px" OnClick="Button1_Click"/>
                                    </div>
                                </div>
                        

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </asp:View>
    </asp:MultiView>
</asp:Content>
