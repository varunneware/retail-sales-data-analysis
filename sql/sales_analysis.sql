-- Total sales and total profit
SELECT
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit
FROM orders;
<br>
-- Total number of orders
SELECT
    COUNT(DISTINCT "Order ID") AS total_orders
FROM orders;
<br>
-- Category-wise sales and profit
SELECT
    Category,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit
FROM orders
GROUP BY Category
ORDER BY total_sales DESC;
<br>
-- Sub-category performance
SELECT
    "Sub-Category",
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit
FROM orders
GROUP BY "Sub-Category"
ORDER BY total_profit ASC;
<br>
-- Monthly sales trend
SELECT
    strftime('%Y-%m', "Order Date") AS month,
    ROUND(SUM(Sales), 2) AS monthly_sales
FROM orders
GROUP BY month
ORDER BY month;
<br>
-- Region-wise performance
SELECT
    Region,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit
FROM orders
GROUP BY Region
ORDER BY total_profit DESC;
<br>
-- Profit margin by region
SELECT
    Region,
    ROUND((SUM(Profit) * 100.0) / SUM(Sales), 2) AS profit_margin_pct
FROM orders
GROUP BY Region
ORDER BY profit_margin_pct DESC;
<br>
-- Top 10 profitable products
SELECT
    "Product Name",
    ROUND(SUM(Profit), 2) AS total_profit
FROM orders
GROUP BY "Product Name"
ORDER BY total_profit DESC
LIMIT 10;
<br>
-- Discount impact on profit
SELECT
    Discount,
    ROUND(SUM(Profit), 2) AS total_profit
FROM orders
GROUP BY Discount
ORDER BY Discount;
<br>
-- Segment-wise sales and profit
SELECT
    Segment,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit
FROM orders
GROUP BY Segment
ORDER BY total_profit DESC;
