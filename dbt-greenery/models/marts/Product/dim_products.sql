{{
  config(
    materialized='table'
  )
}}

SELECT
    product_id,
    name,
    price,
    quantity as product_in_stock
FROM {{ref('stg_products')}}
