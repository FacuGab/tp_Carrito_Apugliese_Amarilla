<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Carrito_de_Compras.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container text-center">
        <h2>ARTICULOS</h2>
        <div class="row row-cols-1 row-cols-md-3 g-4">

            <!-- Repiter -->
            <asp:Repeater ID="rep_ListaDefautl" runat="server">
                <ItemTemplate>
                    <div class="col" style="padding-bottom: 10px;">
                        <div class="card" style="width: 18rem;">
                            <img src="<%#DataBinder.Eval(Container.DataItem, "_urlImagen")%>" class="card-img-top" alt="Imagen Default">
                            <div class="card-body">
                                <h5 class="card-title"><%#DataBinder.Eval(Container.DataItem, "_nombre")%></h5>
                                <p class="card-text"><%#DataBinder.Eval(Container.DataItem, "_descripcion")%></p>
                            </div>
                            <ul class="list-group list-group-flush">
                                <li class="list-group-item">Codigo: <%#DataBinder.Eval(Container.DataItem, "_codArticulo")%></li>
                                <li class="list-group-item">Precio: <%#DataBinder.Eval(Container.DataItem, "_precio")%></li>
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
