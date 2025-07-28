-- Calculate the percentage contribution of each pizza type to total revenue.

SELECT 
    pizza_types.category,
    ROUND(SUM(order_details.quantity * pizzas.price) * 100 / (SELECT 
                    SUM(order_details.quantity * pizzas.price)
                FROM
                    order_details 
                        JOIN
                    pizzas ON order_details.pizza_id = pizzas.pizza_id),
            2) AS percenatage_share 
FROM
    pizza_types 
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
        JOIN
    order_details ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.category