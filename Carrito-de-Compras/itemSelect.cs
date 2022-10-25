using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Carrito_de_Compras
{
    public class itemSelect
    {
        public int id { get; set; }
        public string marca { get; set; }
        public string tipo { get; set; }
        public decimal precio { get; set; }

        public itemSelect(string marca, string tipo, decimal precio)
        {
            this.marca = marca;
            this.tipo = tipo;
            this.precio = precio;
        }
    }
}