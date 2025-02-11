-- ========================================================
--               DROP AND CREATE TABLES SCRIPT
-- ========================================================

-- --------------------------------------------------------
-- 1. Drop and Create: crm_cust_info
-- --------------------------------------------------------
IF OBJECT_ID('bronze.crm_cust_info', 'U') IS NOT NULL
    DROP TABLE bronze.crm_cust_info;
CREATE TABLE bronze.crm_cust_info(
    cst_id INT,                            -- Customer ID
    cst_key NVARCHAR(50),                  -- Customer Key
    cst_firstname NVARCHAR(50),            -- First Name
    cst_lastname NVARCHAR(50),             -- Last Name
    cst_marital_status NVARCHAR(50),       -- Marital Status
    cst_gndr NVARCHAR(50),                 -- Gender
    cst_create_date DATE                   -- Account Creation Date
);

-- --------------------------------------------------------
-- 2. Drop and Create: crm_prd_id
-- --------------------------------------------------------
IF OBJECT_ID('bronze.crm_prd_id', 'U') IS NOT NULL
    DROP TABLE bronze.crm_prd_id;
CREATE TABLE bronze.crm_prd_id(
    prd_id INT,                            -- Product ID
    prd_key NVARCHAR(50),                  -- Product Key
    prd_nm NVARCHAR(50),                   -- Product Name
    prd_cost INT,                          -- Product Cost
    prd_line NVARCHAR(50),                 -- Product Line
    prd_start_dt DATE,                     -- Product Start Date
    prd_end_dt DATE                        -- Product End Date
);

-- --------------------------------------------------------
-- 3. Drop and Create: crm_sales_details
-- --------------------------------------------------------
IF OBJECT_ID('bronze.crm_sales_details', 'U') IS NOT NULL
    DROP TABLE bronze.crm_sales_details;
CREATE TABLE bronze.crm_sales_details (
    sls_ord_num NVARCHAR(50),              -- Sales Order Number
    sls_prd_key NVARCHAR(50),              -- Sales Product Key
    sls_cust_id INT,                       -- Customer ID (Foreign Key)
    sls_order_dt INT,                      -- Order Date
    sls_ship_dt INT,                       -- Shipping Date
    sls_due_dt INT,                        -- Due Date
    sls_sales INT,                         -- Sales Amount
    sls_quantity INT,                      -- Quantity Sold
    sls_price INT                          -- Sales Price
);

-- --------------------------------------------------------
-- 4. Drop and Create: erp_cust
-- --------------------------------------------------------
IF OBJECT_ID('bronze.erp_cust', 'U') IS NOT NULL
    DROP TABLE bronze.erp_cust;
CREATE TABLE bronze.erp_cust (
    CID NVARCHAR(50),                      -- Customer ID
    BDATE DATE,                            -- Birthdate
    GEN NVARCHAR(50)                       -- Gender
);

-- --------------------------------------------------------
-- 5. Drop and Create: erp_loc
-- --------------------------------------------------------
IF OBJECT_ID('bronze.erp_loc', 'U') IS NOT NULL
    DROP TABLE bronze.erp_loc;
CREATE TABLE bronze.erp_loc (
    CID NVARCHAR(50),                      -- Customer ID
    CNTRY NVARCHAR(50)                     -- Country
);

-- --------------------------------------------------------
-- 6. Drop and Create: erp_px_cat
-- --------------------------------------------------------
IF OBJECT_ID('bronze.erp_px_cat', 'U') IS NOT NULL
    DROP TABLE bronze.erp_px_cat;
CREATE TABLE bronze.erp_px_cat (
    ID NVARCHAR(50),                       -- Product Category ID
    CAT NVARCHAR(50),                      -- Category
    SUBCAT NVARCHAR(50),                   -- Sub-category
    MAINTENANCE NVARCHAR(50)               -- Maintenance Information
);

-- ========================================================
--               END OF SCRIPT
-- ========================================================
