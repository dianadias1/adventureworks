with
     source as (
          select
               /* Selecting only the data we will use in the data products */
               "SPECIALOFFERID" as specialoffer_id
               , "PRODUCTID" as product_id
          from {{ source('sap_adw','specialofferproduct') }}
     )

select *
from source