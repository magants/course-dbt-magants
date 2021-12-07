
select (select 
count(session_id)
from dbt_magants.stg_events
where event_type='checkout') as count_checkouts,

(select 
count(id)
from dbt_magants.stg_events) as count_ids,

to_char(
    (select 
count(session_id)
from dbt_magants.stg_events
where event_type='checkout')/
(select 
count(id)
from dbt_magants.stg_events),'999.9999') as conversion_rate