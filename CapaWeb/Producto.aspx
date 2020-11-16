<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Producto.aspx.cs" Inherits="CapaWeb.Producto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
       
    <br />
    <div class="container">
        <div class="row">
            <div class="col-md-6 mx-auto">
                <div class="card" style="width: 40rem;>
                    <div class="card-body">

                        <div class="row" align="center">
                            <div class="col">
                                <div>
                                    <h3>MANTENIMIENTO PRODUCTO</h3>
                                </div>
                            </div>
                        </div>

                        <div class="row" align="center">
                                <div>
                                    <asp:Button class="btn btn-success" runat="server" ID="btnBoleta" Text="Boleta" Width="120px" OnClick="btnBoleta_Click" />
                                    <asp:Button class="btn btn-success" runat="server" ID="btnProducto" Text="Producto" Width="120px" OnClick="btnProducto_Click" />
                                    <asp:Button class="btn btn-success" runat="server" ID="btnCategoria" Text="Categoria" Width="120px" OnClick="btnCategoria_Click"/>                                    
                                </div>                            
                        </div>
                        <br />
                        <div class="row" align="center">
                                <div>
                                    <asp:Button class="btn btn-danger" runat="server" ID="btnCerrar" Text="Cerrar Sesion" Width="120px" OnClick="btnCerrar_Click" />
                                </div>                            
                        </div>

                        <div class="row" align="center">
                            <div class="col">
                                <div>
                                    <hr/>
                                </div>
                            </div>
                        </div>

                        <div class="row" >
                            <div class="col">
                                <div class="form-group">
                                    <asp:TextBox class="form-control" runat="server" ID="txtCodProducto" placeholder="Codigo Producto"  ></asp:TextBox>                                   
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <div class="form-group">
                                    <asp:TextBox class="form-control" runat="server" ID="txtNombre" placeholder="Nombre" ></asp:TextBox> 
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <div class="form-group">
                                    <asp:TextBox class="form-control" runat="server" ID="txtUnidadMedida" placeholder="Unidad Medida"></asp:TextBox>                                                                        
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <div class="form-group">
                                    <asp:TextBox class="form-control" runat="server" ID="txtPrecio" placeholder="Precio" ></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <div class="form-group">
                                    <asp:TextBox class="form-control" runat="server" ID="txtStock" placeholder="Stock" ></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <div class="form-group">
                                    <asp:TextBox class="form-control" runat="server" ID="txtCodCategoria" placeholder="Codigo Categoria"></asp:TextBox>
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
                        <div  align="center">
                            <asp:Button class="btn btn-primary" Text="Agregar" runat="server" ID="btnAgregar" OnClick="btnAgregar_Click" Width="130px" />
                            <asp:Button class="btn btn-primary" Text="Eliminar" runat="server" ID="btnEiminar" OnClick="btnEiminar_Click" Width="130px" />
                            <asp:Button class="btn btn-primary" Text="Actualizar" runat="server" ID="btnActualizar" OnClick="btnActualizar_Click" Width="130px" />
                        </div>
                        <br />
                        <div class="row" align="center">
                            <div class="col">
                                <div class="form-group">
                                    <asp:TextBox class="form-control" runat="server" ID="txtBuscar" placeholder="Ingrese Texto" Width="250px"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row" align="center">
                            <div class="col">
                                <div class="form-group">
                                    <div>
                                        <asp:DropDownList class="form-control" runat="server" ID="ddlCriterio" Width="250px">
                                           <asp:ListItem Text="CodProducto"></asp:ListItem>
                                           <asp:ListItem Text="Nombre"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row" align="center">
                            <div class="col">
                                <div class="form-group">
                                    <asp:Button class="btn btn-info" Text="Buscar" runat="server" ID="btnBuscar" OnClick="btnBuscar_Click" Width="150px" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <asp:GridView ID="gvProducto" runat="server" class="table" AutoGenerateColumns="false" PageSize="5" AllowPaging="true" 
                                OnPageIndexChanging="gvProducto_PageIndexChanging" >
                                <Columns>
                                        <asp:BoundField DataField="CodProducto" HeaderText="CodProducto" />
                                        <asp:BoundField DataField="Categoria" HeaderText="Categoria" />
                                        <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                                        <asp:BoundField DataField="UnidadMedida" HeaderText="UnidadMedida" />
                                        <asp:BoundField DataField="Precio" HeaderText="Precio" />
                                        <asp:BoundField DataField="Stock" HeaderText="Stock" />
                                </Columns>
                                <PagerStyle HorizontalAlign="Center" />
                            </asp:GridView>

            </div>
        </div>
    </div>
                            
                        
        
</asp:Content>
