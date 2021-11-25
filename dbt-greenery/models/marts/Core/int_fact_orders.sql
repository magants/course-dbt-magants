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
    p.name as product_name,
    p.price,
    p.quantity,
    pr.promo_id,
    pr.discout,
    pr.status as promo_status,
    o.order_cost,
    o.shipping_cost,
    o.order_total,
    o.tracking_id,
    o.shipping_service,
    o.estimated_delivery_at,
    o.delivered_at,
    o.status as order_status
 
FROM 
{{ ref('stg_orders') }} o,
{{ ref('stg_order_items') }} oi,
{{ ref('int_users') }} iu,
{{ ref('stg_addresses') }} a,
{{ ref('stg_products') }} p,
{{ ref('stg_promos') }} pr

WHERE o.order_id = oi.order_id
AND o.user_id = iu.user_id
AND o.address_id=a.address_id
AND oi.product_id=p.product_id
AND o.promo_id=pr.promo_id