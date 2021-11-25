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
dbt_magants.stg_orders o,
dbt_magants.stg_order_items oi,
dbt_magants.int_users iu

WHERE o.order_id = oi.order_id
AND o.user_id = iu.user_id