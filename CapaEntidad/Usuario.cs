using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.Runtime.Serialization;

namespace CapaEntidad
{
    [DataContract]
    public class Usuario
    {
        [DataMember]
        public string _Usuario
        { get; set; }
        [DataMember]
        public string _Contrasena
        { get; set; }

        [DataMember]
        public string _Nueva
        { get; set; }
    }
}
