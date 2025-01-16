with
     source as (
          select
               /* Selecting only the data we will use in the data products */
               /* Primary Key */
               "STATEPROVINCEID" as stateprovince_id
               /* Foreign Key */
               , "COUNTRYREGIONCODE" as country_region_code
               , "TERRITORYID" as territory_id
               
               , "NAME" as state_province_name
               , "ISONLYSTATEPROVINCEFLAG" as isonlystateprovinceflag
          from {{ source('sap_adw','stateprovince') }}
     )

select *
from source