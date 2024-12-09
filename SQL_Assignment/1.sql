select 
	region,sum(profit) as tota_profit,count(Returned) as return 
from 
	`Sample - Superstore_Orders` as o left join `Sample - Superstore_Returns` as r on o.`order id`=r.`order id` 
group by 
	region