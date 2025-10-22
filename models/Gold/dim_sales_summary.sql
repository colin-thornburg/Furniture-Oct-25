{{ config(
    materialized='table',
    database=env_var('DBT_ENV_LAYER', 'dev_') ~ 'gold',
    tags=['gold', 'dimension']
) }}

select
    c.customer_id,
    c.customer_name,
    c.region,
    c.industry,
    count(distinct o.order_id) as total_orders,
    sum(o.total_amount) as total_revenue,
    avg(o.total_amount) as avg_order_value
from {{ ref('silver_customers') }} c
left join {{ ref('silver_orders') }} o
    on c.customer_id = o.customer_id
group by
    c.customer_id,
    c.customer_name,
    c.region,
    c.industry