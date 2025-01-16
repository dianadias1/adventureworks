with
     source as (
          select
               /* Selecting only the data we will use in the data products */
               /* Primary Key */
               "ADDRESSID" as address_id
               /* Foreign Key */
               , "STATEPROVINCEID" as stateprovince_id
               
               , "CITY" as city_name
          from {{ source('sap_adw','address') }}
     )

select *
from source