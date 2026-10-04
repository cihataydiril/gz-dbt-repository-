select
    s.products_id,
    s.date_date,
    s.orders_id,
    s.revenue,
    CAST(s.quantity as int64) as quantity,
    CAST(p.purchase_price as float64) as purchase_price,
    (CAST(s.quantity as int64) * CAST(p.purchase_price as float64)) as satin_alma_maliyeti,
    ROUND((s.revenue - (CAST(s.quantity as int64) * CAST(p.purchase_price as float64))), 2) as marj
from {{ref('stg_raw__sales')}} s
left join {{ref('stg_raw__product')}} p
    on s.products_id = p.products_id
