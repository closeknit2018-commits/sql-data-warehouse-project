# SQL Data Warehouse Project

**Complete End-to-End SQL Data Warehouse** built by a beginner Data Engineer student at **Nackademin** (Yrkeshögskola), Sweden.

After completing courses in **SQL** and **Database Design and Modeling**, I developed this project to apply real-world data warehousing concepts.

### 🎯 Project Overview
This project implements a full **Medallion Architecture** (Bronze → Silver → Gold) using Microsoft SQL Server.

**Key Features:**
- Full **ETL processes** across all layers
- Dimensional modeling with **Star Schema**
- Well-designed **Fact** and **Dimension tables**
- Clean, analytics-ready **Gold layer** for business reporting and BI tools

### 🛠 Technologies Used
- Microsoft SQL Server
- T-SQL
- Medallion Architecture (Bronze → Silver → Gold)
- Star Schema Data Modeling

### 📁 Repository Structure
sql-data-warehouse-project/
├── datasets/                  # Source and raw datasets
├── data_flow/                 # Data flow documentation and diagrams
├── script/
│   ├── bronze/                # Scripts for extracting and loading raw data
│   ├── silver/                # Scripts for cleaning and transforming data
│   ├── gold/                  # Scripts for creating analytical models
│   ├── tests/                 # Test scripts and quality files
└── README.md                  # Project overview and instructions

### 🚀 How to Run the Project
1. Clone the repository:
   ```bash
   git clone https://github.com/closeknit2018-commits/sql-data-warehouse-project.git

   Open SQL Server Management Studio (SSMS).
Execute the scripts in the script/ folder in this order:
DDL_bronze.sql
proc_bronze.sql
DDL_silver.sql
proc_silver.sql
DDL_gold.sql


🙋 About Me
I’m a new Data Engineer student at Nackademin in Stockholm.
This repository is part of my learning journey and portfolio to showcase practical skills in building a modern data warehouse.
Feedback and suggestions are very welcome!

⭐ If this project helps you, feel free to give it a star!
Made with ❤️ by a Nackademin Data Engineer Student
