<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Lista.aspx.cs" Inherits="Carrito_de_Compras.Lista" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Content -->
    <div class="container text-center">
        <hr />
        <h1>Lista Carrito</h1>
        <h2>Su Lista:</h2>
        <h3>Cantidad de articulos: <%:Request.QueryString["cantidad"] %></h3>
        <h3>Cantidad de Repetidos: <asp:Label ID="lblRepetidos" Text="" runat="server" /></h3>

        <table class="table table-striped">
            <tbody>
                <asp:Repeater ID="rep_repetidor" runat="server">
                    <HeaderTemplate>
                        <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Codigo</th>
                                <th scope="col">Articulo</th>
                                <th scope="col">Imagen</th>
                            </tr>
                        </thead>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <th scope="row"><%#DataBinder.Eval(Container.DataItem, "_Id") %></th>
                            <td><%#DataBinder.Eval(Container.DataItem, "_codArticulo") %></td>
                            <td>
                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th scope="col">Nombre</th>
                                        </tr>
                                    </thead>
                                    <tbody class="table-group-divider">
                                        <tr>
                                            <td scope="row"><%#DataBinder.Eval(Container.DataItem, "_nombre") %></td>
                                        </tr>
                                    </tbody>
                                </table>
                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th scope="col">Precio</th>
                                        </tr>
                                    </thead>
                                    <tbody class="table-group-divider">
                                        <tr>
                                            <td><%#DataBinder.Eval(Container.DataItem, "_precio") %></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </td>
                            <td><asp:Image runat="server" CssClass="img-thumbnail" ImageUrl='<%#DataBinder.Eval(Container.DataItem, "_urlImagen")%>' style="width: 100%; height: 40vh; object-fit: contain;" /></td>
                            <td><asp:Button Text="Eliminar" runat="server" Enabled="false" /></td>            
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </tbody>
        </table>
    </div>
    <!-- Fin Content -->
</asp:Content>

        <%--<asp:GridView ID="dgw_tabla" CssClass="table table-bordered table-dark" AutoGenerateColumns="false" runat="server">
            <Columns>
                <asp:BoundField HeaderText="Codigo" DataField="_codArticulo" />
                <asp:BoundField HeaderText="Nombre" DataField="_nombre" />
                <asp:BoundField HeaderText="Descripcion" DataField="_descripcion" />
                <asp:BoundField HeaderText="Url de Img" DataField="_urlImagen" />
                <%--<asp:ImageField DataImageUrlField="<%:  %>" />--%>
                <%--<asp:BoundField HeaderText="Precio" DataField="_precio" />--%>
                <%--<asp:BoundField HeaderText="Id" DataField="Id" HeaderStyle-CssClass="ocultar" ItemStyle-CssClass="ocultar" />--%>
                <%--una forma de ocultar mediante css--%>
             <%--</Columns>
        </asp:GridView>--%>