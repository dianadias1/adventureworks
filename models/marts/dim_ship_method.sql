with
     shipmethod as (
          select
          {{ dbt_utils.generate_surrogate_key([
               "shipmethod_id"
               ]) }} as shipmethod_sk
          , shipmethod_id
          , ship_method_name
          from {{ ref('stg_shipmethod') }}
     )

select *
from shipmethod