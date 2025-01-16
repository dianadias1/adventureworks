with
     source as (
          select
               /* Selecting only the data we will use in the data products */
               /* Primary Key */
               "BUSINESSENTITYID" as businessentity_id

               , "NAME" as store_name
          from {{ source('sap_adw','store') }}
     )

select *
from source