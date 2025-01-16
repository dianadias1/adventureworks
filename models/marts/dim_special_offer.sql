with
     specialoffer as (
          select
               specialoffer_id
               
               , offer_type
               , offer_category
          from {{ ref('stg_specialoffer') }}
     )

     , specialofferproduct as (
          select
               specialoffer_id
               , product_id
          from {{ ref('stg_specialofferproduct') }}
     )

     , final_special_offer as (
          select
               {{ dbt_utils.generate_surrogate_key([
               "specialoffer.specialoffer_id"
          ]) }} as specialoffer_sk
          , specialoffer.specialoffer_id
          , specialoffer.offer_type
          , specialoffer.offer_category
          , specialofferproduct.product_id
          from specialoffer
          left join specialofferproduct
               on specialoffer.specialoffer_id = specialofferproduct.specialoffer_id
     )

select * from final_special_offer