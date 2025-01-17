with
     source as (
          select
               /* Selecting only the data we will use in the data products */
               /* Primary Key */
               "SPECIALOFFERID" as specialoffer_id
               
               , "TYPE" as offer_type
               , "CATEGORY" as offer_category
          from {{ source('sap_adw','specialoffer') }}
     )

select *
from source