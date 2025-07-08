-- 1. List all products
SELECT * FROM products;

-- 2. Total units sold per product
SELECT product_id, SUM(quantity) AS total_sold
FROM sales
GROUP BY product_id;

-- 3. Top 5 best-selling products
SELECT product_id, SUM(quantity) AS total_sales
FROM sales
GROUP BY product_id
ORDER BY total_sales DESC
LIMIT 5;

-- 4. Products low in stock
SELECT * FROM inventory WHERE quantity < 50;

-- 5. Revenue per product
SELECT product_id, SUM(quantity * price) AS revenue
FROM sales
GROUP BY product_id;

-- 6. Average daily sales per product
SELECT product_id, AVG(quantity) AS avg_daily_sales
FROM sales
GROUP BY product_id;

-- 7. Monthly sales per store
SELECT store_id, MONTH(sale_date) AS month, SUM(quantity * price) AS total_sales
FROM sales
GROUP BY store_id, MONTH(sale_date);

-- 8. Most returned products
SELECT product_id, COUNT(*) AS returns
FROM returns
GROUP BY product_id
ORDER BY returns DESC;

-- 9. Sales by category
SELECT category, SUM(quantity * price) AS revenue
FROM products p
JOIN sales s ON p.id = s.product_id
GROUP BY category;

-- 10. Stockout incidents per store
SELECT store_id, COUNT(*) AS stockouts
FROM inventory_logs
WHERE status = 'stockout'
GROUP BY store_id;