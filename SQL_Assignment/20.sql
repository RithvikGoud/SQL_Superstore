select 
	segment,region,sum(sales) as total_sales,sum(profit) as profit 
from
	`Sample - Superstore_Orders`
where 
	segment in ('Corporate','Consumer') and region=('West')
group by segment,region