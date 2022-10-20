using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Carrito_de_Compras
{
    public partial class Default : System.Web.UI.Page
    {
        private List<Articulo> listaArticulos;
        private List<Articulo> listaSeleccionados;
        private NegocioArticulo negocio;
        protected void Page_Load(object sender, EventArgs e)
        {

            if(!IsPostBack)
            {
                negocio = new NegocioArticulo();
                listaArticulos = new List<Articulo>( negocio.listarArticulos() );
                rep_ListaDefautl.DataSource = listaArticulos;
                rep_ListaDefautl.DataBind();
                Session.Add("ListaArt", listaArticulos);
                Session.Add("listaArticulos", listaSeleccionados = new List<Articulo>() );
            }
            
        }

        protected void btn_AgregarArt_Click(object sender, EventArgs e)
        {

            if (Session["listaArticulos"] == null || Session["ListaArt"] == null) return;

            string select = ((Button)sender).CommandArgument;
            List<Articulo> list = ((List<Articulo>)Session["ListaArt"]);

            listaSeleccionados = (List<Articulo>)Session["listaArticulos"];
            listaSeleccionados.Add( list[list.FindIndex(itm => itm._Id.ToString() == select)] );

            //(Articulo)listaArticulos.Where(itm => itm._Id.ToString() == select)
        }
    }
}