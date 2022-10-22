<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Lista.aspx.cs" Inherits="Carrito_de_Compras.Lista" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- Content -->
    <div class="container text-center">
        <hr />
        <h1>Lista Carrito</h1>
        <h2>Su Lista:</h2>
        <h3>Cantidad de articulos: <%:Session["cantidad"] %></h3>
        <h3>Cantidad de obj en Session: <%:Session.Count %></h3>
        <h3>Monto Total:<asp:Label ID="lblTotal" Text=" $" runat="server" /></h3>

        <table class="table table-striped">
            <tbody>
                <asp:Repeater ID="rep_repetidor" runat="server">
                    <HeaderTemplate>
                        <thead>
                            <tr>
                                <th scope="col">Articulo</th>
                                <th scope="col">Imagen</th>
                            </tr>
                        </thead>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td>
                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th scope="col">Codigo</th>
                                        </tr>
                                    </thead>
                                    <tbody class="table-group-divider">
                                        <tr>
                                            <td><%#DataBinder.Eval(Container.DataItem, "_codArticulo") %></td>
                                        </tr>
                                    </tbody>
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
                                    <thead>
                                        <tr>
                                            <th scope="col">Cantidad Seleccionada</th>
                                        </tr>
                                    </thead>
                                    <tbody class="table-group-divider">
                                        <tr>
                                            <td><%#ArtRepetidos( ((Dominio.Articulo)Container.DataItem)._codArticulo ) %></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </td>
                            <td>
                                <asp:Image runat="server" CssClass="img-thumbnail" ImageUrl='<%#DataBinder.Eval(Container.DataItem, "_urlImagen")%>' onerror="this.src='https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/495px-No-Image-Placeholder.svg.png?20200912122019'" Style="width: 100%; height: 40vh; object-fit: contain;" />
                            </td>
                            <td>
                                <table class="table">
                                    <tbody>
                                        <tr>
                                            <td>
                                                <h4>Total de este Articulo<span class="badge bg-secondary"><%#TotalXunidades( ((Dominio.Articulo)Container.DataItem)._codArticulo, ((Dominio.Articulo)Container.DataItem)._precio ) %></span> $</h4>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Button ID="btn_Eliminar" Text="Eliminar" runat="server" CommandArgument='<%#Eval("_codArticulo") %>' CommandName="_codArticulo"  OnClick="btn_Eliminar_Click" />
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </td>
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
