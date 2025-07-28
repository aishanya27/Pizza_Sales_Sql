-- Determine the top 3 most ordered pizza types based on revenue for each pizza category.

select category, name, revenue, rank_number from 
(select category, name, revenue, rank() over (partition by category order by revenue desc) as rank_number
from
(select pt.category,pt.name, sum(od.quantity*p.price) as revenue 
from pizza_types as pt join pizzas as p 
on pt.pizza_type_id=p.pizza_type_id 
join order_details as od on p.pizza_id=od.pizza_id 
group by pt.category,pt.name) as a) as b
where rank_number <=3