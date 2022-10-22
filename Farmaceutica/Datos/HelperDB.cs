using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Farmaceutica.Datos
{
    internal class HelperDB
    {
        private static HelperDB instancia;
        private SqlConnection conexion;
        public HelperDB()
        {
            conexion = new SqlConnection(@"Data Source=localhost;Initial Catalog=FARMACEUTICA;Integrated Security=True");
        }
        public static HelperDB ObtenerInstancia()
        {
            if (instancia == null)
                instancia = new HelperDB();
                return instancia;
        }
        public DataTable ConsultaSQL(string nombreSP,List<Parametro> valores)
        {
            DataTable tabla = new DataTable();
            conexion.Open();
            SqlCommand cmd = new SqlCommand(nombreSP,conexion);
            cmd.CommandType = CommandType.StoredProcedure;
            if(valores != null)
                foreach(Parametro p in valores)
                {
                    cmd.Parameters.Add(p);
                }
            tabla.Load(cmd.ExecuteReader());
            conexion.Close();
            return tabla;
        }

        public int ConsultarEscalarSalida(string nombreSP,string paramSalida)
        {
            conexion.Open();
            SqlCommand cmd = new SqlCommand(nombreSP, conexion);
            cmd.CommandType=CommandType.StoredProcedure;
            SqlParameter pSalida=new SqlParameter();
            pSalida.ParameterName = paramSalida;
            pSalida.DbType = DbType.Int32;
            pSalida.Direction = ParameterDirection.Output;
            cmd.Parameters.Add(pSalida);
            conexion.Close();
            return (int)pSalida.Value;
        }
    }
}
