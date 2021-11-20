Week 1 answers..

1. Post to #projects - GitHub repo - https://github.com/magants/course-dbt-magants
2. Tag both code review partners..

3;
    * How many users do we have? 130
        select count(distinct(user_id)) FROM users 

    * On average, how many orders do we receive per hour?

    * On average, how long does an order take from being placed to being delivered?

    * How many users have only made one purchase? Two purchases? Three+ purchases? 1-25, 2-22, >=3-81

        select count(order_id), user_id
        from orders
        group by user_id
        having count(order_id)=:Number_of_purchases

    * On average, how many unique sessions do we have per hour?

 
Self review questions;

Were you able to create schema.yml files with model names and descriptions? Y
Were you able to run your dbt models and snapshots against the data warehouse? Y
Could you run the queries to answer key questions from the project instructions? Y
What was most challenging/surprising in completing this week’s project? The Github piece was the most challenging. I am new to using Git..
Is there anywhere you are still stuck or confused? Or Is there a particular part of the project where you want focused feedback from your reviewers? Not yet