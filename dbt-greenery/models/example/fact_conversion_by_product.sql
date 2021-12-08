-- sessions w/ add_to_cart for product_x & checkout / sessions w/ add_to_cart for product_x

WITH
    sessions_with_checkout AS (
        SELECT
            session_id,
            MAX(CASE WHEN event_type='checkout' THEN 1 ELSE 0 END) has_checkout
        FROM {{ref('stg_events')}}
        GROUP BY session_id
)
, sessions_with_product AS (
    SELECT
        session_id,
        split_part(page_url, '/', 5) as product_id
    FROM {{ref('stg_events')}}
    WHERE event_type='add_to_cart'
    GROUP BY session_id, product_id
)

SELECT
    product_id,
    SUM(has_checkout)::numeric / COUNT(sp.session_id) as conv_rate
FROM sessions_with_product AS sp
LEFT JOIN sessions_with_checkout
    USING (session_id)
GROUP BY product_id