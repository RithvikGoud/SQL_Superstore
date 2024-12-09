--Determine the impact of discounts on sales and profits for orders that were shipped via 'First Class' and 'Standard Class'.
select `ship mode`,discount,sum(sales) as total_sales ,sum(profit) as total_profit
from
	`Sample - Superstore_Orders` 
where 
	`ship mode` in ('First Class','Standard Class')
group by
    `ship mode`, discount
order by 
    `ship mode`, discount