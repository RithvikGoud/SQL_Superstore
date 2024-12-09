WITH ReturnStatus AS (
    SELECT
        `Product Name`,
        CASE WHEN SUM(CASE WHEN `Returned` = 'Yes' THEN 1 ELSE 0 END) > 0 THEN 'Returned' ELSE 'Not Returned' END AS return_status
    FROM
        `Sample - Superstore_Orders` as s  left join `Sample - Superstore_Returns` as r  on s.`order id`=r.`order id`
    GROUP BY
        `Product Name`
),
SalesPerformance AS (
    SELECT
        r.return_status,
        SUM(s.`Sales`) AS total_sales,
        COUNT(DISTINCT s.`Order ID`) AS order_count,
        AVG(s.`Sales`) AS avg_sales_per_order
    FROM
        `Sample - Superstore_Orders` s
    JOIN
        ReturnStatus r
    ON
        s.`Product Name` = r.`Product Name`
    GROUP BY
        r.return_status
)
SELECT
    return_status,
    total_sales,
    order_count,
    avg_sales_per_order
FROM
    SalesPerformance
ORDER BY
    return_status;

    