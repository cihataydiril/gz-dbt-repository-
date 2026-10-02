SELECT
    orders_id,
    date_date,
    ROUND(SUM(revenue), 2) AS revenue,
    SUM(quantity) AS quantity,
    ROUND(SUM(satin_alma_maliyeti), 2) AS satin_alma_maliyeti,
    ROUND(SUM(marj), 2) AS marj
FROM {{ref('int_sales_margin')}}
GROUP BY orders_id, date_date