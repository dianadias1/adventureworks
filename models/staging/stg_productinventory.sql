with
     source as (
          select
               /* Selecting only the data we will use in the data products */
               /* Primary Key */
	          "PRODUCTID"

	          ,"QUANTITY"
          from {{ source('sap_adw','productinventory') }}
     )

select * from source