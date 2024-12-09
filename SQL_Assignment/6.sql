select 
	category,sum(profit) as total_profit,sum(sales) as total_sales,avg(discount)*100 as avg_discount
from 
	`Sample - Superstore_Orders` 
group by 
		Category
	order by avg_discount