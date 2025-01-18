with
     customers as (
          select
               *
          from {{ ref('dim_customers') }}
     )

     , products as (
          select *
          from {{ ref('dim_products') }}
     )

     , region as (
          select *
          from {{ ref('dim_region') }}
     )

     , deduping_region as (
          select
               region_sk
               , territory_id
               , territory_name
               , row_number ( ) over (partition by territory_id order by territory_id) as rownumber 
          from region
     )

     , sales_person as (
          select *
          from {{ ref('dim_sales_person') }}
     )

     , sales_reason as (
          select *
          from {{ ref('dim_sales_reason') }}
     )

     , deduping_sales_reason as (
          select
               salesreason_sk
               , salesorder_id
               , sales_reason_category
               , row_number ( ) over (partition by salesorder_id order by salesorder_id) as rownumber 
          from sales_reason
     )

     , special_offer as (
          select
               *
          from {{ ref('dim_special_offer') }}
     )

     , deduping_special_offer as (
          select
               specialoffer_sk
               , specialoffer_id
               , row_number ( ) over (partition by specialoffer_id order by specialoffer_id) as rownumber 
          from special_offer
     )

     , shipmethod as (
          select
               *
          from {{ ref('dim_ship_method')}}
     )

     , orders_header as (
          select
               salesorder_id
               , sales_person_id
               , customer_id
               , territory_id
               , shipmethod_id
               , payment_method
               , order_date
               , subtotal
               , total_due
          from {{ ref('stg_salesorderheader') }}
     )

     , orders_detail as (
          select
               salesorderdetail_id
               , salesorder_id
               , specialoffer_id
               , product_id
               , orderqty
               , unitprice
               , unitprice_discount
          from {{ ref('stg_salesorderdetail')}}
     )

     , order_detail_final as (
          select
          {{ dbt_utils.generate_surrogate_key([
               "orders_detail.salesorder_id"
               , "orders_detail.product_id"
          ]) }} as orderdetail_sk
               , customers.customers_sk as customers_fk
               , deduping_region.region_sk as region_fk
               , shipmethod.shipmethod_sk as shipmethod_fk
               , deduping_special_offer.specialoffer_sk as specialoffer_fk
               , products.products_sk as products_fk
               , sales_person.salesperson_sk as salesperson_fk
               , deduping_sales_reason.salesreason_sk as salesreason_fk
               , orders_header.payment_method
               , orders_header.subtotal
               , orders_header.total_due
               , orders_detail.orderqty
               , orders_detail.unitprice
               , orders_detail.unitprice_discount
               , orders_header.order_date
          from orders_header
          left join orders_detail
               on orders_header.salesorder_id = orders_detail.salesorder_id
          left join customers
               on orders_header.customer_id = customers.customer_id
          left join shipmethod
               on orders_header.shipmethod_id = shipmethod.shipmethod_id
          left join products
               on orders_detail.product_id = products.product_id
          left join sales_person
               on sales_person.businessentity_id = orders_header.sales_person_id
          left join deduping_special_offer
               on orders_detail.specialoffer_id = deduping_special_offer.specialoffer_id
               and deduping_special_offer.rownumber = 1
          left join deduping_sales_reason
               on orders_header.salesorder_id = deduping_sales_reason.salesorder_id
               and deduping_sales_reason.rownumber = 1
          left join deduping_region
               on orders_header.territory_id = deduping_region.territory_id
               and deduping_region.rownumber = 1
     )

select *
from order_detail_final