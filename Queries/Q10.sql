-- Determine the top 3 most ordered pizza types based on revenue.

SELECT 
    pizza_types.name, ROUND(SUM(pizzas.price * order_details.quantity), 2) AS revenue
FROM
    pizzas 
        JOIN
    order_details ON pizzas.pizza_id = order_details.pizza_id
        JOIN
    pizza_types ON pizzas.pizza_type_id = pizza_types.pizza_type_id
GROUP BY pizza_types.name
ORDER BY revenue DESC
LIMIT 3