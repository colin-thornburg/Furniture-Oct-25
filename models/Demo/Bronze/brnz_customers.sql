{{
    config(
        materialized='table'
    )
}}


select
    customer_id,
    customer_name as cust_nm,
    region,
    industry,
    current_timestamp() as ingested_at
from {{ ref('raw_customers') }}