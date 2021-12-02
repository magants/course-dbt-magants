{{ 
    config(
        materialized='table'
    )
}}

{%
    set event_types = ['add_to_cart','checkout','page_view','delete_from_cart','account_created','package_shipped']
%}


    select
    session_id,
    created_at,
    user_id
    {% for event_type in event_types %},
    sum(CASE WHEN event_type = '{{event_type}}' THEN 1 ELSE 0 END) as {{event_type}}_count
    {% endfor %}

    FROM {{ ref('stg_events') }}
    GROUP BY 1,2,3