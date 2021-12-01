{{ 
    config(
        materialized='table'
    )
}}

{% set event_types = ["add_to_cart", "checkout", "page_view", "delete_from_cart", "account_created", "package_shipped"] %}


    SELECT
    session_id,
        {% FOR event_type IN event_types %}
        count(CASE WHEN event_type = '{{event_type}}' THEN 1 END) as {{event_type}}_count,
        {% ENDFOR %}

    FROM {{ ref('stg_events') }}
    GROUP BY 1