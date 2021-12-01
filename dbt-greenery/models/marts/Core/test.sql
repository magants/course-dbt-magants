SELECT
    session_id,
        {% FOR event_type IN event_types %}
        count(CASE WHEN event_type = '{{event_type}}' THEN 1 END) as {{event_type}}_count,
        {% ENDFOR %}

    FROM {{ ref('stg_events') }}
    GROUP BY 1