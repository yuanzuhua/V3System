﻿using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Ap.Common.Constants;
using NReco.PdfGenerator;
using log4net;
namespace Vivablast.Controllers
{
    public class HelperController : Controller
    {
        private static readonly ILog Log = LogManager.GetLogger(typeof(HelperController).FullName);

        //
        // GET: /Helper/

        public ActionResult PrintPdf(string content, string fileName, string voucher)
        {
            try
            {
                var temp = System.Net.WebUtility.HtmlDecode(content);
                //var htmlContent = String.Format("{0}", Content);
                var pdfDoc = new NReco.PdfGenerator.HtmlToPdfConverter
                {
                    Orientation = PageOrientation.Landscape,
                    Size = PageSize.A4
                };
                var pageMargins = new PageMargins {Bottom = 05, Left = 05, Right = 05, Top = 05}; //Margins in mm
                pdfDoc.Margins = pageMargins; //margins added to PDF.
                //pdfDoc.PageHeaderHtml = "PDF generated by .";
                pdfDoc.PageFooterHtml =
                    "<div style='float:right;'>  Page <span class='page'></span> of  <span class='topage'></span></div>";
                var pdfBytes = pdfDoc.GeneratePdf(temp);
                Log.Info("Loop complete.");
                Log.Error("Export PDF!", new Exception("Test"));
                return File(pdfBytes, "application/pdf", fileName + "_" + voucher + ".pdf");
            }
            catch (Exception e)
            {
                Log.Error("Export PDF!", e);
                return Json(new { result = Constants.UnSuccess });
            }
        }

        public ActionResult PrintPdfPortrait(string content, string fileName, string voucher)
        {
            try
            {
                var temp = System.Net.WebUtility.HtmlDecode(content);
                //var htmlContent = String.Format("{0}", Content);
                var pdfDoc = new NReco.PdfGenerator.HtmlToPdfConverter
                {
                    Orientation = PageOrientation.Portrait,
                    Size = PageSize.A4
                };
                var pageMargins = new PageMargins { Bottom = 05, Left = 10, Right = 10, Top = 05 }; //Margins in mm
                pdfDoc.Margins = pageMargins; //margins added to PDF.
                //pdfDoc.PageHeaderHtml = "PDF generated by .";
                pdfDoc.PageFooterHtml =
                    "<div style='float:right;'>  Page <span class='page'></span> of  <span class='topage'></span></div>";
                var pdfBytes = pdfDoc.GeneratePdf(temp);
                Log.Info("Loop complete.");
                Log.Error("Export PDF!", new Exception("Test"));
                return File(pdfBytes, "application/pdf", fileName + "_" + voucher + ".pdf");
            }
            catch (Exception e)
            {
                Log.Error("Export PDF!", e);
                return Json(new { result = Constants.UnSuccess });
            }
        }
    }
}
