﻿using System.Collections;
using System.Collections.Generic;
using Ap.Business.Seedworks;
using Ap.Business.ViewModels;
using Ap.Data.Repositories;
using Ap.Data.Seedworks;
using Dapper;
using System.Data;
using System.Linq;
using Vivablast.Models;

namespace Ap.Business.Repositories
{
    public class PeRepository : BaseRepository, IPeRepository
    {
        public PeRepository(IDatabaseFactory databaseFactory, IDbContext dbContext)
            : base(databaseFactory, dbContext)
        {

        }

        public V3_PE_PDF GetByPEPDF(int id)
        {
            var sql = GetSqlConnection();
            var result = sql.Query<V3_PE_PDF>("dbo.V3_PE_PDF", new
            {
                id
            },
                                         commandType: CommandType.StoredProcedure).FirstOrDefault();

            sql.Close();
            return result;
        }

        public PeViewModel ListCondition(int page, int size, int store, int potype, string po, string status, string mrf, int supplier, int project, string stockCode, string stockName, string fd, string td, string enable)
        {
            var model = new PeViewModel();
            var paramss = new DynamicParameters();
            paramss.Add("page", page);
            paramss.Add("size", size);
            paramss.Add("store", store);
            paramss.Add("potype", potype);
            paramss.Add("po", po);
            paramss.Add("status", status);
            paramss.Add("mrf", mrf);
            paramss.Add("supplier", supplier);
            paramss.Add("project", project);
            paramss.Add("stockCode", stockCode);
            paramss.Add("stockName", stockName);
            paramss.Add("fd", fd);
            paramss.Add("td", td);
            paramss.Add("enable", enable);
            paramss.Add("out", dbType: DbType.Int32, direction: ParameterDirection.Output);

            using (var sql = GetSqlConnection())
            {
                var data = sql.Query<V3_List_PO>("V3_List_PO", paramss, commandType: CommandType.StoredProcedure);
                sql.Close();
                model.PoGetListResults = data.ToList();
                var total = paramss.Get<int>("out");
                model.TotalRecords = total;
            }
            return model;
        }

        public List<V3_Pe_Detail> ListConditionDetail(int id, string enable)
        {
            var sql = GetSqlConnection();
            var result = sql.Query<V3_Pe_Detail>("dbo.V3_PeDetail", new
            {
                id,
                enable
            },
            commandType: CommandType.StoredProcedure).ToList();

            sql.Close();
            return result.Any() ? result : new List<V3_Pe_Detail>();
        }

        public IList<V3_Pe_Detail> ListConditionDetailExcel(int page, int size, int store, int potype, string po, string status, string mrf, int supplier, int project, string stockCode, string stockName, string fd, string td, string enable)
        {
            var sql = GetSqlConnection();
            var result = sql.Query<V3_Pe_Detail>("dbo.V3_List_Pe_Detail", new
            {
                page,
                size,
                store,
                potype,
                po,
                status,
                mrf,
                supplier,
                project,
                stockCode,
                stockName,
                fd,
                td,
                enable
            },
            commandType: CommandType.StoredProcedure).ToList();

            sql.Close();
            return result.Any() ? result : new List<V3_Pe_Detail>();
        }

        public V3_PE_Information GetPeInformation(int id)
        {
            var sql = GetSqlConnection();
            var result = sql.Query<V3_PE_Information>("dbo.V3_PE_Information", new
            {
                id
            },
            commandType: CommandType.StoredProcedure).FirstOrDefault();

            sql.Close();
            return result;
        }

        public IList<string> ListCode(string condition)
        {
            if (string.IsNullOrEmpty(condition))
            {
                return null;
            }

            var sql = GetSqlConnection();
            var result = sql.Query<string>("V3_PeGetListCode", new
            {
                condition
            },
                                           commandType: CommandType.StoredProcedure).ToList();

            sql.Close();

            if (result.Any()) return result;
            var a = new List<string>();
            return a;
        }

        public IList<string> ListPayment(string condition)
        {
            if (string.IsNullOrEmpty(condition))
            {
                return null;
            }

            var sql = GetSqlConnection();
            var result = sql.Query<string>("V3_ListPayment", new
            {
                condition
            },
                                           commandType: CommandType.StoredProcedure).ToList();

            sql.Close();

            if (result.Any()) return result;
            var a = new List<string>();
            return a;
        }

        public V3_GetPoId_Lastest PoLastest(string condition)
        {
            var sql = GetSqlConnection();
            var result = sql.Query<V3_GetPoId_Lastest>("dbo.V3_GetPoId_Lastest", new
            {
                condition
            },
            commandType: CommandType.StoredProcedure).FirstOrDefault();

            sql.Close();
            return result ?? (new V3_GetPoId_Lastest());
        }

        public int CheckDelete(int id)
        {
            var sql = GetSqlConnection();
            var result = sql.Query<int>("V3_CheckDelete_Pe", new
            {
                id
            },
                                           commandType: CommandType.StoredProcedure).SingleOrDefault();

            sql.Close();

            return result;
        }

        public int Delete(int id)
        {
            var sql = GetSqlConnection();
            var result = sql.Query<int>("V3_Delete_Pe", new
            {
                id
            },
                                           commandType: CommandType.StoredProcedure).SingleOrDefault();

            sql.Close();

            return result;
        }

        public int DeleteDetail(int id)
        {
            var sql = GetSqlConnection();
            var result = sql.Query<int>("V3_Delete_PE_Detail", new
            {
                id
            },
                                           commandType: CommandType.StoredProcedure).SingleOrDefault();

            sql.Close();

            return result;
        }

        public int UpdateRequisition(int mrf, int stock, decimal quantity)
        {
            var sql = GetSqlConnection();
            var result = sql.Query<int>("V3_PE_Update_Requisition", new
            {
                mrf,
                stock,
                quantity
            },
                                           commandType: CommandType.StoredProcedure).SingleOrDefault();

            sql.Close();
            return result;
        }

        public int UpdatePeTotal(int id)
        {
            var sql = GetSqlConnection();
            var result = sql.Query<int>("V3_PE_Update_Total", new
            {
                id
            },
                                           commandType: CommandType.StoredProcedure).SingleOrDefault();

            sql.Close();
            return result;
        }

        public int UpdatePaymentType(string payment)
        {
            var sql = GetSqlConnection();
            var result = sql.Query<int>("V3_DataPaymentType", new
            {
                payment
            },
                                           commandType: CommandType.StoredProcedure).SingleOrDefault();

            sql.Close();
            return result;
        }
    }
}
