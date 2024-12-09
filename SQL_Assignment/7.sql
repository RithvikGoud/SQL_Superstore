with top_city as(
select 
	o.city,
	CASE 
            WHEN COUNT(DISTINCT o.`Order ID`) = 0 THEN 0
            ELSE COUNT(DISTINCT r.`Order ID`) * 1.0 / COUNT(DISTINCT o.`Order ID`)
        END AS return_rate
from 
	`Sample - Superstore_Orders` as o left join `Sample - Superstore_Returns` as r
on
	o.`order id`=r.`order id`
group by o.city
order by return_rate DESC
limit 1)

select 
    o.`city`,
    o.`product name`,
    COUNT(r.`Order ID`) AS return_count
from
    `Sample - Superstore_Orders` o
join
    `Sample - Superstore_Returns` r ON o.`Order ID` = r.`Order ID`
join
    top_city t ON o.`City` = t.`City`
group by
    o.`City`,
    o.`Product Name`
order by
    return_count DESC;

