<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LoginCliente.aspx.cs" Inherits="CapaWeb.LoginCliente" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
    <div class="row">
        <div class="col-md-6 mx-auto">
            <div class="card" style="width: 23rem;">    
                <div class="card-body">
                    <div class="row" align="center">
                        <div class="col">
                            <h3>Iniciar Sesion</h3>
                            <asp:Button class="btn btn-primary" Text="Vendedor" runat="server" ID="btnCliente" OnClick="btnCliente_Click" Width="120px"/>
                            <asp:Button class="btn btn-primary" Text="Cliente" runat="server" ID="btnVendedor" OnClick="btnVendedor_Click" Width="120px"/>
                        </div>
                        <br />
                        <div class="col">
                                <asp:Button class="btn btn-success" Text="Registrarse" runat="server" ID="btnIniciar"  Width="190px" OnClick="btnIniciar_Click" />
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
                            

    <br />
<div>
    <asp:MultiView ID="mvEjemplo" runat="server">
        <asp:View ID="vOpcion1" runat="server">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-6 mx-auto" >
                                <div class="card" style="width: 23rem;">
                                    <div class="card-body" align="center">
                                            <div class="row" align="center">
                                                <div class="col">
                                                    <div>
                                                        <img width="150px" src="imagenes/usuario.svg"/>                                       
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row" align="center">
                                                <div class="col">
                                                    <div>
                                                        <h4>Inicio De Sesion Vendedor</h4>
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

                                            <div class="row">
                                                <div class="col">                                                
                                                    <div class="form-group" >
                                                        <asp:TextBox CssClass="form-control" runat="server" Id="txtUsuarioV" placeHolder="Usuario" Width="240px"/>                                                                                                            
                                                    </div>
                                                
                                                    <div class="form-group">
                                                        <asp:TextBox CssClass="form-control" runat="server" Id="txtContrasenaV" placeHolder="Contraseña" TextMode="Password" Width="240px"/>
                                                    </div>
                                                    <div class="form-group">
                                                        <a runat="server" href="RecuperarContraseña.aspx" >¿Olvidaste tu Contraseña?</a>
                                                    </div>
                                                    <div class="form-group">
                                                        <asp:Button class="btn btn-primary" Text="INGRESAR" runat="server" ID="btnLoguinVendedor" OnClick="btnLoguinVendedor_Click" Width="220px" />
                                                    </div>
                                                </div>
                                            </div>
                                     </div>                                    
                                </div>
                            </div>
                        </div>
                    </div>
               </asp:View>
        <asp:View Id="vOpcion2" runat="server">                                                 
            <div class="container">
                        <div class="row">
                            <div class="col-md-6 mx-auto">
                                <div class="card" style="width: 23rem;">
                                    <div class="card-body" align="center">

                                        <div class="row" align="center">
                                            <div class="col">
                                                <div>
                                                    <img width="150px" src="imagenes/usuario.svg"/>                                       
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row" align="center">
                                            <div class="col">
                                                <div>
                                                    <h4>Inicio De Sesion Cliente</h4>
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

                                        <div class="row">
                                            <div class="col">                                                
                                                <div class="form-group" >
                                                    <asp:TextBox class="form-control" runat="server" Id="txtUsuario" placeHolder="Usuario" Width="240px"/>                                                                                                            
                                                </div>
                                                
                                                <div class="form-group">
                                                    <asp:TextBox class="form-control" runat="server" Id="txtContrasena" placeHolder="Contraseña" TextMode="Password" Width="240px"/>
                                                </div>

                                                <div class="form-group">
                                                    <a runat="server" href="RecuperarContraseña.aspx" >¿Olvidaste tu Contraseña?</a>
                                                </div>
                                                <div class="form-group">
                                                    <asp:Button class="btn btn-primary" Text="INGRESAR" runat="server" ID="btnLoguinCliente" OnClick="btnLoguinCliente_Click1" Width="220px"  />
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
        </asp:View>
        <asp:View Id="vOpcion3" runat="server">                                                 
            <div class="container">
                        <div class="row">
                            <div class="col-md-6 mx-auto">
                                <div class="card" style="width: 23rem;">
                                    <div class="card-body" align="center">

                                        <div class="row" align="center">
                                            <div class="col">
                                                <div>
                                                    <img width="150px" src="imagenes/detective.svg"/>                                       
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row" align="center">
                                            <div class="col">
                                                <div>
                                                    <h4>Recuperar Contraseña</h4>
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

                                        <div class="row">
                                            <div class="col">                                                
                                                <div class="form-group" >
                                                    <asp:TextBox class="form-control" runat="server" Id="txtRecuperarU" placeHolder="Usuario" Width="240px"/>                                                                                                            
                                                </div>
                                                
                                                <div class="form-group">
                                                    <asp:TextBox class="form-control" runat="server" Id="txtRecuperarC" placeHolder="Contraseña" TextMode="Password" Width="240px"/>
                                                </div>
                                                <div class="form-group">
                                                    <asp:TextBox class="form-control" runat="server" Id="TextBox1" placeHolder="Verificar Contraseña" TextMode="Password" Width="240px"/>
                                                </div>
                                                <div class="form-group">
                                                    <asp:TextBox class="form-control" runat="server" Id="TextBox2" placeHolder="Nueva Contraseña" TextMode="Password" Width="240px"/>
                                                </div>
                                                <div class="form-group">
                                                    <asp:Button class="btn btn-primary" Text="INGRESAR" runat="server" ID="Button1" OnClick="btnLoguinCliente_Click1" Width="220px"  />
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
        </asp:View>
     </asp:MultiView>                
</div>
</asp:Content>
