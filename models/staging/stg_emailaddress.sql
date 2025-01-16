with
     source as (
          select
               /* Selecting only the data we will use in the data products */
               "BUSINESSENTITYID" as businessentity_id
               
               , "EMAILADDRESS" as email_address
          from {{ source('sap_adw','emailaddress') }}
     )

select * 
from source