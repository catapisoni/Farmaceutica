using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Farmaceutica.Dominio
{
    internal class Clientes
    {
        public int IdCliente { get; set; }

        public Personas IdPersonaCliente { get; set; }

        public ObrasSociales CuitOSCliente { get; set; }

        public CondicionIva CondicionIvaCliente { get; set; }

        public Clientes()
        {

        }
    }
}
