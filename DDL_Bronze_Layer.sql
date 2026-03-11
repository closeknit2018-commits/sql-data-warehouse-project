/* 
==================================================================================
DDL Script : Create Bronze tables
==================================================================================
Script purpose:
	This script creates tables in the bronze schema, dropping existing tablesif 
	they already exist 
	Run this script to re-define the DDL structure od bronze tables
==================================================================================
*/
DROP DATABASE IF EXISTS DataWarehouse
	GO 

	CREATE DATABASE DataWarehouse
	GO

	USE DataWarehouse
	

DROP TABLE IF EXISTS bronze_Customer_info

CREATE TABLE bronze_Customer_info (
	CustomerName NVARCHAR(50)
	,CustomerPhNo NVARCHAR (50)
	,CustomerAddress NVARCHAR(120)
	,Password NVARCHAR(50)
)


DROP TABLE IF EXISTS bronze_Branch_info

CREATE TABLE bronze_Branch_info (
	Brand_Id TINYINT
	,Brand_Name NVARCHAR(12)
)


DROP TABLE IF EXISTS bronze_BranchProduct_info

CREATE TABLE bronze_BranchProduct_info (
	Brands_Brand_id TINYINT
	,Products_ProductID NVARCHAR(50)
)


DROP TABLE IF EXISTS bronze_Product_info

CREATE TABLE bronze_Product_info (
	ProductID NVARCHAR (50)
	,ProductName NVARCHAR(500)
	,ProductStock NVARCHAR(20)
	,Price NVARCHAR(120)
	,Discount NVARCHAR(20)
	,Category_CategoryID NVARCHAR(20)
)


DROP TABLE IF EXISTS bronze_Cashier_info

CREATE TABLE bronze_Cashier_info (
	CashierID TINYINT
	,CashierName NVARCHAR(20)
	,CashierPhoneNo NVARCHAR (50)
	,CashierAddress NVARCHAR(50)
)


DROP TABLE IF EXISTS bronze_Categories_info

CREATE TABLE bronze_Categories_info (
	CategoryId TINYINT
	,Category NVARCHAR(50)
	,SubCategory NVARCHAR(50)
)


DROP TABLE IF EXISTS bronze_Transactions_details

CREATE TABLE bronze_Transactions_details (
	Transaction_date DATE
	,Quantity INT
	,Subtotal NVARCHAR(250)
	,Taxes NVARCHAR(250)	
	,DiscountPrice NVARCHAR(250)
	,TotalAmount NVARCHAR(250)
	,Payment_Method NVARCHAR(250)
	,Products_ProductID NVARCHAR(250)
	,CustomerCart_CustomerID INT
	,Cashier_CashierID INT
)

SELECT * FROM bronze_Transactions_details
