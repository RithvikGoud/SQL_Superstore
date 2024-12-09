WITH OrderReturnStatus AS (
    SELECT
        o.`Order ID`,
        o.`Region`,
        o.`Segment`,
        o.`Sales`,
        o.`Profit`,
        CASE 
            WHEN r.`Returned` = 'Yes' THEN 'Returned'
            ELSE 'Not Returned'
        END AS return_status
    FROM
        `Sample - Superstore_Orders` o
    LEFT JOIN
        `Sample - Superstore_Returns` r
    ON
        o.`Order ID` = r.`Order ID`
),
AggregatedMetrics AS (
    SELECT
        `Region`,
        `Segment`,
        `return_status`,
        SUM(`Sales`) AS total_sales,
        SUM(`Profit`) AS total_profit,
        COUNT(DISTINCT `Order ID`) AS order_count
    FROM
        OrderReturnStatus
    GROUP BY
        `Region`,
        `Segment`,
        `return_status`
)
SELECT
    `Region`,
    `Segment`,
    `return_status`,
    total_sales,
    total_profit,
    order_count,
    total_sales * 1.0 / order_count AS avg_sales_per_order,
    total_profit * 1.0 / order_count AS avg_profit_per_order
FROM
    AggregatedMetrics
ORDER BY
    `Region`,
    `Segment`,
    `return_status`;
