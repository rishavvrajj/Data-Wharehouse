-- Switch to the 'master' database
USE master;
GO

-- Create the DataWarehouse database
CREATE DATABASE DataWarehouse;
GO

-- Switch to the 'DataWarehouse' database
USE DataWarehouse;
GO

-- *******************************
-- SCHEMA CREATION
-- *******************************

-- Create 'bronze' schema for raw or untransformed data
CREATE SCHEMA bronze;
GO

-- Create 'silver' schema for cleaned and transformed data
CREATE SCHEMA Silver;
GO

-- Create 'gold' schema for aggregated and refined data
CREATE SCHEMA gold;
GO
