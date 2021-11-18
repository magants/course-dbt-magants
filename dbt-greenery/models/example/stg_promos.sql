{{
  config(
    materialized='table'
  )
}}

SELECT 
    id,
    promo_id,
    discout,
    status
FROM {{ source('tutorial', 'promos') }}