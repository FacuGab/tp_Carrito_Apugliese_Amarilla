<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Carrito_de_Compras.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container text-center">
        <h2>ARTICULOS</h2>
        <div class="row">

            <!-- Repiter -->
            <asp:Repeater ID="rep_ListaDefautl" runat="server">
                <ItemTemplate>
                    <div class="col-sm-6" style="padding-bottom: 10px;">
                        <div class="card" style="width: 18rem;">
                            <img src="<%#DataBinder.Eval(Container.DataItem, "_urlImagen")%>" class="card-img-top" alt="Imagen Default">
                            <div class="card-body align-content-center">
                                <h5 class="card-title"><%#DataBinder.Eval(Container.DataItem, "_nombre")%></h5>
                                <p class="card-text"><%#DataBinder.Eval(Container.DataItem, "_descripcion")%></p>
                            </div>
                            <ul class="list-group list-group-flush">
                                <li class="list-group-item">Codigo: <%#DataBinder.Eval(Container.DataItem, "_codArticulo")%></li>
                                <li class="list-group-item">Precio: <%#DataBinder.Eval(Container.DataItem, "_precio")%></li>
                                <li class="list-group-item">Marca: <%#DataBinder.Eval(Container.DataItem, "_marca._Descripcion")%></li>
                            </ul>
                            <div class="card-body">
                                <a href="#" class="card-link">Card link</a>
                                <a href="#" class="card-link">Another link</a>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
            <!-- Fin Repiter -->

        </div>
    </div>

</asp:Content>
