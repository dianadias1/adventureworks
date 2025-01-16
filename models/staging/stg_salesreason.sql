with
     source as (
          select
               /* Selecting only the data we will use in the data products */
               /* Primary Key */
               "SALESREASONID" as sales_reason_id
               
               , "NAME" as sales_reason_category
          from {{ source('sap_adw','salesreason') }}
     )

select * 
from source