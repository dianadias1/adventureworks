with
     source as (
          select
               /* Selecting only the data we will use in the data products */
               /* Primary Key */
               "SHIPMETHODID" as shipmethod_id

               , "NAME" as ship_method_name
          from {{ source('sap_adw','shipmethod') }}
     )

select *
from source