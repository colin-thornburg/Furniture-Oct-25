{{ config(
    materialized='table',
    database=env_var('DBT_ENV_LAYER', 'dev_') ~ 'gold',
    tags=['gold', 'fact']
) }}

select
    oi.item_id,
    oi.order_id,
    c.customer_name,
    oi.product_type,
    oi.quantity,
    oi.unit_price,
    oi.line_total
from {{ ref('silver_order_items') }} oi
left join {{ ref('silver_orders') }} o
    on oi.order_id = o.order_id
left join {{ ref('silver_customers') }} c
    on o.customer_id = c.customer_id