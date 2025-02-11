-- ========================================================
--             LOAD BRONZE LAYER PROCEDURE
-- ========================================================

CREATE OR ALTER PROCEDURE bronze.load_bronze  
AS
BEGIN
    -- Declare variables to track load times
    DECLARE @start_time DATETIME, @end_time DATETIME, 
            @batch_start_time DATETIME, @batch_end_time DATETIME;

    BEGIN TRY
        -- Start tracking batch execution time
        SET @batch_start_time = GETDATE();
        PRINT '====================================================';
        PRINT '             Loading Bronze Layer';
        PRINT '====================================================';

        -- --------------------------------------------------------
        -- Loading CRM Tables
        -- --------------------------------------------------------
        PRINT '----------------------------------------------------';
        PRINT '             Loading CRM Table';
        PRINT '----------------------------------------------------';

        -- Loading crm_cust_info
        SET @start_time = GETDATE();
        PRINT '>> Truncating Table: bronze.crm_cust_info';
        TRUNCATE TABLE bronze.crm_cust_info;
        PRINT '>> Inserting Data Into: bronze.crm_cust_info';
        BULK INSERT bronze.crm_cust_info
        FROM 'C:\Workspace\Data Science\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
        WITH(
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );
        SET @end_time = GETDATE();
        PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
        PRINT '----------------------------------';

        -- Loading crm_prd_id
        SET @start_time = GETDATE();
        PRINT '>> Truncating Table: bronze.crm_prd_id';
        TRUNCATE TABLE bronze.crm_prd_id;
        PRINT '>> Inserting Data Into: bronze.crm_prd_id';
        BULK INSERT bronze.crm_prd_id
        FROM 'C:\Workspace\Data Science\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
        WITH(
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );
        SET @end_time = GETDATE();
        PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
        PRINT '----------------------------------';

        -- Loading crm_sales_details
        SET @start_time = GETDATE();
        PRINT '>> Truncating Table: bronze.crm_sales_details';
        TRUNCATE TABLE bronze.crm_sales_details;
        PRINT '>> Inserting Data Into: bronze.crm_sales_details';
        BULK INSERT bronze.crm_sales_details
        FROM 'C:\Workspace\Data Science\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
        WITH(
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );
        SET @end_time = GETDATE();
        PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
        PRINT '----------------------------------';

        -- --------------------------------------------------------
        -- Loading ERM Tables
        -- --------------------------------------------------------
        PRINT '----------------------------------------------------';
        PRINT '             Loading ERM Table';
        PRINT '----------------------------------------------------';

        -- Loading erp_cust
        SET @start_time = GETDATE();
        PRINT '>> Truncating Table: bronze.erp_cust';
        TRUNCATE TABLE bronze.erp_cust;
        PRINT '>> Inserting Data Into: bronze.erp_cust';
        BULK INSERT bronze.erp_cust
        FROM 'C:\Workspace\Data Science\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
        WITH(
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );
        SET @end_time = GETDATE();
        PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
        PRINT '----------------------------------';

        -- Loading erp_loc
        SET @start_time = GETDATE();
        PRINT '>> Truncating Table: bronze.erp_loc';
        TRUNCATE TABLE bronze.erp_loc;
        PRINT '>> Inserting Data Into: bronze.erp_loc';
        BULK INSERT bronze.erp_loc
        FROM 'C:\Workspace\Data Science\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
        WITH(
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );
        SET @end_time = GETDATE();
        PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
        PRINT '----------------------------------';

        -- Loading erp_px_cat
        SET @start_time = GETDATE();
        PRINT '>> Truncating Table: bronze.erp_px_cat';
        TRUNCATE TABLE bronze.erp_px_cat;
        PRINT '>> Inserting Data Into: bronze.erp_px_cat';
        BULK INSERT bronze.erp_px_cat
        FROM 'C:\Workspace\Data Science\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
        WITH(
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );
        SET @end_time = GETDATE();
        PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
        PRINT '----------------------------------';

        -- --------------------------------------------------------
        -- Calculate Total Batch Duration
        -- --------------------------------------------------------
        SET @batch_end_time = GETDATE();
        PRINT '>> Total Load Duration: ' + CAST(DATEDIFF(second, @batch_start_time, @batch_end_time) AS NVARCHAR) + ' seconds';
        PRINT '----------------------------------';

    END TRY

    BEGIN CATCH
        -- Error Handling Block
        PRINT '--------------------------------------------';
        PRINT 'Error Message: ' + ERROR_MESSAGE();
        PRINT '--------------------------------------------';
    END CATCH
END
