USE master;
GO

-- Drop and recreate the 'DataAnalytics' database
IF EXISTS (SELECT * FROM sys.databases WHERE name = 'DataSales')
BEGIN
	PRINT '[!] Deleting existing DataSales database.'
	ALTER DATABASE DataSales SET SINGLE_USER WITH ROLLBACK IMMEDIATE
	DROP DATABASE DataSales
END;
GO

CREATE DATABASE DataSales;
GO

USE DataSales;
GO

-- Create Schemas
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'gold')
BEGIN
	PRINT '[+] Creating gold Schema.'
    EXEC('CREATE SCHEMA gold AUTHORIZATION dbo');
END
GO

-- eu tables
PRINT '[i] Creating tables'


IF OBJECT_ID(N'gold.eu_customers', N'U') IS NULL
BEGIN 
	BEGIN TRY
		BEGIN TRANSACTION;
			CREATE TABLE [gold].[eu_customers] (
                customer_id   VARCHAR(20) PRIMARY KEY,
                customer_name VARCHAR(255)
            );
		COMMIT TRANSACTION;
		PRINT '[+] gold.eu_customers table created successfully';
	END TRY	
	BEGIN CATCH
		IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION;
        PRINT '[x] Err creating gold.eu_customers: ' + ERROR_MESSAGE();
	END CATCH
END
ELSE 
BEGIN
	PRINT '[!] Table gold.eu_customers already exists.';
END

GO

IF OBJECT_ID(N'gold.eu_locations', N'U') IS NULL
BEGIN 
	BEGIN TRY
		BEGIN TRANSACTION;
			CREATE TABLE [gold].[eu_locations] (
                postal_code    VARCHAR(20),
                city           VARCHAR(100),
                [state]        VARCHAR(100),
                region         VARCHAR(50),
                country_region VARCHAR(100)
            );
		COMMIT TRANSACTION;
		PRINT '[+] gold.eu_locations table created successfully';
	END TRY	
	BEGIN CATCH
		IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION;
        PRINT '[x] Err creating gold.eu_locations: ' + ERROR_MESSAGE();
	END CATCH
END
ELSE 
BEGIN
	PRINT '[!] Table gold.eu_locations already exists.';
END

GO

IF OBJECT_ID(N'gold.eu_orders', N'U') IS NULL
BEGIN 
	BEGIN TRY
		BEGIN TRANSACTION;
			CREATE TABLE [gold].[eu_orders] (
                row_id        INT PRIMARY KEY,
                order_id      VARCHAR(25),
                order_date    DATE,
                ship_date     DATE,
                ship_mode     VARCHAR(50),
                customer_id   VARCHAR(20),
                segment       VARCHAR(50),
                postal_code   VARCHAR(20), -- Se usa VARCHAR if there are char symbols
                product_id    VARCHAR(25),
                sales         DECIMAL(18, 4),
                quantity      INT,
                discount      DECIMAL(5, 2),
                profit        DECIMAL(18, 4)
            );
		COMMIT TRANSACTION;
		PRINT '[+] gold.eu_orders table created successfully';
	END TRY	
	BEGIN CATCH
		IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION;
        PRINT '[x] Err creating gold.eu_orders: ' + ERROR_MESSAGE();
	END CATCH
END
ELSE 
BEGIN
	PRINT '[!] Table gold.eu_orders already exists.';
END

GO

IF OBJECT_ID(N'gold.eu_products', N'U') IS NULL
BEGIN 
	BEGIN TRY
		BEGIN TRANSACTION;
			CREATE TABLE [gold].[eu_products] (
                product_id    VARCHAR(25),
                category      VARCHAR(100),
                sub_category  VARCHAR(100),
                product_name  VARCHAR(255)
            );
		COMMIT TRANSACTION;
		PRINT '[+] gold.eu_products table created successfully';
	END TRY	
	BEGIN CATCH
		IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION;
        PRINT '[x] Err creating gold.eu_products: ' + ERROR_MESSAGE();
	END CATCH
END
ELSE 
BEGIN
	PRINT '[!] Table gold.eu_products already exists.';
END

GO

-- ==================================================================================
-- not eu tables
-- ==================================================================================

IF OBJECT_ID(N'gold.non_eu_customers', N'U') IS NULL
BEGIN 
	BEGIN TRY
		BEGIN TRANSACTION;
			CREATE TABLE [gold].[non_eu_customers] (
                customer_id   VARCHAR(20) PRIMARY KEY,
                customer_name VARCHAR(255)
            );
		COMMIT TRANSACTION;
		PRINT '[+] gold.non_eu_customers table created successfully';
	END TRY	
	BEGIN CATCH
		IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION;
        PRINT '[x] Err creating gold.non_eu_customers: ' + ERROR_MESSAGE();
	END CATCH
END
ELSE 
BEGIN
	PRINT '[!] Table gold.non_eu_customers already exists.';
END

GO

IF OBJECT_ID(N'gold.non_eu_locations', N'U') IS NULL
BEGIN 
	BEGIN TRY
		BEGIN TRANSACTION;
			CREATE TABLE [gold].[non_eu_locations] (
                postal_code    VARCHAR(20),
                city           VARCHAR(100),
                [state]        VARCHAR(100),
                region         VARCHAR(50),
                country_region VARCHAR(100)
            );
		COMMIT TRANSACTION;
		PRINT '[+] gold.non_eu_locations table created successfully';
	END TRY	
	BEGIN CATCH
		IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION;
        PRINT '[x] Err creating gold.non_eu_locations: ' + ERROR_MESSAGE();
	END CATCH
END
ELSE 
BEGIN
	PRINT '[!] Table gold.non_eu_locations already exists.';
END

GO

IF OBJECT_ID(N'gold.non_eu_orders', N'U') IS NULL
BEGIN 
	BEGIN TRY
		BEGIN TRANSACTION;
			CREATE TABLE [gold].[non_eu_orders] (
                row_id        INT PRIMARY KEY,
                order_id      VARCHAR(25),
                order_date    DATE,
                ship_date     DATE,
                ship_mode     VARCHAR(50),
                customer_id   VARCHAR(20),
                segment       VARCHAR(50),
                postal_code   VARCHAR(20), -- Se usa VARCHAR if there are char symbols
                product_id    VARCHAR(25),
                sales         DECIMAL(18, 4),
                quantity      INT,
                discount      DECIMAL(5, 2),
                profit        DECIMAL(18, 4)
            );
		COMMIT TRANSACTION;
		PRINT '[+] gold.non_eu_orders table created successfully';
	END TRY	
	BEGIN CATCH
		IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION;
        PRINT '[x] Err creating gold.non_eu_orders: ' + ERROR_MESSAGE();
	END CATCH
END
ELSE 
BEGIN
	PRINT '[!] Table gold.non_eu_orders already exists.';
END

GO

IF OBJECT_ID(N'gold.non_eu_products', N'U') IS NULL
BEGIN 
	BEGIN TRY
		BEGIN TRANSACTION;
			CREATE TABLE [gold].[non_eu_products] (
                product_id    VARCHAR(25),
                category      VARCHAR(100),
                sub_category  VARCHAR(100),
                product_name  VARCHAR(255)
            );
		COMMIT TRANSACTION;
		PRINT '[+] gold.non_eu_products table created successfully';
	END TRY	
	BEGIN CATCH
		IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION;
        PRINT '[x] Err creating gold.non_eu_products: ' + ERROR_MESSAGE();
	END CATCH
END
ELSE 
BEGIN
	PRINT '[!] Table gold.non_eu_products already exists.';
END

GO