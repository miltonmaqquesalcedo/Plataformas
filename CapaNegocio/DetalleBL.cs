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
    public class DetalleBL : Interface.IDetalle
    {
        private Datos datos = new DatosSQL();
        private string mensaje;
        public string Mensaje
        {
            get { return mensaje; }
        }

        public bool Actualizar(Detalle detalle)
        {
            DataRow fila = datos.TraerDataRow("spActualizarDetalle", detalle.NroBoleta,detalle.CodProducto,detalle.Cantidad);
            mensaje = fila["Mensaje"].ToString();
            byte codError = Convert.ToByte(fila["CodError"]);
            if (codError == 0) return true;
            else return false;
        }

        public bool Agregar(Detalle detalle)
        {
            DataRow fila = datos.TraerDataRow("spAgregarDetalle", detalle.NroBoleta, detalle.CodProducto, detalle.Cantidad);
            mensaje = fila["Mensaje"].ToString();
            byte codError = Convert.ToByte(fila["CodError"]);
            if (codError == 0) return true;
            else return false;
        }

        public DataSet Buscar(string texto, string criterio)
        {
            return datos.TraerDataSet("spBuscarDetalle", texto, criterio);
        }

        public bool Eliminar(string NroBoleta, string CodProducto)
        {
            DataRow fila = datos.TraerDataRow("spEliminarDetalle", NroBoleta, CodProducto);
            byte codError = Convert.ToByte(fila["CodError"]);
            mensaje = fila["Mensaje"].ToString();
            if (codError == 0) return true;
            else return false;
        }

        public DataSet Listar()
        {
            return datos.TraerDataSet("spListarDetalle");
        }
    }
}
