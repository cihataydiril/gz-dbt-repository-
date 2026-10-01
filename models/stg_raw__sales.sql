with

source as (

    select * from {{ source('raw', 'sales') }}

),

renamed as (

    select
        * except(pdt_id),
        pdt_id as products_id
    from source

)

select * from renamed