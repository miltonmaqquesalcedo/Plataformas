using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CapaEntidad;
using System.Data;

using CapaDatos;

namespace CapaNegocio
{
    public class BoletaBL : Interface.IBoleta
    {
        private Datos datos = new DatosSQL();
        private string mensaje;
        public string Mensaje
        {
            get { return mensaje; }
        }

        public bool Actualizar(Boleta boleta)
        {
            DataRow fila = datos.TraerDataRow("spActualizarBoleta", boleta.NroBoleta, boleta.CodCliente,boleta.CodVendedor,boleta.Anulado);
            mensaje = fila["Mensaje"].ToString();
            byte codError = Convert.ToByte(fila["CodError"]);
            if (codError == 0) return true;
            else return false;
        }

        public bool Agregar(Boleta boleta)
        {
            DataRow fila = datos.TraerDataRow("spGenerarBoleta", boleta.NroBoleta, boleta.CodCliente, boleta.CodVendedor, boleta.Anulado);
            mensaje = fila["Mensaje"].ToString();
            byte codError = Convert.ToByte(fila["CodError"]);
            if (codError == 0) return true;
            else return false;
        }

        public DataSet Buscar(string texto, string criterio)
        {
            return datos.TraerDataSet("spBuscarBoleta", texto, criterio);
        }

        public bool Eliminar(string NroBoleta)
        {
            DataRow fila = datos.TraerDataRow("spEliminarBoleta", NroBoleta);
            byte codError = Convert.ToByte(fila["CodError"]);
            mensaje = fila["Mensaje"].ToString();
            if (codError == 0) return true;
            else return false;
        }

        public DataSet Listar()
        {
            return datos.TraerDataSet("spListarBoleta");
        }
    }
}
