{{ config(
    materialized='view',
    database=env_var('DBT_ENV_LAYER', 'dev_') ~ 'bronze',
    tags=['bronze'],
    meta={
        'layer': 'bronze'
    }
) }}

select
    item_id,
    order_id,
    product_type,
    quantity,
    unit_price,
    current_timestamp() as ingested_at
from {{ ref('raw_order_items') }}