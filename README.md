# Data-Pipeline-Excel-Python-BI_DashBoard
End-to-end data pipeline: Cleans and validates raw Excel datasets using Python (Pandas), stages structured records into a relational SQL database, and serves interactive executive dashboards via Power BI.

# Step 1: Raw Unclean Data Ingestion (Excel File)
Source File: raw_data.xlsx

Input State: Raw, unstructured transactional spreadsheet.

Core Issues Addressed:

Missing & Null Values: Blank cells across vital analytical attributes (e.g., Customer IDs, Order Dates, Revenue values).

Data Type Mismatches: Dates stored as general text strings; numeric revenue/prices concatenated with currency symbols ($, ₹, commas).

Inconsistent Formatting: Unstandardized text casings (e.g., mixed "North", "north", "NORTH " with trailing whitespace).

Duplicate & Redundant Rows: Multiple logged instances of identical order IDs due to manual entry errors.

Invalid Outliers: Impossible values such as negative prices or delivery dates preceding purchase dates.

Step 2: Programmatic Data Cleansing & Transformation (Python File)
Script File: cleaning_pipeline.py

Core Libraries: pandas, numpy, openpyxl, sqlalchemy

Transformation Operations:

Automated File Extraction: Loaded the multi-sheet Excel workbook using pd.read_excel() into an in-memory Pandas DataFrame.

Schema Standardization: Stripped leading/trailing whitespaces from column headers and normalized naming conventions to lowercase snake_case (snake_case).

Data Type Casting:

Converted text dates into uniform ISO datetime64[ns] objects using pd.to_datetime().

Cleaned numeric columns by stripping non-numeric characters using regex and casting to float64 / int64.

Imputation & Deduplication:

Executed .drop_duplicates(subset=['order_id']) to retain only unique transactions.

Evaluated null patterns: filled non-critical categorical nulls with 'Unknown' and numeric nulls with median/mean values where appropriate, dropping corrupt rows lacking primary identifiers.

Feature Engineering: Derived operational attributes, such as delivery_duration_days (delivery_date - order_date) and categorical buckets (e.g., revenue_tier).

Step 3: Cleaned Dataset Generation (Clean Excel / CSV File)
Output File: cleaned_data.xlsx (or cleaned_data.csv)

Output State: Fully normalized, rectangular, production-ready dataset.

Integrity Characteristics:

Strict Data Types: Every single column strictly adheres to uniform scalar types (integers, floats, dates, strings).

Referential Completeness: 100% complete key identifiers with zero duplicate entries.

Standardized Casing: Unified categorical strings enabling accurate aggregations without grouping fragmentation.

Audit Readiness: Serves as a validated, clean flat-file snapshot ready for relational storage or analytical consumption.

Step 4: Relational Database Staging & Querying (SQL Query Layer)
Database Engine: PostgreSQL / MySQL / SQL Server

Script / Query File: schema_and_queries.sql

Database Operations:

Schema Definition (DDL): Created a structured relational table enforcing constraints (PRIMARY KEY, NOT NULL, proper column data types).

Automated Ingestion: Streamed the cleaned data directly into the SQL table using pandas.DataFrame.to_sql() with SQLAlchemy connection pooling.

Analytical View Creation (SQL Queries): Rather than querying the raw table directly in Power BI, created optimized SQL Views and aggregations:

Handled business logic directly inside the database engine using window functions (ROW_NUMBER(), RANK()) and date aggregations (GROUP BY DATE_TRUNC(...)).

Prepared pre-joined, indexing-optimized views to minimize memory footprint and compute load on the visualization tool.

Step 5: Analytical Dashboarding & Business Intelligence (Power BI)
Output File: sales_performance_report.pbix

Connection Mode: Database Connector (DirectQuery or Scheduled Import from SQL)

Visualization & Modeling Architecture:

Data Model (Star Schema): Structured the imported SQL views into clear Fact and Dimension tables connected via 1-to-many relationships.

DAX Measures Formulation: Authored calculated measures to drive dynamic business metrics:

Total Revenue: SUM(Fact_Sales[Revenue])

YoY Revenue Growth %: DIVIDE([Total Revenue] - [Revenue LY], [Revenue LY], 0)

Average Order Value (AOV): DIVIDE([Total Revenue], [Total Orders], 0)

Executive Interface Design: Built an interactive dashboard featuring:

KPI Scorecards: Instant high-level snapshot of total revenue, orders, and fulfillment rate.

Time-Series Charts: Monthly/quarterly revenue progression with historical comparisons.

Categorical Breakdowns: Heatmaps and bar charts detailing top-performing regions, products, and customer segments.

Interactive Slicers: Date range selectors, geographic filters, and status toggles allowing cross-filtering across all visual elements.

