{{ config(
    materialized='table',
    database=env_var('DBT_ENV_LAYER', 'dev_') ~ 'gold',
    tags=['gold', 'fact']
) }}

select
    o.order_id,
    o.customer_id,
    c.customer_name,
    c.region,
    c.industry,
    o.order_date,
    o.total_amount,
    o.status
from {{ ref('silver_orders') }} o
left join {{ ref('silver_customers') }} c
    on o.customer_id = c.customer_id