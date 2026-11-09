select
    _row,
    date_date,
    cost,
    _fivetran_synced
from {{ source('fvt_gsheet', 'gwz_finance_campaign') }}