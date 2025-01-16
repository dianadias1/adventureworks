with
     source as (
          select
               /* Selecting only the data we will use in the data products */
               /* Primary Key */
               "PRODUCTID" as product_id
               /* Foreign Key */
               , "PRODUCTSUBCATEGORYID" as product_subcategory_id
               
               , "NAME" as product_name
          from {{ source('sap_adw','product') }}
     )

select * from source