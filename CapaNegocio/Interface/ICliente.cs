using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using CapaEntidad;
using System.Data;

namespace CapaNegocio.Interface
{
    interface ICliente
    {
        DataSet Listar();
        bool Agregar(Cliente cliente);
        bool Eliminar(String CodCliente);
        bool Actualizar(Cliente cliente);
        DataSet Buscar(String texto, string criterio);
        bool Login(Cliente cliente);
    }
}
