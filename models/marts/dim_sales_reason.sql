with
     salesreason as (
          select
               sales_reason_id
               , sales_reason_category
          from {{ ref('stg_salesreason') }}
     )

     , salesorderheader_salesreason as (
          select
               salesorder_id
               , sales_reason_id
          from {{ ref('stg_salesorderheadersalesreason') }}     
     )

     , final_salesreason as (
          select
          {{ dbt_utils.generate_surrogate_key([
               "salesreason.sales_reason_id"
               , "salesorderheader_salesreason.salesorder_id"
               ]) }} as salesreason_sk
          , salesorder_id
          , sales_reason_category
          from salesorderheader_salesreason
          left join salesreason
               on salesorderheader_salesreason.sales_reason_id = salesreason.sales_reason_id
     ) 

select *
from final_salesreason