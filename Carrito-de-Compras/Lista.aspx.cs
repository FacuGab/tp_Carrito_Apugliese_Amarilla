using System;
using System.Collections.Generic;
using System.EnterpriseServices;
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
        private List<Articulo> lista;
        private List<Articulo> listaCarrito;
        public int repetido { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack) // por si hay postback, ver ... 
            {
                if (Session["listaCarrito"] == null)
                    Session.Add("listaCarrito", new List<Articulo>());

                lista = (List<Articulo>)Session["listaSeleccionados"];
                if( lista == null )  
                    return;
                listaCarrito = (List<Articulo>)Session["listaCarrito"];
                foreach (Articulo articulo in lista)
                {
                    if ( !listaCarrito.Exists(itm => itm._Id == articulo._Id) )
                        listaCarrito.Add(articulo);
                }

                rep_repetidor.DataSource = listaCarrito;
                rep_repetidor.DataBind();
            }
        }
    }
}