﻿//------------------------------------------------------------------------------
// <auto-generated>
//     Este código fue generado por una herramienta.
//     Versión de runtime:4.0.30319.42000
//
//     Los cambios en este archivo podrían causar un comportamiento incorrecto y se perderán si
//     se vuelve a generar el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace CapaWeb.ServiceReferenceBoleta {
    using System.Data;
    
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ServiceModel.ServiceContractAttribute(ConfigurationName="ServiceReferenceBoleta.wsBoletaSoap")]
    public interface wsBoletaSoap {
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/Listar", ReplyAction="*")]
        [System.ServiceModel.XmlSerializerFormatAttribute(SupportFaults=true)]
        System.Data.DataSet Listar();
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/Listar", ReplyAction="*")]
        System.Threading.Tasks.Task<System.Data.DataSet> ListarAsync();
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/Agregar", ReplyAction="*")]
        [System.ServiceModel.XmlSerializerFormatAttribute(SupportFaults=true)]
        bool Agregar(string NroBoleta, string CodCliente, string CodVendedor, int Anulado);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/Agregar", ReplyAction="*")]
        System.Threading.Tasks.Task<bool> AgregarAsync(string NroBoleta, string CodCliente, string CodVendedor, int Anulado);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/Eliminar", ReplyAction="*")]
        [System.ServiceModel.XmlSerializerFormatAttribute(SupportFaults=true)]
        bool Eliminar(string NroBoleta);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/Eliminar", ReplyAction="*")]
        System.Threading.Tasks.Task<bool> EliminarAsync(string NroBoleta);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/Actualizar", ReplyAction="*")]
        [System.ServiceModel.XmlSerializerFormatAttribute(SupportFaults=true)]
        bool Actualizar(string NroBoleta, string CodCliente, string CodVendedor, int Anulado);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/Actualizar", ReplyAction="*")]
        System.Threading.Tasks.Task<bool> ActualizarAsync(string NroBoleta, string CodCliente, string CodVendedor, int Anulado);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/Buscar", ReplyAction="*")]
        [System.ServiceModel.XmlSerializerFormatAttribute(SupportFaults=true)]
        System.Data.DataSet Buscar(string texto, string Categoria);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/Buscar", ReplyAction="*")]
        System.Threading.Tasks.Task<System.Data.DataSet> BuscarAsync(string texto, string Categoria);
    }
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public interface wsBoletaSoapChannel : CapaWeb.ServiceReferenceBoleta.wsBoletaSoap, System.ServiceModel.IClientChannel {
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public partial class wsBoletaSoapClient : System.ServiceModel.ClientBase<CapaWeb.ServiceReferenceBoleta.wsBoletaSoap>, CapaWeb.ServiceReferenceBoleta.wsBoletaSoap {
        
        public wsBoletaSoapClient() {
        }
        
        public wsBoletaSoapClient(string endpointConfigurationName) : 
                base(endpointConfigurationName) {
        }
        
        public wsBoletaSoapClient(string endpointConfigurationName, string remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public wsBoletaSoapClient(string endpointConfigurationName, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public wsBoletaSoapClient(System.ServiceModel.Channels.Binding binding, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(binding, remoteAddress) {
        }
        
        public System.Data.DataSet Listar() {
            return base.Channel.Listar();
        }
        
        public System.Threading.Tasks.Task<System.Data.DataSet> ListarAsync() {
            return base.Channel.ListarAsync();
        }
        
        public bool Agregar(string NroBoleta, string CodCliente, string CodVendedor, int Anulado) {
            return base.Channel.Agregar(NroBoleta, CodCliente, CodVendedor, Anulado);
        }
        
        public System.Threading.Tasks.Task<bool> AgregarAsync(string NroBoleta, string CodCliente, string CodVendedor, int Anulado) {
            return base.Channel.AgregarAsync(NroBoleta, CodCliente, CodVendedor, Anulado);
        }
        
        public bool Eliminar(string NroBoleta) {
            return base.Channel.Eliminar(NroBoleta);
        }
        
        public System.Threading.Tasks.Task<bool> EliminarAsync(string NroBoleta) {
            return base.Channel.EliminarAsync(NroBoleta);
        }
        
        public bool Actualizar(string NroBoleta, string CodCliente, string CodVendedor, int Anulado) {
            return base.Channel.Actualizar(NroBoleta, CodCliente, CodVendedor, Anulado);
        }
        
        public System.Threading.Tasks.Task<bool> ActualizarAsync(string NroBoleta, string CodCliente, string CodVendedor, int Anulado) {
            return base.Channel.ActualizarAsync(NroBoleta, CodCliente, CodVendedor, Anulado);
        }
        
        public System.Data.DataSet Buscar(string texto, string Categoria) {
            return base.Channel.Buscar(texto, Categoria);
        }
        
        public System.Threading.Tasks.Task<System.Data.DataSet> BuscarAsync(string texto, string Categoria) {
            return base.Channel.BuscarAsync(texto, Categoria);
        }
    }
}