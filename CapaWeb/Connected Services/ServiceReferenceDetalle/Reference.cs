﻿//------------------------------------------------------------------------------
// <auto-generated>
//     Este código fue generado por una herramienta.
//     Versión de runtime:4.0.30319.42000
//
//     Los cambios en este archivo podrían causar un comportamiento incorrecto y se perderán si
//     se vuelve a generar el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace CapaWeb.ServiceReferenceDetalle {
    using System.Data;
    
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ServiceModel.ServiceContractAttribute(ConfigurationName="ServiceReferenceDetalle.wsDetalleSoap")]
    public interface wsDetalleSoap {
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/Listar", ReplyAction="*")]
        [System.ServiceModel.XmlSerializerFormatAttribute(SupportFaults=true)]
        System.Data.DataSet Listar();
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/Listar", ReplyAction="*")]
        System.Threading.Tasks.Task<System.Data.DataSet> ListarAsync();
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/Agregar", ReplyAction="*")]
        [System.ServiceModel.XmlSerializerFormatAttribute(SupportFaults=true)]
        bool Agregar(string NroBoleta, string CodProducto, int Cantidad);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/Agregar", ReplyAction="*")]
        System.Threading.Tasks.Task<bool> AgregarAsync(string NroBoleta, string CodProducto, int Cantidad);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/Eliminar", ReplyAction="*")]
        [System.ServiceModel.XmlSerializerFormatAttribute(SupportFaults=true)]
        bool Eliminar(string CodCategoria, string CodProducto);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/Eliminar", ReplyAction="*")]
        System.Threading.Tasks.Task<bool> EliminarAsync(string CodCategoria, string CodProducto);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/Actualizar", ReplyAction="*")]
        [System.ServiceModel.XmlSerializerFormatAttribute(SupportFaults=true)]
        bool Actualizar(string NroBoleta, string CodProducto, int Cantidad);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/Actualizar", ReplyAction="*")]
        System.Threading.Tasks.Task<bool> ActualizarAsync(string NroBoleta, string CodProducto, int Cantidad);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/Buscar", ReplyAction="*")]
        [System.ServiceModel.XmlSerializerFormatAttribute(SupportFaults=true)]
        System.Data.DataSet Buscar(string texto, string Categoria);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/Buscar", ReplyAction="*")]
        System.Threading.Tasks.Task<System.Data.DataSet> BuscarAsync(string texto, string Categoria);
    }
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public interface wsDetalleSoapChannel : CapaWeb.ServiceReferenceDetalle.wsDetalleSoap, System.ServiceModel.IClientChannel {
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public partial class wsDetalleSoapClient : System.ServiceModel.ClientBase<CapaWeb.ServiceReferenceDetalle.wsDetalleSoap>, CapaWeb.ServiceReferenceDetalle.wsDetalleSoap {
        
        public wsDetalleSoapClient() {
        }
        
        public wsDetalleSoapClient(string endpointConfigurationName) : 
                base(endpointConfigurationName) {
        }
        
        public wsDetalleSoapClient(string endpointConfigurationName, string remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public wsDetalleSoapClient(string endpointConfigurationName, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public wsDetalleSoapClient(System.ServiceModel.Channels.Binding binding, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(binding, remoteAddress) {
        }
        
        public System.Data.DataSet Listar() {
            return base.Channel.Listar();
        }
        
        public System.Threading.Tasks.Task<System.Data.DataSet> ListarAsync() {
            return base.Channel.ListarAsync();
        }
        
        public bool Agregar(string NroBoleta, string CodProducto, int Cantidad) {
            return base.Channel.Agregar(NroBoleta, CodProducto, Cantidad);
        }
        
        public System.Threading.Tasks.Task<bool> AgregarAsync(string NroBoleta, string CodProducto, int Cantidad) {
            return base.Channel.AgregarAsync(NroBoleta, CodProducto, Cantidad);
        }
        
        public bool Eliminar(string CodCategoria, string CodProducto) {
            return base.Channel.Eliminar(CodCategoria, CodProducto);
        }
        
        public System.Threading.Tasks.Task<bool> EliminarAsync(string CodCategoria, string CodProducto) {
            return base.Channel.EliminarAsync(CodCategoria, CodProducto);
        }
        
        public bool Actualizar(string NroBoleta, string CodProducto, int Cantidad) {
            return base.Channel.Actualizar(NroBoleta, CodProducto, Cantidad);
        }
        
        public System.Threading.Tasks.Task<bool> ActualizarAsync(string NroBoleta, string CodProducto, int Cantidad) {
            return base.Channel.ActualizarAsync(NroBoleta, CodProducto, Cantidad);
        }
        
        public System.Data.DataSet Buscar(string texto, string Categoria) {
            return base.Channel.Buscar(texto, Categoria);
        }
        
        public System.Threading.Tasks.Task<System.Data.DataSet> BuscarAsync(string texto, string Categoria) {
            return base.Channel.BuscarAsync(texto, Categoria);
        }
    }
}