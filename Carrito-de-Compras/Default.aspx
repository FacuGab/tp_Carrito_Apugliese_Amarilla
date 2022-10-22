<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Carrito_de_Compras.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        
        <%//script:
        var keyValues = ((Dictionary<string, int>)Session["uniXcodigo"]);
        int cantidad = keyValues.Count;
        int repeticiones = keyValues.TryGetValue("M03", out int value)? keyValues["M03"] : 0;
        %>

    <div class="container text-center">
        <h4>Cantidad de Articulos en Carrito: <span class="badge bg-secondary"><%:Session["cantidad"] %></span></h4>
        <%--<h4>(quitar, solo de test)Cantidad de obj en session: <span class="badge bg-secondary"><%:Session.Count %></span></h4> <!-- Quitar -->
        <h4>(quitar, solo de test)Cantidad de obj repetidos de "M03": <span class="badge bg-secondary"> <%:repeticiones %> </span></h4> <!-- Quitar -->--%>
        <h4>(quitar, solo de test)Cantidad de obj en Diccionario uniXcodigo: <span class="badge bg-secondary"><%:cantidad %></span></h4> <!-- Quitar -->
        <a href="Lista.aspx">ir a Carrito</a>

        <h2>ARTICULOS</h2>
        <div class="row row-cols-1 row-cols-md-3 g-4">
            <!-- Repiter -->
            <asp:Repeater ID="rep_ListaDefautl" runat="server">
                <ItemTemplate>
                    <div class="col" style="padding-bottom: 10px; display:grid; justify-items:center;">
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
                                <asp:Button ID="btn_AgregarArt" Text="Agregar a Carrito" CssClass="btn btn-primary" runat="server" CommandArgument='<%#Eval("_id") %>' CommandName="ArtId" OnClick="btn_AgregarArt_Click"/>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
            <!-- Fin Repiter -->

        </div>
    </div>
    
</asp:Content>
