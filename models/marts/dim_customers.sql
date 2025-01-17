with
     person as (
          select
               businessentity_id
               , person_name
          from {{ ref('stg_person') }}
     )
     
     , customer as (
          select
               customer_id
               , person_id
               , store_id
               , territory_id
               , customer_category
          from {{ ref('stg_customer') }}
     )

     , store as (
          select
               businessentity_id
               , store_name
          from {{ ref('stg_store') }}
     )

     , emailaddress as (
          select
               businessentity_id
               , email_address
          from {{ ref('stg_emailaddress') }}
     )

     , final_customers as (
          select
          {{ dbt_utils.generate_surrogate_key([
               "customer.customer_id"
               ]) }} as customers_sk
               , customer.customer_id
               , customer.person_id
               , customer.store_id
               , customer.territory_id
               , customer.customer_category
               , person.person_name
               , store.store_name
               , emailaddress.email_address
          from customer
          left join person
               on customer.person_id = person.businessentity_id
          left join store
               on customer.store_id = store.businessentity_id
          left join emailaddress
               on person.businessentity_id = emailaddress.businessentity_id
     )

select *
from final_customers
