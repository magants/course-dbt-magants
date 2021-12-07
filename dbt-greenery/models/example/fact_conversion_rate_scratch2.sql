/*{{ 
    config(
        materialized='table'
    )
}}

SELECT 
    count_checkouts
FROM {{ ref('count_checkouts')}}

/

SELECT 
    count_event_ids
FROM {{ ref('count_event_ids')}}*/