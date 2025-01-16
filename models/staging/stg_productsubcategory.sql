with
     source as (
          select
               /* Selecting only the data we will use in the data products */
               /* Primary Key */
               "PRODUCTSUBCATEGORYID" as product_subcategory_id
               /* Foreign Key */
               , "PRODUCTCATEGORYID" as product_category_id
               
               , "NAME" as subcategory_name
          from {{ source('sap_adw','productsubcategory') }}
     )

select * from source