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