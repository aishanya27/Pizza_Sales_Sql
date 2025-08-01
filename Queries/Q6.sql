-- Join the necessary tables to find the total quantity of each pizza category ordered
SELECT 
    pizza_types.category, SUM(order_details.quantity) as total_quantity
FROM
    pizza_types 
        JOIN
    pizzas on pizza_types.pizza_type_id = pizzas.pizza_type_id
        JOIN
    order_details ON pizzas.pizza_id = order_details.pizza_id
GROUP BY pizza_types.category