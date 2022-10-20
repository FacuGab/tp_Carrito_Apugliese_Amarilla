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
        private int cantidad = 0;
        protected void Page_Load(object sender, EventArgs e)
        {

            if(!IsPostBack)
            {
                negocio = new NegocioArticulo();
                listaArticulos = new List<Articulo>( negocio.listarArticulos() );
                rep_ListaDefautl.DataSource = listaArticulos;
                rep_ListaDefautl.DataBind();
                if(Session.Count == 0)
                {
                    Session.Add("ListaArticulos", listaArticulos);
                    Session.Add("listaSeleccionados", listaSeleccionados = new List<Articulo>());
                    Session.Add("cantidad", cantidad);
                }
            }
            
        }

        protected void btn_AgregarArt_Click(object sender, EventArgs e)
        {
            cantidad += (int)Session["cantidad"];
            if (Session["listaSeleccionados"] == null || Session["ListaArticulos"] == null) return;

            string select = ((Button)sender).CommandArgument;
            List<Articulo> list = ((List<Articulo>)Session["ListaArticulos"]);

            listaSeleccionados = (List<Articulo>)Session["listaSeleccionados"];
            listaSeleccionados.Add( list[list.FindIndex(itm => itm._Id.ToString() == select)] );

            Session.Add("cantidad", ++cantidad);
            
        }
    }
}