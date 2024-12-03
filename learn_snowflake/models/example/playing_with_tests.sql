with sample_customer as (
    select * 
    from {{ source('sample2', 'customer') }}
)

select 
    c_custkey,
    c_mktsegment,
    {{rename_segments('c_mktsegment')}} as mkt_segment_adjusted,
    c_acctbal,
from sample_customer