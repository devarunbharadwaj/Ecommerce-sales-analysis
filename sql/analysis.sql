-- ===============================
-- 1. Revenue per customer
-- ===============================
SELECT 
    customer_id,
    SUM(price) AS total_revenue
FROM orders_revenue
GROUP BY customer_id
ORDER BY total_revenue DESC;


-- ===============================
-- 2. Top 10% revenue contribution (Pareto Analysis)
-- ===============================
WITH customer_revenue AS (
    SELECT 
        customer_id,
        SUM(price) AS total_revenue
    FROM orders_revenue
    GROUP BY customer_id
),
ranked AS (
    SELECT 
        *,
        ROW_NUMBER() OVER (ORDER BY total_revenue DESC) AS rank,
        COUNT(*) OVER () AS total_customers
    FROM customer_revenue
)
SELECT 
    SUM(total_revenue) * 100.0 / 
    (SELECT SUM(total_revenue) FROM customer_revenue) AS revenue_percentage
FROM ranked
WHERE rank <= total_customers * 0.1;


-- ===============================
-- 3. Customer Retention Analysis
-- ===============================
WITH customer_orders AS (
    SELECT 
        customer_id,
        COUNT(order_id) AS order_count
    FROM orders_revenue
    GROUP BY customer_id
)
SELECT 
    COUNT(*) AS total_customers,
    SUM(CASE WHEN order_count = 1 THEN 1 ELSE 0 END) AS one_time_customers,
    SUM(CASE WHEN order_count > 1 THEN 1 ELSE 0 END) AS repeat_customers,
    ROUND(
        SUM(CASE WHEN order_count > 1 THEN 1 ELSE 0 END) * 100.0 
        / COUNT(*), 2
    ) AS repeat_percentage
FROM customer_orders;


-- ===============================
-- 4. Monthly Revenue Trend
-- ===============================
SELECT 
    DATE_TRUNC('month', order_purchase_timestamp) AS month,
    SUM(price) AS monthly_revenue,
    COUNT(order_id) AS total_orders
FROM orders_revenue
GROUP BY month
ORDER BY month;


-- ===============================
-- 5. Delivery Time Impact on Revenue
-- ===============================
SELECT 
    delivery_bucket,
    COUNT(order_id) AS total_orders,
    AVG(price) AS avg_order_value
FROM orders_revenue
GROUP BY delivery_bucket
ORDER BY avg_order_value DESC;


-- ===============================
-- 6. High Value vs Low Value Customers
-- ===============================
WITH customer_revenue AS (
    SELECT 
        customer_id,
        SUM(price) AS total_revenue
    FROM orders_revenue
    GROUP BY customer_id
)
SELECT 
    CASE 
        WHEN total_revenue > 500 THEN 'High Value'
        WHEN total_revenue BETWEEN 200 AND 500 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS customer_segment,
    COUNT(*) AS num_customers,
    AVG(total_revenue) AS avg_revenue
FROM customer_revenue
GROUP BY customer_segment
ORDER BY avg_revenue DESC;
