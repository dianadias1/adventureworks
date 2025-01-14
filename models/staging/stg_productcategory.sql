with
     source as (
          select
               /* Selecting only the data we will use in the data products */
               /* Primary Key */
	          "PRODUCTCATEGORYID"
               
	          ,"NAME"
          from {{ source('sap_adw','productcategory') }}
     )

select * from source