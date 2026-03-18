# Global Sales Data Engineering & Analytics 📊

## Project Overview
This project demonstrates a complete data lifecycle, from designing a relational database in **SQL Server** to implementing automated **ETL processes** and generating business insights through an interactive **Sales Dashboard**. It focuses on analyzing global sales performance (EU and Non-EU regions) for the year 2023.

## 🛠️ Tech Stack
* **Database Management:** SQL Server (T-SQL)
* **ETL Automation:** Stored Procedures & Bulk Insert
* **Data Visualization:** Interactive Dashboards
* **Languages:** SQL

## 🏗️ Data Architecture
The `DataSales` database follows a structured approach using a **Gold Schema** to organize high-quality, reporting-ready data:

* **Fact Tables:** `eu_orders`, `non_eu_orders` (Central transaction data)
* **Dimension Tables:** Customers, Locations, and Products (Contextual data)

### Automated ETL Pipeline
I developed a robust stored procedure, `gold.usp_BulkInsertData`, to streamline the data ingestion process. This pipeline features:
* **Transaction Management:** Ensures data integrity by rolling back if errors occur.
* **Environment Localization:** Configured to handle regional formats (`SET LANGUAGE Spanish`) to avoid decimal and date conversion errors during the bulk load.
* **Scalability:** The procedure is parameterized to load different CSV sources efficiently.

## 📈 Key Insights (2023 Performance)
The final analysis reveals a strong growth year for the company:
* **Revenue Growth:** Total sales reached **$733K**, reflecting a **20.4%** increase Year-Over-Year (YoY).
* **Profitability:** Net profit rose by **12.5%**. The most profitable customer was **Raymond Buch**, contributing **$6,781** in profit.
* **Operational Opportunities:** While sales are high, the **Tables**, **Supplies**, and **Bookcases** subcategories are currently operating at a loss, indicating a need for pricing or logistics optimization.

---

## 🚀 Getting Started
1. Run `innit_database.sql` in your SQL Server instance to create the schema and tables.
2. Update the file paths in `innit_tablesdata.sql` to point to your local CSV data.
3. Execute the script to trigger the automated bulk loading process.

---

## 📂 Repository Structure
```
data-warehouse-project/
│
├── dashboard/                          # Raw datasets used for the Allegheny County tax liens project
│   ├── images/                         # Dashboard images
│   │   └── ...
│   └── Sales Dashboards.twbx           # Tableau Dashboard File
│
├── datasets/                           # Raw datasets used for the project
│   ├── eu/
│   │   ├── Customers.csv
│   │   ├── Location.csv
│   │   ├── Orders.csv   
│   │   └── Products.csv
│   └── non-eu/                         # Dashboard images
│       ├── Customers.csv
│       ├── Location.csv
│       ├── Orders.csv   
│       └── Products.csv
│
├── docs/                               # Project documentation and architecture details
│   └── ...
│
├── scripts/                            # SQL scripts for ETL and transformations
│   ├── innit_database.sql              # Scripts for create database
│   └── innit_tablesdata.sql            # Scripts for load all tables
│
├── README.md                           # Project overview and instructions
├── LICENSE                             # License information for the repository
└── .gitignore
```
---


## 🛡️ License

This project is licensed under the [MIT License](LICENSE). You are free to use, modify, and share this project with proper attribution.

# 👨‍💻 About Me

Hi! I'm **Leandro Gallo**, a **Systems Engineering student** from Argentina with a strong interest in:

- Data Engineering
- Data Analytics
- Backend Development
- Cybersecurity
- Software Development

I enjoy building **data pipelines, automation tools, and data-driven systems**, and I am currently developing projects to strengthen my skills in **data architecture, SQL development, and analytics**.

This repository is part of my **technical portfolio**, where I showcase projects related to:

- Data Warehousing
- ETL Pipelines
- Data Modeling
- Analytics

---

# 🔗 Connect With Me

📧 Email  
leandrogallo698@gmail.com

![SQL Server](https://img.shields.io/badge/SQL%20Server-CC2927?style=for-the-badge&logo=microsoftsqlserver&logoColor=white)
![ETL Pipeline](https://img.shields.io/badge/ETL-Pipeline-blue?style=for-the-badge)
![Data Engineering](https://img.shields.io/badge/Data%20Engineering-FF6F00?style=for-the-badge)
![Data Analytics](https://img.shields.io/badge/Data%20Analytics-4CAF50?style=for-the-badge)
![Star Schema](https://img.shields.io/badge/Star%20Schema-Model-purple?style=for-the-badge)
![Medallion Architecture](https://img.shields.io/badge/Medallion%20Architecture-Bronze%20Silver%20Gold-orange?style=for-the-badge)
![Git](https://img.shields.io/badge/Git-Version%20Control-F05032?style=for-the-badge&logo=git&logoColor=white)
![GitHub](https://img.shields.io/badge/GitHub-Repository-181717?style=for-the-badge&logo=github)
