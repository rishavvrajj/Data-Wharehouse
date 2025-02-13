-- ========================================================
--               DROP AND CREATE TABLES SCRIPT (Silver)
-- ========================================================

-- --------------------------------------------------------
-- 1. Drop and Create: crm_cust_info
-- --------------------------------------------------------
IF OBJECT_ID('silver.crm_cust_info', 'U') IS NOT NULL
    DROP TABLE silver.crm_cust_info;

CREATE TABLE silver.crm_cust_info (
    cst_id INT,                            -- Customer ID
    cst_key NVARCHAR(50),                  -- Customer Key
    cst_firstname NVARCHAR(50),            -- First Name
    cst_lastname NVARCHAR(50),             -- Last Name
    cst_marital_status NVARCHAR(50),       -- Marital Status
    cst_gndr NVARCHAR(50),                 -- Gender
    cst_create_date DATE,                  -- Account Creation Date
    dwh_create_date DATETIME2 DEFAULT GETDATE()  -- Data Warehouse Creation Date
);

-- --------------------------------------------------------
-- 2. Drop and Create: crm_prd_id
-- --------------------------------------------------------
IF OBJECT_ID('silver.crm_prd_id', 'U') IS NOT NULL
    DROP TABLE silver.crm_prd_id;

CREATE TABLE silver.crm_prd_id (
    prd_id INT,                            -- Product ID
    cat_id NVARCHAR(50),                   -- Category ID
    prd_key NVARCHAR(50),                  -- Product Key
    prd_nm NVARCHAR(50),                   -- Product Name
    prd_cost INT,                          -- Product Cost
    prd_line NVARCHAR(50),                 -- Product Line
    prd_start_dt DATE,                     -- Product Start Date
    prd_end_dt DATE,                       -- Product End Date
    dwh_create_date DATETIME2 DEFAULT GETDATE()  -- Data Warehouse Creation Date
);

-- --------------------------------------------------------
-- 3. Drop and Create: crm_sales_details
-- --------------------------------------------------------
IF OBJECT_ID('silver.crm_sales_details', 'U') IS NOT NULL
    DROP TABLE silver.crm_sales_details;

CREATE TABLE silver.crm_sales_details (
    sls_ord_num NVARCHAR(50),              -- Sales Order Number
    sls_prd_key NVARCHAR(50),              -- Sales Product Key
    sls_cust_id INT,                       -- Customer ID (Foreign Key)
    sls_order_dt DATE,                     -- Order Date
    sls_ship_dt DATE,                      -- Shipping Date
    sls_due_dt DATE,                       -- Due Date
    sls_sales INT,                         -- Sales Amount
    sls_quantity INT,                      -- Quantity Sold
    sls_price INT,                         -- Sales Price
    dwh_create_date DATETIME2 DEFAULT GETDATE()  -- Data Warehouse Creation Date
);

-- --------------------------------------------------------
-- 4. Drop and Create: erp_cust
-- --------------------------------------------------------
IF OBJECT_ID('silver.erp_cust', 'U') IS NOT NULL
    DROP TABLE silver.erp_cust;

CREATE TABLE silver.erp_cust (
    CID NVARCHAR(50),                      -- Customer ID
    BDATE DATE,                            -- Birthdate
    GEN NVARCHAR(50),                      -- Gender
    dwh_create_date DATETIME2 DEFAULT GETDATE()  -- Data Warehouse Creation Date
);

-- --------------------------------------------------------
-- 5. Drop and Create: erp_loc
-- --------------------------------------------------------
IF OBJECT_ID('silver.erp_loc', 'U') IS NOT NULL
    DROP TABLE silver.erp_loc;

CREATE TABLE silver.erp_loc (
    CID NVARCHAR(50),                      -- Customer ID
    CNTRY NVARCHAR(50),                    -- Country
    dwh_create_date DATETIME2 DEFAULT GETDATE()  -- Data Warehouse Creation Date
);

-- --------------------------------------------------------
-- 6. Drop and Create: erp_px_cat
-- --------------------------------------------------------
IF OBJECT_ID('silver.erp_px_cat', 'U') IS NOT NULL
    DROP TABLE silver.erp_px_cat;

CREATE TABLE silver.erp_px_cat (
    ID NVARCHAR(50),                       -- Product Category ID
    CAT NVARCHAR(50),                      -- Category
    SUBCAT NVARCHAR(50),                   -- Sub-category
    MAINTENANCE NVARCHAR(50),              -- Maintenance Information
    dwh_create_date DATETIME2 DEFAULT GETDATE()  -- Data Warehouse Creation Date
);

-- ========================================================
--               END OF SCRIPT (Silver)
-- ========================================================
