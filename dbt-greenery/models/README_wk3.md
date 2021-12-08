Week 3 answers;

* What is our user conversion rate?

    - 36.10% (select * from dbt_magants.fact_conversion_rate)

* What is our user conversion rate by product?

    - select * from dbt_magants.fact_conversion_by_product

* Create a macro.

    - I used ramnathv's "sum_if" macro from the week3 lesson.

* Added post-hook to run after each model compile & on-run-end to run after dbt run to grant usage access on my schema

* Installed dbt-utils & tried to apply dbt_utils.get_column_values via /macros/dbt_utils_get_column_values.sql

* 