SELECT current_database();

CREATE TABLE staging_superstore (
    "order.id" TEXT,
    "order.date" DATE,
    "ship.date" DATE,
    "customer.id" TEXT,
    "customer.name" TEXT,
    segment TEXT,
    "product.id" TEXT,
    "product.name" TEXT,
    category TEXT,
    "sub.category" TEXT,
    sales NUMERIC,
    quantity INT,
    discount NUMERIC,
    profit NUMERIC,
    region TEXT,
    city TEXT,
    country TEXT,
    market TEXT
);
SELECT COUNT(*) FROM staging_superstore;

SELECT *
FROM staging_superstore
LIMIT 5;

SELECT 
    SUM(sales) AS total_sales
FROM staging_superstore;

SELECT 
    category,
    SUM(sales) AS total_sales
FROM staging_superstore
GROUP BY category
ORDER BY total_sales DESC;

SELECT 
    category,
    SUM(sales) AS sales,
    SUM(profit) AS profit
FROM staging_superstore
GROUP BY category
ORDER BY profit;

SELECT 
    category,
    SUM(profit) / NULLIF(SUM(sales), 0) AS profit_margin
FROM staging_superstore
GROUP BY category
ORDER BY profit_margin DESC;

SELECT 
    EXTRACT(YEAR FROM "order.date") AS year,
    SUM(sales) AS total_sales
FROM staging_superstore
GROUP BY year
ORDER BY year;

SELECT 
    region,
    SUM(sales) AS total_sales
FROM staging_superstore
GROUP BY region
ORDER BY total_sales DESC;

SELECT 
    "product.name",
    SUM(sales) AS total_sales
FROM staging_superstore
GROUP BY "1product.name"
ORDER BY total_sales DESC
LIMIT 10;

SELECT 
    segment,
    COUNT(DISTINCT "customer.id") AS customers,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM staging_superstore
GROUP BY segment
ORDER BY total_sales DESC;

SELECT 
    segment,
    SUM(sales) / COUNT(DISTINCT "customer.id") AS avg_sales_per_customer
FROM staging_superstore
GROUP BY segment
ORDER BY avg_sales_per_customer DESC;

SELECT 
    "customer.id",
    "customer.name",
    SUM(profit) AS total_profit
FROM staging_superstore
GROUP BY "customer.id", "customer.name"
HAVING SUM(profit) < 0
ORDER BY total_profit;

SELECT 
    segment,
    SUM(profit) / NULLIF(SUM(sales), 0) AS profit_margin
FROM staging_superstore
GROUP BY segment
ORDER BY profit_margin;

SELECT 
    "customer.name",
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM staging_superstore
GROUP BY "customer.name"
ORDER BY total_sales DESC
LIMIT 10;

CREATE VIEW vw_kpi_overview AS
SELECT
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    COUNT(DISTINCT "customer.id") AS total_customers,
    COUNT(DISTINCT "order.id") AS total_orders
FROM staging_superstore;

CREATE VIEW vw_sales_by_category AS
SELECT
    category,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    SUM(profit) / NULLIF(SUM(sales), 0) AS profit_margin
FROM staging_superstore
GROUP BY category;

CREATE VIEW vw_sales_by_segment AS
SELECT
    segment,
    COUNT(DISTINCT "customer.id") AS customers,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM staging_superstore
GROUP BY segment;

CREATE VIEW vw_sales_over_time AS
SELECT
    DATE_TRUNC('month', "order.date") AS month,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM staging_superstore
GROUP BY month;


