# Consumer Goods Sales & Profitability Analysis
## Project Overview

This project analyzes sales performance, customer segments, and profitability drivers in a Consumer Goods context using a SQL + Power BI workflow.
The objective is to move beyond descriptive dashboards and identify what drives revenue, margin, and profitability differences across products and customer segments.

## Business Questions

The analysis focuses on three core questions:

-How is the business performing overall?

-Which customer segments drive revenue and value?

-Where is profitability created or lost, and why?

### Tools & Technologies

-PostgreSQL – data storage and transformation

-SQL – aggregation logic and analytical views

-Power BI – data modeling, DAX measures, and visualization

-DAX – KPIs and dynamic insights

### Data Source

-Superstore dataset (Consumer Goods transactional data)

-Data was transformed into analytical SQL views to support efficient reporting and KPI calculation.

### Data Modeling Approach

Instead of loading raw transactional data directly into Power BI, the model uses SQL views to:

-Aggregate sales, profit, customers, and orders

-Separate concerns by analysis level (overview, segment, category)

-Ensure consistent metric definitions

### Key views:

-vw_kpi_overview

-vw_sales_by_segment

-vw_sales_by_category

## Dashboard Structure
### Page 1 – Executive Overview

Provides a high-level snapshot of business performance:

Total Sales, Profit, Customers, and Orders

-Sales and Profit by Category

-Key insight highlighting category-level performance differences

### Page 2 – Customer Segments

Focuses on who generates revenue and value:

-Customer distribution by segment

-Sales contribution by segment

-Average Sales per Customer

-Dynamic insight comparing volume-driven vs value-driven segments

### Page 3 – Profitability Drivers

Diagnoses why profitability varies:

-Profit Margin %, Margin Variability, and efficiency KPIs

-Profit Margin by Category

-Sales vs Profit Margin comparison

-Identification of low-margin categories impacting overall performance

Key Insights

-Revenue concentration does not always align with profitability.

-Customer segments differ significantly in value generation per customer.

-Profitability is driven more by margin dispersion across categories than by sales volume alone.

-Improving low-margin categories would have a greater impact than scaling already efficient ones.

## Key Skills Demonstrated

-Business-oriented data analysis

-SQL-based data modeling

-KPI design with DAX

-Insight-driven dashboard storytelling

-Analytical thinking aligned with real business questions
