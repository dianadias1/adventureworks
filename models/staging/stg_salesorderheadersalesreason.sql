with
     source as (
          select
               /* Selecting only the data we will use in the data products */
               "SALESORDERID" as salesorder_id
               , "SALESREASONID" as sales_reason_id
          from {{ source('sap_adw','salesorderheadersalesreason') }}
     )

select *
from source