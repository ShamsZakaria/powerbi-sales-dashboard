--- DB OBjects:
---- 1- tabels 
---- 2- Views


Create view DA as
Select OH.[SalesOrderID],[OrderDate],[DueDate],[ShipDate]
	   ,[Status],[OnlineOrderFlag],[CustomerID],[SalesPersonID]
       ,OH.[TerritoryID],ST.Name Terriotry_Name, ST.[Group] Territory_Group
	   ,OH.[ShipMethodID], SM.Name ShipMethod
	   ,[SubTotal] ,[TaxAmt]
       ,[Freight],[TotalDue],[SalesOrderDetailID],[OrderQty]
       ,OD.[ProductID],[UnitPrice],[LineTotal]
	   ,P.Name Product_Name, PS.Name SubCategory, PC.Name Category

From Sales.SalesOrderHeader OH
JOIN Sales.SalesOrderDetail OD
ON OH.SalesOrderID = OD.SalesOrderID
Join Sales.SalesTerritory ST
ON ST.TerritoryID = OH.TerritoryID
Join Purchasing.ShipMethod SM
ON SM.ShipMethodID = OH.ShipMethodID
Join Production.Product P
ON P.ProductID = OD.ProductID
Join Production.ProductSubcategory PS 
ON PS.ProductSubcategoryID = P.ProductSubcategoryID
Join Production.ProductCategory PC
ON PC.ProductCategoryID = PS.ProductCategoryID


SELECT * FROM DA;
