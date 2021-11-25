{{
  config(
    materialized='table'
  )
}}

SELECT
    o.order_id,
    oi.product_id,
    iu.full_name,
    o.promo_id,
    --o.address_id,
    o.order_cost,
    o.shipping_cost,
    o.order_total,
    o.tracking_id,
    o.shipping_service,
    o.estimated_delivery_at,
    o.delivered_at,
    o.status 
FROM 
{{ ref('stg_orders') }} o,
{{ ref('stg_orders_items') }} oi,
{{ ref('int_users') }} iu

WHERE o.order_id = oi.order_id
AND o.user_id = iu.user_id