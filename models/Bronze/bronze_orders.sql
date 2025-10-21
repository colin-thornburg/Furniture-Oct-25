{{ config(
    materialized='view',
    tags=['bronze'],
    meta={
        'layer': 'bronze'
    }
) }}

select
    order_id,
    customer_id,
    order_date,
    total_amount,
    status,
    current_timestamp() as ingested_at
from {{ ref('raw_orders') }}