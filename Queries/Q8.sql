-- Join relevant tables to find the category-wise distribution of pizzas.

SELECT 
    category, COUNT(category) AS total_count
FROM
    pizza_types
GROUP BY category