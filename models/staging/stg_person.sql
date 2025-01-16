with
     source as (
          select
               /* Selecting only the data we will use in the data products */
               /* Primary Key */
               "BUSINESSENTITYID" as businessentity_id
               
               , CONCAT("FIRSTNAME", ' ', "LASTNAME") as person_name
          from {{ source('sap_adw','person') }}
     )

select * 
from source