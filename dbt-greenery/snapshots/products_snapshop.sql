{% snapshot products_snapshot %}

  {{
    config(
      target_schema='snapshots',
      unique_key='product_id',

      strategy='check',
      check_cols='updated_at'
    )
  }}

  SELECT * 
  FROM {{ source('tutorial', 'products') }}

{% endsnapshot %}