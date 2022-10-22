using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Farmaceutica.Dominio
{
    internal class Barrios
    {
        public int IdBarrio { get; set; }
        public string NombreBarrio { get; set; }

        public Localidades IdLocalidadBarrios { get; set; }
    }
}
