{{
  config(
    materialized='table'
  )
}}

SELECT
    total_page_views,
    total_orders,
    total_spend,
    first_order,
    last_order,
    user_name