    select count(user_id)
    from dbt_magants.dim_users
    group by user_id
    having count(user_id) > 1