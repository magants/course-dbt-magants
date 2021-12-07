{{ 
    config(
        materialized='table'
    )
}}

select (select 
count(session_id)
from dbt_magants.stg_events
where event_type='checkout') as count_checkouts