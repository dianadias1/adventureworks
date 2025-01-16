with
     source as (
          select
               /* Selecting only the data we will use in the data products */
               /* Primary Key */
               "COUNTRYREGIONCODE" as country_region_code
               , "NAME"as country_region_name
          from {{ source('sap_adw','countryregion') }}
     )

select * 
from source