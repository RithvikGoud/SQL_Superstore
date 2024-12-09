with top_customers as(
select 
	`customer id`,
	`customer name`,sum(sales) as total_sales
from 
	`Sample - Superstore_Orders`
group by 
	`customer name`
order by 
	total_sales DESC
limit 5
)
select
	o.`customer id`,
    o.`customer name`,
	substr(`Order Date`, 4, 8) AS year_month,
    SUM(o.`Sales`) AS monthly_sales
from
    `Sample - Superstore_Orders` o
join
    top_customers t ON o.`customer id` = t.`customer id`
group by
    o.`customer id`,o.`customer name`,year_month

