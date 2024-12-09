with reg_pro_sales_all as(
select 
	region,`product name`,sum(sales) as total_sales
from 
	`Sample - Superstore_Orders` 
group by 
	region,`product name`
),
top_10_rank as (
select 
	region,`product name`,total_sales,row_number() over(PARTITION by region order by total_sales desc) as rank
from 
	reg_pro_sales_all
)

select 
	region,`product name`,total_sales
from 
	top_10_rank
where 
	rank<=10 
order by 
	region,total_sales desc
