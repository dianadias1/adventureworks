with
     person as (
          select
               businessentity_id
               , person_name
          from {{ ref('stg_person') }}
     )

     , salesperson as (
          select
               businessentity_id
               , territory_id
          from {{ ref('stg_salesperson') }}
     )

     , final_salesperson as (
          select
          {{ dbt_utils.generate_surrogate_key([
               "salesperson.businessentity_id"
          ]) }} as salesperson_sk
          , salesperson.businessentity_id
          , salesperson.territory_id
          , person.person_name
          from salesperson
          left join person
               on salesperson.businessentity_id = person.businessentity_id        
     )

select *
from final_salesperson