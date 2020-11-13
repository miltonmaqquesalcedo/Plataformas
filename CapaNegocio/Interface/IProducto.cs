using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using CapaEntidad;
using System.Data;

namespace CapaNegocio.Interface
{
    interface IProducto
    {
        DataSet Listar();
        bool Agregar(Producto producto);
        bool Eliminar(String CodProducto);
        bool Actualizar(Producto producto);
        DataSet Buscar(String texto, string criterio);
    }
}
