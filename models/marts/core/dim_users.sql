with users as (
    select 
    user_id,
    first_name, 
    last_name, 
    email,
    country, 
    city,
    traffic_source,
    registered_at
    from {{ref('stg_users')}}
), orders as (
    select
    user_id, 
    count(*) as lifetime_orders,
    sum(num_of_item) as lifetime_items,
    min(ordered_at) as first_order_at,
    max(ordered_at) as last_order_at
    from {{ref('stg_orders')}}
    WHERE status = 'Complete'
    GROUP BY user_id
)

select u.*, o.* EXCEPT (user_id) from users u
LEFT JOIN orders o
ON u.user_id = o.user_id
