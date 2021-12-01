{{
  config(
    materialized='table'
  )
}}

SELECT
    full_name,
    COUNT(1) as num_orders
FROM {{ref('dim_users')}}
JOIN {{ref('fact_orders')}}
        USING (full_name)
GROUP BY full_name