-- Retrieve the total number of orders placed.
SELECT 
    COUNT(order_id) AS total_orders
FROM
    orders;

-- Calculate the total revenue generated from pizza sales
SELECT 
    ROUND(SUM(o.quantity * p.price), 2) AS revenue
FROM
    pizzas p
        JOIN
    order_details o ON p.pizza_id = o.pizza_id;

-- Identify the highest-priced pizza.
SELECT 
    pt.name, p.price
FROM
    pizzas p
        JOIN
    pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
ORDER BY p.price DESC
LIMIT 1;

-- Identify the most common pizza size ordered.
SELECT 
    p.size, COUNT(o.order_details_id) AS order_count
FROM
    pizzas p
        JOIN
    order_details o ON p.pizza_id = o.pizza_id
GROUP BY p.size
ORDER BY order_count DESC
LIMIT 1;

-- List the top 5 most ordered pizza types along with their quantities
SELECT 
    pt.name, SUM(o.quantity) AS quanities
FROM
    pizza_types pt
        JOIN
    pizzas p ON pt.pizza_type_id = p.pizza_type_id
        JOIN
    order_details o ON p.pizza_id = o.pizza_id
GROUP BY pt.name
ORDER BY quanities DESC
LIMIT 5;