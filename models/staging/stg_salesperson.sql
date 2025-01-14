with
     source as (
          select
               /* Selecting only the data we will use in the data products */
               /* Primary Key */
	          "BUSINESSENTITYID"
               /* Foreign Key */
               ,"TERRITORYID"
          from {{ source('sap_adw','salesperson') }}
     )

select * from source