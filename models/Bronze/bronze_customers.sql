{{
    config(
        materialized='view',
        schema='customer',
        database=env_var('DBT_ENV_LAYER', 'dev_') ~ 'bronze'
    )
}}

select
    customer_id,
    customer_name,
    region,
    industry,
    current_timestamp() as ingested_at
from {{ ref('raw_customers') }}