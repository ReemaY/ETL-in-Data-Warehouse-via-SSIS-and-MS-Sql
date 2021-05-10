
Use Project_DWBI
CREATE TABLE BusinessEntity(
	[BusinessEntityID] [int] IDENTITY(1,1)  ,
	[rowguid] [uniqueidentifier] ROWGUIDCOL      ,
	[ModifiedDate] [datetime]     ,
 )

 CREATE TABLE [Person](
	[BusinessEntityID] [int]     ,
	[PersonType] [char](2),
	[NameStyle] [varchar](100) ,
	[Title] [varchar](8)  ,
	[FirstName] [varchar](100) ,
	[MiddleName] [varchar](100)  ,
	[LastName] [varchar](100) ,
	[Suffix] [varchar](10)  ,
	[EmailPromotion] [int] ,
	[AdditionalContactInfo] [varchar](100)  ,
	[Demographics] [varchar](100)  ,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  ,
	[ModifiedDate] [datetime]  )




CREATE TABLE [Department](
	[DepartmentID] [smallint] IDENTITY(1,1),
	[Name] [varchar](100)   ,
	[GroupName] [varchar](100)   ,
	[ModifiedDate] [datetime]   )


CREATE TABLE [SalesOrderHeader](
	[SalesOrderID] [int] IDENTITY(1,1) ,
	[RevisionNumber] [tinyint]   ,
	[OrderDate] [datetime]   ,
	[DueDate] [datetime]   ,
	[ShipDate] [datetime]  ,
	[Status] [tinyint]   ,
	[OnlineOrderFlag] [varchar](100)   ,
	[SalesOrderNumber]  [varchar](23),
	[PurchaseOrderNumber] [varchar](100)  ,
	[AccountNumber] [varchar](100)  ,
	[CustomerID] [int]   ,
	[SalesPersonID] [int]  ,
	[TerritoryID] [int]  ,
	[BillToAddressID] [int]   ,
	[ShipToAddressID] [int]   ,
	[ShipMethodID] [int]   ,
	[CreditCardID] [int]  ,
	[CreditCardApprovalCode] [varchar](15)  ,
	[CurrencyRateID] [int]  ,
	[SubTotal] [money]   ,
	[TaxAmt] [money]   ,
	[Freight] [money]   ,
	[TotalDue]  [int],
	[Comment] [varchar](128)  ,
	[rowguid] [uniqueidentifier] ROWGUIDCOL    ,
	[ModifiedDate] [datetime]   )



CREATE TABLE [Store](
	[BusinessEntityID] [int]  ,
	[Name] [varchar](100)  ,
	[SalesPersonID] [int] ,
	[Demographics] [varchar](100) ,
	[rowguid] [uniqueidentifier] ROWGUIDCOL ,
	[ModifiedDate] [datetime]  )

CREATE TABLE [SalesPerson](
	[BusinessEntityID] [int] ,
	[TerritoryID] [int] ,
	[SalesQuota] [money] ,
	[Bonus] [money] ,
	[CommissionPct] [smallmoney] ,
	[SalesYTD] [money] ,
	[SalesLastYear] [money] ,
	[rowguid] [uniqueidentifier] ROWGUIDCOL,
	[ModifiedDate] [datetime] )


CREATE TABLE [SalesOrderDetail](
	[SalesOrderID] [int] ,
	[SalesOrderDetailID] [int] IDENTITY(1,1) ,
	[CarrierTrackingNumber] [varchar](25) ,
	[OrderQty] [smallint] ,
	[ProductID] [int] ,
	[SpecialOfferID] [int]  ,
	[UnitPrice] [money] ,
	[UnitPriceDiscount] [money] ,
	[LineTotal] [int],
	[rowguid] [uniqueidentifier] ROWGUIDCOL  ,
	[ModifiedDate] [datetime] )


CREATE TABLE [SalesTerritory](
	[TerritoryID] [int] IDENTITY(1,1)  ,
	[Name] [varchar](100) ,
	[CountryRegionCode] [varchar](3) ,
	[Group] [varchar](100) ,
	[SalesYTD] [money] ,
	[SalesLastYear] [money],
	[CostYTD] [money] ,
	[CostLastYear] [money] ,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  ,
	[ModifiedDate] [datetime] )

	drop table [SalesTerritory]

CREATE TABLE [Currency](
	[CurrencyCode] [char](3)  ,
	[Name] [varchar](100)  ,
	[ModifiedDate] [datetime]  )

CREATE TABLE [SalesOrderHeaderSalesReason](
	[SalesOrderID] [int]  ,
	[SalesReasonID] [int]  ,
	[ModifiedDate] [datetime]  )

CREATE TABLE [SpecialOffer](
	[SpecialOfferID] [int] IDENTITY(1,1) ,
	[Description] [varchar](255) ,
	[DiscountPct] [smallmoney]  ,
	[Type] [varchar](50)  ,
	[Category] [varchar](50)  ,
	[StartDate] [datetime]  ,
	[EndDate] [datetime]  ,
	[MinQty] [int]  ,
	[MaxQty] [int] ,
	[rowguid] [uniqueidentifier] ROWGUIDCOL ,
	[ModifiedDate] [datetime] )

