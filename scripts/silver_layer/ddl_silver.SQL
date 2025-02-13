
IF OBJECT_ID ('silver.crm_cust_info','U') IS NOT NULL
	DROP TABLE silver.crm_cust_info;
CREATE TABLE silver.crm_cust_info(
	cst_id INT,
	cst_key NVARCHAR(50),
	cst_firstname NVARCHAR(50),
	cst_lastname NVARCHAR(50),
	cst_marital_status NVARCHAR(50),
	cst_gndr NVARCHAR(50),
	cst_create_date DATE,
	dwh_create_date DATETIME2 DEFAULT GETDATE()
);

IF OBJECT_ID ('silver.crm_prd_id','U') IS NOT NULL
	DROP TABLE silver.crm_prd_id;
Create table silver.crm_prd_id(
	prd_id INT,
	cat_id NVARCHAR(50),
	prd_key NVARCHAR(50),
	prd_nm NVARCHAR(50),
	prd_cost INT,
	prd_line NVARCHAR(50),
	prd_start_dt DATE,
	prd_end_dt DATE,
	dwh_create_date DATETIME2 DEFAULT GETDATE()
);

IF OBJECT_ID ('silver.crm_sales_details ','U') IS NOT NULL
	DROP TABLE silver.crm_sales_details ;
CREATE TABLE silver.crm_sales_details (
	sls_ord_num NVARCHAR(50),
	sls_prd_key NVARCHAR(50),
	sls_cust_id INT,
	sls_order_dt DATE,
	sls_ship_dt DATE,
	sls_due_dt DATE,
	sls_sales INT,
	sls_quantity INT,
	sls_price INT,
	dwh_create_date DATETIME2 DEFAULT GETDATE()
);


IF OBJECT_ID ('silver.erp_cust','U') IS NOT NULL
	DROP TABLE silver.erp_cust;
CREATE TABLE silver.erp_cust (
	CID NVARCHAR(50),
	BDATE DATE,
	GEN NVARCHAR(50),
	dwh_create_date DATETIME2 DEFAULT GETDATE()
);

IF OBJECT_ID ('silver.erp_loc ','U') IS NOT NULL
	DROP TABLE silver.erp_loc ;
CREATE TABLE silver.erp_loc (
	CID NVARCHAR(50),
	CNTRY NVARCHAR(50),
	dwh_create_date DATETIME2 DEFAULT GETDATE()
);


IF OBJECT_ID ('silver.erp_px_cat','U') IS NOT NULL
	DROP TABLE silver.erp_px_cat;
CREATE TABLE silver.erp_px_cat (
	ID NVARCHAR(50),
	CAT NVARCHAR(50),
	SUBCAT NVARCHAR(50),
	MAINTENANCE NVARCHAR(50),
	dwh_create_date DATETIME2 DEFAULT GETDATE()
);
