<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Privado.aspx.cs" Inherits="SeguridadFrontEnd.Intranet.Privado" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Sitio privado, solo personal autorizado
            <br />
            <br />
            Bienvenido
            <asp:LoginName ID="LoginName1" runat="server" />
            <br />
            <br />
            <asp:LoginStatus ID="LoginStatus1" runat="server" />
            <br />
            <br />
            <br />
        </div>
        <!--Controles que permiten un mejor uso del espacio en un formulario web-->
        <p>
            <asp:Button Text="Opcion 1" runat="server" ID="btnOpcion1" OnClick="btnOpcion1_Click"/>
            <asp:Button Text="Opcion 2" runat="server" ID="btnOpcion2" OnClick="btnOpcion2_Click"/>
            <asp:Button Text="Opcion 3" runat="server" ID="btnOpcion3" OnClick="btnOpcion3_Click"/>
        </p>
        <asp:MultiView ActiveViewIndex="0" runat="server" ID="mvOpciones">
            <asp:View runat="server" ID="vOpcion1">
                Opcion 1
                <asp:Button Text="text" runat="server" />
            </asp:View>
            <asp:View runat="server" ID="vOpcion2">
                Opcion 2
                <asp:Button Text="text" runat="server" />
            </asp:View>
            <asp:View runat="server" ID="vOpcion3">
                Opcion 3
                <asp:DropDownList runat="server">
                    <asp:ListItem Text="text"></asp:ListItem>
                    <asp:ListItem Text="text"></asp:ListItem>
                </asp:DropDownList>
            </asp:View>
        </asp:MultiView>
    </form>
</body>
</html>
