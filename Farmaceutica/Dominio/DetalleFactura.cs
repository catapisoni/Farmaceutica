using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Farmaceutica.Dominio
{
    internal class DetalleFactura
    {
        public int IdDetalle { get; set; }
        public Facturas IdFacturaDF { get; set; }
        public Productos IdProductoDF { get; set; }
        public int Cantidad { get; set; }
        public decimal Precio_Venta { get; set; }
        public ValidacionesCobertura IdValidacionDF { get; set; }
        public DescuentosOS_Vigentes IdDescuentoOS { get; set; }
        public decimal DescuentoSucursal { get; set; }
        public DetalleFactura()
        {

        }
    }
}
