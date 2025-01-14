with
     source as (
          select
               /* Selecting only the data we will use in the data products */
               /* Primary Key */
	          "COUNTRYREGIONCODE"
               
	          ,"NAME"
          from {{ source('sap_adw','countryregion') }}
     )

select * from source