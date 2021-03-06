﻿using System.Collections.Generic;
using System.Data.Entity.Core.Objects;
using Ap.Business.Domains;
using Ap.Business.ViewModels;
using Vivablast.Models;

namespace Ap.Business.Seedworks
{
    public interface IStockRepository
    {
        XStockViewModel StockViewModelFilter(int page, int size, string stockCode, string stockName, string store, int type, int category, string enable);

        XStockViewModel StockAndServiceViewModelFilter(int page, int size, string stockCode, string stockName, string store, int type, int category, string enable);

        XStockViewModel ProductPeViewModelFilter(int page, int size, string stockCode, string stockName, string store, int type, int category, string enable, int supplier);

        //int ListConditionCount(int page, int size, string stockCode, string stockName, string store, int type, int category, string enable);

        IList<V3_List_Stock> PeListCondition(int page, int size, string stockCode, string stockName, string store, int type, int category, string enable, int supplier);

        int PeListConditionCount(int page, int size, string stockCode, string stockName, string store, int type, int category, string enable, int supplier);

        IList<V3_List_Stock> StockInListCondition(int page, int size, string stockCode, string stockName, string store, int type, int category, string enable, int pe);

        int StockInListConditionCount(int page, int size, string stockCode, string stockName, string store, int type, int category, string enable, int pe);

        IList<V3_List_Stock> StockOutListCondition(int page, int size, string stockCode, string stockName, int store, int type, int category);

        int StockOutListConditionCount(int page, int size, string stockCode, string stockName, int store, int type, int category);

        IList<V3_List_Stock> StockReturnListCondition(int page, int size, string stockCode, string stockName, int project, int type, int category);

        int StockReturnListConditionCount(int page, int size, string stockCode, string stockName, int project, int type, int category);

        IList<string> ListCode(string condition);

        IList<string> ListName(string condition);

        int CheckDelete(int id);

        int Delete(int id);

        IList<V3_Stock_Quantity_Management_Result> ListStockQuantity(int page, int size, string stockCode, string stockName, string store, int type, int category, string fd, string td, string enable);

        int ListStockQuantityCount(int page, int size, string stockCode, string stockName, string store, int type, int category, string fd, string td, string enable);

        string NewStockCode(int type, int category);
    }
}
