
SELECT * FROM silver.crm_cust_info
INSERT INTO silver.crm_cust_info (
	cst_id,
	cst_key,
	cst_firstname,
	cst_lastname,
	cst_marital_status,
	cst_gndr,
	cst_create_date)

SELECT
cst_id,
cst_key,
TRIM(cst_firstname) AS cst_firstname,
TRIM(cst_lastname) AS cst_lastname,
CASE WHEN UPPER(TRIM(cst_marital_status)) = 'S' THEN 'Single'
	WHEN UPPER(TRIM(cst_marital_status)) = 'M' THEN 'Married'
	ELSE 'N/A'
END AS cst_marital_status,
CASE WHEN UPPER(TRIM(cst_gndr)) = 'F' THEN 'Female'
	WHEN UPPER(TRIM(cst_gndr)) = 'M' THEN 'Male'
	ELSE 'N/A'
END AS cst_gndr,
cst_create_date
FROM ( SELECT *,
ROW_NUMBER() OVER (PARTITION BY cst_id ORDER BY cst_create_date DESC) AS flag_last
FROM bronze.crm_cust_info)T
WHERE flag_last = 1

INSERT INTO Silver.crm_prd_id (
	prd_id,
	cat_id,
	prd_key,
	prd_nm,
	prd_cost,
	prd_line ,
	prd_start_dt ,
	prd_end_dt
)

SELECT
	prd_id,
	REPLACE(SUBSTRING(prd_key,1,5), '-','_') AS cat_id  ,
	SUBSTRING(prd_key,7,LEN(prd_key)) AS prd_key,
	prd_nm ,
	ISNULL(prd_cost,0) AS prd_cost,
	CASE UPPER(TRIM(prd_line))
		WHEN 'M' THEN 'Mountain'
		WHEN 'R' THEN 'Road'
		WHEN 'S' THEN 'Other sales'
		WHEN 'T' THEN 'Touring'
		ELSE 'N/A'
	END AS prd_line,
	prd_start_dt,
	prd_end_dt
FROM bronze.crm_prd_id


INSERT INTO silver.crm_sales_details (
	sls_ord_num,
	sls_prd_key,
	sls_cust_id,
	sls_order_dt,
	sls_ship_dt,
	sls_due_dt,
	sls_sales,
	sls_quantity,
	sls_price
)

SELECT
sls_ord_num ,
sls_prd_key ,
sls_cust_id,
CASE WHEN sls_order_dt = 0 or LEN(sls_order_dt)!=8 THEN NULL
	 ELSE CAST(CAST(sls_order_dt AS NVARCHAR)AS DATE)
END AS sls_order_dt,
CASE WHEN sls_ship_dt = 0 or LEN(sls_ship_dt)!=8 THEN NULL
	 ELSE CAST(CAST(sls_ship_dt AS NVARCHAR)AS DATE)
END AS sls_due_dt,
CASE WHEN sls_due_dt = 0 or LEN(sls_due_dt)!=8 THEN NULL
	 ELSE CAST(CAST(sls_due_dt AS NVARCHAR)AS DATE)
END AS sls_due_dt,

CASE WHEN sls_sales != sls_quantity * sls_price OR sls_sales <= 0 OR sls_sales IS NULL 
THEN sls_quantity * ABS(sls_price)
ELSE sls_sales
END AS New_sls_sales,

sls_quantity,

CASE WHEN sls_price IS NULL OR sls_price <= 0
THEN sls_sales / sls_quantity
ELSE sls_price
END AS new_sls_price

FROM bronze.crm_sales_details


INSERT INTO silver.erp_cust (CID,BDATE,GEN)
SELECT 
CASE WHEN CID LIKE 'NAS%' THEN SUBSTRING(CID,4,LEN(CID))
	 ELSE CID
END CID,
CASE WHEN BDATE > GETDATE() THEN NULL
		ELSE BDATE
END AS BDATE,
CASE WHEN GEN IS NULL OR GEN = '' THEN 'N/A'
	 WHEN GEN = 'M' THEN 'Male'
   	 WHEN GEN = 'F' THEN 'Female'
ELSE GEN 
END AS GEN
FROM bronze.erp_cust

INSERT INTO silver.erp_loc (CID, CNTRY)
SELECT 
REPLACE ( CID , '-','') AS CID,
	CASE 
	WHEN CNTRY IN ('US','USA') THEN 'United States'
	WHEN CNTRY = 'DE' THEN 'Germany'
	WHEN CNTRY = '' OR CNTRY IS NULL THEN 'N/A'
	ELSE CNTRY
	END AS CNTRY
FROM bronze.erp_loc


INSERT INTO silver.erp_px_cat 
(ID,
CAT,
SUBCAT,
MAINTENANCE)

SELECT ID,
CAT,
SUBCAT,
MAINTENANCE
FROM bronze.erp_px_cat 
