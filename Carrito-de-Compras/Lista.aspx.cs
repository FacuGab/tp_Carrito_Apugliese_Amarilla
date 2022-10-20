using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using Negocio;

namespace Carrito_de_Compras
{
    public partial class Lista : System.Web.UI.Page
    {
        private NegocioArticulo negocio;
        private List<Articulo> listaArticulo;
        protected void Page_Load(object sender, EventArgs e)
        {

            negocio = new NegocioArticulo();
            if(!IsPostBack) // por si hay postback, ver ... 
            {
                //listaArticulo = negocio.listarArticulos();
                //listaArticulo = (List<Articulo>)Session["listaSeleccionados"];
                rep_repetidor.DataSource = (List<Articulo>)Session["listaSeleccionados"];
                rep_repetidor.DataBind();
            }

        }
    }
}