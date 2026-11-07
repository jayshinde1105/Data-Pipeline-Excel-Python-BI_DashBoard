SHOW databases;
USE ecommerce;
select * from orders;

-- Total Orders
SELECT COUNT(*) AS Total_Orders 
FROM  orders;

-- Tota Seles
SELECT SUM(net_amount) AS Total_Seles
FROM  orders;

-- Top Products
SELECT product,SUM(net_amount) AS sales
FROM  orders
GROUP BY  product
ORDER BY sales DESC;

-- Top Cities
SELECT city,SUM(net_amount) AS sales
FROM  orders
GROUP BY city
ORDER BY sales DESC;

-- Monthly Sales
SELECT month , SUM(net_amount) AS sales
FROM  orders
GROUP BY month;

-- Higesth Profit Products
SELECT product,SUM(net_amount) AS profit
FROM  orders
GROUP BY product
ORDER BY product DESC;

-- Payment Mode Distribution
SELECT payment_mode, COUNT(*) AS total_orders
FROM  orders
GROUP BY payment_mode;

-- Cancelled Orders
SELECT *
FROM  orders
WHERE order_status = 'Cancelled';