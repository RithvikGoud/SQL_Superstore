select
	segment,substr(`order date`,-4) as year,substr(`order date` ,4,3) as month,count(`order id`) as total_orders
from
    `Sample - Superstore_Orders`
group by 
	segment,year,month
order by segment,year,month