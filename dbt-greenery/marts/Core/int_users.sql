    id,
    user_id,
    first_name,
    last_name,
    email,
    phone_number,
    created_at,
    updated_at,
    address_id
FROM {{ source('tutorial', 'users') }}



{{
  config(
    materialized='table'
  )
}}

    address_id

SELECT
  u.user_id,
  u.first_name ||' '||u.last_name as full_name,
  u.email,
  phone_number,
  p.status,
  --address
  CASE
    WHEN p.status = 1 THEN 'Inactive'
    WHEN p.status = 2 THEN 'Inactive'
    WHEN p.status = 3 THEN 'Active'
    WHEN p.status = 4 THEN 'Inactive'
    WHEN p.status = 5 THEN 'Inactive'
    WHEN p.status = 6 THEN 'Inactive'
    ELSE 'Other'
  END AS status_label,
  p.promo_id AS promo_id
FROM {{ ref('stg_users') }} u
-- take out promosLEFT JOIN {{ ref('stg_promos') }} p
  ON u.id = p.id