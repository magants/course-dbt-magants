{{
  config(
    materialized='table'
  )
}}

SELECT
 
 SELECT
  user_id,
  full_name,
  email,
  phone_number,
  address,
  zipcode,
  state,
  country
FROM {{ ref('int_users') }}