Queries :=
1. Revenue per customer
  SELECT customer_id, SUM(price) AS total_revenue
FROM orders_revenue
GROUP BY customer_id
ORDER BY total_revenue DESC;

2. Top 10% revenue contribution
  WITH ranked AS (
    SELECT *,
           ROW_NUMBER() OVER (ORDER BY total_revenue DESC) AS rank,
           COUNT(*) OVER () AS total_customers
    FROM customer_revenue
)
SELECT 
    SUM(total_revenue) * 100.0 / (SELECT SUM(total_revenue) FROM customer_revenue) AS revenue_percentage
FROM ranked
WHERE rank <= total_customers * 0.1;

3. Repeat vs one-time customers
SELECT
    COUNT(*) AS total_customers,
    SUM(CASE WHEN order_count = 1 THEN 1 ELSE 0 END) AS one_time,
    SUM(CASE WHEN order_count > 1 THEN 1 ELSE 0 END) AS repeat_customers
FROM (
    SELECT customer_id, COUNT(order_id) AS order_count
    FROM orders_revenue
    GROUP BY customer_id
) t;
