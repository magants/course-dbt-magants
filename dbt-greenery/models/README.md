Week 2 answers;

* What is our user repeat rate?

    - Repeat Rate = Users who purchased 2 or more times / users who purchased

* What are good indicators of a user who will likely purchase again? What about indicators of users who are likely NOT to purchase again? If you had more data, what features would you want to look into to answer this question?

    - NOTE: This is a hypothetical question vs. something we can analyze in our Greenery data set. Think about what exploratory analysis you would do to approach this question.

* More stakeholders are coming to us for data, which is great! But we need to get some more models created before we can help. Create a marts folder, so we can organize our models, with the following subfolders for business units:

    -Core
    -Marketing
    -Product 

* Within each marts folder, create at least 1-2 intermediate models and 1-2 dimension/fact models.

    -Note: think about what metrics might be particularly useful for these business units, and build dbt models using greenery’s data
        -For example, some “core” datasets could include fact_orders, dim_products, and dim_users
        -The marketing mart could contain a model like “user_order_facts” which contains order information at the user level
        -The product mart could contain a model like “fact_page_views” which contains all page view events from greenery’s events data

* Explain the marts models you added. Why did you organize the models in the way you did?

* Use the dbt docs to visualize your model DAGs to ensure the model layers make sense
    
    -Paste in an image of your DAG from the docs

(Part 2) Tests

* We added some more models and transformed some data! Now we need to make sure they’re accurately reflecting the data. Add dbt tests into your dbt project on your existing models from Week 1, and new models from the section above

    -What assumptions are you making about each model? (i.e. why are you adding each test?)

    -Did you find any “bad” data as you added and ran tests on your models? How did you go about either cleaning the data in the dbt model or adjusting your assumptions/tests?

    -Apply these changes to your github repo

* Your stakeholders at Greenery want to understand the state of the data each day. Explain how you would ensure these tests are passing regularly and how you would alert stakeholders about bad data getting through.

>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

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
