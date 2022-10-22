using Farmaceutica.Dominio;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Farmaceutica.Datos.Interfaz
{
    internal interface IDaoFactura
    {
        List<Productos> ObtenerProductos();
        int ObtenerProximoNumeroFactura();
        Facturas ObtenerFacturaPorNumero(int numero);
        DataTable ObtenerReporte(DateTime desde, DateTime hasta);
        bool ProductoNuevo(Productos productos);
        bool Actualizar(Productos productos);
        bool Borrar(int cod);
       
        
    }
}
