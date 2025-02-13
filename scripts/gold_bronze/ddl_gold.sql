-- ******************************************
-- VIEW CREATION IN 'gold' SCHEMA
-- ******************************************

-- 1. Creating the 'dim_customers' view for customer dimension data
CREATE VIEW gold.dim_customers AS
SELECT	
	-- Assign a unique key to each customer (Customer_Key)
	ROW_NUMBER() OVER (ORDER BY cst_id) AS Customer_Key,
	-- Select customer details from 'crm_cust_info' table
	ci.cst_id AS Customer_id,
	ci.cst_key AS Customer_Number,
	ci.cst_firstname AS First_Name,
	ci.cst_lastname AS Last_Name,
	la.CNTRY AS Country, -- Country from 'erp_loc' table
	ci.cst_marital_status AS Marital_Status,
	-- Gender handling with a fallback value
	CASE 
		WHEN ci.cst_gndr != 'N/A' THEN ci.cst_gndr
		ELSE COALESCE(ca.gen, 'N/A')
	END AS Gender,
	ca.BDATE AS Birth_date, -- Birth date from 'erp_cust' table
	ci.cst_create_date AS Create_date -- Customer creation date
FROM silver.crm_cust_info ci
-- Joining with 'erp_cust' to get customer gender and birth date
LEFT JOIN silver.erp_cust ca ON ci.cst_key = ca.cid
-- Joining with 'erp_loc' to get the country of the customer
LEFT JOIN silver.erp_loc la ON ci.cst_key = la.CID;
GO

-- 2. Creating the 'dim_products' view for product dimension data
CREATE VIEW gold.dim_products AS
SELECT 
	-- Assign a unique key to each product (product_key)
	ROW_NUMBER() OVER (ORDER BY pn.prd_start_dt, pn.prd_key) AS product_key,
	-- Select product details from 'crm_prd_id' table
	pn.prd_id AS product_id,
	pn.prd_key AS product_number,
	pn.prd_nm AS product_name,
	pn.cat_id AS category_id,
	pc.CAT AS category, -- Category from 'erp_px_cat' table
	pc.SUBCAT AS sub_category, -- Sub-category from 'erp_px_cat' table
	pn.prd_cost AS cost,
	pn.prd_line AS product_line,
	pn.prd_start_dt AS start_date -- Product start date
FROM silver.crm_prd_id pn
-- Joining with 'erp_px_cat' to get category and sub-category details
LEFT JOIN silver.erp_px_cat pc ON pn.cat_id = pc.id
-- Filter to only include active products (not ended)
WHERE prd_end_dt IS NULL;
GO

-- 3. Creating the 'fact_sales' view for sales fact data
CREATE VIEW gold.fact_sales AS
SELECT 
	-- Sales details from 'crm_sales_details' table
	sd.sls_ord_num AS order_number,
	pr.product_key, -- Foreign key to 'dim_products'
	cu.Customer_Key, -- Foreign key to 'dim_customers'
	sd.sls_order_dt AS order_date,
	sd.sls_ship_dt AS shipping_date,
	sd.sls_due_dt AS due_date,
	sd.sls_sales AS sales_amount,
	sd.sls_quantity AS quantity,
	sd.sls_price -- Sales price for the product
FROM silver.crm_sales_details sd
-- Joining with the 'dim_products' view to link sales to products
LEFT JOIN gold.dim_products pr ON sd.sls_prd_key = pr.product_number
-- Joining with the 'dim_customers' view to link sales to customers
LEFT JOIN gold.dim_customers cu ON sd.sls_cust_id = cu.Customer_id;
GO

-- ******************************************
-- ADDITIONAL NOTES:
-- 'dim_customers' view: Stores customer details (e.g., ID, name, marital status, country, gender, etc.).
-- 'dim_products' view: Stores product information (e.g., product ID, name, category, cost, etc.).
-- 'fact_sales' view: Stores sales transactions linking to products and customers, including order dates and amounts.
-- ******************************************
