with
     source as (
          select
               /* Selecting only the data we will use in the data products */
               /* Primary Key */
               "SALESORDERID" as salesorder_id
               /* Foreign Key */
               , "CUSTOMERID" as customer_id
               , "TERRITORYID" as territory_id
               , "SHIPMETHODID" as shipmethod_id
               , "CREDITCARDID" as creditcard_id

               , case 
                    when creditcard_id is not null then 'Card'
                    else 'Other Payment Methods'
               end as payment_method
               
               , cast ("ORDERDATE" as timestamp) as order_date_time
               , cast(date_trunc('day', cast("ORDERDATE" as timestamp)) as date) as order_date
               , cast(to_char(cast("ORDERDATE" as timestamp), 'HH24:MI:SS') as time) as order_time
               , "SUBTOTAL" as subtotal
               , "TOTALDUE" as total_due
          from {{ source('sap_adw','salesorderheader') }}
     )

select *
from source