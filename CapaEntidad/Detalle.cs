using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.Runtime.Serialization;

namespace CapaEntidad
{
    [DataContract]
    public class Detalle
    {
        [DataMember]
        public string NroBoleta
        { get; set; }
        [DataMember]
        public string CodProducto
        { get; set; }
        [DataMember]
        public int Cantidad
        { get; set; }
       
    }
}
