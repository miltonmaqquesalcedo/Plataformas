using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using CapaEntidad;
using System.Data;

namespace CapaNegocio.Interface
{
    interface IDetalle
    {
        DataSet Listar();
        bool Agregar(Detalle detalle);
        bool Eliminar(String NroBoleta, String CodProducto);
        bool Actualizar(Detalle detalle);
        DataSet Buscar(String texto, string criterio);
    }
}
