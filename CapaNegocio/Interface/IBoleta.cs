using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using CapaEntidad;
using System.Data;

namespace CapaNegocio.Interface
{
    interface IBoleta
    {
        DataSet Listar();
        bool Agregar(Boleta boleta);
        bool Eliminar(String NroBoleta);
        bool Actualizar(Boleta boleta);
        DataSet Buscar(String texto, string criterio);
        DataSet ListarBoleta(string NroBoleta);
        DataSet ListarDetalle(string NroBoleta);
    }
}
