using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Farmaceutica.Dominio
{
    internal class Empleados
    {
        public int IdEmpleado { get; set; }
        public Personas IdPersonaEmpleado { get; set; }

        public string Observaciones { get; set; }

        public Empleados()
        {

        }
    }
}
