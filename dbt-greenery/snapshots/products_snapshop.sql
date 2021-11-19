{% snapshot products_snapshot %}

  {{
    config(
      target_schema='snapshots',
      unique_key='product_id',

      strategy='check',
      check_cols=['id', 'product_id', 'name', 'price', 'quantity']
    )
  }}

  SELECT * 
  FROM {{ source('tutorial', 'products') }}

{% endsnapshot %}