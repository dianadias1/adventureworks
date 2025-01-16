with
     source as (
          select
               /* Selecting only the data we will use in the data products */
               /* Primary Key */
               "PRODUCTCATEGORYID" as product_category_id
               
               ,"NAME" as category_name
          from {{ source('sap_adw','productcategory') }}
     )

select * from source