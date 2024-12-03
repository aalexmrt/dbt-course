with customers as (
    select *
    from {{ source('sample', 'customer') }}
),
orders as (
    select *
    from {{ source('sample', 'orders') }}
)



select c.c_custkey, c.c_name, c.c_nationkey, sum(o.o_totalprice) as total_order_price
from customers c
left join orders o
on c_custkey = o.o_custkey
{{group_by(3)}}
