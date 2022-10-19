<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Lista.aspx.cs" Inherits="Carrito_de_Compras.Lista" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container text-center">
        <hr />
        <h2>Lista Articulos</h2>
        <asp:GridView ID="dgw_tabla" CssClass="table table-bordered table-dark" AutoGenerateColumns="true" runat="server">
            <Columns>
                <%--<asp:BoundField HeaderText="Id" DataField="Id" HeaderStyle-CssClass="ocultar" ItemStyle-CssClass="ocultar" />--%> <%--una forma de ocultar mediante css--%>
            </Columns>
        </asp:GridView>
    </div>

</asp:Content>
