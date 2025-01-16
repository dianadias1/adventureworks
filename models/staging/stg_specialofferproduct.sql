with
     source as (
          select
               /* Selecting only the data we will use in the data products */
               "SPECIALOFFERID"
               , "PRODUCTID"
          from {{ source('sap_adw','specialofferproduct') }}
     )

select *
from source