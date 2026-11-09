# Data-Pipeline-Excel-Python-BI_DashBoard
End-to-end data pipeline: Cleans and validates raw Excel datasets using Python (Pandas), stages structured records into a relational SQL database, and serves interactive executive dashboards via Power BI.

# Step 1: Raw Unclean Data Ingestion (Excel File)
Source File: Ecommerce_Unclean_Data.xlsx
Input State: Raw, unstructured transactional spreadsheet.
Core Issues Addressed:
Missing & Null Values: Blank cells across vital analytical attributes (e.g., Customer IDs, Order Dates, Revenue values).

# Step 2: Programmatic Data Cleansing & Transformation (Python File)
Script File: python_code_Ecommerce.ipynb
Core Libraries: pandas, numpy, openpyxl, sqlalchemy
Transformation Operations:
Automated File Extraction: Loaded the multi-sheet Excel workbook using pd.read_excel() into an in-memory Pandas DataFrame.

# Step 3: Cleaned Dataset Generation (Clean Excel / CSV File)
Output File: Clean_Ecommerce.xlsx
Output State: Fully normalized, rectangular, production-ready dataset.
Integrity Characteristics:
Strict Data Types: Every single column strictly adheres to uniform scalar types (integers, floats, dates, strings).

# Step 4: Relational Database Staging & Querying
Database Engine: MySQL Workbench
Script / Query File: ecommerce SQL.sql

# Step 5: Analytical Dashboarding & Business Intelligence (Power BI)
Output File: ecommerce power bi dashboard2.pbix
Connection Mode: Database Connector (DirectQuery or Scheduled Import from SQL)
Visualization & Modeling Architecture:
Data Model (Star Schema): Structured the imported SQL views into clear Fact and Dimension tables connected via 1-to-many relationships.
DAX Measures Formulation: Authored calculated measures to drive dynamic business metrics:
Time-Series Charts: Monthly/quarterly revenue progression with historical comparisons.

Categorical Breakdowns: Heatmaps and bar charts detailing top-performing regions, products, and customer segments.

Interactive Slicers: Date range selectors, geographic filters, and status toggles allowing cross-filtering across all visual elements.

