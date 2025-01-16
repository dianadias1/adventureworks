with
     source as (
          select
               /* Selecting only the data we will use in the data products */
               /* Primary Key */
               "BUSINESSENTITYID" as businessentity_id

               /* Foreign Key */
               , "TERRITORYID" as territory_id
          from {{ source('sap_adw','salesperson') }}
     )

select *
from source