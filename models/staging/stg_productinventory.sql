with
     source as (
          select
               /* Selecting only the data we will use in the data products */
               /* Primary Key */
               "PRODUCTID" as product_id

               , "QUANTITY" as quantity
          from {{ source('sap_adw','productinventory') }}
     )

select *
from source