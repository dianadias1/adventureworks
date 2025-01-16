with
     source as (
          select
               /* Selecting only the data we will use in the data products */
               /* Primary Key */
               "TERRITORYID" as territory_id
               /* Foreign Key */
               , "COUNTRYREGIONCODE" as country_region_code            
               
               , "NAME" as territory_name
               , "GEOGRAPHICALREGION" as geographical_region
               , "SALESYTD" as territory_sales_ytd
               , "SALESLASTYEAR" as territory_sales_last_year
               , "COSTYTD" as territory_cost_ytd
               , "COSTLASTYEAR" as territory_cost_last_year
          from {{ source('sap_adw','salesterritory') }}
     )

select * 
from source