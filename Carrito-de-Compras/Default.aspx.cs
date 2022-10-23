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
        private List<Articulo> listaSeleccionados;
        private int cantidad = 0;
        private int index;
        Dictionary<string, int> keyValues;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                NegocioArticulo negocio = new NegocioArticulo();
                NegocioDetalle detalles = new NegocioDetalle();
                detalles.listarDosCategorias();
                dwlTipo.DataSource = detalles.listaCategorias;
                dwlTipo.DataBind();
                dwlMarca.DataSource = detalles.listaMarcas;
                dwlMarca.DataBind();

                rep_ListaDefautl.DataSource = new List<Articulo>(negocio.listarArticulos(0));
                rep_ListaDefautl.DataBind();

                if(Session.Count == 0)
                {
                    Session.Add("ListaArticulos", new List<Articulo>(negocio.listarArticulos(0)));
                    Session.Add("listaSeleccionados", new List<Articulo>());
                    Session.Add("cantidad", 0);
                    Session.Add("uniXcodigo", new Dictionary<string, int>());
                    Session.Add("montoTotal", 0.00M);
                    Session.Add("montoParcial", 0.00M);
                }
            }
        }
        //Metodos:
        protected void btn_AgregarArt_Click(object sender, EventArgs e)
        {
            try
            {
                if (Session["listaSeleccionados"] == null || Session["ListaArticulos"] == null)
                    return;

                cantidad += (int)Session["cantidad"];
                int intSelect = int.Parse(((Button)sender).CommandArgument);

                List<Articulo> list = ((List<Articulo>)Session["ListaArticulos"]);
                listaSeleccionados = (List<Articulo>)Session["listaSeleccionados"];
                keyValues = (Dictionary<string, int>)Session["uniXcodigo"];

                index = list.FindIndex(itm => itm._Id == intSelect);
                listaSeleccionados.Add(list[index]);
                Session.Add("cantidad", ++cantidad);

                index = listaSeleccionados.FindIndex(itm => itm._Id == intSelect);
                string codSeleccionado = listaSeleccionados[index]._codArticulo;

                if (!keyValues.ContainsKey(codSeleccionado))
                {
                    keyValues.Add(codSeleccionado, 1);
                }
                else
                {
                    keyValues[codSeleccionado]++;
                }
            }
            catch
            {
                Response.Redirect("Default.aspx", false);
            }
            
        }
        protected void lbtLinkCarrito_Click(object sender, EventArgs e)
        {
            try
            {
                Response.Redirect("Lista.aspx", false);
            }
            catch
            {
                Response.Redirect("Default.aspx", false);
            }
        }

        protected void btnFiltrar_Click(object sender, EventArgs e)
        {
            try
            {
                var obj = (Button)sender;
                string marca = dwlMarca.SelectedValue;
                string tipo = dwlTipo.SelectedValue;
                decimal precio = decimal.Parse(txbPrecio.Text);
            }
            catch
            {
                Response.Redirect("Default.aspx", false);
            }
        }
    }//
}