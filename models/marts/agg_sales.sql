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

     , dim_sales_person as (
          select
               *
          from {{ ref('dim_sales_person') }}
     )

     , final_agg as (
          select
          {{ dbt_utils.generate_surrogate_key([
               "dim_region.territory_id"
               , "dim_region.stateprovince_id"
               , "dim_region.country_region_name"
               , "dim_sales_person.businessentity_id"
               , "fct_order_details.salesorder_id"
               , "fct_order_details.product_id"
          ]) }} as aggsales_sk
          , dim_region.region_sk as region_fk
          , dim_sales_person.salesperson_sk as salesperson_fk
          , fct_order_details.orderdetail_sk as orders_detail_fk
          , dim_region.geographical_region
          , dim_region.territory_name
          , dim_region.country_region_name
          , dim_region.state_province_name
          , dim_region.territory_sales_ytd
          , dim_region.territory_sales_last_year
          , dim_region.territory_cost_ytd
          , dim_region.territory_cost_last_year
          , dim_sales_person.person_name
          , fct_order_details.payment_method
          , fct_order_details.subtotal
          , fct_order_details.total_due
          , fct_order_details.orderqty
          , fct_order_details.unitprice
          , fct_order_details.unitprice_discount
          , fct_order_details.order_date
          from fct_order_details
          left join dim_region
               on fct_order_details.region_fk = dim_region.region_sk
          left join dim_sales_person
               on fct_order_details.salesperson_fk = dim_sales_person.salesperson_sk
     )

select *
from final_agg