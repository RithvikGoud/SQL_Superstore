with Correlation_formula as (
    Select
        `sub-category`,
        count(*) as n,
        sum(`quantity`) as total_quantity,
        sum((profit / sales) * 100) AS profit_margin,
        sum(`quantity` * (profit / sales) * 100) AS quantity_mul_profit_margin,
        sum(`quantity` * `quantity`) AS quantity_square,
        sum(((profit / sales) * 100) * ((profit / sales) * 100)) AS profit_margin_square
    from
        `Sample - Superstore_Orders`
    group by
        `sub-category`
)
select
    `sub-category`,
	total_quantity,
	profit_margin,
    (n * quantity_mul_profit_margin - total_quantity * profit_margin) / 
    sqrt((n * quantity_square - total_quantity * total_quantity) * (n * profit_margin_square - profit_margin * profit_margin)) AS correlation_quantity_profit_margin
from
    Correlation_formula
order by 
    correlation_quantity_profit_margin DESC;
