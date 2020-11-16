<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RecuperarContraseña.aspx.cs" Inherits="CapaWeb.RecuperarContraseña" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">                                                

    <br />        
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
                                                    <h4>Cambiar Contraseña</h4>
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
                                                    <asp:TextBox class="form-control" runat="server" Id="txtRecuperarC2" placeHolder="Repetir Contraseña" TextMode="Password" Width="240px"/>
                                                </div>
                                                <div class="form-group">
                                                    <asp:TextBox class="form-control" runat="server" Id="txtNuevaContraseña" placeHolder="Nueva Contraseña" TextMode="Password" Width="240px"/>
                                                </div>
                                                <div class="form-group">
                                                    <asp:DropDownList class="form-control" runat="server" ID="ddlCriterio" Width="200px">
                                                       <asp:ListItem Text="Vendedor"></asp:ListItem>
                                                       <asp:ListItem Text="Cliente"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                                <div class="form-group">
                                                        <a runat="server" href="LoginCliente.aspx" >Iniciar Sesion</a>
                                                 </div>
                                                <div class="form-group">
                                                    <asp:Button class="btn btn-danger" Text="CAMBIAR" runat="server" ID="btnVerificar" Width="220px" OnClick="btnVerificar_Click" />                                                    
                                                </div>
                                                
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
    </div>        
</asp:Content>