CREATE TABLE [SpecialOfferProduct](
	[SpecialOfferID] [int]  ,
	[ProductID] [int]  ,
	[rowguid] [uniqueidentifier] ROWGUIDCOL,
	[ModifiedDate] [datetime]  )

CREATE TABLE [Customer](
	[CustomerID] [int] IDENTITY(1,1) ,
	[PersonID] [int] ,
	[StoreID] [int] ,
	[TerritoryID] [int] ,
	[AccountNumber] [varchar](100),
	[rowguid] [uniqueidentifier] ROWGUIDCOL ,
	[ModifiedDate] [datetime] )

CREATE TABLE [ProductInventory](
	[ProductID] [int]  ,
	[LocationID] [int] ,
	[Shelf] [varchar](10),
	[Bin] [int] ,
	[Quantity] [int] ,
	[rowguid] [uniqueidentifier] ROWGUIDCOL ,
	[ModifiedDate] [datetime]  )

	

CREATE TABLE [PurchaseOrderHeader](
	[PurchaseOrderID] [int] IDENTITY(1,1)  ,
	[RevisionNumber] [int]  ,
	[Status] [int]  ,
	[EmployeeID] [int] ,
	[VendorID] [int]  ,
	[ShipMethodID] [int]  ,
	[OrderDate] [datetime]  ,
	[ShipDate] [datetime] ,
	[SubTotal] [money]  ,
	[TaxAmt] [money]  ,
	[Freight] [money]  ,
	[TotalDue]  AS (is (([SubTotal]+[TaxAmt])+[Freight],(0))) PERSISTED  ,
	[ModifiedDate] [datetime]  )

CREATE TABLE [PurchaseOrderDetail](
	[PurchaseOrderID] [int]  ,
	[PurchaseOrderDetailID] [int] IDENTITY(1,1)  ,
	[DueDate] [datetime]  ,
	[OrderQty] [int]  ,
	[ProductID] [int]  ,
	[UnitPrice] [money]  ,
	[LineTotal]  AS (is ([OrderQty]*[UnitPrice],(0.00))),
	[ReceivedQty] [decimal](8, 2)  ,
	[RejectedQty] [decimal](8, 2)  ,
	[StockedQty]  AS (is ([ReceivedQty]-[RejectedQty],(0.00))),
	[ModifiedDate] [datetime]  )


	

CREATE TABLE [Product](
	[ProductID] [int] IDENTITY(1,1)  ,
	[Name] [varchar](100)  ,
	[ProductNumber] [varchar](25)  ,
	[MakeFlag] [varchar](100)  ,
	[FinishedGoodsFlag] [varchar](100)  ,
	[Color] [varchar](15) ,
	[SafetyStockLevel] [int]  ,
	[ReorderPoint] [int]  ,
	[StandardCost] [money]  ,
	[ListPrice] [money]  ,
	[Size] [varchar](5) ,
	[SizeUnitMeasureCode] [char](3) ,
	[WeightUnitMeasureCode] [char](3) ,
	[Weight] [decimal](8, 2) ,
	[DaysToManufacture] [int]  ,
	[ProductLine] [char](2) ,
	[Class] [char](2) ,
	[Style] [char](2) ,
	[ProductSubcategoryID] [int] ,
	[ProductModelID] [int] ,
	[SellStartDate] [datetime]  ,
	[SellEndDate] [datetime] ,
	[DiscontinuedDate] [datetime] ,
	[rowguid] [uniqueidentifier] ROWGUIDCOL   ,
	[ModifiedDate] [datetime]  )

		drop table [ProductSubCategory]

CREATE TABLE [ProductCategory](
	[ProductCategoryID] [int] IDENTITY(1,1)  ,
	[Name] [varchar](100)  ,
	[rowguid] [uniqueidentifier] ROWGUIDCOL   ,
	[ModifiedDate] [datetime]  )

CREATE TABLE [ProductSubCategory](
	[ProductSubcategoryID] [int] IDENTITY(1,1)  ,
	[ProductCategoryID] [int]  ,
	[Name] [varchar](100)  ,
	[rowguid] [uniqueidentifier] ROWGUIDCOL   ,
	[ModifiedDate] [datetime]  )


	
CREATE TABLE [Employee](
	[BusinessEntityID] [int]     ,
	[NationalIDNumber] [varchar](15)     ,
	[LoginID] [varchar](256)     ,
	[OrganizationNode] [hierarchyid]  ,
	[OrganizationLevel]  [varchar](100),
	[JobTitle] [varchar](50)     ,
	[BirthDate] [date]     ,
	[MaritalStatus] [char](1)     ,
	[Gender] [char](1)     ,
	[HireDate] [date]     ,
	[SalariedFlag] [varchar](100)     ,
	[VacationHours] [int]   ,
	[SickLeaveHours] [int]  ,
	[rowguid] [uniqueidentifier] ROWGUIDCOL,
	[ModifiedDate] [datetime])

	drop table [Employee]

	select * from [Employee]

	CREATE TABLE [SalesReason](
	[SalesReasonID] [int] IDENTITY(1,1)  ,
	[Name] [varchar](100)  ,
	[ReasonType] [varchar](100)  ,
	[ModifiedDate] [datetime]  )