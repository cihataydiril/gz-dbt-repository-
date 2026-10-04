SELECT
    date_date,
    COUNT(orders_id) AS nb_transactions,
    ROUND(SUM(revenue), 2) AS revenue,
    ROUND(SUM(revenue) / NULLIF(COUNT(orders_id), 0), 2) AS average_basket,
    ROUND(SUM(marj), 2) AS marj,
    ROUND(SUM(satin_alma_maliyeti), 2) AS satin_alma_maliyeti,
    ROUND(SUM(nakliye_ucreti), 2) AS nakliye_ucreti,
    ROUND(SUM(log_maliyeti), 2) AS log_maliyeti,
    ROUND(SUM(nakliye_maliyeti), 2) AS nakliye_maliyeti,
    ROUND(SUM(operasyonel_marj), 2) AS operasyonel_marj,
    SUM(quantity) AS quantity
FROM {{ ref('int_orders_operational') }}
GROUP BY date_date
ORDER BY date_date DESC