//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using System.ComponentModel.DataAnnotations;

namespace ApBusiness.Domains
{
    using System;
    using System.Collections.Generic;
    
    public partial class WAMS_SERVICE
    {
        [Key]
        public long bServiceID { get; set; }
        public string vStockID { get; set; }
        public long bSupplierID { get; set; }
        public long bHourSpend { get; set; }
        public string vMaintenanceWorker { get; set; }
        public long bPrice { get; set; }
        public Nullable<long> bVAT { get; set; }
        public Nullable<double> fSubTotal { get; set; }
        public string vDescription { get; set; }
        public Nullable<long> bReturn { get; set; }
    }
}
