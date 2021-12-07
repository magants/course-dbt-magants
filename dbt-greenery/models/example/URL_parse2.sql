
--select count(*) from dbt_magants.stg_events
--where session_id in (

SELECT
      split_part(page_url, '/', 5) as product_guid,
      count(split_part(page_url, '/', 5)) as count_guid
      
      FROM dbt.dbt_magants.stg_events
WHERE event_type='add_to_cart'
group by page_url
order by product_guid desc






