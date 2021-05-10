Use Project_DWBI_WH

CREATE TABLE [DimEmployee](
	[EmployeeKey] [int] IDENTITY(1,1),
	[BusinessEntityId] [int],
	[FirstName] [varchar](100)    ,
	[LastName] [varchar](100)    ,
	[HireDate] [date]  ,
	[BirthDate] [date]  ,
	[MaritalStatus] [nchar](1)  ,
	[Gender] [nchar](1)  ,
	[VacationHours] [int]  ,
	[SickLeaveHours] [int]  ,
	[StartDate] [date]  ,
	[EndDate] [date] )

drop table [DimDate]

	CREATE TABLE [DimDate](
	[DateKey] [int]  ,
	[FullDateAlternateKey] [date]  ,
	[DayNumberOfWeek] [tinyint]  ,
	[EnglishDayNameOfWeek] [nvarchar](10)  ,
	[DayNumberOfMonth] [tinyint]  ,
	[DayNumberOfYear] [smallint]  ,
	[WeekNumberOfYear] [tinyint]  ,
	[EnglishMonthName] [nvarchar](10)  ,
	[MonthNumberOfYear] [tinyint]  ,
	[CalendarQuarter] [tinyint]  ,
	[CalendarYear] [smallint]  ,
	[CalendarSemester] [tinyint]  ,
	[FiscalQuarter] [tinyint]  ,
	[FiscalYear] [smallint]  ,
	[FiscalSemester] [tinyint])

CREATE TABLE [DimProduct](
	[ProductKey] [int] IDENTITY(1,1)    ,
	[ProductAlternateKey] [int]  ,
	[ProductSubcategoryKey] [int]  ,
	[EnglishProductName] [varchar](50)    ,
	[StandardCost] [money]  ,
	[ListPrice] [money]  ,
	[DaysToManufacture] [int]  ,
	[StartDate] [datetime]  ,
	[EndDate] [datetime]  )

	DROP TABLE [DimProductCategory]

CREATE TABLE [DimProductSubcategory](
	[ProductSubcategoryKey] [int] IDENTITY(1,1)    ,
	[ProductSubcategoryAlternateKey] [int]  ,
	[EnglishProductSubcategoryName] [varchar](100)    ,
	[ProductCategoryKey] [int]  )

	

CREATE TABLE [DimProductCategory](
	[ProductCategoryKey] [int] IDENTITY(1,1)    ,
	[ProductCategoryAlternateKey] [int]  ,
	[EnglishProductCategoryName] [varchar](50)  )

CREATE TABLE [DimCurrency](
	[CurrencyKey] [int] IDENTITY(1,1)    ,
	[CurrencyAlternateKey] [char](3)    ,
	[CurrencyName] [varchar](100)    )

	drop table [DimGeography]

CREATE TABLE [DimPromotion](
	[PromotionKey] [int] IDENTITY(1,1)    ,
	[PromotionAlternateKey] [int]  ,
	[EnglishPromotionName] [varchar](255)  ,
	[DiscountPct] [float]  ,
	[StartDate] [datetime]    ,
	[EndDate] [datetime]  ,
	[MinQty] [int]  ,
	[MaxQty] [int]  )


CREATE TABLE [DimCustomer](
	[CustomerKey] [int] IDENTITY(1,1)    ,
	[GeographyKey] [int]  ,
	[CustomerAlternateKey] [nvarchar](15)    ,
	[FirstName] [nvarchar](50)  ,
	[LastName] [nvarchar](50)  ,
	[BirthDate] [date]  ,
	[MaritalStatus] [nchar](1)  ,
	[Gender] [nvarchar](1)  ,
	[YearlyIncome] [money]  ,
	[DateFirstPurchase] [date]  )

CREATE TABLE [DimSalesReason](
	[SalesReasonKey] [int] IDENTITY(1,1)    ,
	[SalesReasonAlternateKey] [int]    ,
	[SalesReasonName] [varchar](50)    ,
	[SalesReasonReasonType] [varchar](50)    )

CREATE TABLE [DimGeography](
	[GeographyKey] [int] IDENTITY(1,1)  ,
	[City] [nvarchar](30) ,
	[StateProvinceCode] [nvarchar](3) ,
	[StateProvinceName] [nvarchar](50) ,
	[CountryRegionCode] [nvarchar](3) ,
	[EnglishCountryRegionName] [nvarchar](50) ,
	[SpanishCountryRegionName] [nvarchar](50) ,
	[FrenchCountryRegionName] [nvarchar](50) ,
	[PostalCode] [nvarchar](15) ,
	[SalesTerritoryKey] [int] ,
	[IpAddressLocator] [nvarchar](15) )

	drop table [FactInternetSalesReason]

	CREATE TABLE [FactInternetSales](
	[ProductKey] [int]     ,
	[OrderDateKey] [int]     ,
	[DueDateKey] [int]     ,
	[ShipDateKey] [int]     ,
	[CustomerKey] [int]     ,
	[PromotionKey] [int]     ,
	[CurrencyKey] [int]     ,
	[SalesTerritoryKey] [int]     ,
	[SalesOrderNumber] [nvarchar](20)     ,
	[SalesOrderLineNumber] [int]   ,
	[OrderQuantity] [int]     ,
	[UnitPrice] [money]     ,
	[UnitPriceDiscountPct] [float]     ,
	[DiscountAmount] [float]     ,
	[ProductStandardCost] [money]     ,
	[TotalProductCost] [money]     ,
	[SalesAmount] [money]     ,
	[TaxAmt] [money]     ,
	[OrderDate] [datetime]  ,
	[DueDate] [datetime]  )

	CREATE TABLE [FactProductInventory](
	[ProductKey] [int]     ,
	[DateKey] [int]     ,
	[MovementDate] [date]     ,
	[UnitCost] [money]     ,
	[UnitsIn] [int]     ,
	[UnitsOut] [int]     ,
	[UnitsBalance] [int]     )

	CREATE TABLE [FactInternetSalesReason](
	[SalesOrderNumber] [nvarchar](20)     ,
	[SalesOrderLineNumber] [int]     ,
	[SalesReasonKey] [int]     )

	CREATE TABLE [FactSalesQuota](
	[SalesQuotaKey] [int] IDENTITY(1,1)     ,
	[EmployeeKey] [int]     ,
	[DateKey] [int]     ,
	[CalendarYear] [int]     ,
	[CalendarQuarter] [int]     ,
	[SalesAmountQuota] [money]     ,
	[Date] [datetime]  )

	


	