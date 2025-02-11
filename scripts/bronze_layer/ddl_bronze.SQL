
IF OBJECT_ID ('bronze.crm_cust_info','U') IS NOT NULL
	DROP TABLE bronze.crm_cust_info;
CREATE TABLE bronze.crm_cust_info(
	cst_id INT,
	cst_key NVARCHAR(50),
	cst_firstname NVARCHAR(50),
	cst_lastname NVARCHAR(50),
	cst_marital_status NVARCHAR(50),
	cst_gndr NVARCHAR(50),
	cst_create_date DATE
);

IF OBJECT_ID ('bronze.crm_prd_id','U') IS NOT NULL
	DROP TABLE bronze.crm_prd_id;
Create table bronze.crm_prd_id(
	prd_id INT,
	prd_key  NVARCHAR(50),
	prd_nm NVARCHAR(50),
	prd_cost INT,
	prd_line NVARCHAR(50),
	prd_start_dt DATE,
	prd_end_dt DATE,
);

IF OBJECT_ID ('bronze.crm_sales_details ','U') IS NOT NULL
	DROP TABLE bronze.crm_sales_details ;
CREATE TABLE bronze.crm_sales_details (
	sls_ord_num NVARCHAR(50),
	sls_prd_key NVARCHAR(50),
	sls_cust_id INT,
	sls_order_dt INT,
	sls_ship_dt INT,
	sls_due_dt INT,
	sls_sales INT,
	sls_quantity INT,
	sls_price INT,
);

IF OBJECT_ID ('bronze.erp_cust','U') IS NOT NULL
	DROP TABLE bronze.erp_cust;
CREATE TABLE bronze.erp_cust (
	CID NVARCHAR(50),
	BDATE DATE,
	GEN NVARCHAR(50),
);

IF OBJECT_ID ('bronze.erp_loc ','U') IS NOT NULL
	DROP TABLE bronze.erp_loc ;
CREATE TABLE bronze.erp_loc (
	CID NVARCHAR(50),
	CNTRY NVARCHAR(50),
);


IF OBJECT_ID ('bronze.erp_px_cat','U') IS NOT NULL
	DROP TABLE bronze.erp_px_cat;
CREATE TABLE bronze.erp_px_cat (
	ID NVARCHAR(50),
	CAT NVARCHAR(50),
	SUBCAT NVARCHAR(50),
	MAINTENANCE NVARCHAR(50),
);
