with items as (

    select * from {{ ref('stg_order_items') }}

),

products as (

    select * from {{ ref('stg_products') }}

)

select
    items.order_item_id,
    items.order_id,
    items.user_id,
    items.product_id,
    products.product_name,
    products.category,
    products.brand,
    products.sale_price,
    products.cost,
    items.sale_price - products.cost as profit,
    items.ordered_at

from items
left join products using (product_id)
