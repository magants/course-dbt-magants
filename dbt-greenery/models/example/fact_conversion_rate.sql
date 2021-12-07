-- # of sessions that had a checkout event / total # of unique sessions

WITH
    sessions_with_checkout AS (
        SELECT
            session_id,
            MAX(CASE WHEN event_type='checkout' THEN 1 ELSE 0 END) has_checkout
        FROM {{ref('stg_events')}}
        GROUP BY session_id
)
SELECT
    SUM(has_checkout)::numeric / COUNT(session_id) as conv_rate
FROM sessions_with_checkout