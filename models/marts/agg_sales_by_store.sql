/* This table is a aggregation of sales by sales person and sales terrytory */ 
with
     fct_order_details as (
          select
               *
          from {{ ref('fct_order_details') }}
     )

     , dim_region as (
          select
               *
          from {{ ref('dim_region') }}
     )

     , dim_customers as (
          select
               *
          from {{ ref('dim_customers') }}
     )

     , dim_products as (
          select
               *
          from {{ ref('dim_products') }}
     )

     , final_agg as (
          select
               fct_order_details.salesorder_id
               , dim_customers.store_id
               , dim_products.product_id
               , dim_region.territory_id
               , dim_region.stateprovince_id
               , dim_customers.store_name
               , dim_region.geographical_region
               , dim_region.country_region_name
               , dim_region.territory_name
               , dim_region.state_province_name
               , dim_region.isonlystateprovinceflag
               , fct_order_details.total_due
               , fct_order_details.orderqty
               , fct_order_details.unitprice
               , dim_products.product_name
               , dim_products.subcategory_name
               , dim_products.category_name
               , dim_products.total_quantity
               , fct_order_details.order_date
          from fct_order_details
          left join dim_region
               on fct_order_details.region_fk = dim_region.region_sk
          left join dim_customers
               on fct_order_details.customers_fk = dim_customers.customers_sk
          left join dim_products
               on fct_order_details.products_fk = dim_products.products_sk
     )

select *
from final_agg
where store_id is not null