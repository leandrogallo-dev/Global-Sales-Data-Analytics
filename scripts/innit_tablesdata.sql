USE DataSales;
GO

CREATE OR ALTER PROCEDURE gold.usp_BulkInsertData
    @TableName NVARCHAR(255),
    @FilePath  NVARCHAR(MAX)
AS
BEGIN
	SET LANGUAGE Spanish; -- eu_orders has (, and .) problems

	DECLARE @sql NVARCHAR(MAX) = N'
	BEGIN TRY
		PRINT '' '';
		PRINT ''[...] Loading ' + @TableName + '...'';
		DECLARE @StartTime DATETIME2 = SYSDATETIME();
		BEGIN TRANSACTION;
			TRUNCATE TABLE ' + @TableName + ';

			BULK INSERT ' + @TableName + '
			FROM ''' + @FilePath + '''			-- CHANGE THIS
			WITH (
				FIRSTROW = 2,
				FIELDTERMINATOR = '';'',
				ROWTERMINATOR = ''\n'',
				KEEPNULLS,
				TABLOCK
			);
		COMMIT TRANSACTION;
		DECLARE @EndTime DATETIME2 = SYSDATETIME();

		PRINT ''[+] Details exec time: '' + CAST(DATEDIFF(SECOND, @StartTime, @EndTime) AS VARCHAR(10)) + '' sec.'';
		PRINT ''[+] Data successfully inserted in ' + @TableName + '.'';
	END TRY
	BEGIN CATCH
        IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION;

		DECLARE @ErrorMsg NVARCHAR(4000) = ''[x] Err to import ' + @TableName + ': '' + ERROR_MESSAGE();
        RAISERROR(@ErrorMsg, 16, 1);
	END CATCH';

	EXEC sp_executesql @sql;
END;
GO

EXEC gold.usp_BulkInsertData 'gold.eu_customers', 'D:\Data\eu\Customers.csv';
EXEC gold.usp_BulkInsertData 'gold.eu_locations', 'D:\Data\eu\Location.csv';
EXEC gold.usp_BulkInsertData 'gold.eu_orders',	  'D:\Data\eu\Orders.csv';
EXEC gold.usp_BulkInsertData 'gold.eu_products',  'D:\Data\eu\Products.csv';

EXEC gold.usp_BulkInsertData 'gold.non_eu_customers', 'D:\Data\non-eu\Customers.csv';
EXEC gold.usp_BulkInsertData 'gold.non_eu_locations', 'D:\Data\non-eu\Location.csv';
EXEC gold.usp_BulkInsertData 'gold.non_eu_orders',	  'D:\Data\non-eu\Orders.csv';
EXEC gold.usp_BulkInsertData 'gold.non_eu_products',  'D:\Data\non-eu\Products.csv';