{{
  config(
    materialized='table'
  )
}}

SELECT
o.order_id,
    oi.product_id,
    iu.full_name,
    iu.phone_number,
    iu.email,
    a.address,
    a.zipcode,
    a.state,
    a.country,
    o.promo_id,
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
{{ ref('stg_order_items') }} oi,
{{ ref('int_users') }} iu,
{{ ref('stg_addresses') }} a

WHERE o.order_id = oi.order_id
AND o.user_id = iu.user_id
AND o.address_id=a.address_id