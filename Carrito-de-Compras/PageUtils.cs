using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;

namespace Carrito_de_Compras
{
    public static class PageUtils
    {
        public static void Mensaje(Page page, string mensaje)
        {
            if(!string.IsNullOrWhiteSpace(mensaje))
                ScriptManager.RegisterClientScriptBlock(page, page.GetType(), "alertMessage", $"alert('{mensaje}')", true);
        }
    }
}