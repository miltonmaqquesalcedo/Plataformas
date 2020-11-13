﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using CapaEntidad;
using System.Data;

namespace CapaNegocio.Interface
{
    interface ICategoria
    {
        DataSet Listar();
        bool Agregar(Categoria categoria);
        bool Eliminar(String CodCategoria);
        bool Actualizar(Categoria categoria);
        DataSet Buscar(String texto, string criterio);
    }
}
