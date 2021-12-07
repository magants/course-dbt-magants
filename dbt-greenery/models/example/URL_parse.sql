SELECT
    split_part(page_url, '/', 5) as product_guid
FROM dbt.dbt_magants.stg_events