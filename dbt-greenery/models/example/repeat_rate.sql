
/*
    count the # of users with more than one order / total users
*/

{{ config(materialized='table') }}

WITH source_data as (

SELECT
sum(CASE WHEN order_count > 1 THEN 1 END) as repeat_users,
sum(CASE WHEN order_count = 1 THEN 1 END) as single_order_users,
sum(1) as total_users
FROM dbt_magants.orders_per_user

)

SELECT
repeat_users,
single_order_users,
total_users
FROM source_data