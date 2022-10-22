using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Farmaceutica.Dominio
{
    internal class Productos
    {
        public int IdProducto { get; set; }
        //public int Vta_receta { get; set; }
        public string Descripcion { get; set; }
        public string NombreComercial { get; set; }
        public int CodBarras { get; set; }
        public decimal Precio { get; set; }

        public DateTime Vencimiento { get; set; }

        public Tipo_Producto TipoProducto { get; set; }

        public Productos()
        {

        }

 
    }

}
