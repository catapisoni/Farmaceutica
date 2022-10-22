using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Farmaceutica.Dominio
{
    internal class Personas
    {
        public int IdPersona { get; set; }
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        
        public Tipo_Doc IdTipoDoc { get; set; }
        public int NroDoc { get; set; }
        public DateTime Fec_nac { get; set; }
        public string Mail { get; set; }
        public string Telefono { get; set; }
        public string Direccion { get; set; }
        public int Altura { get; set; }
        public Barrios IdBarrioPersonas { get; set; }

        public Personas()
        {

        }
    }
}
