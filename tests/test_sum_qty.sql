with
     validation as (
          select sum(orderqty) as sum_val
          from {{ref ('fct_order_details') }}
          where order_date between '2011-01-01' and '2013-12-31'
     )

select *
from validation where sum_val != 213255