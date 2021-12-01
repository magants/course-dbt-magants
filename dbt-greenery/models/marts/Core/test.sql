SELECT
    full_name,
    COUNT(1) as num_orders
FROM dbt_magants.dim_users
JOIN dbt_magants.fact_orders
        USING (full_name)
GROUP BY full_name
ORDER BY num_orders desc