Week 2 answers;

Week 1 answers;

1. Post to #projects - GitHub repo - https://github.com/magants/course-dbt-magants
2. Tag both code review partners..

3;
    * How many users do we have? 130
        select count(distinct(user_id)) FROM users 

    * On average, how many orders do we receive per hour? 8.51

        with order_time_lapse AS
        (
        select count(order_id) order_count,
        max(created_at) - min(created_at) max_min
        from orders
        )

        select order_count / (extract(hour from max_min) + (extract(day from max_min)*24)) orders_per_hour
        from order_time_lapse

    * On average, how long does an order take from being placed to being delivered? 3 days, 22 hrs, 13 mins & 10 secs

        select avg(delivered_at-created_at) from orders

    * How many users have only made one purchase? Two purchases? Three
    + purchases? 1-25, 2-22, >=3-81

        select count(order_id), user_id
        from orders
        group by user_id
        having count(order_id)=:Number_of_purchases

    * On average, how many unique sessions do we have per hour?
    0.113956959775789366 - 1108 sessions in 405 days & 3 hours (9,723 hours)

    with session_time_lapse AS
    (
    select count(distinct session_id) count,
       max(created_at) - min(created_at) max_min
    from events
    )

    select count / (extract(hour from max_min)+(extract(day from max_min)*24))
    from session_time_lapse
