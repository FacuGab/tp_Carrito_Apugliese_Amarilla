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
        private NegocioArticulo negocio;
        protected void Page_Load(object sender, EventArgs e)
        {

            if(!IsPostBack)
            {
                negocio = new NegocioArticulo();
                listaArticulos = negocio.listarArticulos();
                rep_ListaDefautl.DataSource = listaArticulos;
                rep_ListaDefautl.DataBind();
            }
            
        }
    }
}