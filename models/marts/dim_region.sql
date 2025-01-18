with
     salesterritory as (
          select
               territory_id
               , country_region_code            
               , territory_name
               , geographical_region
               , territory_sales_ytd
               , territory_sales_last_year
               , territory_cost_ytd
               , territory_cost_last_year
          from {{ ref('stg_salesterritory') }}
     )

     , stateprovince as (
          select
               stateprovince_id
               , country_region_code
               , territory_id
               , state_province_name
          from {{ ref('stg_stateprovince') }}
     )

     , countryregion as (
          select
               country_region_code
               , country_region_name
          from {{ ref('stg_countryregion') }}
     )

     , final_region as (
          select
          {{ dbt_utils.generate_surrogate_key([
               "salesterritory.territory_id"
               , "stateprovince.stateprovince_id"
               , "countryregion.country_region_name"
          ]) }} as region_sk
          , salesterritory.territory_id
          , stateprovince.stateprovince_id
          , salesterritory.geographical_region
          , salesterritory.territory_name
          , countryregion.country_region_name
          , stateprovince.state_province_name
          , salesterritory.territory_sales_ytd
          , salesterritory.territory_sales_last_year
          , salesterritory.territory_cost_ytd
          , salesterritory.territory_cost_last_year
          from salesterritory
          left join stateprovince
               on salesterritory.territory_id = stateprovince.territory_id
          left join countryregion
               on salesterritory.country_region_code = countryregion.country_region_code
          
     )

select *
from final_region