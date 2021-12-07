{{ 
    config(
        materialized='table'
    )
}}

select (select 
count(id)
from dbt_magants.stg_events) as count_event_ids