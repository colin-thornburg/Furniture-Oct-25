{{ config(
    materialized='view',
    tags=['silver']
) }}

select
    item_id,
    order_id,
    upper(trim(product_type)) as product_type,
    cast(quantity as integer) as quantity,
    cast(unit_price as decimal(10, 2)) as unit_price,
    cast(quantity as integer) * cast(unit_price as decimal(10, 2)) as line_total
from {{ ref('bronze_order_items') }}
where item_id is not null