with latest_year as(
select 
	max(cast(substr(`order date`,-4)as int)) as max_year 
from 
	`Sample - Superstore_Orders`
),
filter_data as ( 
select 
	substr(`order date`,-4) as year,substr(`order date`,4,3) as month,region,segment,sum(sales) as total_sales 
from 
	`Sample - Superstore_Orders`,latest_year
where cast(substr(`order date`,-4)as int) between latest_year.max_year - 2 and latest_year.max_year
group by
	year,month,region,segment
)
select *
from 
	filter_data
order by 
    year DESC;