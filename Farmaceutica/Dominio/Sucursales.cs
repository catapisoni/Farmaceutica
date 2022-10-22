using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Farmaceutica.Dominio
{
    internal class Sucursales
    {
        public int IdSucursal { get; set; }
        public string NombreSucursal { get; set; }
        public string Direccion { get; set; }
        public int Altura { get; set; }
        public Barrios IdBarrioSucursal { get; set; }

        public Sucursales()
        {

        }
    }
}
