{{
  config(
    materialized='table'
  )
}}

SELECT
  u.user_id,
  u.email,
  u.first_name,
  u.last_name,
  p.status,
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
LEFT JOIN {{ ref('stg_promos') }} p
  ON u.id = p.id