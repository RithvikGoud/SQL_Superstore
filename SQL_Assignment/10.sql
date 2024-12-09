--How do sales and profits vary across different sub-categories within each product category?
SELECT 
    `Category`,
    `Sub-Category`,
    SUM(Sales) AS total_sales,
    SUM(Profit) AS total_profit
FROM 
    `Sample - Superstore_Orders`
GROUP BY 
    `Category`, `Sub-Category`
ORDER BY 
    `Category`, `Sub-Category`;
