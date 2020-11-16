<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Boleta.aspx.cs" Inherits="CapaWeb.Boleta" %>
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
                                    <h3>MANTENIMIENTO BOLETA</h3>
                                </div>
                            </div>
                        </div>

                        <div class="row" align="center">
                                <div>
                                    <asp:Button class="btn btn-success" runat="server" ID="btnBoleta" Text="Boleta" Width="120px" OnClick="btnBoleta_Click" />
                                    <asp:Button class="btn btn-success" runat="server" ID="btnProducto" Text="Producto" Width="120px" OnClick="btnProducto_Click"/>
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
                                    <asp:TextBox class="form-control" runat="server" ID="txtNroBoleta" placeholder="Número de Boleta" ></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <div class="form-group">
                                    <asp:TextBox class="form-control" runat="server" ID="txtCodCliente" placeholder="Codigo Cliente"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <div class="form-group">
                                    <asp:TextBox class="form-control" runat="server" ID="txtCodVendedor" placeholder="Codigo Vendedor"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <div class="form-group">
                                    <asp:TextBox class="form-control" runat="server" ID="txtAnulado" placeholder="Anulado"></asp:TextBox>
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
                            <asp:Button class="btn btn-primary" Text="Agregar" runat="server" ID="btnAgregar" OnClick="btnAgregar_Click" width="130"/>
                            <asp:Button class="btn btn-primary" Text="Eliminar" runat="server" ID="btnEiminar" OnClick="btnEiminar_Click" width="130"/>
                            <asp:Button class="btn btn-primary" Text="Actualizar" runat="server" ID="btnActualizar" OnClick="btnActualizar_Click" width="130" />
                        </div>
                        <br />
                        <div class="row" align="center">
                            <div class="col">
                                <div class="form-group">
                                    <asp:TextBox class="form-control" runat="server" ID="txtBuscar" placeholder="Ingrese aquí" Width="250px"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row" align="center">
                            <div class="col">
                                <div class="form-group">
                                    <div>
                                        <asp:DropDownList class="form-control" runat="server" ID="ddlCriterio" Width="250px">
                                               <asp:ListItem Text="NroBoleta"></asp:ListItem>
                                               <asp:ListItem Text="CodCliente"></asp:ListItem>
                                               <asp:ListItem Text="CodVendedor"></asp:ListItem>
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

                        <div class="row" align="center">
                            <div class="col">
                                <div>
                                    <asp:Button class="btn btn-warning" Text="Exportar Excel" runat="server" ID="btnExcel"  width="130" OnClick="btnExcel_Click"/>
                                    <asp:Button class="btn btn-warning" Text="Exportar Pdf" runat="server" ID="btnPdf"  width="130" OnClick="btnPdf_Click"/>
                                </div>
                            </div>
                        </div>
                        <br />
                        <br />
                    </div>
                </div>
                
                <div  align="center">
                    <asp:GridView ID="gvBoleta1" runat="server" class="table" AutoGenerateColumns="false" PageSize="5" AllowPaging="true"
                        OnPageIndexChanging="gvBoleta_PageIndexChanging">
                        <Columns>
                            <asp:BoundField DataField="NroBoleta" HeaderText="NroBoleta" />
                            <asp:BoundField DataField="Fecha" HeaderText="Fecha" />
                            <asp:BoundField DataField="CodCliente" HeaderText="CodCliente" />
                            <asp:BoundField DataField="CodVendedor" HeaderText="CodCliente" />
                         </Columns>
                         <PagerStyle HorizontalAlign="Center" />
                    </asp:GridView>
                </div>
                  <div class="form-group mx-sm-3 mb-2">
                    <asp:TextBox class="form-control" ID="txtCodigoListar" runat="server" placeholder="Codigo Boleta"></asp:TextBox>
                    <br /><div><asp:Button class="btn btn-primary mb-2" ID="btnListar" runat="server" Text="Buscar" Width="150px" OnClick="btnListar_Click" /></div>
                  </div>
                <h5>BOLETA</h5>
                <div  align="center">
                    <asp:GridView ID="gvBoleta2" runat="server" class="table">
                         <PagerStyle HorizontalAlign="Center" />
                    </asp:GridView>
                </div>
                <h5>DETALLES BOLETA</h5>
                <div  align="center">
                    <asp:GridView ID="gvDetalle1" runat="server" class="table" AutoGenerateColumns="true">
                    </asp:GridView>
                </div>

            </div>
        </div>
    </div>
    
</asp:Content>
