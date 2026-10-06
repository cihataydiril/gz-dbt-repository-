{{ config(materialized='view') }}

select
    f.date_date as date,
    f.operasyonel_marj - c.ads_cost as ads_margin,
    f.average_basket,
    f.operasyonel_marj as operational_margin,
    c.ads_cost,
    c.ads_impression,
    c.ads_clicks,
    f.quantity,
    f.revenue,
    f.satin_alma_maliyeti as purchase_cost,
    f.marj as margin,
    f.nakliye_ucreti as shipping_fee,
    f.log_maliyeti as log_cost,
    f.nakliye_maliyeti as ship_cost
from {{ ref('int_campaigns_day') }} as c
left join {{ ref('finance_days') }} as f
    on c.date_date = f.date_date
order by date