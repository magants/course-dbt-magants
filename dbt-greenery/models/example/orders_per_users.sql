/*
    count the # of orders for each user
*/

{{ config(materialized='table') }}

WITH soure_data as (SELECT
    
    SELECT count(order_id) AS order_count,
    user_id
    FROM {{ source('tutorial','orders') }}
    group by user_id

)

SELECT *
FROM soure_data
