with
     source as (
          select
               /* Selecting only the data we will use in the data products */
               /* Primary Key */
	          "PRODUCTID"
               /* Foreign Key */
	          ,"PRODUCTSUBCATEGORYID"
               
	          ,"SAFETYSTOCKLEVEL"
	          ,"NAME"
          from {{ source('sap_adw','product') }}
     )

select * from source