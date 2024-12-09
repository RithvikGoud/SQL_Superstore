select 
	o.region,o.`customer name`,count(r.Returned) as total_returns
from 
	`Sample - Superstore_Orders` as o join `Sample - Superstore_Returns` as r
	on	
		o.`order id`=r.`order id`
	group by 
		region
		




