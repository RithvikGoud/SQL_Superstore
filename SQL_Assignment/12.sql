--What is the average order value and profit per customer segment for each quarter of the year?
SELECT segment,
    substr(`Order Date`, 8, 4) AS year,
    CASE 
		WHEN substr(`Order Date`, 4, 3) in ('Jan','Feb','Mar') THEN 'Q1'
        WHEN substr(`Order Date`, 4, 3) in ('Apr','May','Jun') THEN 'Q2'
        WHEN substr(`Order Date`, 4, 3) in ('Jul','Aug','Sep') THEN 'Q3'
        WHEN substr(`Order Date`, 4, 3) in ('Oct','Nov','Dec') THEN 'Q4'
        ELSE '00'
    END AS quarter,
	avg(Sales) AS avg_order_value, 
	avg(profit) as avg_profit
from 
	`Sample - Superstore_Orders` 
group by segment,year,quarter
ORDER BY 
    `Segment`, year, quarter;
