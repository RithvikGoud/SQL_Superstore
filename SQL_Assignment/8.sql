select 
	`ship mode`,`segment`,`region`,sum(profit) as total_profit
from 
	`Sample - Superstore_Orders`
group by 
	`ship mode`,`segment`,`region`
order by 
	`ship mode`,`segment`,`region`

