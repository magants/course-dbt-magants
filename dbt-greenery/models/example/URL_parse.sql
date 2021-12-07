
--select count(*) from dbt_magants.stg_events
--where session_id in (

SELECT
      split_part(page_url, '/', 5) as product_guid,
      count(split_part(page_url, '/', 5)) as tot_count_guid,
      (select count(split_part(page_url, '/', 5))
       FROM dbt.dbt_magants.stg_events
       WHERE event_type='add_to_cart'
       ) as tot_count_guid

      FROM dbt.dbt_magants.stg_events
group by page_url
order by product_guid desc



--WHERE event_type='add_to_cart'






