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

EXEC bronze_load_bronze;

CREATE OR ALTER PROCEDURE bronze_load_bronze AS
BEGIN
	BEGIN TRY
		DECLARE @start_time DATETIME, @end_time DATETIME, @batch_start_time DATETIME, @batch_end_time DATETIME;

		SET @batch_start_time = GETDATE();
		PRINT '==================================================================================';
		PRINT 'LOAD BRONZE LAYER';
		PRINT '==================================================================================';

		SET @start_time = GETDATE();
		PRINT '>> Truncating Table bronze_Customer_info';
		TRUNCATE TABLE bronze_Customer_info;

		PRINT '>> Insert data into: bronze_Customer_info';
		BULK INSERT bronze_Customer_info
		FROM 'C:\Users\nalle\OneDrive\Skrivbord\ANALYSERA_DATASET\Inventory_SCM\Customer_Cart.csv'
		WITH (
			FIRSTROW = 2
			,FIELDTERMINATOR = ','
			,TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds' ;	
		PRINT '>> ------------------------------------';


		SET @start_time = GETDATE();
		PRINT '>> Truncating Table bronze_Branch_info';
		TRUNCATE TABLE bronze_Branch_info;

		PRINT '>> Insert data into: bronze_Branch_info';
		BULK INSERT bronze_Branch_info
		FROM 'C:\Users\nalle\OneDrive\Skrivbord\ANALYSERA_DATASET\Inventory_SCM\Brand.csv'
		WITH (
			FIRSTROW = 2
			,FIELDTERMINATOR = ','
			,TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds' ;	
		PRINT '>> ------------------------------------'


		SET @start_time = GETDATE();
		PRINT '>> Truncating Table bronze_BranchProduct_info';
		TRUNCATE TABLE bronze_BranchProduct_info;
	
		PRINT '>> Insert data into: bronze_BranchProduct_info';
		BULK INSERT bronze_BranchProduct_info
		FROM 'C:\Users\nalle\OneDrive\Skrivbord\ANALYSERA_DATASET\Inventory_SCM\Brand_has_product.csv'
		WITH (
			FIRSTROW = 2
			,FIELDTERMINATOR = ','
			,TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds' ;	
		PRINT '>> ------------------------------------'


		SET @start_time = GETDATE();
		PRINT '>> Truncating Table bronze_Product_info';
		TRUNCATE TABLE bronze_Product_info;

		PRINT '>> Insert data into: bronze_Product_info';
		BULK INSERT bronze_Product_info
		FROM 'C:\Users\nalle\OneDrive\Skrivbord\ANALYSERA_DATASET\Inventory_SCM\Products.csv'
		WITH (
			FORMAT = 'CSV' -- understand text qualifier with ',' in text
			,FIRSTROW = 2
			,FIELDTERMINATOR = ',' --may not need this becase using FORMAT = 'csv'
			,CODEPAGE = '65001'
			,TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds' ;	
		PRINT '>> ------------------------------------';


		SET @start_time = GETDATE();
		PRINT '>> Truncating Table bronze_Cashier_info';
		TRUNCATE TABLE bronze_Cashier_info;

		PRINT '>> Insert data into: bronze_Cashier_info';
		BULK INSERT bronze_Cashier_info
		FROM 'C:\Users\nalle\OneDrive\Skrivbord\ANALYSERA_DATASET\Inventory_SCM\Cashier.csv'
		WITH (
			FIRSTROW = 2
			,FIELDTERMINATOR = ','
			,TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds' ;	
		PRINT '>> ------------------------------------'


		SET @start_time = GETDATE();
		PRINT '>> Truncating Table bronze_Categories_info';
		TRUNCATE TABLE bronze_Categories_info;

		PRINT '>> Insert data into: bronze_Categories_info';
		BULK INSERT bronze_Categories_info
		FROM 'C:\Users\nalle\OneDrive\Skrivbord\ANALYSERA_DATASET\Inventory_SCM\Categories.csv'
		WITH (
			FIRSTROW = 2
			,FIELDTERMINATOR = ','
			,TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds' ;	
		PRINT '>> ------------------------------------'


		SET @start_time = GETDATE();
		PRINT '>> Truncating Table bronze_Transactions_details';
		TRUNCATE TABLE bronze_Transactions_details;

		PRINT '>> Insert data into: bronze_Transactions_details';
		BULK INSERT bronze_Transactions_details
		FROM 'C:\Users\nalle\OneDrive\Skrivbord\ANALYSERA_DATASET\Inventory_SCM\Transcations.csv'
		WITH (
			FIRSTROW = 2
			,FIELDTERMINATOR = ','
			,TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds' ;	
		PRINT '>> ------------------------------------'
		
		SET @batch_end_time = GETDATE();
		PRINT '==================================================================================';
		PRINT 'Loading Bronze Layer is completed';
		PRINT 'Total Load duration: ' + CAST(DATEDIFF(second, @batch_start_time, @batch_end_time) AS NVARCHAR) + ' seconds';
		PRINT '==================================================================================';
	END TRY
	
	BEGIN CATCH
		PRINT '==================================================================================';
		PRINT 'ERROR OCCURED DURING LOADING BRONZE LAYER';
		PRINT 'Error message' + ERROR_MESSAGE();
		PRINT 'Error message' + CAST(ERROR_NUMBER() AS NVARCHAR);
		PRINT 'Error message' + CAST(ERROR_STATE() AS NVARCHAR);
		PRINT '==================================================================================';
	
	END CATCH

END

