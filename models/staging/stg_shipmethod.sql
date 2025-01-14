with
     source as (
          select
               /* Selecting only the data we will use in the data products */
               /* Primary Key */
	          "SHIPMETHODID"

	          ,"NAME"
          from {{ source('sap_adw','shipmethod') }}
     )

select * from source