{{
  config(
    materialized='table'
  )
}}

SELECT
  u.user_id,
  u.first_name ||' '||u.last_name as full_name,
  u.email,
  phone_number,
  a.address
FROM {{ ref('stg_users') }} u
LEFT JOIN {{ ref('stg_addresses') }} a
  ON u.address_id = a.address_id