with
     source as (
          select
               /* Selecting only the data we will use in the data products */
               /* Primary Key */
	          "BUSINESSENTITYID"
               /* Foreign Key */
	          ,"SALESPERSONID"
               
	          ,"NAME"
          from {{ source('sap_adw','store') }}
     )

select * from source