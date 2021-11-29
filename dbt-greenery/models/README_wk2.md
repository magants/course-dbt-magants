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

    * I only added models in the Core mart. Primariy b/c of time this short holiday week

* Explain the marts models you added. Why did you organize the models in the way you did?

    - I added dim_users which included the users' address and full name both from int_users. I also added fact_orders which pulled from int_fact_orders. This was the biggest model as it combined data from most of the source tables. I was a a bit confused as to why I really needed an int_fact_order as my fact_orders was a select * from int-fact_orders, but i created an int_fact_orders anyway.

* Use the dbt docs to visualize your model DAGs to ensure the model layers make sense
    
    -Paste in an image of your DAG from the docs

(Part 2) Tests

* We added some more models and transformed some data! Now we need to make sure they’re accurately reflecting the data. Add dbt tests into your dbt project on your existing models from Week 1, and new models from the section above

    -What assumptions are you making about each model? (i.e. why are you adding each test?)

    * I'm assuming there can be no duplicates for user_id in my dim_users. I added a bespoke test to make sure.

    -Did you find any “bad” data as you added and ran tests on your models? How did you go about either cleaning the data in the dbt model or adjusting your assumptions/tests?

    -Apply these changes to your github repo

* Your stakeholders at Greenery want to understand the state of the data each day. Explain how you would ensure these tests are passing regularly and how you would alert stakeholders about bad data getting through.