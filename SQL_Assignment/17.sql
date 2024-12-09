with tol_pro as(
select
	o.region,o.`product name`,sum(o.profit)as total_profit,count(CASE when r.Returned = 'Yes' then 1 END) as return_count
from
    `Sample - Superstore_Orders` as o
left join 
	`Sample - Superstore_Returns` as r
on o.`order id`=r.`order id`
group by region,`product name`),
rank_product as(
select 
	region,`product name`,total_profit,return_count,
	rank() over(PARTITION by region order by total_profit desc) as rank 
from tol_pro)
select region,`product name`,total_profit,return_count from rank_product where rank<=5

