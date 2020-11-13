using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using CapaEntidad;
using System.Data;

namespace CapaNegocio.Interface
{
    interface IVendedor
    {
        DataSet Listar();
        bool Agregar(Vendedor vendedor);
        bool Eliminar(String CodVendedor);
        bool Actualizar(Vendedor vendedor);
        DataSet Buscar(String texto,string criterio);
        bool Login(Vendedor vendedor);
    }
}
