{{ config(
    materialized='view',
    tags=['bronze']
) }}

select
    customer_id,
    customer_name,
    region,
    industry,
    current_timestamp() as ingested_at
from {{ ref('raw_customers') }}