-- Analyze the cumulative revenue generated over time.

select order_date, round(sum(revenue) 
over (order by order_date),2) as cum_revenue 
from (select o.order_date, round(sum(p.price*od.quantity),2) as revenue 
from orders as o
join order_details as od on o.order_id=od.order_id 
join pizzas as p on p.pizza_id=od.pizza_id
group by o.order_date) as sales