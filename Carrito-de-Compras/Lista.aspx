<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Lista.aspx.cs" Inherits="Carrito_de_Compras.Lista" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container text-center">
        <hr />
        <h2>Lista Articulos</h2>
        <asp:GridView ID="dgw_tabla" CssClass="table table-bordered table-dark" AutoGenerateColumns="false" runat="server">
            <Columns>
                <asp:BoundField HeaderText="Codigo" DataField="_codArticulo" />
                <asp:BoundField HeaderText="Nombre" DataField="_nombre" />
                <asp:BoundField HeaderText="Descripcion" DataField="_descripcion" />
                <asp:BoundField HeaderText="Url de Img" DataField="_urlImagen" />
                <%--<asp:ImageField DataImageUrlField="<%:  %>" />--%>
                <asp:BoundField HeaderText="Precio" DataField="_precio" />
                <%--<asp:BoundField HeaderText="Id" DataField="Id" HeaderStyle-CssClass="ocultar" ItemStyle-CssClass="ocultar" />--%>
                <%--una forma de ocultar mediante css--%>
            </Columns>
        </asp:GridView>
        <h2>Repiter</h2>
        <table class="table">

            <tbody>
                <asp:Repeater ID="rep_repetidor" runat="server">
                    <HeaderTemplate>
                        <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Codigo</th>
                                <th scope="col">Articulo</th>
                            </tr>
                        </thead>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <th scope="row"><%#DataBinder.Eval(Container.DataItem, "_Id") %></th>
                            <td></td>
                            <td><%#DataBinder.Eval(Container.DataItem, "_codArticulo") %></td>
                            <td><asp:Image runat="server" CssClass="img-thumbnail" ImageUrl='<%#DataBinder.Eval(Container.DataItem, "_urlImagen")%>' /></td>
                            <td><asp:Button Text="Seleccionar?" runat="server" Enabled="false" /></td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </tbody>
        </table>
        <%--<table class="table">
            <tbody>
                <tr>
                    <th scope="row"><%#DataBinder.Eval(Container.DataItem, "_Id") %></th>
                    <td><%#DataBinder.Eval(Container.DataItem, "_codArticulo") %></td>
                    <td>
                        <asp:Button Text="Seleccionar" runat="server" Enabled="false" /></td>
                </tr>
            </tbody>
        </table>--%>
    </div>

</asp:Content>
