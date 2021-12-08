{% set event_ids = dbt_utils.get_column_values(
        table=ref('stg_events'),
        column='event_id',
        order_by='event_id'
) %}