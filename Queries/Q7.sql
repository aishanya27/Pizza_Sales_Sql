-- Determine the distribution of orders by hour of the day.

SELECT 
    HOUR(order_time) AS hour, COUNT(order_id) AS total_order
FROM
    orders
GROUP BY HOUR(order_time)