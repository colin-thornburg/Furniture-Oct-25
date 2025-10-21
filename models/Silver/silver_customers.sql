{{ config(
    materialized='view',
    tags=['silver']
) }}

select
    customer_id,
    upper(trim(customer_name)) as customer_name,
    upper(trim(region)) as region,
    upper(trim(industry)) as industry
from {{ ref('bronze_customers') }}
where customer_id is not null