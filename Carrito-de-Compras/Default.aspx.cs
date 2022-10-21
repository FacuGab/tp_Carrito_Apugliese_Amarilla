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
        private int cantidad = 0;
        private int n = 0;
        Dictionary<string, int> keyValues;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                NegocioArticulo negocio = new NegocioArticulo();
                listaArticulos = new List<Articulo>( negocio.listarArticulos(0) );
                rep_ListaDefautl.DataSource = listaArticulos;
                rep_ListaDefautl.DataBind();

                if(Session.Count == 0)
                {
                    Session.Add("ListaArticulos", listaArticulos);
                    Session.Add("listaSeleccionados", listaSeleccionados = new List<Articulo>());
                    Session.Add("cantidad", cantidad);
                    Session.Add("uniXcodigo", new Dictionary<string, int>());
                }
            }
        }
        
        protected void btn_AgregarArt_Click(object sender, EventArgs e)
        {
            
            if ( Session["listaSeleccionados"] == null || Session["ListaArticulos"] == null ) 
                return;

            cantidad += (int)Session["cantidad"];
            string select = ((Button)sender).CommandArgument;
            int intSelect = int.Parse(select);

            List<Articulo> list = ((List<Articulo>)Session["ListaArticulos"]);
            listaSeleccionados = (List<Articulo>)Session["listaSeleccionados"];
            keyValues = (Dictionary<string, int>)Session["uniXcodigo"];

            listaSeleccionados.Add( list[list.FindIndex(itm => itm._Id == intSelect)] );
            Session.Add("cantidad", ++cantidad);
            
            string codSeleccionado = listaSeleccionados[listaSeleccionados.FindIndex(itm => itm._Id == intSelect)]._codArticulo;
            if(!keyValues.ContainsKey(codSeleccionado)) 
                keyValues.Add(codSeleccionado, ++n);
        }
    }
}