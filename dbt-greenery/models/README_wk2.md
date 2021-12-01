Week 2 answers;

* What is our user repeat rate?

    - 80.46% (dbt_magants.repeatet_users/dbt_magants.total_users)

* What are good indicators of a user who will likely purchase again? What about indicators of users who are likely NOT to purchase again? If you had more data, what features would you want to look into to answer this question?

    - Indicators if a users will purchase again;
        * Already a repeat user
        * Whether they had a promo_id or not (1x purchases are more likely to have a promo_id)
        * Initial order cost

    - If I had more data, I would like to know the quaility (freshness) of the item initially purchased.

* Within each marts folder, create at least 1-2 intermediate models and 1-2 dimension/fact models.

    * I added models in the Core and Products marts only. Primariy b/c of time this short holiday week.

* Explain the marts models you added. Why did you organize the models in the way you did?

    - I added dim_users which included the users' address and full name both from int_users. I also added fact_orders which pulled from int_fact_orders. This was the biggest model as it combined data from most of the source tables. I was a a bit confused as to why I really needed an int_fact_order as my fact_orders was a select * from int-fact_orders, but i created an int_fact_orders anyway. I also added a dim_products which gave ma a product_in_stock value which I could test against if < 10. Lastly, I went ahead and added a fact_users_orders which gave me a num_order by user.

* Use the dbt docs to visualize your model DAGs to ensure the model layers make sense
    
    -Paste in an image of your DAG from the docs

(Part 2) Tests

* We added some more models and transformed some data! Now we need to make sure they’re accurately reflecting the data. Add dbt tests into your dbt project on your existing models from Week 1, and new models from the section above

    -What assumptions are you making about each model? (i.e. why are you adding each test?)

    * I'm assuming there can be no duplicates for user_id in my dim_users. I added a bespoke test to make sure. I also added a bespoke test to make sure there were no order_costs < 1, which i assume would be a red flag if there were. I added a generic tests to make sure that ethere weren't any null order_ids, or unacceptable prmo_ids.

    -Did you find any “bad” data as you added and ran tests on your models? How did you go about either cleaning the data in the dbt model or adjusting your assumptions/tests? None found, I thought I might w/ my product_in_stock_less_than_1- bespoke test, but I didn't, altough i did find some w/ < 50 in stock,  but don't think that is aproblem for plants??

    -Apply these changes to your github repo

* Your stakeholders at Greenery want to understand the state of the data each day. Explain how you would ensure these tests are passing regularly and how you would alert stakeholders about bad data getting through.

    * I would schedule the tests to run every morning after the scheduled dbt run to create the models. I read somewhere that with the new dbt release you can have 'dbt run' fail/stop if a test fails? This would be one way to ensure no bad data situations happen, although it seems pretty strict. 