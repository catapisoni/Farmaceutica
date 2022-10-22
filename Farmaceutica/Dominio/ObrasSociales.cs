using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Farmaceutica.Dominio
{
    internal class ObrasSociales
    {
        public int CuitOS { get; set; }
        public string NombreOS { get; set; }
        public string DireccionOS { get; set; }

        public int Altura { get; set; }

        public Barrios IdBarrioOS { get; set; }

        public ObrasSociales()
        {

        }
    }
}
