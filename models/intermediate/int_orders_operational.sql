SELECT
    o.orders_id,
    o.date_date,
    o.revenue,
    o.quantity,
    o.satin_alma_maliyeti,
    o.marj,
    s.shipping_fee AS nakliye_ucreti,
    s.logCost AS log_maliyeti,
    s.ship_cost AS nakliye_maliyeti,
    ROUND((o.marj + s.shipping_fee - s.logCost - s.ship_cost), 2) AS operasyonel_marj
FROM {{ ref('int_orders_margin') }} o
LEFT JOIN {{ ref('stg_raw__ship') }} s
ON o.orders_id = s.orders_id