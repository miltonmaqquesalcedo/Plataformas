﻿//------------------------------------------------------------------------------
// <auto-generated>
//     Este código fue generado por una herramienta.
//     Versión de runtime:4.0.30319.42000
//
//     Los cambios en este archivo podrían causar un comportamiento incorrecto y se perderán si
//     se vuelve a generar el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace CapaWeb.ServiceReferenceCategoria {
    using System.Data;
    
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ServiceModel.ServiceContractAttribute(ConfigurationName="ServiceReferenceCategoria.wsCategoriaSoap")]
    public interface wsCategoriaSoap {
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/Listar", ReplyAction="*")]
        [System.ServiceModel.XmlSerializerFormatAttribute(SupportFaults=true)]
        System.Data.DataSet Listar();
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/Listar", ReplyAction="*")]
        System.Threading.Tasks.Task<System.Data.DataSet> ListarAsync();
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/Agregar", ReplyAction="*")]
        [System.ServiceModel.XmlSerializerFormatAttribute(SupportFaults=true)]
        bool Agregar(string CodCategoria, string Nombre, string CategoriaPadre);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/Agregar", ReplyAction="*")]
        System.Threading.Tasks.Task<bool> AgregarAsync(string CodCategoria, string Nombre, string CategoriaPadre);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/Eliminar", ReplyAction="*")]
        [System.ServiceModel.XmlSerializerFormatAttribute(SupportFaults=true)]
        bool Eliminar(string CodCategoria);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/Eliminar", ReplyAction="*")]
        System.Threading.Tasks.Task<bool> EliminarAsync(string CodCategoria);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/Actualizar", ReplyAction="*")]
        [System.ServiceModel.XmlSerializerFormatAttribute(SupportFaults=true)]
        bool Actualizar(string CodCategoria, string Nombre, string CategoriaPadre);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/Actualizar", ReplyAction="*")]
        System.Threading.Tasks.Task<bool> ActualizarAsync(string CodCategoria, string Nombre, string CategoriaPadre);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/Buscar", ReplyAction="*")]
        [System.ServiceModel.XmlSerializerFormatAttribute(SupportFaults=true)]
        System.Data.DataSet Buscar(string texto, string Categoria);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/Buscar", ReplyAction="*")]
        System.Threading.Tasks.Task<System.Data.DataSet> BuscarAsync(string texto, string Categoria);
    }
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public interface wsCategoriaSoapChannel : CapaWeb.ServiceReferenceCategoria.wsCategoriaSoap, System.ServiceModel.IClientChannel {
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public partial class wsCategoriaSoapClient : System.ServiceModel.ClientBase<CapaWeb.ServiceReferenceCategoria.wsCategoriaSoap>, CapaWeb.ServiceReferenceCategoria.wsCategoriaSoap {
        
        public wsCategoriaSoapClient() {
        }
        
        public wsCategoriaSoapClient(string endpointConfigurationName) : 
                base(endpointConfigurationName) {
        }
        
        public wsCategoriaSoapClient(string endpointConfigurationName, string remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public wsCategoriaSoapClient(string endpointConfigurationName, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public wsCategoriaSoapClient(System.ServiceModel.Channels.Binding binding, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(binding, remoteAddress) {
        }
        
        public System.Data.DataSet Listar() {
            return base.Channel.Listar();
        }
        
        public System.Threading.Tasks.Task<System.Data.DataSet> ListarAsync() {
            return base.Channel.ListarAsync();
        }
        
        public bool Agregar(string CodCategoria, string Nombre, string CategoriaPadre) {
            return base.Channel.Agregar(CodCategoria, Nombre, CategoriaPadre);
        }
        
        public System.Threading.Tasks.Task<bool> AgregarAsync(string CodCategoria, string Nombre, string CategoriaPadre) {
            return base.Channel.AgregarAsync(CodCategoria, Nombre, CategoriaPadre);
        }
        
        public bool Eliminar(string CodCategoria) {
            return base.Channel.Eliminar(CodCategoria);
        }
        
        public System.Threading.Tasks.Task<bool> EliminarAsync(string CodCategoria) {
            return base.Channel.EliminarAsync(CodCategoria);
        }
        
        public bool Actualizar(string CodCategoria, string Nombre, string CategoriaPadre) {
            return base.Channel.Actualizar(CodCategoria, Nombre, CategoriaPadre);
        }
        
        public System.Threading.Tasks.Task<bool> ActualizarAsync(string CodCategoria, string Nombre, string CategoriaPadre) {
            return base.Channel.ActualizarAsync(CodCategoria, Nombre, CategoriaPadre);
        }
        
        public System.Data.DataSet Buscar(string texto, string Categoria) {
            return base.Channel.Buscar(texto, Categoria);
        }
        
        public System.Threading.Tasks.Task<System.Data.DataSet> BuscarAsync(string texto, string Categoria) {
            return base.Channel.BuscarAsync(texto, Categoria);
        }
    }
}