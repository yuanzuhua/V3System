//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using System.ComponentModel.DataAnnotations;

namespace Ap.Business.Domains
{
    using System;
    using System.Collections.Generic;
    
    public partial class WAMS_STOCKIN
    {
        [Key]
        public string vStockID { get; set; }
        public System.DateTime dStockInDate { get; set; }
        public Nullable<double> QtyOpenBal { get; set; }
        public Nullable<double> Received { get; set; }
        public Nullable<double> Issued { get; set; }
    }
}