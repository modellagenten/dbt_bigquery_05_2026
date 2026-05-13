with orders as (

    select * from {{ ref('stg_orders') }}

),

order_items as (

    select * from {{ ref('stg_order_items') }}

),

products as (

    select * from {{ ref('stg_products') }}

),

item_totals as (

    select
        oi.order_id,
        count(*)                         as n_items,
        sum(oi.sale_price)               as revenue,
        sum(oi.sale_price - p.cost)      as profit
    from order_items oi
    left join products p using (product_id)
    group by oi.order_id

)

select
    o.order_id,
    o.user_id,
    o.status,
    o.ordered_at,
    o.shipped_at,
    o.delivered_at,
    o.returned_at,
    coalesce(it.n_items, 0)                              as n_items,
    coalesce(it.revenue, 0)                              as revenue,
    coalesce(it.profit, 0)                               as profit,
    timestamp_diff(o.delivered_at, o.ordered_at, day)    as days_to_delivery

from orders o
left join item_totals it using (order_id)
