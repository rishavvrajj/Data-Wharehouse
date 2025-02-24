# Data Warehouse Project

This repository contains SQL scripts and datasets for building a **Data Warehouse** using a **Bronze, Silver, and Gold** layered architecture. The project is designed to handle structured data, providing a robust pipeline for data ingestion, transformation, and analytics.

## 📂 Project Structure

```
Data-Warehouse/
│── Datasets/                  # Contains sample datasets
│── docs/                      # Documentation folder
│── scripts/                   # SQL scripts for data processing
│   │── bronze_layer/          # Raw data layer
│   │   ├── ddl_bronze.SQL
│   │   ├── pron_load_bronze.SQL
│   │── silver_layer/          # Cleansed and transformed data layer
│   │   ├── pron_load_silver.SQL
│   │── gold_layer/            # Aggregated and analytics-ready data layer
│   │   ├── ddl_gold.sql
│   ├── init_database.sql      # Script to initialize the database
│   ├── placeholder/           # Placeholder directory
│── tests/                     # Test cases for validation
│   ├── LICENSE
│   ├── README.md
```

## 🏗 Layers in Data Warehouse

1. **Bronze Layer**:
   - Stores raw, unprocessed data.
   - Contains `ddl_bronze.SQL` for defining tables.
   - `pron_load_bronze.SQL` handles data ingestion.

2. **Silver Layer**:
   - Cleansed and enriched data.
   - `pron_load_silver.SQL` transforms data from the Bronze layer.

3. **Gold Layer**:
   - Analytics-ready, aggregated data.
   - `ddl_gold.sql` contains schema definitions for final tables.

## 🔧 Setup and Usage

### Prerequisites
- Install **Microsoft SQL Server**.
- Install **SQL Server Management Studio (SSMS)** for database management.
- Ensure you have administrative access to create and modify databases.

### Steps to Run the Project

1. **Clone the repository:**
   ```sh
   git clone https://github.com/rishavrajji/Data-Warehouse.git
   cd Data-Warehouse
   ```

2. **Set up the database:**
   Open **SQL Server Management Studio (SSMS)** and execute the following script:
   ```sql
   USE master;
   GO
   CREATE DATABASE DataWarehouse;
   GO
   ```

3. **Run data processing scripts:**
   - Load raw data:  
     ```sql
     USE DataWarehouse;
     GO
     :r scripts/bronze_layer/pron_load_bronze.SQL
     ```
   - Transform data in Silver layer:
     ```sql
     USE DataWarehouse;
     GO
     :r scripts/silver_layer/pron_load_silver.SQL
     ```
   - Create final analytics-ready tables:
     ```sql
     USE DataWarehouse;
     GO
     :r scripts/gold_layer/ddl_gold.sql
     ```

## 🛠 Technologies Used
- **Microsoft SQL Server** – Database Management
- **T-SQL (Transact-SQL)** – Data Processing and Transformation
- **Git & GitHub** – Version Control

## 📜 License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## 🤝 Contribution

We welcome contributions! Please follow these steps:
1. **Fork the repository**
2. **Create a new branch** (`feature-branch`)
3. **Commit your changes**
4. **Push to your branch**
5. **Create a pull request**

For any issues, please open a ticket in the **Issues** section.

---

📌 **Author**: Rishav Raj  
📌 **GitHub**: [rishavrajji](https://github.com/rishavrajji) 🚀
