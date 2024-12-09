select 
	category,sum(sales) as total_sales,sum(profit) as total_profit,count(r.Returned)
from
	`Sample - Superstore_Orders` as o join `Sample - Superstore_Returns` as r on o.`order id`=r.`order id`
where
	category in ('Furniture','Technology')
group by category