-- Group the orders by date and calculate the average number of pizzas ordered per day.

SELECT 
    ROUND(AVG(total_quantity), 2) AS avg_quantity_perday
FROM
    (SELECT 
        orders.order_date AS date, SUM(order_details.quantity) AS total_quantity
    FROM
        orders 
    JOIN order_details  ON orders.order_id = order_details.order_id
    GROUP BY orders.order_date) AS order_per_day