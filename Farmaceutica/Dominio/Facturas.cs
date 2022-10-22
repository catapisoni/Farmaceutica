using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Farmaceutica.Dominio
{
    internal class Facturas
    {
        public int IdFactura { get; set; }
        public DateTime FechaFactura { get; set; }
        public Empleados IdEmpleadoFactura { get; set; }
        public FormasPago IdFormasPagoFactura { get; set; }
        public Clientes IdClienteFacturas { get; set; }
        public Sucursales IdSucursalFactura { get; set; }
        public ObrasSociales CuitOSFactura { get; set; }
        public string Observaciones { get; set; }
    }
}
