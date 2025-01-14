with
     source as (
          select
               /* Selecting only the data we will use in the data products */
               /* Primary Key */
	          "PRODUCTSUBCATEGORYID"
               /* Foreign Key */
	          ,"PRODUCTCATEGORYID"
               
               ,"NAME"
          from {{ source('sap_adw','productsubcategory') }}
     )

select * from source