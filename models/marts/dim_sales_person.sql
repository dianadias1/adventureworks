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
          , person.person_name
          , salesperson.territory_id
          from person
          left join salesperson
               on person.businessentity_id = salesperson.businessentity_id
          where salesperson.businessentity_id is not null         
     )

select *
from final_salesperson