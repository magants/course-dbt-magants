{% snapshot order_items_snapshot %}

  {{
    config(
      target_schema='snapshots',
      unique_key='order_id',

      strategy='check',
      check_cols=['id', 'order_id', 'product_id', 'quantity']
    )
  }}

  SELECT * 
  FROM {{ source('tutorial', 'order_items') }}

{% endsnapshot %}