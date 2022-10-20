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
        private List<Articulo> listaSeleccionados;
        private List<Articulo> listaMostrar;
        public int repetido { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if(!IsPostBack) // por si hay postback, ver ... 
            {
                if (Session["listaMostrar"] == null)
                {
                    Session.Add("listaMostrar", listaMostrar = new List<Articulo>());
                }
                listaSeleccionados = (List<Articulo>)Session["listaSeleccionados"];

                foreach (Articulo articulo in listaSeleccionados)
                {
                    if (listaMostrar.Exists(itm => itm._Id == articulo._Id))
                        repetido += 1;
                }
                listaMostrar = listaSeleccionados;

                rep_repetidor.DataSource = listaMostrar;
                rep_repetidor.DataBind();
            }
        }
    }
}