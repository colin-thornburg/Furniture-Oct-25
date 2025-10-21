{{ config(
    materialized='view',
    tags=['silver']
) }}

select
    order_id,
    customer_id,
    cast(order_date as date) as order_date,
    cast(total_amount as decimal(10, 2)) as total_amount,
    lower(trim(status)) as status
from {{ ref('bronze_orders') }}
where order_id is not null