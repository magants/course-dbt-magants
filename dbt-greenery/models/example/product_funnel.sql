with session_bool as  (
    SELECT
        session_id,
        COUNT(case when event_type IS NOT NULL THEN 1 END) as ts,
        COUNT(case when event_type='page_view' THEN 1 END) as pv,
        COUNT(case when event_type='add_to_cart' THEN 1 END) as atc,
        COUNT(case when event_type='checkout' THEN 1 END) as co
    FROM events
    GROUP BY session_id
)

SELECT COUNT(case when (ts>0 or pv>0 or atc>0 or co>0) THEN 1 END) as L1,
       COUNT(case when (pv>0 or atc>0 or co>0) THEN 1 END) as L2,
       COUNT(case when (atc>0 or co>0) THEN 1 END) as L3,
       COUNT(case when (co>0) THEN 1 END) as L4
FROM session_bool