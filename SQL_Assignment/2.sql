select 
	`customer name`,avg(sales) as avg_sales,(count(r.Returned)/count(o.`order id`))*1.0 as return_rate
from
	`Sample - Superstore_Orders` as o left join `Sample - Superstore_Returns` as r on o.`order id`=r.`order id`
group by 
	`customer name`
order by 
	avg_sales desc

