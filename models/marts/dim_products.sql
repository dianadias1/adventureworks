with
    product as (
        select
            product_id
            , product_name
            , product_subcategory_id
        from {{ ref('stg_product') }}
    )
    
    , subcategory as (
        select
            product_subcategory_id
            , product_category_id
            , subcategory_name
        from {{ ref('stg_productsubcategory') }}
    )
    
    , category as (
        select
            product_category_id
            ,category_name
        from {{ ref('stg_productcategory') }}
    )
    
    , inventory as (
        select
            product_id
            , sum(quantity) as total_quantity
        from {{ ref('stg_productinventory') }}
        group by product_id
    )
    

    , final_products as (
        select
        {{ dbt_utils.generate_surrogate_key([
                "product.product_id"
                , "subcategory.product_category_id"
                , "subcategory.product_subcategory_id"
            ]) }} as products_sk
            , product.product_id
            , product.product_name
            , subcategory.subcategory_name
            , category.category_name
            , inventory.total_quantity
        from product
        left join inventory
            on product.product_id = inventory.product_id
        left join subcategory
            on product.product_subcategory_id = subcategory.product_subcategory_id
        left join category
            on subcategory.product_category_id = category.product_category_id
    )

select *
from final_products
