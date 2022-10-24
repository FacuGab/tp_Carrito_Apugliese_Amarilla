<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Carrito_de_Compras.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <%//script:
        var keyValues = ((Dictionary<string, int>)Session["uniXcodigo"]);
        int cantidad = keyValues.Count;
        int repeticiones = keyValues.TryGetValue("M03", out int value) ? keyValues["M03"] : 0;
    %>

    <div class="container text-center">
        <div style="margin-bottom: 10px">
            <h4>Cantidad de Articulos en Carrito: <span class="badge bg-secondary"><%:Session["cantidad"] %></span></h4>
            <div class="d-grid gap-2 col-6 mx-auto">
                <asp:LinkButton ID="lbtLinkCarrito" Text="Ir a Carrito" CssClass="btn btn-primary" OnClick="lbtLinkCarrito_Click" runat="server" />
            </div>
        </div>

        <!-- Filtros Busqueda -->
        <div>
            <table class="table table-borderless">
                <thead>
                    <h3>Filtros</h3>
                </thead>
                <tbody>
                    <tr>
                        <td colspan="2">
                            <h4>Marca:</h4>
                        </td>
                        <td colspan="2">
                            <asp:DropDownList ID="dwlMarca" CssClass="form-control" OnSelectedIndexChanged="dwlMarca_SelectedIndexChanged" runat="server"></asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <h4>Tipo:</h4>
                        </td>
                        <td colspan="2">
                            <asp:DropDownList ID="dwlTipo" CssClass="form-control" OnSelectedIndexChanged="dwlMarca_SelectedIndexChanged" runat="server"></asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <h4>Precio:</h4>
                        </td>
                        <td colspan="2">
                            <asp:TextBox CssClass="form-control" ID="txbPrecio" runat="server" />
                        </td>
                    </tr>
                </tbody>
            </table>
            <div>
                <asp:Button ID="btnFiltrar" Text="Filtrar" OnClick="btnFiltrar_Click" runat="server" CssClass="btn btn-primary" />
                <asp:Button ID="btnResetFiltro" Text="Borrar filtro" OnClick="btnResetFiltro_Click" runat="server" CssClass="btn btn-primary" />
            </div>
        </div>
        <hr />
        <!-- FIN Filtros Busqueda -->

        <h2>ARTICULOS</h2>
        <div class="row row-cols-1 row-cols-md-3 g-4">
            <!-- Repiter -->
            <asp:Repeater ID="rep_ListaDefautl" runat="server">
                <ItemTemplate>
                    <div class="col" style="padding-bottom: 10px; display: grid; justify-items: center;">
                        <div class="card" style="width: 18rem;">
                            <asp:Image runat="server" CssClass="img-thumbnail" ImageUrl='<%#DataBinder.Eval(Container.DataItem, "_urlImagen")%>' onerror="this.src='https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/495px-No-Image-Placeholder.svg.png?20200912122019'" Style="width: 100%; height: 40vh; object-fit: contain;" />
                            <div class="card-body">
                                <h5 class="card-title"><%#DataBinder.Eval(Container.DataItem, "_nombre")%></h5>
                                <p class="card-text"><%#DataBinder.Eval(Container.DataItem, "_descripcion")%></p>
                            </div>
                            <ul class="list-group list-group-flush">
                                <li class="list-group-item">Codigo: <%#DataBinder.Eval(Container.DataItem, "_codArticulo")%></li>
                                <li class="list-group-item">Precio: <%#DataBinder.Eval(Container.DataItem, "_precio")%> $</li>
                                <li class="list-group-item">Marca: <%#DataBinder.Eval(Container.DataItem, "_marca._Descripcion")%></li>
                            </ul>
                            <div class="card-body">
                                <asp:Button ID="btn_AgregarArt" Text="Agregar a Carrito" CssClass="btn btn-primary" runat="server" CommandArgument='<%#Eval("_id") %>' CommandName="ArtId" OnClick="btn_AgregarArt_Click" />
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
            <!-- Fin Repiter -->

        </div>
    </div>

</asp:Content>
