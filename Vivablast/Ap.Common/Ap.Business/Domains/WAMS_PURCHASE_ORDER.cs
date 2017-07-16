//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using System.ComponentModel.DataAnnotations;
using Ap.Data.Entities;

namespace Ap.Business.Domains
{
    using System;
    using System.Collections.Generic;
    
    public partial class WAMS_PURCHASE_ORDER: BaseEntity
    {
        [Key]
        public int Id { get; set; }
        public string vPOID { get; set; }
        public int? vProjectID { get; set; }
        public int bSupplierID { get; set; }
        public int? bPOTypeID { get; set; }
        public int? bCurrencyTypeID { get; set; }
        public System.DateTime dPODate { get; set; }
        public decimal? fPOTotal { get; set; }
        public string vRemark { get; set; }
        public string vPriceEval { get; set; }
        public string vQuanlityEval { get; set; }
        public string vDeliveryEval { get; set; }
        public string vConformancyToV3Eval { get; set; }
        public string vFromCC { get; set; }
        public string vFromContact { get; set; }
        public string vFromTel { get; set; }
        public string vFromFax { get; set; }
        public string vTermOfPayment { get; set; }
        public bool? iEnable { get; set; }
        public int? iExample { get; set; }
        public string vPOStatus { get; set; }
        public string vLocation { get; set; }
        public DateTime? dDeliverDate { get; set; }
        public string Address { get; set; }
        public string TaxCode { get; set; }
        public string PeStaff { get; set; }
        public string CoRegNo { get; set; }
        public string GSTRegNo { get; set; }
        public string PengerangSite { get; set; }
        public string GSTAddress { get; set; }
        public int? iStore { get; set; }
        public int? iPayment { get; set; }
        public DateTime? dCreated { get; set; }
        public DateTime? dModified { get; set; }
        public int? iCreated { get; set; }
        public int? iModified { get; set; }
        public byte[] Timestamp { get; set; }
    
        public virtual WAMS_CURRENCY_TYPE WAMS_CURRENCY_TYPE { get; set; }
        public virtual WAMS_PO_TYPE WAMS_PO_TYPE { get; set; }
        public virtual WAMS_SUPPLIER WAMS_SUPPLIER { get; set; }
    }
}