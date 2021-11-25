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
dbt_magants.stg_orders o,
dbt_magants.stg_order_items oi,
dbt_magants.int_users iu,
dbt_magants.stg_addresses a,
dbt_magants.stg_products p

WHERE o.order_id = oi.order_id
AND o.user_id = iu.user_id
AND o.address_id=a.address_id
AND oi.product_id=p.product_id