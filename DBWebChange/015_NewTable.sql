/****** Object:  Table [dbo].[XStock]    Script Date: 08/02/2016 09:50:28 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[XStock]') AND type in (N'U'))
DROP TABLE [dbo].[XStock]
GO

/****** Object:  Table [dbo].[XStock]    Script Date: 08/02/2016 09:50:28 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[XStock](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StockId] INT NOT NULL,
	[StockCode] [nvarchar](16) NOT NULL,
	[vStockName] [nvarchar](2000) NOT NULL,
	[vRemark] [nvarchar](1024) NULL,
	[bUnitID] [int] NULL,
	[Unit] [nvarchar] (16) NULL,
	[bMeasurementID] [bigint] NULL,
	[vBrand] [nvarchar](128) NULL,
	[iEnable] [bit] NULL,
	[bCategoryID] [int] NULL,
	[Category] [nvarchar] (64) NULL,
	[bPositionID] [int] NULL,
	[Position] [nvarchar] (64) NULL,
	[bLabelID] [int] NULL,
	[Label] [nvarchar] (64) NULL,
	[bWeight] [float] NULL,
	[vAccountCode] [nvarchar](20) NULL,
	[iType] [int] NULL,
	[Type] [nvarchar] (64) NULL,
	[PartNo] [nvarchar](50) NULL,
	[PartNoFor] [nvarchar](64) NULL,
	[PartNoMiniQty] [int] NULL,
	[RalNo] [nvarchar](50) NULL,
	[ColorName] [nvarchar](64) NULL,
	[SubCategory] [int] NULL,
	[UserForPaint] [int] NULL,
	[dCreated] [datetime] NULL,
	[dModified] [datetime] NULL,
	[iCreated] [int] NULL,
	[Created] [nvarchar] (500) NULL,
	[iModified] [int] NULL,
	[Modified] [nvarchar] (500) NULL,
	[Timestamp] [timestamp] NOT NULL
 CONSTRAINT [PK_XStock] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT INTO [dbo].[XStock]
           ([StockId]
           ,[StockCode]
           ,[vStockName]
           ,[vRemark]
           ,[bUnitID]
           ,[Unit]
           ,[bMeasurementID]
           ,[vBrand]
           ,[iEnable]
           ,[bCategoryID]
           ,[Category]
           ,[bPositionID]
           ,[Position]
           ,[bLabelID]
           ,[Label]
           ,[bWeight]
           ,[vAccountCode]
           ,[iType]
           ,[Type]
           ,[PartNo]
           ,[PartNoFor]
           ,[PartNoMiniQty]
           ,[RalNo]
           ,[ColorName]
           ,[SubCategory]
           ,[UserForPaint]
           ,[dCreated]
           ,[dModified]
           ,[iCreated]
           ,[Created]
           ,[iModified]
           ,[Modified])
      SELECT stock.Id 
		,stock.vStockID
		,stock.vStockName
		,stock.vRemark
      ,stock.[bUnitID]
      ,unit.vUnitName [Unit]
      ,stock.[bMeasurementID]
      ,stock.[vBrand]
      ,stock.[iEnable]
      ,stock.[bCategoryID]
      ,cate.vCategoryName [Category]
      ,stock.[bPositionID]
      ,stock.[Position]
      ,stock.[bLabelID]
      ,label.vLabelName [Label]
      ,stock.[bWeight]
      ,stock.[vAccountCode]
      ,stock.[iType]
      ,stype.TypeName [Type]
      ,stock.[PartNo]
      ,stock.[PartNoFor]
      ,stock.[PartNoMiniQty]
      ,stock.[RalNo]
      ,stock.[ColorName]
      ,stock.[SubCategory]
      ,stock.[UserForPaint]
      ,stock.[dCreated]
      ,stock.[dModified]
      ,stock.[iCreated]
      ,usc.NameUser
      ,stock.[iModified]
      ,usm.NameUser
		FROM [dbo].[WAMS_STOCK] stock (NOLOCK)
		LEFT JOIN [dbo].[WAMS_STOCK_TYPE] stype (NOLOCK) ON stock.iType = stype.Id
		LEFT JOIN [dbo].[WAMS_UNIT] unit (NOLOCK) ON stock.bUnitID = unit.bUnitID
		LEFT JOIN [dbo].[WAMS_CATEGORY] cate (NOLOCK) ON stock.bCategoryID = cate.bCategoryID
		LEFT JOIN dbo.WAMS_LABELS label (NOLOCK) ON label.bLabelID = stock.bLabelID     
	   CROSS APPLY [dbo].[udf_GetUserName](stock.iCreated) AS usc
	   CROSS APPLY [dbo].[udf_GetUserName](stock.iModified) AS usm

GO
GO

/****** Object:  Table [dbo].[XDynamicProjectGroupItemReport]    Script Date: 08/02/2016 11:59:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[XDynamicProjectGroupItemReport]') AND type in (N'U'))
DROP TABLE [dbo].[XDynamicProjectGroupItemReport]
GO

/****** Object:  Table [dbo].[XDynamicProjectGroupItemReport]    Script Date: 08/02/2016 11:59:31 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[XDynamicProjectGroupItemReport](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StockId] [int] NULL,
	[StockCode] [nvarchar](16) NULL,
	[StockName] [nvarchar](2000) NULL,
	[StockTypeId] [int] NULL,
	[StockType] [nvarchar](250) NULL,
	[CategoryId] [int] NULL,
	[Category] [nvarchar](64) NULL,
	[UnitId] [int] NULL,
	[Unit] [nvarchar](64) NULL,
	[QtyStockIn] [decimal](18, 2) NULL,
	[QtyStockReturn] [decimal](18, 2) NULL,
	[QtyStockOut] [decimal](18, 2) NULL,
	[QtyStockRemaining] [decimal](18, 2) NULL,
	[Weight] [nvarchar](20) NULL,
	[Note] [nvarchar](max) NULL,
	[Created] [datetime] NULL,
	[Modified] [datetime] NULL,
	[CreatedById] INT NULL,
	[CreatedBy] [nvarchar](500) NULL,
	[ModifiedById] INT NULL,
	[ModifiedBy] [nvarchar](500) NULL,
	[FagFrom] [nvarchar](10) NULL,
	[FagId] [int] NULL,
 CONSTRAINT [PK_XDynamicProjectGroupItemReport] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT INTO [V3].[dbo].[XDynamicProjectGroupItemReport]
           ([StockId]
           ,[StockCode]
           ,[StockName]
           ,[StockTypeId]
           ,[StockType]
           ,[CategoryId]
           ,[Category]
           ,[UnitId]
           ,[Unit]
           ,[QtyStockIn]
           ,[QtyStockReturn]
           ,[QtyStockOut]
           ,[QtyStockRemaining]
           ,[Weight]
           ,[Note]
           ,[Created]
           ,[Modified]
           ,[CreatedById]
           ,[CreatedBy]
           ,[ModifiedById]
           ,[ModifiedBy]
           ,[FagFrom]
           ,[FagId])
SELECT
stock.StockId, 
stock.StockCode,
stock.vStockName,
stock.iType,
stock.[Type] [StockType],
stock.bCategoryID,
stock.Category,
stock.bUnitID,
stock.Unit,
(select case when stockin.StockinQty is null then 0 else stockin.StockinQty end) [QtyStockIn], 
(select case when returnlist.ReturnedQty is null then 0 else returnlist.ReturnedQty end) [QtyStockReturn], 
(select case when assign.AssignedQty is null then 0 else assign.AssignedQty end) [QtyStockOut], 
(select case when storeQuantity.RemainingQty is null then 0 else storeQuantity.RemainingQty end) [QtyStockRemaining], 
--(select case when stock.bQuantity is null then 0 else stock.bQuantity end) as 'bRemaining' ,
stock.bWeight
,NULL
,GETDATE()
,GETDATE()
,NULL
,NULL
,NULL
,NULL
,NULL
,NULL
FROM XStock stock	
LEFT JOIN
(SELECT vStockID,sum(dReceivedQuantity) [StockinQty] 
FROM WAMS_FULFILLMENT_DETAIL 
--WHERE dStockInDate >=@dFrom and dStockInDate < @dTo 
GROUP BY vStockID) AS stockin ON stockin.vStockId = stock.StockId 
LEFT JOIN
(SELECT vStockID,sum(bQuantity) [AssignedQty] 
FROM WAMS_ASSIGNNING_STOCKS 
--WHERE dDateAssign >=@dFrom and dDateAssign < @dTo 
GROUP BY vStockId) AS assign ON assign.vStockId = stock.StockId
LEFT JOIN
(SELECT vStockID,sum(bQuantity) [ReturnedQty] 
FROM WAMS_RETURN_LIST 
	 --WHERE dDateReturn >=@dFrom and dDateReturn < @dTo 
GROUP BY vStockId) AS returnlist ON returnlist.vStockId = stock.StockId
LEFT JOIN (SELECT StockID, sum(Quantity) [RemainingQty] 
			 FROM [dbo].[Store_Stock] t1 (NOLOCK)
			GROUP BY StockID) AS storeQuantity ON storeQuantity.StockID= stock.StockId
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[XUser]') AND type in (N'U'))
DROP TABLE [dbo].[XUser]
GO
CREATE TABLE [dbo].[XUser](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](500) NOT NULL,
	[Password] [varchar](64) NOT NULL,
	[FirstName] [nvarchar](64) NULL,
	[LastName] [nvarchar](64) NULL,
	[DepartmentId] [int] NULL,
	[Department] [nvarchar](64) NULL,
	[Telephone] [nvarchar](32) NULL,
	[Mobile] [nvarchar](32) NULL,
	[Email] [nvarchar](64) NULL,
	[Enable] [bit] NULL,
	[StoreId] [int] NULL,
	[Store] [nvarchar] (200) NULL,
	[UserR] [int] NULL,
	[ProjectR] [int] NULL,
	[StoreR] [int] NULL,
	[StockR] [int] NULL,
	[RequisitionR] [int] NULL,
	[StockOutR] [int] NULL,
	[StockReturnR] [int] NULL,
	[StockInR] [int] NULL,
	[ReActiveStockR] [int] NULL,
	[PER] [int] NULL,
	[SupplierR] [int] NULL,
	[PriceR] [int] NULL,
	[StockServiceR] [int] NULL,
	[AccountingR] [int] NULL,
	[MaintenanceR] [int] NULL,
	[WorkerR] [int] NULL,
	[ShippmentR] [int] NULL,
	[ReturnSupplierR] [int] NULL,
	[StockTypeR] [int] NULL,
	[CategoryR] [int] NULL,
	[Created] [datetime] NULL,
	[Modified] [datetime] NULL,
	[CreatedBy] int NULL,
	[ModifiedBy] int NULL,
	[Timestamp] [timestamp] NOT NULL
 CONSTRAINT [PK_XUser] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[XDynamicPeReport]') AND type in (N'U'))
DROP TABLE [dbo].[XDynamicPeReport]
GO
CREATE TABLE [dbo].[XDynamicPeReport](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Action] [nvarchar](20) NULL,
	[POId] [int] NULL,
	[PODate] [datetime] NULL,
	[POCode] [nvarchar](16) NOT NULL,
	[POTypeId] [int] NULL,
	[POType] [varchar](50) NULL,
	[ProjectId] [int] NULL,
	[ProjectCode] [nvarchar](20) NULL,
	[ProjectName] [nvarchar](64) NULL,
	[StockId] [int] NULL,
	[StockCode] [nvarchar](16) NULL,
	[StockName] [nvarchar](2000) NULL,
	[StockTypeId] [int] NULL,
	[StockType] [nvarchar](250) NULL,
	[MRF] [nvarchar](200) NULL,
	[CategoryId] [int] NULL,
	[Category] [nvarchar](64) NULL,
	[SupplierId] [int] NULL,
	[Supplier] [nvarchar](64) NULL,
	[UnitId] [int] NULL,
	[Unit] [nvarchar](64) NULL,
	[Quantity] [decimal](18, 2) NULL,
	[QuantityReceived] [decimal](18, 2) NULL,
	[QuantityPending] [decimal](18, 2) NULL,
	[RalNo] [nvarchar](50) NULL,
	[Color] [nvarchar](64) NULL,
     [Weight] [nvarchar](20) NULL,
     [Note] [nvarchar](max) NULL,
	[Created] [datetime] NULL,
	[Modified] [datetime] NULL,
	[CreatedBy] [nvarchar](500) NULL,
	[ModifiedBy] [nvarchar](500) NULL,
	[FagFrom] [nvarchar](10) NULL,
	[FagId] INT NULL
 CONSTRAINT [PK_XDynamicPeReport] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT INTO [dbo].[XDynamicPeReport] ([Action]
           ,[POId]
           ,[PODate]
           ,[POCode]
           ,[POTypeId]
           ,[POType]
           ,[ProjectId]
           ,[ProjectCode]
           ,[ProjectName]
           ,[StockId]
           ,[StockCode]
           ,[StockName]
           ,[StockTypeId]
           ,[StockType]
           ,[MRF]
           ,[CategoryId]
           ,[Category]
           ,[SupplierId]
           ,[Supplier]
           ,[UnitId]
           ,[Unit]
           ,[Quantity]
           ,[QuantityReceived]
           ,[QuantityPending]
           ,[RalNo]
           ,[Color]
           ,[Weight]
           ,[Note]
           ,[Created]
           ,[Modified]
           ,[CreatedBy]
           ,[ModifiedBy]
           ,[FagFrom]
           ,[FagId])
SELECT po.vPODetailStatus, poMaster.Id, poMaster.dPODate, poMaster.vPOID, poType.bPOTypeID, poType.vPOTypeName,
project.Id, project.vProjectID, project.vProjectName, stock.Id, stock.vStockID, stock.vStockName
,stockType.Id, stockType.TypeName, po.vMRF, category.bCategoryID, category.vCategoryName
,supplier.bSupplierID, supplier.vSupplierName 
,unit.bUnitID ,unit.vUnitName
,po.fQuantity, fulfill.dReceivedQuantity, fulfill.dPendingQuantity
,NULL,NULL,stock.bWeight,NULL,NULL,NULL,NULL,NULL, NULL, NULL
FROM WAMS_PO_DETAILS po
INNER JOIN WAMS_STOCK stock ON po.vProductID = stock.Id
INNER JOIN WAMS_STOCK_TYPE stockType ON stockType.Id = stock.iType
INNER JOIN WAMS_UNIT unit ON unit.bUnitID = stock.bUnitID
INNER JOIN WAMS_CATEGORY category On category.bCategoryID = stock.bCategoryID
INNER JOIN WAMS_PURCHASE_ORDER poMaster ON poMaster.Id = po.vPOID
INNER JOIN WAMS_PO_TYPE poType ON poType.bPOTypeID = poMaster.bPOTypeID
INNER JOIN WAMS_SUPPLIER supplier ON supplier.bSupplierID = poMaster.bSupplierID
INNER JOIN WAMS_PROJECT project ON poMaster.vProjectID = project.Id
INNER JOIN WAMS_FULFILLMENT_DETAIL fulfill ON fulfill.vPOID = poMaster.Id
ORDER BY poMaster.dPODate ASC
GO
-- XDynamicPeReport_Insert
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[XDynamicPeReport_Insert]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[XDynamicPeReport_Insert]
GO
CREATE PROCEDURE [dbo].[XDynamicPeReport_Insert]
@Action nvarchar(20)
,@POId int
,@PODate datetime
,@POCode nvarchar(16)
,@POTypeId int
,@POType varchar(50)
,@ProjectId int
,@ProjectCode nvarchar(20)
,@ProjectName nvarchar(64)
,@StockId int
,@StockCode nvarchar(16)
,@StockName nvarchar(2000)
,@StockTypeId int
,@StockType nvarchar(250)
,@MRF nvarchar(200)
,@CategoryId int
,@Category nvarchar(64)
,@SupplierId int
,@Supplier nvarchar(64)
,@UnitId int
,@Unit nvarchar(64)
,@Quantity decimal(18,2)
,@QuantityReceived decimal(18,2)
,@QuantityPending decimal(18,2)
,@RalNo nvarchar(50)
,@Color nvarchar(64)
,@Weight nvarchar(20)
,@Note nvarchar(max)
,@CreatedBy nvarchar(500)
AS
BEGIN
	SET NOCOUNT ON;
	INSERT INTO [dbo].[XDynamicPeReport]
           ([Action]
           ,[POId]
           ,[PODate]
           ,[POCode]
           ,[POTypeId]
           ,[POType]
           ,[ProjectId]
           ,[ProjectCode]
           ,[ProjectName]
           ,[StockId]
           ,[StockCode]
           ,[StockName]
           ,[StockTypeId]
           ,[StockType]
           ,[MRF]
           ,[CategoryId]
           ,[Category]
           ,[SupplierId]
           ,[Supplier]
           ,[UnitId]
           ,[Unit]
           ,[Quantity]
           ,[QuantityReceived]
           ,[QuantityPending]
           ,[RalNo]
           ,[Color]
           ,[Weight]
           ,[Note]
           ,[Created]
           ,[Modified]
           ,[CreatedBy]
           ,[ModifiedBy])
     VALUES
           (@Action
           ,@POId
           ,@PODate
           ,@POCode 
           ,@POTypeId 
           ,@POType 
           ,@ProjectId
           ,@ProjectCode 
           ,@ProjectName 
           ,@StockId
           ,@StockCode 
           ,@StockName 
           ,@StockTypeId 
           ,@StockType 
           ,@MRF 
           ,@CategoryId 
           ,@Category 
           ,@SupplierId 
           ,@Supplier 
           ,@UnitId 
           ,@Unit 
           ,@Quantity 
           ,@QuantityReceived 
           ,@QuantityPending 
           ,@RalNo 
           ,@Color
           ,@Weight 
           ,@Note 
           ,GETDATE()
           ,GETDATE()
           ,@CreatedBy
           ,@CreatedBy)
	SELECT 1
END
GO
-- exec [dbo].[V3_DataPaymentType] '03 DAYs'



--26-07-2016
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[XDynamicProjectReport]') AND type in (N'U'))
DROP TABLE [dbo].[XDynamicProjectReport]
GO
CREATE TABLE [dbo].[XDynamicProjectReport](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Action] [nvarchar](20) NULL,
	[Date] [datetime] NULL,
	[ProjectId] [int] NULL,
	[ProjectCode] [nvarchar](20) NULL,
	[ProjectName] [nvarchar](64) NULL,
	[StockId] [int] NULL,
	[StockCode] [nvarchar](16) NULL,
	[StockName] [nvarchar](2000) NULL,
	[StockTypeId] [int] NULL,
	[StockType] [nvarchar](250) NULL,
	[CategoryId] [int] NULL,
	[Category] [nvarchar](64) NULL,
	[UnitId] [int] NULL,
	[Unit] [nvarchar](64) NULL,
	[SupplierId] [int] NULL,
	[Supplier] [nvarchar](64) NULL,
	[SRV] [nvarchar] (20) NULL,
	[SIV] [nvarchar] (20) NULL,
	[MRF] [nvarchar](200) NULL,
	[POId] [int] NULL,
	[PODate] [datetime] NULL,
	[POCode] [nvarchar](16) NULL,
	[QtyStockIn] [decimal] (18,2) NULL,
	[QtyStockReturn] [decimal] (18,2) NULL,
	[QtyStockOut] [decimal] (18,2) NULL,
	[QtyStockCurrent] [decimal] (18,2) NULL,
	[QtyStockAfterChange] [decimal] (18,2) NULL,
     [Weight] [nvarchar](20) NULL,
     [Note] [nvarchar](max) NULL,
	[Created] [datetime] NULL,
	[Modified] [datetime] NULL,
	[CreatedBy] [nvarchar](500) NULL,
	[ModifiedBy] [nvarchar](500) NULL,
	[FagFrom] [nvarchar](10) NULL,
	[FagId] INT NULL
 CONSTRAINT [PK_XDynamicProjectReport] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

INSERT INTO [dbo].[XDynamicProjectReport] ([Action]
           ,[Date]
           ,[ProjectId]
           ,[ProjectCode]
           ,[ProjectName]
           ,[StockId]
           ,[StockCode]
           ,[StockName]
           ,[StockTypeId]
           ,[StockType]
           ,[CategoryId]
           ,[Category]
           ,[UnitId]
           ,[Unit]
           ,[SupplierId]
           ,[Supplier]
           ,[SRV]
           ,[SIV]
           ,[MRF]
           ,[POId]
           ,[PODate]
           ,[POCode]
           ,[QtyStockIn]
           ,[QtyStockReturn]
           ,[QtyStockOut]
           ,[QtyStockCurrent] 
		 ,[QtyStockAfterChange]
           ,[Weight]
           ,[FagFrom]
           ,[FagId])
     SELECT stockManager.vStatus [Action], stockManager.dDate [Date]
    , stockManager.vProjectID [ProjectId], project.vProjectID [ProjectCode], project.vProjectName [ProjectName]
    , stockManager.vStockID [StockId], stock.vStockID [StockCode], stock.vStockName [StockName]
    , stock.iType [StockTypeId], stockType.TypeName [StockType]
    , stock.bCategoryID [CategoryId], stockCategory.vCategoryName [Category]
    , stock.bUnitID [UnitId], stockUnit.vUnitName [Unit]
    , supplier.bSupplierID [SupplierId], supplier.vSupplierName [Supplier]
    , CASE stockManager.vStatus
    WHEN 'ASSIGN' THEN NULL 
    ELSE stockManager.vStatusID
    END [SRV]
    , CASE stockManager.vStatus
    WHEN 'ASSIGN' THEN stockManager.vStatusID
    ELSE NULL
    END [SIV]
    , stockManager.vMRF [MRF]
    , stockManager.vPOID [POId], po.dPODate [PODate], po.vPOID [POCode]
    , CASE stockManager.vStatus
    WHEN 'FULFILLMENT' THEN stockManager.dQuantityChange 
    ELSE 0
    END [QtyStockIn]
    , CASE stockManager.vStatus
    WHEN 'RETURN' THEN stockManager.dQuantityChange 
    ELSE 0
    END [QtyStockReturn]
    , CASE stockManager.vStatus
    WHEN 'ASSIGN' THEN stockManager.dQuantityChange 
    ELSE 0
    END [QtyStockOut]
    , stockManager.dQuantityCurrent [QtyStockCurrent]
    , stockManager.dQuantityAfterChange [QtyStockAfterChange]
    , stock.bWeight [Weight]
    ,NULL
    ,NULL
    FROM WAMS_STOCK_MANAGEMENT_QUANTITY (NOLOCK) stockManager
    INNER JOIN WAMS_STOCK (NOLOCK) stock ON stockManager.vStockID = stock.Id
    INNER JOIN WAMS_STOCK_TYPE (NOLOCK) stockType ON stock.iType = stockType.Id
    INNER JOIN WAMS_CATEGORY (NOLOCK) stockCategory ON stock.bCategoryID = stockCategory.bCategoryID
    INNER JOIN WAMS_UNIT (NOLOCK) stockUnit ON stock.bUnitID = stockUnit.bUnitID
    LEFT JOIN WAMS_PROJECT (NOLOCK) project ON stockManager.vProjectID = project.Id
    LEFT JOIN WAMS_SUPPLIER (NOLOCK) supplier ON stockManager.bSupplierID = supplier.bSupplierID
    LEFT JOIN WAMS_PURCHASE_ORDER (NOLOCK) po ON stockManager.vPOID = po.Id
    ORDER BY stockManager.ID ASC
    
GO
-- XDynamicProjectReport_Insert
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[XDynamicProjectReport_Insert]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[XDynamicProjectReport_Insert]
GO
CREATE PROCEDURE [dbo].[XDynamicProjectReport_Insert]
@Action nvarchar(20)
,@Date datetime
,@ProjectId int
,@ProjectCode nvarchar(20)
,@ProjectName nvarchar(64)
,@StockId int
,@StockCode nvarchar(16)
,@StockName nvarchar(2000)
,@StockTypeId int
,@StockType nvarchar(250)
,@CategoryId int
,@Category nvarchar(64)
,@UnitId int
,@Unit nvarchar(64)
,@SupplierId int
,@Supplier nvarchar(64)
,@SRV nvarchar(20)
,@SIV nvarchar(20)
,@MRF nvarchar(200)
,@POId int
,@PODate datetime
,@POCode nvarchar(16)
,@QtyStockIn decimal(18,2)
,@QtyStockReturn decimal(18,2)
,@QtyStockOut decimal(18,2)
,@QtyStockCurrent decimal(18,2)
,@QtyStockAfterChange decimal(18,2)
,@Weight nvarchar(20)
,@Note nvarchar(max)
,@CreatedBy nvarchar(500)
AS
BEGIN
	SET NOCOUNT ON;
	INSERT INTO [dbo].[XDynamicProjectReport]
           ([Action]
           ,[Date]
           ,[ProjectId]
           ,[ProjectCode]
           ,[ProjectName]
           ,[StockId]
           ,[StockCode]
           ,[StockName]
           ,[StockTypeId]
           ,[StockType]
           ,[CategoryId]
           ,[Category]
           ,[UnitId]
           ,[Unit]
           ,[SupplierId]
           ,[Supplier]
           ,[SRV]
           ,[SIV]
           ,[MRF]
           ,[POId]
           ,[PODate]
           ,[POCode]
           ,[QtyStockIn]
           ,[QtyStockReturn]
           ,[QtyStockOut]
           ,[QtyStockCurrent]
           ,[QtyStockAfterChange]
           ,[Weight]
           ,[Note]
           ,[Created]
           ,[Modified]
           ,[CreatedBy]
           ,[ModifiedBy])
     VALUES
           (@Action
           ,@Date
           ,@ProjectId
           ,@ProjectCode 
           ,@ProjectName 
           ,@StockId
           ,@StockCode 
           ,@StockName 
           ,@StockTypeId 
           ,@StockType 
           ,@CategoryId 
           ,@Category 
           ,@UnitId 
           ,@Unit 
           ,@SupplierId 
           ,@Supplier
           ,@SRV
           ,@SIV
           ,@MRF 
           ,@POId
           ,@PODate
           ,@POCode 
		 ,@QtyStockIn 
           ,@QtyStockReturn 
           ,@QtyStockOut 
           ,@QtyStockCurrent
           ,@QtyStockAfterChange
           ,@Weight 
           ,@Note 
           ,GETDATE()
           ,GETDATE()
           ,@CreatedBy
           ,@CreatedBy)
	SELECT 1
END
GO




