{{
  config(
    materialized='table'
  )
}}

WITH products_source AS (
  SELECT *
  FROM {{ source('tutorial', 'products') }}
  )

, renamed_products as (
  SELECT 
    id,
    product_id,
    name,
    price,
    quantity
FROM products_source
)

select * from renamed_products