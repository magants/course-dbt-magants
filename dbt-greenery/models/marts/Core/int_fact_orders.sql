{{
  config(
    materialized='table'
  )
}}

SELECT
    o.order_id,
    iu.full_name,
    o.promo_id,
    o.address_id
    o.order_cost,
    o.shipping_cost,
    o.order_total,
    o.tracking_id,
    o.shipping_service,
    o.estimated_delivery_at,
    o.delivered_at,
    o.status 
FROM 
{{ ref('stg_orders') }} o
LEFT JOIN {{ ref('int_users') }} oi
  ON o.user_id = ui.user_id,

LEFT JOIN {{ ref('stg_order_items') }} oi
  ON o.order_id = oi.order_id,